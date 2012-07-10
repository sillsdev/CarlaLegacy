<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="vppassvso">

   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no'">
<xsl:text>
	  rule {VP option 10antiI - VSO order, antipassive, with optional PP Theme}
	  VP = V DP (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiI
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no'">
<xsl:text>
	  rule {VP option 10antiINegSubjVerbRequired - VSO order, antipassive, with optional PP Theme}
	  VP = V DP (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
	  [infl:[polarity:negative]]
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiINegSubjVerbRequired
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@voice)='no'">
<xsl:text>
	  rule {VP option 10antiISubjQ - VSO order, antipassive, subj questioned}
	  VP = V (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = +
	  &lt;VP head fronted cat&gt; = DP
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	  &lt;VP option&gt; = 10antiISubjQ
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//ip/@voice)='no'">
<xsl:text>
	  rule {VP option 10antiIFoc - VSO order, antipassive, subj focused}
	  VP = V (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = -
	  &lt;VP head fronted cat&gt; = FocusP
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	  &lt;VP option&gt; = 10antiIFoc
   </xsl:text>
</xsl:if>












   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voice)='no'">
<xsl:text>
	  rule {VP option 10antiF - OSV order, antipassive, with optional PP Theme}
	  VP = (PP) V DP
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiF
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voice)='no'">
<xsl:text>
	  rule {VP option 10antiFNegSubjVerbRequired - OSV order, antipassive, with optional PP Theme}
	  VP = (PP) V DP
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
	  [infl:[polarity:negative]]
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiFNegSubjVerbRequired
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@voice)='no'">
<xsl:text>
	  rule {VP option 10antiFSubjQ - OSV order, antipassive, subj questioned}
	  VP = (PP) V
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = +
	  &lt;VP head fronted cat&gt; = DP
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	  &lt;VP option&gt; = 10antiFSubjQ
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//ip/@voice)='no'">
<xsl:text>
	  rule {VP option 10antiFFoc - OSV order, antipassive, subj focused}
	  VP = (PP) V
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = -
	  &lt;VP head fronted cat&gt; = FocusP
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	  &lt;VP option&gt; = 10antiFFoc
   </xsl:text>
</xsl:if>













   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiIVNom - VSO order, antipassive, with optional PP Theme}
	  VP = V DP (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = nominative
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = genitive
	  }
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiIVNom
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiINegSubjVerbRequiredVNom - VSO order, antipassive, with optional PP Theme}
	  VP = V DP (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = nominative
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = genitive
	  }
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
	  [infl:[polarity:negative]]
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiINegSubjVerbRequiredVNom
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiISubjQVNom - VSO order, antipassive, subj questioned}
	  VP = V (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = nominative
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = genitive
	  }
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = +
	  &lt;VP head fronted cat&gt; = DP
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	  &lt;VP option&gt; = 10antiISubjQVNom
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiIFocVNom - VSO order, antipassive, subj focused}
	  VP = V (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = nominative
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = genitive
	  }
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = -
	  &lt;VP head fronted cat&gt; = FocusP
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	  &lt;VP option&gt; = 10antiIFocVNom
   </xsl:text>
</xsl:if>














   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiFVNom - OSV order, antipassive, with optional PP Theme}
	  VP = (PP) V DP
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = nominative
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = genitive
	  }
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiFVNom
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiFNegSubjVerbRequiredVNom - OSV order, antipassive, with optional PP Theme}
	  VP = (PP) V DP
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = nominative
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = genitive
	  }
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
	  [infl:[polarity:negative]]
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiFNegSubjVerbRequiredVNom
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiFSubjQVNom - OSV order, antipassive, subj questioned}
	  VP = (PP) V
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = nominative
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = genitive
	  }
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = +
	  &lt;VP head fronted cat&gt; = DP
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	  &lt;VP option&gt; = 10antiFSubjQVNom
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//ip/@voiceCase)='yesNom' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiFFocVNom - OSV order, antipassive, subj focused}
	  VP = (PP) V
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = nominative
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = genitive
	  }
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = -
	  &lt;VP head fronted cat&gt; = FocusP
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	  &lt;VP option&gt; = 10antiFFocVNom
   </xsl:text>
