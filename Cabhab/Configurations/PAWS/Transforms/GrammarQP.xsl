<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="qp">
    <xsl:text>
rule {QP option 0 - no modifiers}
QP = Q
	&lt;QP head&gt; = &lt;Q head&gt;
	&lt;QP option&gt; = 0
</xsl:text>
    <xsl:if test="normalize-space(//qp/@degree)='yes' and normalize-space(//qp/degreeBefore/@checked)='yes' or normalize-space(//qp/@degree)='some' and normalize-space(//qp/degreeBefore/@checked)='yes'">
<xsl:text>
rule {QP option 1 - modifiers initial}
QP = Deg Q
	&lt;QP head&gt; = &lt;Q head&gt;
	&lt;Deg head type modifies_Q&gt; = +
	&lt;Deg head type QP-initial&gt; = +
	&lt;Deg head type comma&gt; = -
	&lt;QP head type prefix&gt; &lt;= &lt;Deg head type prefix&gt;
	&lt;QP option&gt; = 1
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
    <xsl:if test="normalize-space(//qp/@degree)='yes' and normalize-space(//qp/degreeAfter/@checked)='yes' or normalize-space(//qp/@degree)='some' and normalize-space(//qp/degreeAfter/@checked)='yes'">
<xsl:text>
rule {QP option 2 - modifiers final}
QP = Q Deg
	&lt;QP head&gt; = &lt;Q head&gt;
	&lt;Deg head type modifies_Q&gt; = +
	&lt;Deg head type QP-final&gt;   = +
	&lt;Q head type comma&gt; = -
	&lt;QP head type comma&gt; &lt;= &lt;Deg head type comma&gt;
	&lt;QP head type suffix&gt; &lt;= &lt;Deg head type suffix&gt;
	&lt;QP option&gt; = 2
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//qp/@degree)='yes' and normalize-space(//qp/degreeBoth/@checked)='yes' or normalize-space(//qp/@degree)='some' and normalize-space(//qp/degreeBoth/@checked)='yes'">
<xsl:text>
rule {QP option 3 - modifiers both sides}
QP = Deg_1 Q Deg_2
	&lt;QP head&gt; = &lt;Q head&gt;
	&lt;Deg_1 head type modifies_Q&gt; = +
	&lt;Deg_2 head type modifies_Q&gt; = +
	&lt;Deg_1 head type QP-initial&gt; = +
	&lt;Deg_2 head type QP-final&gt;   = +
	&lt;Deg_1 head type comma&gt; = -
	&lt;Q head type comma&gt; = -
	&lt;QP head type comma&gt; &lt;= &lt;Deg_2 head type comma&gt;
	&lt;QP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;QP head type suffix&gt; &lt;= &lt;Deg_2 head type suffix&gt;
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//qp/@cardinalHead)='initial'">
<xsl:text>
rule {QP option Num0i - no modifiers, head initial}
QP = Num (Conj) (Num_1 (Conj_1) (Num_2 (Conj_2) (Num_3 (Conj_3) (Num_4 (Conj_4) (Num_5)))))
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Num head type quantifier&gt; = +
	&lt;Conj head type conjoins_DP&gt; = +
	&lt;Conj_1 head type conjoins_DP&gt; = +
	&lt;Conj_2 head type conjoins_DP&gt; = +
	&lt;Conj_3 head type conjoins_DP&gt; = +
	&lt;Conj_4 head type conjoins_DP&gt; = +
	&lt;QP option&gt; = Num0i
</xsl:text>
</xsl:if>
    
        
    
    <xsl:if test="normalize-space(//qp/@cardinalHead)='final'">
<xsl:text>
rule {QP option Num0f - no modifiers, head final}
QP = (((((Num_5) (Conj_4) Num_4) (Conj_3) Num_3) (Conj_2) Num_2) (Conj_1) Num_1) (Conj) Num
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Num head type quantifier&gt; = +
	&lt;Conj head type conjoins_DP&gt; = +
	&lt;Conj_1 head type conjoins_DP&gt; = +
	&lt;Conj_2 head type conjoins_DP&gt; = +
	&lt;Conj_3 head type conjoins_DP&gt; = +
	&lt;Conj_4 head type conjoins_DP&gt; = +
	&lt;QP option&gt; = Num0f
</xsl:text>
</xsl:if>
    
        
    
    <xsl:if test="normalize-space(//qp/@cardinalHead)='initial' and normalize-space(//qp/ordinalBefore/@checked)='yes'">
