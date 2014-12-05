<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advp">
    <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes'">
<xsl:text>
rule {AdvP option NegI}
AdvP = Neg AdvP_1
            &lt;AdvP head&gt; = &lt;AdvP_1 head&gt;
            &lt;AdvP head modifier&gt; = &lt;Neg&gt;
            &lt;Neg head type AdvP-initial&gt; = +
            &lt;Neg head type comma&gt; = -
            &lt;AdvP head infl polarity&gt; &lt;= negative
            &lt;AdvP head type prefix&gt; &lt;= &lt;Neg head type prefix&gt;
            &lt;AdvP head&gt; == [type:[manner:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[manner:+]]]]]
            &lt;AdvP head&gt; == [type:[temporal:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[temporal:+]]]]]
            &lt;AdvP head&gt; == [type:[locative:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[locative:+]]]]]
            &lt;AdvP option&gt; = NegI
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes'">
<xsl:text>
        rule {AdvP option NegF}
        AdvP =  AdvP_1 Neg
        &lt;AdvP head&gt; = &lt;AdvP_1 head&gt;
        &lt;AdvP head modifier&gt; = &lt;Neg&gt;
        &lt;Neg head type AdvP-final&gt; = +
        &lt;AdvP_1 head type comma&gt; = -
        &lt;AdvP head infl polarity&gt; &lt;= negative
        &lt;AdvP head type suffix&gt; &lt;= &lt;Neg head type suffix&gt;
        &lt;AdvP head type comma&gt; &lt;= &lt;Neg head type comma&gt;
        &lt;AdvP head&gt; == [type:[manner:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[manner:+]]]]]
        &lt;AdvP head&gt; == [type:[temporal:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[temporal:+]]]]]
        &lt;AdvP head&gt; == [type:[locative:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[locative:+]]]]]
        &lt;AdvP option&gt; = NegF
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>
        rule {AdvP option NegBoth}
        AdvP = Neg_1 AdvP_1 Neg_2
        &lt;AdvP head&gt; = &lt;AdvP_1 head&gt;
        &lt;AdvP head modifier&gt; = &lt;Neg_1&gt;
        &lt;Neg_1 head type AdvP-initial&gt; = +
        &lt;Neg_2 head type AdvP-final&gt; = +
        &lt;Neg_1 head type comma&gt; = -
        &lt;AdvP_1 head type comma&gt; = -
        &lt;AdvP head infl polarity&gt; &lt;= negative
        &lt;AdvP head type prefix&gt; &lt;= &lt;Neg_1 head type prefix&gt;
        &lt;AdvP head type suffix&gt; &lt;= &lt;Neg_2 head type suffix&gt;
        &lt;AdvP head type comma&gt; &lt;= &lt;Neg_2 head type comma&gt;
        &lt;AdvP head&gt; == [type:[manner:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[manner:+]]]]]
        &lt;AdvP head&gt; == [type:[temporal:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[temporal:+]]]]]
        &lt;AdvP head&gt; == [type:[locative:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[locative:+]]]]]
        &lt;AdvP option&gt; = NegBoth
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes'">
<xsl:text>
        rule {AdvP option IndefI - interrogative indef phrase, initial}
        AdvP = Adv Indef
        &lt;AdvP head&gt; = &lt;Indef head&gt;
         &lt;Adv head type wh&gt; = +
        &lt;Adv head type AdvP-initial&gt; = +
        &lt;AdvP head type prefix&gt; &lt;= &lt;Adv head type prefix&gt; 
        &lt;AdvP head type suffix&gt; &lt;= &lt;Indef head type suffix&gt; 
        &lt;AdvP option&gt; = IndefI
    </xsl:text>
</xsl:if>
    
        
        
        
 
        
        
        
    
    <xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes'">