</xsl:if>















   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiIVAbs - VSO order, antipassive, with optional PP Theme}
	  VP = V DP (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = absolutive
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = ergative
	  }
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiIVAbs
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiINegSubjVerbRequiredVAbs - VSO order, antipassive, with optional PP Theme}
	  VP = V DP (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = absolutive
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = ergative
	  }
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
	  [infl:[polarity:negative]]
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiINegSubjVerbRequiredVAbs
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiISubjQVAbs - VSO order, antipassive, subj questioned}
	  VP = V (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = absolutive
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = ergative
	  }
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = +
	  &lt;VP head fronted cat&gt; = DP
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	  &lt;VP option&gt; = 10antiISubjQVAbs
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiIFocVAbs - VSO order, antipassive, subj focused}
	  VP = V (PP)
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = absolutive
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = ergative
	  }
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = -
	  &lt;VP head fronted cat&gt; = FocusP
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	  &lt;VP option&gt; = 10antiIFocVAbs
   </xsl:text>
</xsl:if>














   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
	  rule {VP option 10antiFVAbs - OSV order, antipassive, with optional PP Theme}
	  VP = (PP) V DP
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = absolutive
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = ergative
	  }
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiFVAbs
   </xsl:text>
</xsl:if>







   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiFNegSubjVerbRequiredVAbs - OSV order, antipassive, with optional PP Theme}
	  VP = (PP) V DP
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head subject&gt; = &lt;DP&gt;
	  &lt;V head infl valence&gt; &lt;= antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = absolutive
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = ergative
	  }
	  &lt;V head type transitive&gt; = +
	  &lt;PP head type sentential&gt; = -
	  &lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
	  [infl:[polarity:negative]]
	  &lt;VP head fronted&gt; == ~[cat:FocusP]
	  &lt;VP option&gt; = 10antiFNegSubjVerbRequiredVAbs
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiFSubjQVAbs - OSV order, antipassive, subj questioned}
	  VP = (PP) V
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = absolutive
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = ergative
	  }
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = +
	  &lt;VP head fronted cat&gt; = DP
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	  &lt;VP option&gt; = 10antiFSubjQVAbs
   </xsl:text>
</xsl:if>











   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//focus/@focus)='yes' and normalize-space(//ip/@antipassive)!='no' and normalize-space(//ip/@voiceCase)='yesAbs' and normalize-space(//ip/@voice)='yes'">
<xsl:text>
	  rule {VP option 10antiFFocVAbs - OSV order, antipassive, subj focused}
	  VP = (PP) V
	  &lt;VP head&gt; = &lt;V head&gt;
	  &lt;V head infl valence&gt; = antipassive
	  {&lt;V head infl voice&gt; = actor
	  &lt;V head subject head case&gt; = absolutive
	  /&lt;V head infl voice&gt; = {object dative locative instrumental goal}
	  &lt;V head subject head case&gt; = ergative
	  }
	  &lt;VP head type pro-drop&gt; = -
	  &lt;V head subject&gt; = &lt;VP head fronted&gt;
	  &lt;VP head type question&gt; = -
	  &lt;VP head fronted cat&gt; = FocusP
	  &lt;PP head infl valence&gt; =active
	  &lt;PP head type sentential&gt; = -
	  &lt;PP head type suffix poss&gt; = -         | only in possessor position
	  &lt;PP head type prefix poss&gt; = -
	  &lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	  &lt;VP option&gt; = 10antiFFocVAbs
   </xsl:text>