<xsl:text>
rule {QP option Num1i - modifiers initial, head initial}
QP = Num_6 Num (Conj) (Num_1 (Conj_1) (Num_2 (Conj_2) (Num_3 (Conj_3) (Num_4 (Conj_4) (Num_5)))))
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Num head type quantifier&gt; = +
	&lt;Num_6 head type ordinal&gt; = +
	&lt;Num_6 head type QP-initial&gt; = +
	&lt;Num_6 head type comma&gt; = -
	&lt;Conj head type conjoins_DP&gt; = +
	&lt;Conj_1 head type conjoins_DP&gt; = +
	&lt;Conj_2 head type conjoins_DP&gt; = +
	&lt;Conj_3 head type conjoins_DP&gt; = +
	&lt;Conj_4 head type conjoins_DP&gt; = +
	&lt;QP option&gt; = Num1i
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//qp/@cardinalHead)='final' and normalize-space(//qp/ordinalBefore/@checked)='yes'">
<xsl:text>
rule {QP option Num1f - modifiers initial, head final}
QP = Num_6 (((((Num_5) (Conj_4) Num_4) (Conj_3) Num_3) (Conj_2) Num_2) (Conj_1) Num_1) (Conj) Num
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Num head type quantifier&gt; = +
	&lt;Num_6 head type ordinal&gt; = +
	&lt;Num_6 head type QP-initial&gt; = +
	&lt;Num_6 head type comma&gt; = -
	&lt;Conj head type conjoins_DP&gt; = +
	&lt;Conj_1 head type conjoins_DP&gt; = +
	&lt;Conj_2 head type conjoins_DP&gt; = +
	&lt;Conj_3 head type conjoins_DP&gt; = +
	&lt;Conj_4 head type conjoins_DP&gt; = +
	&lt;QP option&gt; = Num1f
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//qp/@cardinalHead)='initial' and normalize-space(//qp/ordinalAfter/@checked)='yes'">
<xsl:text>
rule {QP option Num2i - modifiers final, head initial}
QP = Num (Conj) (Num_1 (Conj_1) (Num_2 (Conj_2) (Num_3 (Conj_3) (Num_4 (Conj_4) (Num_5))))) Num_6
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Num head type quantifier&gt; = +
	&lt;Num_6 head type ordinal&gt; = +
	&lt;Num_6 head type QP-final&gt; = +
	&lt;Conj head type conjoins_DP&gt; = +
	&lt;Conj_1 head type conjoins_DP&gt; = +
	&lt;Conj_2 head type conjoins_DP&gt; = +
	&lt;Conj_3 head type conjoins_DP&gt; = +
	&lt;Conj_4 head type conjoins_DP&gt; = +
	&lt;Num head type comma&gt; = -
	&lt;QP head type comma&gt; &lt;= &lt;Num_6 head type comma&gt;
	&lt;QP option&gt; = Num2i
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//qp/@cardinalHead)='final' and normalize-space(//qp/ordinalAfter/@checked)='yes'">
<xsl:text>
rule {QP option Num2f - modifiers final, head final}
QP = (((((Num_5) (Conj_4) Num_4) (Conj_3) Num_3) (Conj_2) Num_2) (Conj_1) Num_1) (Conj) Num Num_6
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Num head type quantifier&gt; = +
	&lt;Num_6 head type ordinal&gt; = +
	&lt;Num_6 head type QP-final&gt; = +
	&lt;Num head type comma&gt; = -
                &lt;Conj head type conjoins_DP&gt; = +
	&lt;Conj_1 head type conjoins_DP&gt; = +
	&lt;Conj_2 head type conjoins_DP&gt; = +
	&lt;Conj_3 head type conjoins_DP&gt; = +
	&lt;Conj_4 head type conjoins_DP&gt; = +
	&lt;QP head type comma&gt; &lt;= &lt;Num_6 head type comma&gt;
	&lt;QP option&gt; = Num2f
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//qp/@cardinalHead)='initial' and normalize-space(//qp/ordinalBoth/@checked)='yes'">
<xsl:text>
rule {QP option Num3i - modifiers both sides, head initial}
QP = Num_6 Num (Conj) (Num_1 (Conj_1) (Num_2 (Conj_2) (Num_3 (Conj_3) (Num_4 (Conj_4) (Num_5))))) Num_7
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Num head type quantifier&gt; = +
	&lt;Num_6 head type ordinal&gt; = +
	&lt;Num_7 head type ordinal&gt; = +
	&lt;Num_6 head type QP-initial&gt; = +
	&lt;Num_7 head type QP-final&gt; = +
	&lt;Conj head type conjoins_DP&gt; = +
	&lt;Conj_1 head type conjoins_DP&gt; = +
	&lt;Conj_2 head type conjoins_DP&gt; = +
	&lt;Conj_3 head type conjoins_DP&gt; = +
	&lt;Conj_4 head type conjoins_DP&gt; = +
	&lt;Num_6 head type comma&gt; = -
	&lt;Num head type comma&gt; = -
	&lt;QP head type comma&gt; &lt;= &lt;Num_7 head type comma&gt;
	&lt;QP option&gt; = Num3i
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//qp/@cardinalHead)='final' and normalize-space(//qp/ordinalBoth/@checked)='yes'">
<xsl:text>
rule {QP option Num3f - modifiers both sides, head final}
QP = Num_6 (((((Num_5) (Conj_4) Num_4) (Conj_3) Num_3) (Conj_2) Num_2) (Conj_1) Num_1) (Conj) Num Num_7
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Num head type quantifier&gt; = +
	&lt;Num_6 head type ordinal&gt; = +
	&lt;Num_7 head type ordinal&gt; = +
	&lt;Num_6 head type QP-initial&gt; = +
	&lt;Num_7 head type QP-final&gt; = +
	&lt;Conj head type conjoins_DP&gt; = +
	&lt;Conj_1 head type conjoins_DP&gt; = +
	&lt;Conj_2 head type conjoins_DP&gt; = +
	&lt;Conj_3 head type conjoins_DP&gt; = +
	&lt;Conj_4 head type conjoins_DP&gt; = +
	&lt;Num_6 head type comma&gt; = -
	&lt;Num head type comma&gt; = -
	&lt;QP head type comma&gt; &lt;= &lt;Num_7 head type comma&gt;
	&lt;QP option&gt; = Num3f
</xsl:text>
</xsl:if>
    
        
        
        
    
</xsl:template>
</xsl:stylesheet>