<xsl:text>
        rule {AdvP option IndefF - interrogative indef phrase, final}
        AdvP = Indef Adv
        &lt;AdvP head&gt; = &lt;Indef head&gt;
        &lt;Adv head type wh&gt; = +
        &lt;Adv head type AdvP-final&gt; = +
        &lt;AdvP head type prefix&gt; &lt;= &lt;Indef head type prefix&gt; 
        &lt;AdvP head type suffix&gt; &lt;= &lt;Adv head type suffix&gt; 
        &lt;AdvP option&gt; = IndefF
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>
        rule {AdvP option IndefBoth - interrogative indef phrase, both sides}
        AdvP = Adv_1 Indef Adv_2
        &lt;AdvP head&gt; = &lt;Indef head&gt;
        &lt;Adv_1 head type wh&gt; = +
        &lt;Adv_2 head type wh&gt; = +
        &lt;Adv_1 head type AdvP-initial&gt; = +
        &lt;Adv_2 head type AdvP-final&gt; = +
        &lt;AdvP head type prefix&gt; &lt;= &lt;Adv_1 head type prefix&gt; 
        &lt;AdvP head type suffix&gt; &lt;= &lt;Adv_2 head type suffix&gt; 
        &lt;AdvP option&gt; = IndefBoth
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes'">
<xsl:text>
        rule {AdvP option QI - quantifier indef phrase, initial}
        AdvP = Q N
        &lt;AdvP head&gt; = &lt;N head&gt;
        &lt;N head type generic&gt; = +
        &lt;Q head type AdvP-initial&gt; = +
        &lt;AdvP head type prefix&gt; &lt;= &lt;Q head type prefix&gt; 
        &lt;AdvP head type suffix&gt; &lt;= &lt;N head type suffix&gt; 
        &lt;AdvP option&gt; = QI
    </xsl:text>
</xsl:if>
    
        
        
        
 
        
        
        
    
    <xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes'">
<xsl:text>
        rule {AdvP option QF - quantifier indef phrase, final}
        AdvP = N Q
        &lt;AdvP head&gt; = &lt;N head&gt;
        &lt;N head type generic&gt; = +
        &lt;Q head type AdvP-final&gt; = +
        &lt;AdvP head type prefix&gt; &lt;= &lt;N head type prefix&gt; 
        &lt;AdvP head type suffix&gt; &lt;= &lt;Q head type suffix&gt; 
        &lt;AdvP option&gt; = QF
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>
        rule {AdvP option QBoth - quantifier indef phrase, both sides}
        AdvP = Q_1 N Q_2
        &lt;AdvP head&gt; = &lt;N head&gt;
        &lt;N head type generic&gt; = +
        &lt;Q_1 head type AdvP-initial&gt; = +
        &lt;Q_1 head type AdvP-final&gt; = +
        &lt;AdvP head type prefix&gt; &lt;= &lt;Q_1 head type prefix&gt; 
        &lt;AdvP head type suffix&gt; &lt;= &lt;Q_2 head type suffix&gt; 
        &lt;AdvP option&gt; = QBoth
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
        
    <xsl:text>
rule {AdvP option 0 - no modifiers}
AdvP = Adv'
	&lt;AdvP head&gt; = &lt;Adv' head&gt;
	&lt;AdvP option&gt; = 0
</xsl:text>
    <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes' and normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' or normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='yes' and normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' or normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerDegreeWord/@checked)='yes' and normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes'">
<xsl:text>
rule {AdvP option 1 - modifiers initial}
AdvP = Deg Adv'
	&lt;AdvP head&gt; = &lt;Adv' head&gt;
	&lt;AdvP head modifier&gt; = &lt;Deg&gt;
	&lt;Deg head type AdvP-initial&gt; = +
	&lt;Deg head type comma&gt; = -
	&lt;AdvP head type prefix&gt; &lt;= &lt;Deg head type prefix&gt;
	&lt;AdvP head&gt; == [type:[manner:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[manner:+]]]]]
	&lt;AdvP head&gt; == [type:[temporal:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[temporal:+]]]]]
	&lt;AdvP head&gt; == [type:[locative:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[locative:+]]]]]
	&lt;AdvP option&gt; = 1
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' or normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' or normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerDegreeWord/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes'">
<xsl:text>
rule {AdvP option 2 - modifiers final}
AdvP = Adv' Deg
	&lt;AdvP head&gt; = &lt;Adv' head&gt;
	&lt;AdvP head modifier&gt; = &lt;Deg head&gt;
	&lt;Deg head type AdvP-final&gt; = +
	&lt;Adv' head type comma&gt; = -
	&lt;AdvP head type comma&gt; &lt;= &lt;Deg head type comma&gt;
	&lt;AdvP head type suffix&gt; &lt;= &lt;Deg head type suffix&gt;
	&lt;AdvP head&gt; == [type:[manner:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[manner:+]]]]]
	&lt;AdvP head&gt; == [type:[temporal:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[temporal:+]]]]]
	&lt;AdvP head&gt; == [type:[locative:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[locative:+]]]]]
	&lt;AdvP option&gt; = 2
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' or normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' or normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerDegreeWord/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes'">
<xsl:text>
        rule {AdvP option 3 - modifiers both sides}
        AdvP = Deg_1 Adv' Deg_2
        &lt;AdvP head&gt; = &lt;Adv' head&gt;
        &lt;AdvP head modifier&gt; = &lt;Deg_1 head&gt;
        &lt;Deg_1 head type AdvP-initial&gt; = +
        &lt;Deg_2 head type AdvP-final&gt; = +
        &lt;Deg_1 head type comma&gt; = -
        &lt;Adv' head type comma&gt; = -
        &lt;AdvP head type comma&gt; &lt;= &lt;Deg_2 head type comma&gt;
        &lt;AdvP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
        &lt;AdvP head type suffix&gt; &lt;= &lt;Deg_2 head type suffix&gt;
        &lt;AdvP head&gt; == [type:[manner:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[manner:+]]]]]
        &lt;AdvP head&gt; == [type:[temporal:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[temporal:+]]]]]
        &lt;AdvP head&gt; == [type:[locative:+]] -&gt; [modifier:[head:[type:[modifies_Adv:[locative:+]]]]]
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
	&lt;Adv head type comma&gt; = -
	&lt;Adv' head type comma&gt; &lt;= &lt;Adv_1 head type comma&gt;
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
	&lt;Adv_1 head type comma&gt; = -
	&lt;Adv' head type prefix&gt; &lt;= &lt;Adv_1 head type prefix&gt;
	&lt;Adv' option&gt; = 1i