</xsl:if>

















   <xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10a - VSO order, passive, no Agent phrase, no passive Aux}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10a
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10aNegObjVerbRequired - VSO order, passive, no Agent phrase, no passive Aux}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 10aNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 10ap - VSO order, passive, no Agent phrase, no passive Aux, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ap
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10b - OSV order, passive, no Agent phrase, no passive Aux}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10b
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10bNegObjVerbRequired - OSV order, passive, no Agent phrase, no passive Aux}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 10bNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 10bp - OSV order, passive, no Agent phrase, no passive Aux, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10bp
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10c - VSO order, passive, no Agent but PP ditrans, no passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10c
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10cNegObjVerbRequired - VSO order, passive, no Agent but PP ditrans, no passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 10cNegObjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10cp - VSO order, passive, no Agent but PP ditrans, no passive Aux, pro-drop}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10cp
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10cpNegObjVerbRequired - VSO order, passive, no Agent but PP ditrans, no passive Aux, pro-drop}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 10cpNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10d - OSV order, passive, no Agent but PP ditrans, no passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10d
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10dNegObjVerbRequired - OSV order, passive, no Agent but PP ditrans, no passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 10dNegObjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10dp - OSV order, passive, no Agent but PP ditrans, no passive Aux, pro-drop}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10dp
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10dpNegObjVerbRequired - OSV order, passive, no Agent but PP ditrans, no passive Aux, pro-drop}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 10dpNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10e - VSO order, passive, no Agent phrase, passive Aux}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10e
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10eNegObjVerbRequired - VSO order, passive, no Agent phrase, passive Aux}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 10eNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 10ep - VSO order, passive, no Agent phrase, passive Aux, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ep
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10f - OSV order, passive, no Agent phrase, passive Aux}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10f
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10fNegObjVerbRequired - OSV order, passive, no Agent phrase, passive Aux}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 10fNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 10fp - OSV order, passive, no Agent phrase, passive Aux, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10fp
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10g - VSO order, passive, no Agent but PP ditrans, passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10g
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10gNegObjVerbRequired - VSO order, passive, no Agent but PP ditrans, passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 10gNegObjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10gp - VSO order, passive, no Agent but PP ditrans, passive Aux, pro-drop}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10gp
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10gpNegObjVerbRequired - VSO order, passive, no Agent but PP ditrans, passive Aux, pro-drop}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10gpNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10h - OSV order, passive, no Agent but PP ditrans, passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10h
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10hNegObjVerbRequired - OSV order, passive, no Agent but PP ditrans, passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10hNegObjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10hp - OSV order, passive, no Agent but PP ditrans, passive Aux, pro-drop}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10hp
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10hpNegObjVerbRequired - OSV order, passive, no Agent but PP ditrans, passive Aux, pro-drop}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10hpNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10i - VSO order, passive, with PP Agent, no ditrans, no passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10i
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10iNegSubjVerbRequired - VSO order, passive, with PP Agent, no ditrans, no passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10iNegSubjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10iNegObjVerbRequired - VSO order, passive, with PP Agent, no ditrans, no passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10iNegObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10iNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, no ditrans, no passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10iNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10iinit - VSO order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V DP PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10iinit
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10iinitNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V DP PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10iinitNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10iinitNegObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V DP PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10iinitNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10iinitNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V DP PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10iinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10ifin - VSO order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V DP PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ifin
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10ifinNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V DP PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ifinNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ifinNegObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V DP PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ifinNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ifinNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V DP PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ifinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10ip - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ip
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10ipNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ipNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10ipinit - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ipinit
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10ipinitNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ipinitNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ipinitNegObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ipinitNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ipinitNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ipinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10ipfin - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ipfin
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10ipfinNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ipfinNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ipfinNegObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ipfinNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ipfinNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ipfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10j - OSV order, passive, with PP Agent, no ditrans, no passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10j
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10jNegSubjVerbRequired - OSV order, passive, with PP Agent, no ditrans, no passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jNegSubjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jNegObjVerbRequired - OSV order, passive, with PP Agent, no ditrans, no passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jNegObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, no ditrans, no passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10jinit - OSV order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = PP_1 PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jinit
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10jinitNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = PP_1 PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jinitNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jinitNegObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = PP_1 PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jinitNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jinitNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = PP_1 PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10jfin - OSV order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = PP PP_2 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jfin
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10jfinNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = PP PP_2 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jfinNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jfinNegObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = PP PP_2 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jfinNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jfinNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = PP PP_2 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10jp - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jp
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10jpNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jpNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10jpinit - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jpinit
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10jpinitNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jpinitNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jpinitNegObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jpinitNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jpinitNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jpinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10jpfin - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jpfin
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10jpfinNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jpfinNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jpfinNegObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jpfinNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10jpfinNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10jpfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10k - VSO order, passive, with PP Agent, no ditrans, passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10k
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10kNegSubjVerbRequired - VSO order, passive, with PP Agent, no ditrans, passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kNegSubjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kNegObjVerbRequired - VSO order, passive, with PP Agent, no ditrans, passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kNegObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, no ditrans, passive Aux}
VP = V DP PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10kinit - VSO order, passive, with PP Agent, PP ditrans, passive Aux}
VP = V DP PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kinit
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10kinitNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux}
VP = V DP PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kinitNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kinitNegObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux}
VP = V DP PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kinitNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kinitNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux}
VP = V DP PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10kfin - VSO order, passive, with PP Agent, PP ditrans, passive Aux}
VP = V DP PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kfin
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10kfinNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux}
VP = V DP PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kfinNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kfinNegObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux}
VP = V DP PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kfinNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kfinNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux}
VP = V DP PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10kp - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kp
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10kpNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kpNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10kpinit - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kpinit
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10kpinitNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kpinitNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kpinitNegObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kpinitNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kpinitNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kpinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10kpfin - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kpfin
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10kpfinNegSubjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kpfinNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kpfinNegObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kpfinNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10kpfinNegSubjorObjVerbRequired - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10kpfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10l - OSV order, passive, with PP Agent, no ditrans, passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10l
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10lNegSubjVerbRequired - OSV order, passive, with PP Agent, no ditrans, passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lNegSubjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10lNegObjVerbRequired - OSV order, passive, with PP Agent, no ditrans, passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lNegObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10lNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, no ditrans, passive Aux}
VP = PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10linit - OSV order, passive, with PP Agent, PP ditrans, passive Aux}
VP = PP_1 PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10linit
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10linitNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux}
VP = PP_1 PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10linitNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10linitNegObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux}
VP = PP_1 PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10linitNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10linitNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux}
VP = PP_1 PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10linitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10lfin - OSV order, passive, with PP Agent, PP ditrans, passive Aux}
VP = PP PP_2 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lfin
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10lfinNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux}
VP = PP PP_2 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lfinNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10lfinNegObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux}
VP = PP PP_2 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if "object"negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lfinNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10lfinNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux}
VP = PP PP_2 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10lp - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lp
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10lpNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lpNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10lpinit - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lpinit
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10lpinitNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lpinitNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10lpinitNegObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lpinitNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10lpinitNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lpinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10lpfin - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lpfin
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10lpfinNegSubjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lpfinNegSubjVerbRequired
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10lpfinNegObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lpfinNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10lpfinNegSubjorObjVerbRequired - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10lpfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10m - VSO order, passive, with DP Agent phrase, no passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
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
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10m
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10mNegSubjVerbRequired - VSO order, passive, with DP Agent phrase, no passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mNegSubjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10mNegObjVerbRequired - VSO order, passive, with DP Agent phrase, no passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mNegObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10mNegSubjorObjVerbRequired - VSO order, passive, with DP Agent phrase, no passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10mp - VSO order, passive, with DP Agent phrase, no passive Aux, pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mp
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10mpNegSubjVerbRequired - VSO order, passive, with DP Agent phrase, no passive Aux, pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mpNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10mDP - VSO order, passive, with DP Agent phrase, DP ditrans, no passive Aux}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mDP
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10mDPNegSubjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, no passive Aux}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mDPNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10mDPNegObjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, no passive Aux}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mDPNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10mNegDPSubjorObjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, no passive Aux}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 10mDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10mpDP - VSO order, passive, with DP Agent phrase, DP ditrans, no passive Aux, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mpDP
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10mpDPNegSubjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, no passive Aux, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mpDPNegSubjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10mpDPNegObjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, no passive Aux, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mpDPNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10mpDPNegSubjorObjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, no passive Aux, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10mpDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10n - OSV order, passive, with DP Agent phrase, no passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
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
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10n
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10nNegSubjVerbRequired - OSV order, passive, with DP Agent phrase, no passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10nNegSubjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10nNegObjVerbRequired - OSV order, passive, with DP Agent phrase, no passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10nNegObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10nNegSubjorObjVerbRequired - OSV order, passive, with DP Agent phrase, no passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10nNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10np - OSV order, passive, with DP Agent phrase, no passive Aux, pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10np
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10npNegSubjVerbRequired - OSV order, passive, with DP Agent phrase, no passive Aux, pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10npNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10nDP - OSV order, passive, with DP Agent phrase, DP ditrans, no passive Aux}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10nDP
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10nDPNegSubjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, no passive Aux}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10nDPNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10nDPNegObjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, no passive Aux}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10nDPNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10nDPNegSubjorObjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, no passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10nDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10npDP - OSV order, passive, with DP Agent phrase, DP ditrans, no passive Aux, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10npDP
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10npDPNegSubjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, no passive Aux, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10npDPNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10npDPNegObjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, no passive Aux, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10npDPNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10npDPNegSubjorObjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, no passive Aux, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
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
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10npDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10o - VSO order, passive, with DP Agent phrase, passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10o
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10oNegSubjVerbRequired - VSO order, passive, with DP Agent phrase, passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10oNegSubjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10oNegObjVerbRequired - VSO order, passive, with DP Agent phrase, passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10oNegObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10oNegSubjorObjVerbRequired - VSO order, passive, with DP Agent phrase, passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10oNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10op - VSO order, passive, with DP Agent phrase, passive Aux, pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10op
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10opNegSubjVerbRequired - VSO order, passive, with DP Agent phrase, passive Aux, pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10opNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10oDP - VSO order, passive, with DP Agent phrase, DP ditrans, passive Aux}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10oDP
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10oDPNegSubjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, passive Aux}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10oDPNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10oDPNegObjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, passive Aux}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10oDPNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10oDPNegSubjorObjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans,  passive Aux}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10oDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10opDP - VSO order, passive, with DP Agent phrase, DP ditrans, passive Aux, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10opDP
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10opDPNegSubjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, passive Aux, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10opDPNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10opDPNegObjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, passive Aux, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10opDPNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10opDPNegSubjorObjVerbRequired - VSO order, passive, with DP Agent phrase, DP ditrans, passive Aux, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10opDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10p - OSV order, passive, with DP Agent phrase, passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10p
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10pNegSubjVerbRequired - OSV order, passive, with DP Agent phrase, passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10pNegSubjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10pNegObjVerbRequired - OSV order, passive, with DP Agent phrase, passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10pNegObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10pNegSubjorObjVerbRequired - OSV order, passive, with DP Agent phrase, passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10pNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10pp - OSV order, passive, with DP Agent phrase, passive Aux, pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10pp
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10ppNegSubjVerbRequired - OSV order, passive, with DP Agent phrase, passive Aux, pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ppNegSubjVerbRequired
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10pDP - OSV order, passive, with DP Agent phrase, DP ditrans, passive Aux}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10pDP
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10pDPNegSubjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, passive Aux}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10pDPNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10pDPNegObjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, passive Aux}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10pDPNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10pNegDPSubjorObjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, passive Aux}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
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
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [object:[head:[infl:[polarity:negative]]]] -&gt;  | if object negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10pDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10ppDP - OSV order, passive, with DP Agent phrase, DP ditrans, passive Aux, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ppDP
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10ppDPNegSubjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, passive Aux, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ppDPNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ppDPNegObjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, passive Aux, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ppDPNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ppDPNegSubjorObjVerbRequired - OSV order, passive, with DP Agent phrase, DP ditrans, passive Aux, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = +
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 10ppDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no'">
<xsl:text>
rule {VP option 10q - VSO/OSV order, passive, no Agent, no passive Aux, subj questioned}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP option&gt; = 10q
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10qFoc - VSO/OSV order, passive, no Agent, no passive Aux, subj focused}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP option&gt; = 10qFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10r - VSO order, passive, no Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10r
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10rFoc - VSO order, passive, no Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10rFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10rNegObjVerbRequired - VSO order, passive, no Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10rNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10rNegObjVerbRequiredFoc - VSO order, passive, no Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10rNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10rf - OSV order, passive, no Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10rf
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10rfFoc - OSV order, passive, no Agent, PP ditrans, no passive Aux, subj focused}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10rfFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10rfNegObjVerbRequired - OSV order, passive, no Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10rfNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10rfNegObjVerbRequiredFoc - OSV order, passive, no Agent, PP ditrans, no passive Aux, subj focused}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10rfNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes'">
<xsl:text>
rule {VP option 10s - VSO/OSV order, passive, no Agent, passive Aux, subj questioned}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP option&gt; = 10s
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10sFoc - VSO/OSV order, passive, no Agent, passive Aux, subj focused}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP option&gt; = 10sFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10t - VSO order, passive, no Agent, PP ditrans, passive Aux, subj questioned}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10t
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10tFoc - VSO order, passive, no Agent, PP ditrans, passive Aux, subj focused}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10tFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10tNegObjVerbRequired - VSO order, passive, no Agent, PP ditrans, passive Aux, subj questioned}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10tNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10tNegObjVerbRequiredFoc - VSO order, passive, no Agent, PP ditrans, passive Aux, subj focused}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10tNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10tf - OSV order, passive, no Agent, PP ditrans, passive Aux, subj questioned}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10tf
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10tfFoc - OSV order, passive, no Agent, PP ditrans, passive Aux, subj focused}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10tfFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10tfNegObjVerbRequired - OSV order, passive, no Agent, PP ditrans, passive Aux, subj questioned}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10tfNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10tfNegObjVerbRequiredFoc - OSV order, passive, no Agent, PP ditrans, passive Aux, subj focused}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10tfNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10u - VSO order, passive, PP Agent, no ditrans, no passive Aux, subj questioned}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10u
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10uFoc - VSO order, passive, PP Agent, no ditrans, no passive Aux, subj focused}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10uFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10uNegSubjVerbRequired - VSO order, passive, PP Agent, no ditrans, no passive Aux, subj questioned}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10uNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10uNegSubjVerbRequiredFoc - VSO order, passive, PP Agent, no ditrans, no passive Aux, subj focused}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10uNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10uinit - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10uinit
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10uinitFoc - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10uinitFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10uinitNegSubjVerbRequired - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10uinitNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10uinitNegSubjVerbRequiredFoc - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10uinitNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10uinitNegObjVerbRequired - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10uinitNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10uinitNegObjVerbRequiredFoc - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10uinitNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10uinitNegSubjorObjVerbRequired - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10uinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10uinitNegSubjorObjVerbRequiredFoc - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10uinitNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10ufin - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP option&gt; = 10ufin
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10ufinFoc - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP option&gt; = 10ufinFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10ufinNegSubjVerbRequired - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10ufinNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10ufinNegSubjVerbRequiredFoc - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10ufinNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ufinNegObjVerbRequired - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10ufinNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10ufinNegObjVerbRequiredFoc - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10ufinNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10ufinNegSubjorObjVerbRequired - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10ufinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10ufinNegSubjorObjVerbRequiredFoc - VSO order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10ufinNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10v - OSV order, passive, PP Agent, no ditrans, no passive Aux, subj questioned}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10v
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vFoc - OSV order, passive, PP Agent, no ditrans, no passive Aux, subj focused}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10vFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10vNegSubjVerbRequired - OSV order, passive, PP Agent, no ditrans, no passive Aux, subj questioned}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vNegSubjVerbRequiredFoc - OSV order, passive, PP Agent, no ditrans, no passive Aux, subj focused}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10vinit - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP option&gt; = 10vinit
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vinitFoc - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP option&gt; = 10vinitFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10vinitNegSubjVerbRequired - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vinitNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vinitNegSubjVerbRequiredFoc - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vinitNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10vinitNegObjVerbRequired - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vinitNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vinitNegObjVerbRequiredFoc - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vinitNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10vinitNegSubjorObjVerbRequired - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vinitNegSubjorObjVerbRequiredFoc - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vinitNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10vfin - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10vfin
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vfinFoc - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10vfinFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10vfinNegSubjVerbRequired - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vfinNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vfinNegSubjVerbRequiredFoc - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vfinNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10vfinNegObjVerbRequired - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vfinNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vfinNegObjVerbRequiredFoc - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vfinNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10vfinNegSubjorObjVerbRequired - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj questioned}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10vfinNegSubjorObjVerbRequiredFoc - OSV order, passive, PP Agent, PP ditrans, no passive Aux, subj focused}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10vfinNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10w - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10w
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10wFoc - VSO order, passive, PP Agent, no ditrans, passive Aux, subj focused}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10wFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10wNegSubjVerbRequired - VSO order, passive, PP Agent, no ditrans, passive Aux, subj questioned}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; = passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; = passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10wNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10wNegSubjVerbRequiredFoc - VSO order, passive, PP Agent, no ditrans, passive Aux, subj focused}
VP = V PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; = passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; = passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10wNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10winit - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10winit
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10winitFoc - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 10winitFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10winitNegSubjVerbRequired - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10winitNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10winitNegSubjVerbRequiredFoc - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10winitNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10winitNegObjVerbRequired - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10winitNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10winitNegObjVerbRequiredFoc - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10winitNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10winitNegSubjorObjVerbRequired - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10winitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10winitNegSubjorObjVerbRequiredFoc - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = V PP_1 PP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10winitNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10wfin - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP option&gt; = 10wfin
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10wfinFoc - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP option&gt; = 10wfinFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10wfinNegSubjVerbRequired - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10wfinNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10wfinNegSubjVerbRequiredFoc - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10wfinNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10wfinNegObjVerbRequired - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10wfinNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10wfinNegObjVerbRequiredFoc - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10wfinNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10wfinNegSubjorObjVerbRequired - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10wfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10wfinNegSubjorObjVerbRequiredFoc - VSO order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = V PP PP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP_2 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10wfinNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10x - OSV order, passive, PP Agent, no ditrans, passive Aux, subj questioned}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10x
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xFoc - OSV order, passive, PP Agent, no ditrans, passive Aux, subj focused}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10xFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10xNegSubjVerbRequired - OSV order, passive, PP Agent, no ditrans, passive Aux, subj questioned}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xNegSubjVerbRequiredFoc - OSV order, passive, PP Agent, no ditrans, passive Aux, subj focused}
VP = PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10xinit - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP option&gt; = 10xinit
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xinitFoc - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP option&gt; = 10xinitFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10xinitNegSubjVerbRequired - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xinitNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xinitNegSubjVerbRequiredFoc - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xinitNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10xinitNegObjVerbRequired - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xinitNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xinitNegObjVerbRequiredFoc - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xinitNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10xinitNegSubjorObjVerbRequired - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xinitNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xinitNegSubjorObjVerbRequiredFoc - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = PP_1 PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_1 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_1 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xinitNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10xfin - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10xfin
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xfinFoc - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP option&gt; = 10xfinFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10xfinNegSubjVerbRequired - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xfinNegSubjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xfinNegSubjVerbRequiredFoc - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xfinNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10xfinNegObjVerbRequired - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xfinNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xfinNegObjVerbRequiredFoc - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xfinNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10xfinNegSubjorObjVerbRequired - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj questioned}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xfinNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10xfinNegSubjorObjVerbRequiredFoc - OSV order, passive, PP Agent,PP ditrans, passive Aux, subj focused}
VP = PP PP_2 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;PP head infl valence&gt; =passive
	&lt;PP_2 head infl valence&gt; =active
	&lt;PP head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;PP_2 head type prefix poss&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_2 head object&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;PP head type comma&gt; = -
	&lt;PP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10xfinNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10y - VSO order, passive, DP Agent, no ditrans, no passive Aux, subj questioned}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 10y
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yFoc - VSO order, passive, DP Agent, no ditrans, no passive Aux, subj focused}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 10yFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10yNegSubjVerbRequired - VSO order, passive, DP Agent, no ditrans, no passive Aux, subj questioned}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yNegSubjVerbRequiredFoc - VSO order, passive, DP Agent, no ditrans, no passive Aux, subj focused}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10yDP - VSO order, passive, DP Agent, DP ditrans, no passive Aux, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 10yDP
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yDPFoc - VSO order, passive, DP Agent, DP ditrans, no passive Aux, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 10yDPFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10yDPNegSubjVerbRequired - VSO order, passive, DP Agent, DP ditrans, no passive Aux, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yDPNegSubjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10yDPNegObjVerbRequired - VSO order, passive, DP Agent, DP ditrans, no passive Aux, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yDPNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10yDPNegSubjorObjVerbRequired - VSO order, passive, DP Agent, DP ditrans, no passive Aux, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yDPNegSubjVerbRequiredFoc - VSO order, passive, DP Agent, DP ditrans, no passive Aux, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yDPNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yDPNegObjVerbRequiredFoc - VSO order, passive, DP Agent, DP ditrans, no passive Aux, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yDPNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yDPNegSubjorObjVerbRequiredFoc - VSO order, passive, DP Agent, DP ditrans, no passive Aux, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yDPNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10z - OSV order, passive, DP Agent, no ditrans, no passive Aux, subj questioned}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 10z
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zFoc - OSV order, passive, DP Agent, no ditrans, no passive Aux, subj focused}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 10zFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10zNegSubjVerbRequired - OSV order, passive, DP Agent, no ditrans, no passive Aux, subj questioned}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zNegSubjVerbRequiredFoc - OSV order, passive, DP Agent, no ditrans, no passive Aux, subj focused}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10zDP - OSV order, passive, DP Agent, DP ditrans, no passive Aux, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 10zDP
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zDPFoc - OSV order, passive, DP Agent, DP ditrans, no passive Aux, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 10zDPFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10zDPNegSubjVerbRequired - OSV order, passive, DP Agent, DP ditrans, no passive Aux, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zDPNegSubjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10zDPNegObjVerbRequired - OSV order, passive, DP Agent, DP ditrans, no passive Aux, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zDPNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10zDPNegSubjorObjVerbRequired - OSV order, passive, DP Agent, DP ditrans, no passive Aux, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zDPNegSubjVerbRequiredFoc - OSV order, passive, DP Agent, DP ditrans, no passive Aux, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zDPNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zDPNegObjVerbRequiredFoc - OSV order, passive, DP Agent, DP ditrans, no passive Aux, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zDPNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='no' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zDPNegSubjorObjVerbRequiredFoc - OSV order, passive, DP Agent, DP ditrans, no passive Aux, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zDPNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10ya - VSO order, passive, DP Agent, no ditrans, passive Aux, subj questioned}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 10ya
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yaFoc - VSO order, passive, DP Agent, no ditrans, passive Aux, subj focused}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 10yaFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10yaNegSubjVerbRequired - VSO order, passive, DP Agent, no ditrans, passive Aux, subj questioned}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yaNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yaNegSubjVerbRequiredFoc - VSO order, passive, DP Agent, no ditrans, passive Aux, subj focused}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yaNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10yaDP - VSO order, passive, DP Agent, DP ditrans, passive Aux, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 10yaDP
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yaDPFoc - VSO order, passive, DP Agent, DP ditrans, passive Aux, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 10yaDPFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10yaDPNegSubjVerbRequired - VSO order, passive, DP Agent, DP ditrans, passive Aux, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yaDPNegSubjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10yaDPNegObjVerbRequired - VSO order, passive, DP Agent, DP ditrans, passive Aux, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yaDPNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10yaDPNegSubjorObjVerbRequired - VSO order, passive, DP Agent, DP ditrans, passive Aux, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yaDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yaDPNegSubjVerbRequiredFoc - VSO order, passive, DP Agent, DP ditrans, passive Aux, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yaDPNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yaDPNegObjVerbRequiredFoc - VSO order, passive, DP Agent, DP ditrans, passive Aux, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yaDPNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10yaDPNegSubjorObjVerbRequiredFoc - VSO order, passive, DP Agent, DP ditrans, passive Aux, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10yaDPNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 10za - OSV order, passive, DP Agent, no ditrans, passive Aux, subj questioned}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 10za
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zaFoc - OSV order, passive, DP Agent, no ditrans, passive Aux, subj focused}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 10zaFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 10zaNegSubjVerbRequired - OSV order, passive, DP Agent, no ditrans, passive Aux, subj questioned}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zaNegSubjVerbRequired
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zaNegSubjVerbRequiredFoc - OSV order, passive, DP Agent, no ditrans, passive Aux, subj focused}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zaNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10zaDP - OSV order, passive, DP Agent, DP ditrans, passive Aux, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 10zaDP
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zaDPFoc - OSV order, passive, DP Agent, DP ditrans, passive Aux, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 10zaDPFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 10zaDPNegSubjVerbRequired - OSV order, passive, DP Agent, DP ditrans, passive Aux, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zaDPNegSubjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10zaDPNegObjVerbRequired - OSV order, passive, DP Agent, DP ditrans, passive Aux, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zaDPNegObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 10zaDPNegSubjorObjVerbRequired - OSV order, passive, DP Agent, DP ditrans, passive Aux, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zaDPNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zaDPNegSubjVerbRequiredFoc - OSV order, passive, DP Agent, DP ditrans, passive Aux, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zaDPNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zaDPNegObjVerbRequiredFoc - OSV order, passive, DP Agent, DP ditrans, passive Aux, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zaDPNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@passiveAux)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 10zaDPNegSubjorObjVerbRequiredFoc - OSV order, passive, DP Agent, DP ditrans, passive Aux, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head infl valence&gt; =passive
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = FocusP
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP head&gt; == [indirectobject:[head:[infl:[polarity:negative]]]] -&gt;  | if indirectobject negative, VP must be
					 [infl:[polarity:negative]]
	&lt;VP option&gt; = 10zaDPNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































</xsl:template>
</xsl:stylesheet>
