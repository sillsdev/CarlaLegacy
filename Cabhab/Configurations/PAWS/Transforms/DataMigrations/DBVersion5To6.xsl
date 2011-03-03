<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 4 to 5
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="@* |  node()">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <!--
        increment dbversion
    -->
    <!--
    This is the pattern to use when do not need to also add one or more attributes to the paws element
    <xsl:template match="/paws[@dbversion='4']">
        <paws dbversion="5">
            <xsl:apply-templates select="@*[name()!='dbversion']"/>
            <xsl:apply-templates/>
        </paws>
    </xsl:template>
-->
    <!--
        Add output control attributes on the paws element
    -->
    <xsl:template match="/paws[@dbversion='5']">
        <paws dbversion="6" outputGrammar="True" outputWriter="True" outputWriterPractical="True" outputWriterPracticalSpanish="False">
            <xsl:apply-templates/>
        </paws>
    </xsl:template>
    <!--
        for np, may need to add following elements:
        agreeNumberExample, agreeAnimacyExample, agreeClassExample, agreeGenderExample, articleExample, demonstrativeExample
    -->
    <xsl:template match="np/example">
        <xsl:if test="count(preceding-sibling::*)=0">
            <agreeNumberExample/>
            <agreeAnimacyExample/>
            <agreeClassExample/>
            <agreeGenderExample/>
            <articleExample/>
            <demonstrativeExample/>
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <!--
        for pron, add a dependentPron attribute
    -->
    <xsl:template match="pron">
        <pron checkedOff="{@checkedOff}" dependentPron="no">
            <xsl:apply-templates select="@*[name()!='checkedOff']"/>
            <xsl:apply-templates/>
        </pron>
    </xsl:template>
    <!--
        Split out several personal pronoun elements into first, second, third person elements
        personalNoCaseExample, personalNomSubjectExample, personalNomObjectExample, personalNomPossessorExample,
        personalErgSubjectTransExample, personalErgSubjectIntransExample, personalErgPossessorExample, personalSplitSubjectExample,
        personalSplitObjectExample, personalSplitPossessorExample, personalSplitErgExample, personalSplitAbsExample,
    -->
    <xsl:template match="pron/personalNoCaseExample">
        <personalFirstNoCaseExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstNoCaseExample>
        <personalSecondNoCaseExample/>
        <personalThirdNoCaseExample/>
    </xsl:template>
    <xsl:template match="pron/personalNomSubjectExample">
        <personalFirstNomSubjectExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstNomSubjectExample>
        <personalSecondNomSubjectExample/>
        <personalThirdNomSubjectExample/>
    </xsl:template>
    <xsl:template match="pron/personalNomObjectExample">
        <personalFirstNomObjectExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstNomObjectExample>
        <personalSecondNomObjectExample/>
        <personalThirdNomObjectExample/>
    </xsl:template>
    <xsl:template match="pron/personalNomPossessorExample">
        <personalFirstNomPossessorExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstNomPossessorExample>
        <personalSecondNomPossessorExample/>
        <personalThirdNomPossessorExample/>
    </xsl:template>
    <xsl:template match="pron/personalErgSubjectTransExample">
        <personalFirstErgSubjectTransExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstErgSubjectTransExample>
        <personalSecondErgSubjectTransExample/>
        <personalThirdErgSubjectTransExample/>
    </xsl:template>
    <xsl:template match="pron/personalErgSubjectIntransExample">
        <personalFirstErgSubjectIntransExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstErgSubjectIntransExample>
        <personalSecondErgSubjectIntransExample/>
        <personalThirdErgSubjectIntransExample/>
    </xsl:template>
    <xsl:template match="pron/personalErgPossessorExample">
        <personalFirstErgPossessorExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstErgPossessorExample>
        <personalSecondErgPossessorExample/>
        <personalThirdErgPossessorExample/>
    </xsl:template>
    <xsl:template match="pron/personalSplitSubjectExample">
        <personalFirstSplitSubjectExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstSplitSubjectExample>
        <personalSecondSplitSubjectExample/>
        <personalThirdSplitSubjectExample/>
    </xsl:template>
    <xsl:template match="pron/personalSplitObjectExample">
        <personalFirstSplitObjectExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstSplitObjectExample>
        <personalSecondSplitObjectExample/>
        <personalThirdSplitObjectExample/>
    </xsl:template>
    <xsl:template match="pron/personalSplitPossessorExample">
        <personalFirstSplitPossessorExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstSplitPossessorExample>
        <personalSecondSplitPossessorExample/>
        <personalThirdSplitPossessorExample/>
    </xsl:template>
    <xsl:template match="pron/personalSplitErgExample">
        <personalFirstSplitErgExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstSplitErgExample>
        <personalSecondSplitErgExample/>
        <personalThirdSplitErgExample/>
    </xsl:template>
    <xsl:template match="pron/personalSplitAbsExample">
        <personalFirstSplitAbsExample>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </personalFirstSplitAbsExample>
        <personalSecondSplitAbsExample/>
        <personalThirdSplitAbsExample/>
    </xsl:template>
    <!--
        for pron, may need to add following elements:
        agreeNumberExample, agreeAnimacyExample, agreeClassExample, agreeGenderExample, articleExample, demonstrativeExample
    -->
    <xsl:template match="pron/possExample">
        <personalDependentFirstNoCaseExample/>
        <personalDependentSecondNoCaseExample/>
        <personalDependentThirdNoCaseExample/>
        <personalDependentFirstNomSubjectExample/>
        <personalDependentSecondNomSubjectExample/>
        <personalDependentThirdNomSubjectExample/>
        <personalDependentFirstNomObjectExample/>
        <personalDependentSecondNomObjectExample/>
        <personalDependentThirdNomObjectExample/>
        <personalDependentFirstNomPossessorExample/>
        <personalDependentSecondNomPossessorExample/>
        <personalDependentThirdNomPossessorExample/>
        <personalDependentFirstErgSubjectTransExample/>
        <personalDependentSecondErgSubjectTransExample/>
        <personalDependentThirdErgSubjectTransExample/>
        <personalDependentFirstErgSubjectIntransExample/>
        <personalDependentSecondErgSubjectIntransExample/>
        <personalDependentThirdErgSubjectIntransExample/>
        <personalDependentFirstErgPossessorExample/>
        <personalDependentSecondErgPossessorExample/>
        <personalDependentThirdErgPossessorExample/>
        <personalDependentFirstSplitSubjectExample/>
        <personalDependentSecondSplitSubjectExample/>
        <personalDependentThirdSplitSubjectExample/>
        <personalDependentFirstSplitObjectExample/>
        <personalDependentSecondSplitObjectExample/>
        <personalDependentThirdSplitObjectExample/>
        <personalDependentFirstSplitPossessorExample/>
        <personalDependentSecondSplitPossessorExample/>
        <personalDependentThirdSplitPossessorExample/>
        <personalDependentFirstSplitErgExample/>
        <personalDependentSecondSplitErgExample/>
        <personalDependentThirdSplitErgExample/>
        <personalDependentFirstSplitAbsExample/>
        <personalDependentSecondSplitAbsExample/>
        <personalDependentThirdSplitAbsExample/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <!--
        for ip, add five new attributes
        auxNonfinite (no | yes) "no"
        auxNonfiniteRequired (no | yes) "no"
        auxNonfiniteOrder (no | yes) "yes"
        auxOther (no | yes) "no"
        auxOtherOrder (no | yes) "yes"
    -->
    <xsl:template match="ip">
        <ip>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="auxNonfinite">no</xsl:attribute>
            <xsl:attribute name="auxNonfiniteRequired">no</xsl:attribute>
            <xsl:attribute name="auxNonfiniteOrder">yes</xsl:attribute>
            <xsl:attribute name="auxOther">no</xsl:attribute>
            <xsl:attribute name="auxOtherOrder">yes</xsl:attribute>
            <xsl:apply-templates/>
        </ip>
    </xsl:template>
    <!--
        auxiliaryExample may need to be added
    -->
    <xsl:template match="ip/auxExample">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
        <xsl:if test="following-sibling::*[1][name()!='auxiliaryExample']">
            <auxiliaryExample/>
        </xsl:if>
    </xsl:template>
    <!--
        auxiliaryNonfiniteExample and auxiliaryOtherExample may need to be added
    -->
    <xsl:template match="ip/auxOtherExample">
        <xsl:if test="preceding-sibling::*[1][name()!='auxiliaryNonfiniteExample']">
            <auxiliaryNonfiniteExample/>
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
        <xsl:if test="following-sibling::*[1][name()!='auxiliaryOtherExample']">
            <auxiliaryOtherExample/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
