<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="vptran">
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5a - V initial, transitive (accusative case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
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
	
		
		
		
		
		
		
	   	 
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5aNegObjVerbRequired - V initial, transitive (accusative case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5aNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5b - V initial, transitive (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
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
	
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5bNegObjVerbRequired - V initial, transitive (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5bNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5c - V final, transitive (accusative case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
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
	
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cNegObjVerbRequired - V final, transitive (accusative case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cQSubj - V final, transitive (accusative case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cQSubj
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 

		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cQSubjNegObjVerbRequired - V final, transitive (accusative case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5cQSubjNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cNegSubj - V final, transitive (accusative case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cNegSubj
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequired - V final, transitive (accusative case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequired - V final, transitive (accusative case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cQAdvP - V final, transitive (accusative case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
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
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cQAdvPNegObjVerbRequired - V final, transitive (accusative case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cQAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
				
		 
	
		
		
		
		
		
		
		
				
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cNegAdvP - V final, transitive (accusative case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
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
	
		
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cNegAdvPVerbRequired - V final, transitive (accusative case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
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
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5cNegAdvPObjVerbRequired - V final, transitive (accusative case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5d - V final, transitive (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
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
	
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dNegObjVerbRequired - V final, transitive (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dQSubj - V final, transitive (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5dQSubj
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dQSubjNegObjVerbRequired - V final, transitive (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5dQSubjNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dNegSubj - V final, transitive (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubj
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dNegSubjVerbRequired - V final, transitive (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dNegSubjNegObjVerbRequired - V final, transitive (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dQAdvP - V final, transitive (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dQAdvPNegObjVerbRequired - V final, transitive (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dQAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dNegAdvP - V final, transitive (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
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
	
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dNegAdvPVerbRequired - V final, transitive (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5dNegAdvPNegObjVerbRequired - V final, transitive (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	

	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5aAppl - V initial, applicative (accusative case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5aAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
	   	 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5aNegObjVerbRequiredAppl - V initial, applicative (accusative case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5aNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5bAppl - V initial, applicative (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5bAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5bNegObjVerbRequiredAppl - V initial, applicative (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5bNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cAppl - V final, applicative (accusative case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegObjVerbRequiredAppl - V final, applicative (accusative case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cQSubjAppl - V final, applicative (accusative case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cQSubjAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cQSubjNegObjVerbRequiredAppl - V final, applicative (accusative case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5cQSubjNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegSubjAppl - V final, applicative (accusative case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cNegSubjAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequiredAppl - V final, applicative (accusative case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequiredAppl - V final, applicative (accusative case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cQAdvPAppl - V final, applicative (accusative case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cQAdvPAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cQAdvPNegObjVerbRequiredAppl - V final, applicative (accusative case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cQAdvPNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
				
		 
		
		 
		
		
		
		
		
		
		
		
				
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPAppl - V final, applicative (accusative case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPVerbRequiredAppl - V final, applicative (accusative case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPObjVerbRequiredAppl - V final, applicative (accusative case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dAppl - V final, applicative (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegObjVerbRequiredAppl - V final, applicative (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dQSubjAppl - V final, applicative (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5dQSubjAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dQSubjNegObjVerbRequiredAppl - V final, applicative (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5dQSubjNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegSubjAppl - V final, applicative (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegSubjVerbRequiredAppl - V final, applicative (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegSubjNegObjVerbRequiredAppl - V final, applicative (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dQAdvPAppl - V final, applicative (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dQAdvPAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dQAdvPNegObjVerbRequiredAppl - V final, applicative (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dQAdvPNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPAppl - V final, applicative (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPVerbRequiredAppl - V final, applicative (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPNegObjVerbRequiredAppl - V final, applicative (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	


	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
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
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5ei - VSO order, transitive (accusative case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
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
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5eiNegObjVerbRequired - VSO order, transitive (accusative case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5eiNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = dative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
        &lt;VP head fronted&gt; == ~[cat:FocusP]
        &lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5epNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5fi - VSO order, transitive (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5fiNegObjVerbRequired - VSO order, transitive (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5fiNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fpNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eAppl - VSO order, applicative (accusative case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
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
 	&lt;VP option&gt; = 5eAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eNegSubjVerbRequiredAppl - VSO order, applicative (accusative case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eNegObjVerbRequiredAppl - VSO order, applicative (accusative case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eNegSubjOrObjVerbRequiredAppl - VSO order, applicative (accusative case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegSubjOrObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eiAppl - VSO order, applicative (accusative case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
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
	&lt;VP option&gt; = 5eiAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eiNegObjVerbRequiredAppl - VSO order, applicative (accusative case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5eiNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5epAppl - VSO order, applicative (accusative case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
 	&lt;VP option&gt; = 5epAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5epNegObjVerbRequiredAppl - VSO order, applicative (accusative case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
        &lt;VP head fronted&gt; == ~[cat:FocusP]
        &lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5epNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fAppl - VSO order, applicative (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
 	&lt;VP option&gt; = 5fAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fNegSubjVerbRequiredAppl - VSO order, applicative (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fNegObjVerbRequiredAppl - VSO order, applicative (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fNegSubjOrObjVerbRequiredAppl - VSO order, applicative (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegSubjOrObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fiAppl - VSO order, applicative (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
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
	&lt;VP option&gt; = 5fiAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fiNegObjVerbRequiredAppl - VSO order, applicative (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5fiNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fpAppl - VSO order, applicative (absolutive case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
 	&lt;VP option&gt; = 5fpAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fpNegObjVerbRequiredAppl - VSO order, applicative (absolutive case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fpNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	

	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5gi - OSV order, transitive (accusative case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
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
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5giNegObjVerbRequired - OSV order, transitive (accusative case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5giNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gpNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5hi - OSV order, transitive (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5hiNegObjVerbRequired - OSV order, transitive (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5hiNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
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
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hpNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	

	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gAppl - OSV order, applicative (accusative case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
 	&lt;VP option&gt; = 5gAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gNegSubjVerbRequiredAppl - OSV order, applicative (accusative case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gNegObjVerbRequiredAppl - OSV order, applicative (accusative case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gNegSubjOrObjVerbRequiredAppl - OSV order, applicative (accusative case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegSubjOrObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5giAppl - OSV order, applicative (accusative case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5giAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5giNegObjVerbRequiredAppl - OSV order, applicative (accusative case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5giNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gpAppl - OSV order, applicative (accusative case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gpAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gpNegObjVerbRequiredAppl - OSV order, applicative (accusative case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gpNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hAppl - OSV order, applicative (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
 	 &lt;VP option&gt; = 5hAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hNegSubjVerbRequiredAppl - OSV order, applicative (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hNegObjVerbRequiredAppl - OSV order, applicative (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hNegSubjOrObjVerbRequiredAppl - OSV order, applicative (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegSubjOrObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hiAppl - OSV order, applicative (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5hiAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hiNegObjVerbRequiredAppl - OSV order, applicative (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5hiNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hpAppl - OSV order, applicative (absolutive case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hpAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hpNegObjVerbRequiredAppl - OSV order, applicative (absolutive case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hpNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	

	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5i - V initial/final, object questioned (accusative object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5i
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5iFoc - V initial/final, object focused (accusative object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5iFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='split' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='split' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5j - V initial/final, object questioned (absolutive object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5j
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5jFoc - V initial/final, object focused (absolutive object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5jFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	

	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
		rule {VP option 5iAppl - V initial/final, applicative object questioned (accusative object)}
		VP = V
		&lt;VP head&gt; = &lt;V head&gt;
		&lt;V head object&gt; = &lt;VP head fronted&gt;
		&lt;V head infl valence&gt; = applicative
		&lt;V head type copular&gt; = -
		&lt;VP head fronted head case&gt; = accusative
		&lt;VP head fronted head type wh&gt; = +
		&lt;VP head fronted cat&gt; = DP
		&lt;VP head type question&gt; = +
		&lt;V head type motion&gt; = -
		&lt;VP option&gt; = 5iAppl
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
		rule {VP option 5iFocAppl - V initial/final, applicative object focused (accusative object)}
		VP = V
		&lt;VP head&gt; = &lt;V head&gt;
		&lt;V head object&gt; = &lt;VP head fronted&gt;
		&lt;V head infl valence&gt; = applicative
		&lt;V head type copular&gt; = -
		&lt;VP head fronted head case&gt; = accusative
		&lt;VP head fronted head type wh&gt; = -
		&lt;VP head fronted cat&gt; = FocusP
		&lt;VP head type question&gt; = -
		&lt;V head type motion&gt; = -
		&lt;VP option&gt; = 5iFocAppl
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='split' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='split' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
		rule {VP option 5jAppl - V initial/final, applicative object questioned (absolutive object)}
		VP = V
		&lt;VP head&gt; = &lt;V head&gt;
		&lt;V head object&gt; = &lt;VP head fronted&gt;
		&lt;V head infl valence&gt; = applicative
		&lt;V head type copular&gt; = -
		&lt;VP head fronted head case&gt; = absolutive
		&lt;VP head fronted head type wh&gt; = +
		&lt;VP head fronted cat&gt; = DP
		&lt;VP head type question&gt; = +
		&lt;V head type motion&gt; = -
		&lt;VP option&gt; = 5jAppl
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
		rule {VP option 5jFocAppl - V initial/final, applicative object focused (absolutive object)}
		VP = V
		&lt;VP head&gt; = &lt;V head&gt;
		&lt;V head object&gt; = &lt;VP head fronted&gt;
		&lt;V head infl valence&gt; = applicative
		&lt;V head type copular&gt; = -
		&lt;VP head fronted head case&gt; = absolutive
		&lt;VP head fronted head type wh&gt; = -
		&lt;VP head fronted cat&gt; = FocusP
		&lt;VP head type question&gt; = -
		&lt;V head type motion&gt; = -
		&lt;VP option&gt; = 5jFocAppl
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5k - VSO order, transitive, object questioned (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5k
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5kFoc - VSO order, transitive, object focused (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5kFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequired - VSO order, transitive, object questioned (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5kNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequiredFoc - VSO order, transitive, object focused (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5kNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5kp - VSO order, transitive, object questioned (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kp
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5kpFoc - VSO order, transitive, object focused (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kpFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5l - VSO order, transitive, object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5l
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5lFoc - VSO order, transitive, object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5lFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequired - VSO order, transitive, object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5lNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequiredFoc - VSO order, transitive, object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5lNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5lp - VSO order, transitive, object questioned (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lp
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5lpFoc - VSO order, transitive, object focused (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lpFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	

	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kAppl - VSO order, applicative object questioned (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5kAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kFocAppl - VSO order, applicative object focused (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5kFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequiredAppl - VSO order, applicative object questioned (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5kNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequiredFocAppl - VSO order, applicative object focused (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5kNegSubjVerbRequiredFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kpAppl - VSO order, applicative object questioned (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kpAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kpFocAppl - VSO order, applicative object focused (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kpFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lAppl - VSO order, applicative object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5lAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lFocAppl - VSO order, applicative object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5lFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequiredAppl - VSO order, applicative object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5lNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequiredFocAppl - VSO order, applicative object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5lNegSubjVerbRequiredFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lpAppl - VSO order, applicative object questioned (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lpAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lpFocAppl - VSO order, applicative object focused (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lpFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	

	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5m - OSV order, transitive, object questioned (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5m
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5mFoc - OSV order, transitive, object focused (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5mFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequired - OSV order, transitive, object questioned (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5mNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequiredFoc - OSV order, transitive, object focused (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5mNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5mp - OSV order, transitive, object questioned (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mp
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5mpFoc - OSV order, transitive, object focused (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mpFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5n - OSV order, transitive, object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5n
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5nFoc - OSV order, transitive, object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5nFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequired - OSV order, transitive, object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5nNegSubjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequiredFoc - OSV order, transitive, object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5nNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5np - OSV order, transitive, object questioned (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5np
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5npFoc - OSV order, transitive, object focused (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5npFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	

	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mAppl - OSV order, applicative object questioned (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5mAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mFocAppl - OSV order, applicative object focused (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5mFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequiredAppl - OSV order, applicative object questioned (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5mNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequiredFocAppl - OSV order, applicative object focused (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5mNegSubjVerbRequiredFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mpAppl - OSV order, applicative object questioned (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mpAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mpFocAppl - OSV order, applicative object focused (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mpFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5nAppl - OSV order, applicative object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5nAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5nFocAppl - OSV order, applicative object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5nFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequiredAppl - OSV order, applicative object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5nNegSubjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequiredFocAppl - OSV order, applicative object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5nNegSubjVerbRequiredFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5npAppl - OSV order, applicative object questioned (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5npAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5npFocAppl - OSV order, applicative object focused (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5npFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	


	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5o - VSO order, transitive, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5o
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5oFoc - VSO order, transitive, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5oFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5oNegObjVerbRequired - VSO order, transitive, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5oNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5oNegObjVerbRequiredFoc - VSO order, transitive, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5oNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5p - VSO order, transitive, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5p
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5pFoc - VSO order, transitive, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5pFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5pNegObjVerbRequired - VSO order, transitive, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5pNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5pNegObjVerbRequiredFoc - VSO order, transitive, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5pNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	

		<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5oAppl - VSO order, applicative, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5oAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5oFocAppl - VSO order, applicative, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5oFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5oNegObjVerbRequiredAppl - VSO order, applicative, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5oNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5oNegObjVerbRequiredFocAppl - VSO order, applicative, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5oNegObjVerbRequiredFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5pAppl - VSO order, applicative, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5pAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5pFocAppl - VSO order, applicative, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5pFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5pNegObjVerbRequiredAppl - VSO order, applicative, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5pNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5pNegObjVerbRequiredFocAppl - VSO order, applicative, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5pNegObjVerbRequiredFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	

	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5q - OSV order, transitive, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5q
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5qFoc - OSV order, transitive, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5qFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5qNegObjVerbRequired - OSV order, transitive, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5qNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5qNegObjVerbRequiredFoc - OSV order, transitive, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5qNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5r - OSV order, transitive, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5r
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5rFoc - OSV order, transitive, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5rFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5rNegObjVerbRequired - OSV order, transitive, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5rNegObjVerbRequired
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no'">
<xsl:text>
rule {VP option 5rNegObjVerbRequiredFoc - OSV order, transitive, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5rNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
			
		
		
		
		
		
		
		
		
		 
	
		
		
		
		
		
		
		
		
		
			
		
		
		
		
		
		
		
		
		
	

	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5qAppl - OSV order, applicative, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5qAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5qFocAppl - OSV order, applicative, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5qFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5qNegObjVerbRequiredAppl - OSV order, applicative, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5qNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5qNegObjVerbRequiredFocAppl - OSV order, applicative, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5qNegObjVerbRequiredFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5rAppl - OSV order, applicative, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5rAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5rFocAppl - OSV order, applicative, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5rFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5rNegObjVerbRequiredAppl - OSV order, applicative, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5rNegObjVerbRequiredAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		 
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voice)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@voiceCase)='no' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5rNegObjVerbRequiredFocAppl - OSV order, applicative, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5rNegObjVerbRequiredFocAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		 
		
		 
			
		
		
		
		
		
		
		
		
		 
		
		 
		
		
		
		
		
		
		
		
		
		
		
		 
			
		
		
		
		
		
		
		
		
		
		
		 
	

	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5aVNom - V initial, transitive}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5aVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
	   
	   
	   
	   

		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5aNegObjVerbRequiredVNom - V initial, transitive}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5aNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		


	   
	   

		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5bVAbs - V initial, transitive (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5bVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		

	   
	   

		
		
		
		
		
		

	   
	   

		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5bNegObjVerbRequiredVAbs - V initial, transitive (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5bNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		

	   
	   

		
		
		
		
		
		

	   
	   

		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cVNom - V final, transitive}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		


	   
	   

		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cNegObjVerbRequiredVNom - V final, transitive}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		


	   
	   

		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cQSubjVNom - V final, transitive, subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cQSubjVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cQSubjNegObjVerbRequiredVNom - V final, transitive, subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5cQSubjNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cNegSubjVNom - V final, transitive, subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cNegSubjVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequiredVNom - V final, transitive, subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequiredVNom - V final, transitive, subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cQAdvPVNom - V final, transitive, AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cQAdvPVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cQAdvPNegObjVerbRequiredVNom - V final, transitive, AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cQAdvPNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPVNom - V final, transitive, AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPVerbRequiredVNom - V final, transitive, AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPObjVerbRequiredVNom - V final, transitive, AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dVAbs - V final, transitive (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		

	   
	   

		
		
		
		
		
		

	   
	   

		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dNegObjVerbRequiredVAbs - V final, transitive (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		

	   
	   

		
		
		
		
		
		

	   
	   

		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dQSubjVAbs - V final, transitive (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5dQSubjVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dQSubjNegObjVerbRequiredVAbs - V final, transitive (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5dQSubjNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dNegSubjVAbs - V final, transitive (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dNegSubjVerbRequiredVAbs - V final, transitive (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dNegSubjNegObjVerbRequiredVAbs - V final, transitive (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dQAdvPVAbs - V final, transitive (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dQAdvPVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dQAdvPNegObjVerbRequiredVAbs - V final, transitive (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dQAdvPNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPVAbs - V final, transitive (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPVerbRequiredVAbs - V final, transitive (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPNegObjVerbRequiredVAbs - V final, transitive (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		
		


	   
	   
	

		<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5aVNomAppl - V initial, applicative}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5aVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
	   
	   
	   
	   
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5aNegObjVerbRequiredVNomAppl - V initial, applicative}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5aNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5bVAbsAppl - V initial, applicative (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5bVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5bNegObjVerbRequiredVAbsAppl - V initial, applicative (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5bNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cVNomAppl - V final, applicative}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegObjVerbRequiredVNomAppl - V final, applicative}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cQSubjVNomAppl - V final, applicative, subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cQSubjVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cQSubjNegObjVerbRequiredVNomAppl - V final, applicative, subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5cQSubjNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegSubjVNomAppl - V final, applicative, subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cNegSubjVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequiredVNomAppl - V final, applicative, subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequiredVNomAppl - V final, applicative, subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cQAdvPVNomAppl - V final, applicative, AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cQAdvPVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cQAdvPNegObjVerbRequiredVNomAppl - V final, applicative, AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cQAdvPNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>Appl
rule {VP option 5cNegAdvPVNomAppl - V final, applicative, AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPVerbRequiredVNomAppl - V final, applicative, AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPObjVerbRequiredVNomAppl - V final, applicative, AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dVAbsAppl - V final, applicative (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegObjVerbRequiredVAbsAppl - V final, applicative (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dQSubjVAbsAppl - V final, applicative (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5dQSubjVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dQSubjNegObjVerbRequiredVAbsAppl - V final, applicative (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5dQSubjNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegSubjVAbsAppl - V final, applicative (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegSubjVerbRequiredVAbsAppl - V final, applicative (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegSubjNegObjVerbRequiredVAbsAppl - V final, applicative (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
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
 	&lt;DP_1 head agr animacy&gt; = &lt;DP head agr animacy&gt;
 	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dQAdvPVAbsAppl - V final, applicative (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dQAdvPVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dQAdvPNegObjVerbRequiredVAbsAppl - V final, applicative (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dQAdvPNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPVAbsAppl - V final, applicative (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPVerbRequiredVAbsAppl - V final, applicative (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPNegObjVerbRequiredVAbsAppl - V final, applicative (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head infl polarity&gt; = negative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	


	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5eVNom - VSO order, transitive}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
 	&lt;VP option&gt; = 5eVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5eNegSubjVerbRequiredVNom - VSO order, transitive}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegSubjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5eNegObjVerbRequiredVNom - VSO order, transitive}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5eNegSubjOrObjVerbRequiredVNom - VSO order, transitive}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegSubjOrObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5eiVNom - VSO order, transitive, imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP option&gt; = 5eiVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5eiNegObjVerbRequiredVNom - VSO order, transitive, imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5eiNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5ep - VSO order, transitive, pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
 	&lt;VP option&gt; = 5epVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5epIOVNom - VSO order, transitive (dative case indirect object), subj pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	{&lt;DP_1 head type reflexive&gt; = -
	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = dative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
	&lt;VP option&gt; = 5epIOVNom
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5epNegObjVerbRequiredVNom - VSO order, transitive, pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
        &lt;VP head fronted&gt; == ~[cat:FocusP]
        &lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5epNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5fVAbs - VSO order, transitive (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
 	&lt;VP option&gt; = 5fVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5fNegSubjVerbRequiredVAbs - VSO order, transitive (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegSubjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5fNegObjVerbRequiredVAbs - VSO order, transitive (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5fNegSubjOrObjVerbRequiredVAbs - VSO order, transitive (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegSubjOrObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5fiVAbs - VSO order, transitive (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;VP option&gt; = 5fiVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5fiNegObjVerbRequiredVAbs - VSO order, transitive (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5fiNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5fpVAbs - VSO order, transitive (absolutive case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
 	&lt;VP option&gt; = 5fpVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5fpNegObjVerbRequiredVAbs - VSO order, transitive (absolutive case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fpNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	

		<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eVNomAppl - VSO order, applicative}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
 	&lt;VP option&gt; = 5eVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eNegSubjVerbRequiredVNomAppl - VSO order, applicative}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegSubjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eNegObjVerbRequiredVNomAppl - VSO order, applicative}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eNegSubjOrObjVerbRequiredVNomAppl - VSO order, applicative}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5eNegSubjOrObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eiVNomAppl - VSO order, applicative, imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP option&gt; = 5eiVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5eiNegObjVerbRequiredVNomAppl - VSO order, applicative, imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5eiNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5epAppl - VSO order, applicative, pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
 	&lt;VP option&gt; = 5epVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5epNegObjVerbRequiredVNomAppl - VSO order, applicative, pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
        &lt;VP head fronted&gt; == ~[cat:FocusP]
        &lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5epNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fVAbsAppl - VSO order, applicative (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
 	&lt;VP option&gt; = 5fVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fNegSubjVerbRequiredVAbsAppl - VSO order, applicative (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegSubjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fNegObjVerbRequiredVAbsAppl - VSO order, applicative (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fNegSubjOrObjVerbRequiredVAbsAppl - VSO order, applicative (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fNegSubjOrObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fiVAbsAppl - VSO order, applicative (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;VP option&gt; = 5fiVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fiNegObjVerbRequiredVAbsAppl - VSO order, applicative (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5fiNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fpVAbsAppl - VSO order, applicative (absolutive case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
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
 	&lt;VP option&gt; = 5fpVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5fpNegObjVerbRequiredVAbsAppl - VSO order, applicative (absolutive case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5fpNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	


	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5gVNom - OSV order, transitive}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
 	&lt;VP option&gt; = 5gVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5gNegSubjVerbRequiredVNom - OSV order, transitive}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegSubjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5gNegObjVerbRequiredVNom - OSV order, transitive}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5gNegSubjOrObjVerbRequiredVNom - OSV order, transitive}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegSubjOrObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5giVNom - OSV order, transitive, imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5giVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5giNegObjVerbRequiredVNom - OSV order, transitive, imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5giNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5gpVNom - OSV order, transitive, pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gpVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5gpNegObjVerbRequiredVNom - OSV order, transitive, pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gpNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5hVAbs - OSV order, transitive (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
 	 &lt;VP option&gt; = 5hVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5hNegSubjVerbRequiredVAbs - OSV order, transitive (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegSubjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5hNegObjVerbRequiredVAbs - OSV order, transitive (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5hNegSubjOrObjVerbRequiredVAbs - OSV order, transitive (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegSubjOrObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5hiVAbs - OSV order, transitive (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5hiVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5hiNegObjVerbRequiredVAbs - OSV order, transitive (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5hiNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5hpVAbs - OSV order, transitive (absolutive case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hpVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5hpNegObjVerbRequiredVAbs - OSV order, transitive (absolutive case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hpNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	

		<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gVNomAppl - OSV order, applicative}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
 	&lt;VP option&gt; = 5gVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gNegSubjVerbRequiredVNomAppl - OSV order, applicative}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegSubjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gNegObjVerbRequiredVNomAppl - OSV order, applicative}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gNegSubjOrObjVerbRequiredVNomAppl - OSV order, applicative}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
 	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;DP_1 head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gNegSubjOrObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5giVNomAppl - OSV order, applicative, imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5giVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5giNegObjVerbRequiredVNomAppl - OSV order, applicative, imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5giNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gpVNomAppl - OSV order, applicative, pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gpVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5gpNegObjVerbRequiredVNomAppl - OSV order, applicative, pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = nominative
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5gpNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hVAbsAppl - OSV order, applicative (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
 	 &lt;VP option&gt; = 5hVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hNegSubjVerbRequiredVAbsAppl - OSV order, applicative (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegSubjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hNegObjVerbRequiredVAbsAppl - OSV order, applicative (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hNegSubjOrObjVerbRequiredVAbsAppl - OSV order, applicative (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hNegSubjOrObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hiVAbsAppl - OSV order, applicative (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5hiVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hiNegObjVerbRequiredVAbsAppl - OSV order, applicative (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood&gt; = imperative
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -		
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5hiNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hpVAbsAppl - OSV order, applicative (absolutive case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hpVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5hpNegObjVerbRequiredVAbsAppl - OSV order, applicative (absolutive case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        	{&lt;DP_1 head type reflexive&gt; = -
        	/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood&gt; = declarative
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP_1 head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP_1 head case&gt; = absolutive
	}
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt; 
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
 	&lt;VP head fronted&gt; == ~[cat:FocusP]
 	&lt;VP head fronted&gt; == ~[cat:DP]
 	&lt;VP option&gt; = 5hpNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	


	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5iVNom - V initial/final, object questioned}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5iVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5iFocVNom - V initial/final, object focused}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5iFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='split' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5jVAbs - V initial/final, object questioned (absolutive object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5jVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5jFocVAbs - V initial/final, object focused (absolutive object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head subject head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head subject head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5jFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	

	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
		rule {VP option 5iVNomAppl - V initial/final, applicative object questioned}
		VP = V
		&lt;VP head&gt; = &lt;V head&gt;
		&lt;V head object&gt; = &lt;VP head fronted&gt;
		&lt;V head infl valence&gt; = applicative
		&lt;V head type copular&gt; = -
		{&lt;V head infl voice&gt; = actor
		&lt;V head subject head case&gt; = nominative
		&lt;VP head fronted head case&gt; = genitive
		/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
		&lt;V head subject head case&gt; = genitive
		&lt;VP head fronted head case&gt; = nominative
		}
		&lt;VP head fronted head type wh&gt; = +
		&lt;VP head fronted cat&gt; = DP
		&lt;VP head type question&gt; = +
		&lt;V head type motion&gt; = -
		&lt;VP option&gt; = 5iVNomAppl
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
		rule {VP option 5iFocVNomAppl - V initial/final, applicative object focused}
		VP = V
		&lt;VP head&gt; = &lt;V head&gt;
		&lt;V head object&gt; = &lt;VP head fronted&gt;
		&lt;V head infl valence&gt; = applicative
		&lt;V head type copular&gt; = -
		{&lt;V head infl voice&gt; = actor
		&lt;V head subject head case&gt; = nominative
		&lt;VP head fronted head case&gt; = genitive
		/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
		&lt;V head subject head case&gt; = genitive
		&lt;VP head fronted head case&gt; = nominative
		}
		&lt;VP head fronted head type wh&gt; = -
		&lt;VP head fronted cat&gt; = FocusP
		&lt;VP head type question&gt; = -
		&lt;V head type motion&gt; = -
		&lt;VP option&gt; = 5iFocVNomAppl
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//typology/@case)='split' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
		rule {VP option 5jVAbsAppl - V initial/final, applicative object questioned (absolutive object)}
		VP = V
		&lt;VP head&gt; = &lt;V head&gt;
		&lt;V head object&gt; = &lt;VP head fronted&gt;
		&lt;V head infl valence&gt; = applicative
		&lt;V head type copular&gt; = -
		{&lt;V head infl voice&gt; = actor
		&lt;V head subject head case&gt; = absolutive
		&lt;VP head fronted head case&gt; = ergative
		/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
		&lt;V head subject head case&gt; = ergative
		&lt;VP head fronted head case&gt; = absolutive
		}
		&lt;VP head fronted head type wh&gt; = +
		&lt;VP head fronted cat&gt; = DP
		&lt;VP head type question&gt; = +
		&lt;V head type motion&gt; = -
		&lt;VP option&gt; = 5jVAbsAppl
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
		rule {VP option 5jFocVAbsAppl - V initial/final, applicative object focused (absolutive object)}
		VP = V
		&lt;VP head&gt; = &lt;V head&gt;
		&lt;V head object&gt; = &lt;VP head fronted&gt;
		&lt;V head infl valence&gt; = applicative
		&lt;V head type copular&gt; = -
		{&lt;V head infl voice&gt; = actor
		&lt;V head subject head case&gt; = absolutive
		&lt;VP head fronted head case&gt; = ergative
		/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
		&lt;V head subject head case&gt; = ergative
		&lt;VP head fronted head case&gt; = absolutive
		}
		&lt;VP head fronted head type wh&gt; = -
		&lt;VP head fronted cat&gt; = FocusP
		&lt;VP head type question&gt; = -
		&lt;V head type motion&gt; = -
		&lt;VP option&gt; = 5jFocVAbsAppl
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5kVNom - VSO order, transitive, object questioned}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5kVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5kFocVNom - VSO order, transitive, object focused}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5kFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequiredVNom - VSO order, transitive, object questioned}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5kNegSubjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequiredFocVNom - VSO order, transitive, object focused}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5kNegSubjVerbRequiredFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5kpVNom - VSO order, transitive, object questioned, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kpVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5kpFocVNom - VSO order, transitive, object focused, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kpFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5lVAbs - VSO order, transitive, object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5lVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5lFocVAbs - VSO order, transitive, object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5lFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequiredVAbs - VSO order, transitive, object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5lNegSubjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequiredFocVAbs - VSO order, transitive, object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5lNegSubjVerbRequiredFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5lpVAbs - VSO order, transitive, object questioned (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lpVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5lpFocVAbs - VSO order, transitive, object focused (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lpFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	

		<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kVNomAppl - VSO order, applicative object questioned}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5kVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kFocVNomAppl - VSO order, applicative object focused}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5kFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequiredVNomAppl - VSO order, applicative object questioned}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5kNegSubjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequiredFocVNomAppl - VSO order, applicative object focused}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5kNegSubjVerbRequiredFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kpVNomAppl - VSO order, applicative object questioned, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kpVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5kpFocVNomAppl - VSO order, applicative object focused, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kpFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lVAbsAppl - VSO order, applicative object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5lVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lFocVAbsAppl - VSO order, applicative object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5lFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequiredVAbsAppl - VSO order, applicative object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5lNegSubjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequiredFocVAbsAppl - VSO order, applicative object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5lNegSubjVerbRequiredFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lpVAbsAppl - VSO order, applicative object questioned (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lpVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5lpFocVAbsAppl - VSO order, applicative object focused (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lpFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	

	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5mVNom - OSV order, transitive, object questioned}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5mVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5mFocVNom - OSV order, transitive, object focused}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5mFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequiredVNom - OSV order, transitive, object questioned}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5mNegSubjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequiredFocVNom - OSV order, transitive, object focused}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5mNegSubjVerbRequiredFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5mpVNom - OSV order, transitive, object questioned, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mpVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5mpFocVNom - OSV order, transitive, object focused, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mpFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5nVAbs - OSV order, transitive, object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5nVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5nFocVAbs - OSV order, transitive, object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5nFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequiredVAbs - OSV order, transitive, object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5nNegSubjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequiredFocVAbs - OSV order, transitive, object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5nNegSubjVerbRequiredFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5npVAbs - OSV order, transitive, object questioned (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5npVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5npFocVAbs - OSV order, transitive, object focused (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5npFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	

		<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mVNomAppl - OSV order, applicative object questioned}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5mVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mFocVNomAppl - OSV order, applicative object focused}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5mFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequiredVNomAppl - OSV order, applicative object questioned}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5mNegSubjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequiredFocVNomAppl - OSV order, applicative object focused}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = genitive
	&lt;VP head fronted head case&gt; = nominative
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5mNegSubjVerbRequiredFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mpVNomAppl - OSV order, applicative object questioned, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mpVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5mpFocVNomAppl - OSV order, applicative object focused, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mpFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5nVAbsAppl - OSV order, applicative object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5nVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5nFocVAbsAppl - OSV order, applicative object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5nFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequiredVAbsAppl - OSV order, applicative object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5nNegSubjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequiredFocVAbsAppl - OSV order, applicative object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	}
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
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5nNegSubjVerbRequiredFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5npVAbsAppl - OSV order, applicative object questioned (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5npVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5npFocVAbsAppl - OSV order, applicative object focused (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;VP head fronted head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;VP head fronted head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5npFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	

	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5oVNom - VSO order, transitive, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5oVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5oFocVNom - VSO order, transitive, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5oFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5oNegObjVerbRequiredVNom - VSO order, transitive, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5oNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5oNegObjVerbRequiredFocVNom - VSO order, transitive, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5oNegObjVerbRequiredFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5pVAbs - VSO order, transitive, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5pVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5pFocVAbs - VSO order, transitive, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5pFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5pNegObjVerbRequiredVAbs - VSO order, transitive, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5pNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5pNegObjVerbRequiredFocVAbs - VSO order, transitive, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5pNegObjVerbRequiredFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	

		<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5oVNomAppl - VSO order, applicative, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5oVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5oFocVNomAppl - VSO order, applicative, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5oFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5oNegObjVerbRequiredVNomAppl - VSO order, applicative, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                           [infl:[polarity:negative]]
	&lt;VP option&gt; = 5oNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5oNegObjVerbRequiredFocVNomAppl - VSO order, applicative, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5oNegObjVerbRequiredFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5pVAbsAppl - VSO order, applicative, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5pVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5pFocVAbsAppl - VSO order, applicative, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5pFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5pNegObjVerbRequiredVAbsAppl - VSO order, applicative, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5pNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5pNegObjVerbRequiredFocVAbsAppl - VSO order, applicative, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5pNegObjVerbRequiredFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	

	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5qVNom - OSV order, transitive, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5qVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5qFocVNom - OSV order, transitive, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5qFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5qNegObjVerbRequiredVNom - OSV order, transitive, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5qNegObjVerbRequiredVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5qNegObjVerbRequiredFocVNom - OSV order, transitive, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5qNegObjVerbRequiredFocVNom
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5rVAbs - OSV order, transitive, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5rVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5rFocVAbs - OSV order, transitive, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5rFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5rNegObjVerbRequiredVAbs - OSV order, transitive, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5rNegObjVerbRequiredVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
rule {VP option 5rNegObjVerbRequiredFocVAbs - OSV order, transitive, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	{&lt;V head type transitive&gt; = +
	&lt;V head infl valence&gt; = active
	/&lt;V head type transitive&gt; = -
	&lt;V head infl valence&gt; = causative
	}
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5rNegObjVerbRequiredFocVAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   

		
		
		
		
		
		
		


	   
	   
	
   
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5qVNomAppl - OSV order, applicative, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5qVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5qFocVNomAppl - OSV order, applicative, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5qFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5qNegObjVerbRequiredVNomAppl - OSV order, applicative, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5qNegObjVerbRequiredVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5qNegObjVerbRequiredFocVNomAppl - OSV order, applicative, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = nominative
	&lt;DP head case&gt; = genitive
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = genitive
	&lt;DP head case&gt; = nominative
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5qNegObjVerbRequiredFocVNomAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5rVAbsAppl - OSV order, applicative, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5rVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5rFocVAbsAppl - OSV order, applicative, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5rFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5rNegObjVerbRequiredVAbsAppl - OSV order, applicative, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5rNegObjVerbRequiredVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//typology/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes' and normalize-space(//ip/@applicative)='yes'">
<xsl:text>
rule {VP option 5rNegObjVerbRequiredFocVAbsAppl - OSV order, applicative, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head infl valence&gt; = applicative
	&lt;VP head type pro-drop&gt; = -
        	{&lt;DP head type reflexive&gt; = +
 	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        	/&lt;DP head type reflexive&gt; = -
        	}
	&lt;V head type copular&gt; = -
	{&lt;V head infl voice&gt; = actor
	&lt;V head fronted head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	/&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	&lt;V head fronted head case&gt; = ergative
	&lt;DP head case&gt; = absolutive
	}
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be 
                     [infl:[polarity:negative]]
	&lt;VP option&gt; = 5rNegObjVerbRequiredFocVAbsAppl
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		

	   
	   
		
		
		
		
		
		
		
		
		
		


	   
	   
		
		
	
   
</xsl:template>
</xsl:stylesheet>