</xsl:text>
</xsl:if>
   
        
      
      
   
    <xsl:if test="normalize-space(//advcl/@advOrNPPos)='after' or normalize-space(//advcl/@advOrNPPos)='either'">
<xsl:text>
rule {AdvBar option 2f - DP complements final}
Adv' = Adv DP
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type takes_DP&gt; = +
	&lt;Adv head type comma&gt; = -
	&lt;Adv' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;Adv' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;Adv' option&gt; = 2f
</xsl:text>
</xsl:if>
    
        

        
    
    <xsl:if test="normalize-space(//advcl/@advOrNPPos)='before' or normalize-space(//advcl/@advOrNPPos)='either'">
<xsl:text>
rule {AdvBar option 2i - DP complements initial}
Adv' = DP Adv
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type takes_DP&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;Adv' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;Adv' option&gt; = 2i
</xsl:text>
</xsl:if>
    
        

        
    
    <xsl:text>
rule {AdvBar option 3f - IP complements final}
Adv' = Adv IP
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type sentential&gt; = +
	&lt;IP head fronted&gt; = none
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head type verbheaded&gt; = +
	&lt;IP head type root&gt; = -
	&lt;Adv head type comma&gt; = -
	&lt;Adv' head type comma&gt; &lt;= &lt;IP head type comma&gt;
	&lt;Adv' head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	&lt;Adv' head type motion&gt; &lt;= &lt;IP head type motion&gt;  |keep locative with motion V
	&lt;Adv' option&gt; = 3f
</xsl:text>
    <xsl:if test="normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//typology/@wordOrder)='OSV'">
<xsl:text>
rule {AdvBar option 3i - IP complements initial}
Adv' = IP Adv
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type sentential&gt; = +
	&lt;IP head fronted&gt; = none
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head type verbheaded&gt; = +
	&lt;IP head type root&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;Adv' head type prefix&gt; &lt;= &lt;IP head type prefix&gt;
	&lt;Adv' head type motion&gt; &lt;= &lt;IP head type motion&gt;  |keep locative with motion V
	&lt;Adv' option&gt; = 3i
</xsl:text>
</xsl:if>
    
        
        
        
        
        
    
    <xsl:text>
rule {AdvBar option 4f - CP complements final}
Adv' = Adv CP
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type sentential&gt; = +
	&lt;Adv head embedded&gt; = &lt;CP&gt;
	&lt;CP head type question&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;CP head type root&gt; = -
	&lt;Adv head type comma&gt; = -
	&lt;Adv' head type comma&gt; &lt;= &lt;CP head type comma&gt;
	&lt;Adv' head type suffix&gt; &lt;= &lt;CP head type suffix&gt;
	&lt;Adv' option&gt; = 4f
</xsl:text>
    <xsl:if test="normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//typology/@wordOrder)='OSV'">
<xsl:text>
rule {AdvBar option 4i - CP complements initial}
Adv' = CP Adv
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type sentential&gt; = +
	&lt;Adv head embedded&gt; = &lt;CP&gt;
	&lt;CP head type question&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;CP head type root&gt; = -
	&lt;CP head type comma&gt; = -
	&lt;Adv' head type prefix&gt; &lt;= &lt;CP head type prefix&gt;
	&lt;Adv' option&gt; = 4i
</xsl:text>
</xsl:if>
    
        
        
        
        
        
    
</xsl:template>
</xsl:stylesheet>
