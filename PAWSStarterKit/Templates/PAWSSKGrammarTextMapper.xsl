<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" version="1.0" encoding="iso-8859-1" indent="no"/>
	<!-- set specifier and head defaults -->
	<xsl:variable name="Spec">
		<xsl:if test="//typology/@wordOrder='SVO' or //typology/@wordOrder='SOV'">initial</xsl:if>
		<xsl:if test="//typology/@wordOrder='VSO' or //typology/@wordOrder='OSV'">internal</xsl:if>
		<xsl:if test="//typology/@wordOrder='VOS' or //typology/@wordOrder='OVS'">final</xsl:if>
	</xsl:variable>
	<xsl:variable name="Head">
		<xsl:if test="//typology/@wordOrder='SVO' or //typology/@wordOrder='VSO' or //typology/@wordOrder='VOS'">initial</xsl:if>
		<xsl:if test="//typology/@wordOrder='SOV' or //typology/@wordOrder='OVS' or //typology/@wordOrder='OSV'">final</xsl:if>
	</xsl:variable>
	<!-- main part -->
	<xsl:template match="/">
		<xsl:call-template name="beginning"/>
		<xsl:apply-templates/>
		<!-- now output all the feature templates for all possible cases -->
		<xsl:call-template name="featureTemplates"/>
	</xsl:template>
	<!-- ************  AdjP  ************-->
	<xsl:template match="//adjp">
|-***********************************************************
<xsl:call-template name="AdjPOptions"/>
	</xsl:template>
	<xsl:template name="AdjPOptions">
		<xsl:if test="./@modifiers='no'">
rule {AdjP option 1 - no modifiers}
AdjP = Adj
	&lt;AdjP head&gt; = &lt;Adj head&gt;
</xsl:if>
		<xsl:if test="./@modifiers='yesDegree'">
			<xsl:if test="./@degreePos='before' or ./@degreePos='unknown' and $Spec='initial' or ./@degreePos='unknown' and $Spec='internal'">
rule {AdjP option 2 - degree modifiers initial }
AdjP = (Deg) Adj
	&lt;AdjP head&gt; = &lt;Adj head&gt;
	&lt;Deg head type modifies_Adj&gt; = +
</xsl:if>
			<xsl:if test="./@degreePos='after' or ./@degreePos='unknown' and $Spec='final'">
rule {AdjP option 3 - degree modifiers final }
AdjP = Adj (Deg)
	&lt;AdjP head&gt; = &lt;Adj head&gt;
	&lt;Deg head type modifies_Adj&gt; = +
</xsl:if>
			<xsl:if test="./@degreePos='either'">
rule {AdjP option 4 - degree modifiers both sides }
AdjP = (Deg_1) Adj (Deg_2)
	&lt;AdjP head&gt; = &lt;Adj head&gt;
	&lt;Deg_1 head type modifies_Adj&gt; = +
	&lt;Deg_2 head type modifies_Adj&gt; = +
	&lt;Deg_1 head type AdjP-initial&gt; = +
	&lt;Deg_2 head type AdjP-final&gt;   = +
</xsl:if>
		</xsl:if>
		<xsl:if test="./@modifiers='yesManner'">
			<xsl:if test="./@mannerPos='before' or ./@mannerPos='unknown' and $Spec='initial' or ./@mannerPos='unknown' and $Spec='internal'">
rule {AdjP option 5 - degree or AdvP modifiers initial }
AdjP = (Deg / AdvP) Adj
	&lt;AdjP head&gt; = &lt;Adj head&gt;
	&lt;Deg head type modifies_Adj&gt; = +
	&lt;AdvP head type manner&gt;      = +
</xsl:if>
			<xsl:if test="./@mannerPos='after' or ./@mannerPos='unknown' and $Spec='final'">
rule {AdjP option 6 - degree or AdvP modifiers final }
AdjP = Adj (Deg / AdvP)
	&lt;AdjP head&gt; = &lt;Adj head&gt;
	&lt;Deg head type modifies_Adj&gt; = +
	&lt;AdvP head type manner&gt;      = +
</xsl:if>
			<xsl:if test="./@mannerPos='either'">
rule {AdjP option 7 - degree modifiers both sides }
AdjP = (Deg_1 / AdvP_1) Adj (Deg_2 / AdvP_2)
	&lt;AdjP head&gt; = &lt;Adj head&gt;
	&lt;AdvP_1 head type manner&gt;      = +
	&lt;AdvP_2 head type manner&gt;      = +
	&lt;Deg_1 head type modifies_Adj&gt; = +
	&lt;Deg_2 head type modifies_Adj&gt; = +
	&lt;Deg_1 head type AdjP-initial&gt; = +
	&lt;Deg_2 head type AdjP-final&gt;   = +
</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- ************  AdvP  ************-->
	<xsl:template match="//advp">
|-***********************************************************
<xsl:call-template name="AdvPOptions"/>
	</xsl:template>
	<xsl:template name="AdvPOptions">
		<xsl:if test="./@degree='no'">
rule {AdvP option 1 - no modifiers}
AdvP = Adv
	&lt;AdvP head&gt; = &lt;Adv head&gt;
</xsl:if>
		<xsl:if test="./@degree='yes'">
			<xsl:if test="./@degreePos='before' or ./@degreePos='unknown' and $Spec='initial' or ./@degreePos='unknown' and $Spec='internal'">
rule {AdvP option 2 - modifiers initial}
AdvP = (Deg) Adv
	&lt;AdvP head&gt; = &lt;Adv head&gt;
	&lt;Deg head type modifies_Adv&gt; = &lt;Adv head type&gt;
</xsl:if>
			<xsl:if test="./@degreePos='after' or ./@degreePos='unknown' and $Spec='final'">
rule {AdvP option 3 - modifiers final}
AdvP = Adv (Deg)
	&lt;AdvP head&gt; = &lt;Adv head&gt;
	&lt;Deg head type modifies_Adv&gt; = &lt;Adv head type&gt;
</xsl:if>
			<xsl:if test="./@degreePos='either'">
rule {AdvP option 4 - modifiers both sides}
AdvP = (Deg_1) Adv (Deg_2)
	&lt;AdvP head&gt; = &lt;Adv head&gt;
	&lt;Deg_1) head type modifies_Adv&gt; = &lt;Adv head type&gt;
	&lt;Deg_2) head type modifies_Adv&gt; = &lt;Adv head type&gt;
	&lt;Deg_1 head type AdvP-initial&gt; = +
	&lt;Deg_2 head type AdvP-final&gt;   = +
</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- ************  CP  ************-->
	<xsl:template match="//q">
|-***********************************************************
<xsl:call-template name="QOptions"/>
	</xsl:template>
	<xsl:template name="QOptions">
		<!-- main clause Yes/No questions -->
		<xsl:call-template name="CPOption1"/>
		<xsl:if test="./@mainYN='yes'">
			<xsl:if test="./@mainYNPos='before' or ./@mainYNPos='unknown' and $Head='initial'">
				<xsl:call-template name="CBarOption1c"/>
			</xsl:if>
			<xsl:if test="./@mainYNPos='after' or ./@mainYNPos='unknown' and $Head='final'">
				<xsl:call-template name="CBarOption1e"/>
			</xsl:if>
			<xsl:if test="./@mainYNPos='either'">
				<xsl:if test="./@mainYNBoth='no'">
					<xsl:call-template name="CBarOption1c"/>
					<xsl:call-template name="CBarOption1e"/>
				</xsl:if>
				<xsl:if test="./@mainYNBoth='yesBoth'">
					<xsl:call-template name="CBarOption1g"/>
				</xsl:if>
				<xsl:if test="./@mainYNBoth='yesInitial'">
					<xsl:call-template name="CBarOption1h"/>
					<xsl:if test="./@mainYNBothInitialFinal='yes'">
						<xsl:call-template name="CBarOption1e"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@mainYNBoth='yesFinal'">
					<xsl:call-template name="CBarOption1i"/>
					<xsl:if test="./@mainYNBothFinalInitial='yes'">
						<xsl:call-template name="CBarOption1c"/>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@mainYN='noAux'">
			<xsl:call-template name="CBarOption1b"/>
			<xsl:if test="./@mainYNAuxPos='before' or ./@mainYNAuxPos='unknown' and $Head='initial'">
				<xsl:call-template name="CBarOption1d"/>
			</xsl:if>
			<xsl:if test="./@mainYNAuxPos='after' or ./@mainYNAuxPos='unknown' and $Head='final'">
				<xsl:call-template name="CBarOption1f"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@mainYN='no'">
			<xsl:call-template name="CBarOption1a"/>
		</xsl:if>
		<!-- Embedded Yes/No Questions -->
		<xsl:call-template name="CPOption3"/>
		<xsl:if test="./@embYN='yes'">
			<xsl:if test="./@embYNPos='before' or ./@embYNPos='unknown' and $Head='initial'">
				<xsl:call-template name="CBarOption2c"/>
			</xsl:if>
			<xsl:if test="./@embYNPos='after' or ./@embYNPos='unknown' and $Head='final'">
				<xsl:call-template name="CBarOption2e"/>
			</xsl:if>
			<xsl:if test="./@embYNPos='either'">
				<xsl:if test="./@embYNBoth='no'">
					<xsl:call-template name="CBarOption2c"/>
					<xsl:call-template name="CBarOption2e"/>
				</xsl:if>
				<xsl:if test="./@embYNBoth='yesBoth'">
					<xsl:call-template name="CBarOption2g"/>
				</xsl:if>
				<xsl:if test="./@embYNBoth='yesInitial'">
					<xsl:call-template name="CBarOption2h"/>
					<xsl:if test="./@embYNBothInitialFinal='yes'">
						<xsl:call-template name="CBarOption2e"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@embYNBoth='yesFinal'">
					<xsl:call-template name="CBarOption2i"/>
					<xsl:if test="./@embYNBothFinalInitial='yes'">
						<xsl:call-template name="CBarOption2c"/>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@embYN='noAux'">
			<xsl:if test="./@embYNAuxPos='before' or ./@embYNAuxPos='unknown' and $Head='initial'">
				<xsl:call-template name="CBarOption2d"/>
			</xsl:if>
			<xsl:if test="./@embYNAuxPos='after' or ./@embYNAuxPos='unknown' and $Head='final'">
				<xsl:call-template name="CBarOption2f"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@embYN='no'">
			<xsl:call-template name="CBarOption2a"/>
		</xsl:if>
		<!-- Main clause content questions -->
		<xsl:if test="./@contFront='yes' or ./@contFront='unknown' and $Head='initial'">
			<xsl:call-template name="CPOption2a"/>
			<xsl:call-template name="CPOption2b"/>
			<xsl:call-template name="CPOption2c"/>
			<xsl:call-template name="CPOption4a"/>
			<xsl:call-template name="CPOption4b"/>
			<xsl:call-template name="CPOption4c"/>
		</xsl:if>
		<xsl:if test="./@mainCont='yesSame' or ./@mainCont='yesDiff'">
			<xsl:if test="./@contFront='yes' or ./@contFront='unknown' and $Head='initial'">
				<xsl:if test="./@mainContBefore='yes' or ./@mainContBefore='yesSome'">
					<xsl:call-template name="CPOption2d"/>
					<xsl:call-template name="CPOption2e"/>
					<xsl:call-template name="CPOption2f"/>
					<xsl:call-template name="CPOption4d"/>
					<xsl:call-template name="CPOption4e"/>
					<xsl:call-template name="CPOption4f"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@mainContBefore!='yes' and ./@mainContSame='no'">
				<xsl:if test="./@mainContPos='before' or ./@mainContPos='unknown' and $Head='initial'">
					<xsl:call-template name="CBarOption1c"/>
				</xsl:if>
				<xsl:if test="./@mainContPos='after' or ./@mainContPos='unknown' and $Head='final'">
					<xsl:call-template name="CBarOption1e"/>
				</xsl:if>
				<xsl:if test="./@mainContPos='either' and ./@mainYNPos!='either'">
					<xsl:if test="./@mainContBoth='no'">
						<xsl:call-template name="CBarOption1c"/>
						<xsl:call-template name="CBarOption1e"/>
					</xsl:if>
					<xsl:if test="./@mainContBoth='yesBoth'">
						<xsl:call-template name="CBarOption1g"/>
					</xsl:if>
					<xsl:if test="./@mainContBoth='yesInitial'">
						<xsl:call-template name="CBarOption1h"/>
						<xsl:if test="./@mainContBothInitialFinal='yes'">
							<xsl:call-template name="CBarOption1e"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@mainContBoth='yesFinal'">
						<xsl:call-template name="CBarOption1i"/>
						<xsl:if test="./@mainContBothFinalInitial='yes'">
							<xsl:call-template name="CBarOption1c"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@mainYN!='no'">
				<xsl:if test="./@mainContRequired='no'">
					<xsl:call-template name="CBarOption1a"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@mainCont='noAux'">
			<xsl:if test="./@mainYN!='noAux'">
				<xsl:if test="$Head='initial'">
					<xsl:call-template name="CBarOption1d"/>
				</xsl:if>
				<xsl:if test="$Head='final'">
					<xsl:call-template name="CBarOption1f"/>
				</xsl:if>
				<xsl:if test="./@mainContAux='no'">
					<xsl:call-template name="CBarOption1b"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@mainCont='no'">
			<xsl:if test="./@mainYN='yes'">
				<xsl:call-template name="CBarOption1a"/>
			</xsl:if>
		</xsl:if>
		<!-- embedded content questions -->
		<xsl:if test="./@embCont='yesSameYN' or ./@embCont='yesSameCont' or ./@embCont='yesDiff'">
			<xsl:if test="./@embContPosAsEmbYNPos='no' and ./@embYN!='yes'">
				<xsl:if test="./@embContPos='before' or ./@embContPos='unknown' and $Head='initial'">
					<xsl:call-template name="CBarOption2c"/>
				</xsl:if>
				<xsl:if test="./@embContPos='after' or ./@embContPos='unknown' and $Head='final'">
					<xsl:call-template name="CBarOption2e"/>
				</xsl:if>
				<xsl:if test="./@embContPos='either'">
					<xsl:if test="./@embContBoth='no'">
						<xsl:call-template name="CBarOption2c"/>
						<xsl:call-template name="CBarOption2e"/>
					</xsl:if>
					<xsl:if test="./@embContBoth='yesBoth'">
						<xsl:call-template name="CBarOption2g"/>
					</xsl:if>
					<xsl:if test="./@embContBoth='yesInitial'">
						<xsl:call-template name="CBarOption2h"/>
						<xsl:if test="./@embContBothInitialFinal='yes'">
							<xsl:call-template name="CBarOption2e"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@embContBoth='yesFinal'">
						<xsl:call-template name="CBarOption2i"/>
						<xsl:if test="./@embContBothFinalInitial='yes'">
							<xsl:call-template name="CBarOption2c"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@embYN!='no'">
				<xsl:if test="./@embContRequired='no'">
					<xsl:call-template name="CBarOption2a"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@embCont='noAux'">
			<xsl:if test="./@embYN='no'">
				<xsl:if test="$Head='initial'">
					<xsl:call-template name="CBarOption2d"/>
				</xsl:if>
				<xsl:if test="$Head='final'">
					<xsl:call-template name="CBarOption2f"/>
				</xsl:if>
				<xsl:if test="./@embContAux='no'">
					<xsl:call-template name="CBarOption2b"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@embCont='no'">
			<xsl:if test="./@embYN='noAux'">
				<xsl:call-template name="CBarOption2b"/>
			</xsl:if>
			<xsl:if test="./@embYN!='noAux'">
				<xsl:call-template name="CBarOption2a"/>
			</xsl:if>
		</xsl:if>
		<!-- @@@@@@@@@@@@ -->
	</xsl:template>
	<xsl:template name="CPOption1">
rule {CP option 1 - no fronting, root}
CP = C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root &gt; = +
	&lt;C' head type vacuous&gt; = -		|- to avoid empty CP
	&lt;C' head fronted&gt; = none
</xsl:template>
	<xsl:template name="CPOption2a">
rule {CP option 2a - DP specifier initial, wh, root}
CP = DP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C' head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption2b">
rule {CP option 2b - PP specifier initial, wh, root}
CP = PP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C' head fronted&gt; = &lt;PP&gt;
	&lt;PP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption2c">
rule {CP option 2c - AdvP specifier initial, wh, root}
CP = AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption2d">
rule {CP option 2d - C, DP specifier initial, wh, root}
CP = C DP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption2e">
rule {CP option 2e - C, PP specifier initial, wh, root}
CP = C PP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head fronted&gt; = &lt;PP&gt;
	&lt;PP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption2f">
rule {CP option 2f - C, AdvP specifier initial, wh, root}
CP = C AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption3">
rule {CP option 3 - no fronting, non-root}
CP = C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root &gt; = -
	&lt;C' head type vacuous&gt; = -		|- to avoid empty CP
	&lt;C' head fronted&gt; = none
</xsl:template>
	<xsl:template name="CPOption4a">
rule {CP option 4a - DP specifier initial, wh, non-root}
CP = DP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C' head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption4b">
rule {CP option 4b - PP specifier initial, wh, non-root}
CP = PP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C' head fronted&gt; = &lt;PP&gt;
	&lt;PP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption4c">
rule {CP option 4c - AdvP specifier initial, wh, non-root}
CP = AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption4d">
rule {CP option 4d - C, DP specifier initial, wh, non-root}
CP = C DP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption4e">
rule {CP option 4e - C, PP specifier initial, wh, non-root}
CP = C PP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head fronted&gt; = &lt;PP&gt;
	&lt;PP head type wh&gt; = +
</xsl:template>
	<xsl:template name="CPOption4f">
rule {CP option 4f - C, AdvP specifier initial, wh, non-root}
CP = C AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +

</xsl:template>
	<xsl:template name="CBarOption1a">
rule {C' option 1a - head vacuous, root, no aux fronting}
C' = IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type vacuous&gt; = +		|- to avoid empty CP
</xsl:template>
	<xsl:template name="CBarOption1b">
rule {C' option 1b - head vacuous, root, with possible aux fronting}
C' = IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type vacuous&gt; = +		|- to avoid empty CP
	&lt;IP head type auxiliary&gt; = -		|- if aux present, must front
</xsl:template>
	<xsl:template name="CBarOption1c">
rule {C' option 1c - head-initial, question, root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1d">
rule {C' option 1d - Aux initial, question, root}
C' = Aux IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1e">
rule {C' option 1e - head-final, question, root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1f">
rule {C' option 1f - Aux final, question, root}
C' = IP Aux
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1g">
rule {C' option 1g - head both sides, question, root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1h">
rule {C' option 1h - head both sides, initial required, question, root}
C' = C IP (C_1)
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1i">
rule {C' option 1i - head both sides, final required, question, root}
C' = (C) IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C_1 head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1j">
rule {C' option 1j - head-initial, non-question, root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1k">
rule {C' option 1k - head-final, non-question, root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1l">
rule {C' option 1l - head both sides, non-question, root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1m">
rule {C' option 1m - head both sides, initial required, non-question, root}
C' = C IP (C_1)
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption1n">
rule {C' option 1n - head both sides, final required, non-question, root}
C' = (C) IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C_1 head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2a">
rule {C' option 2a - head vacuous, non-root, no aux fronting}
C' = IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type vacuous&gt; = +		|- to avoid empty CP
</xsl:template>
	<xsl:template name="CBarOption2b">
rule {C' option 2b - head vacuous, non-root, with possible aux fronting}
C' = IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type vacuous&gt; = +		|- to avoid empty CP
	&lt;IP head type auxiliary&gt; = -		|- if aux present, must front
</xsl:template>
	<xsl:template name="CBarOption2c">
rule {C' option 2c - head-initial, question, non-root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2d">
rule {C' option 2d - Aux initial, question, non-root}
C' = Aux IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2e">
rule {C' option 2e - head-final, question, non-root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2f">
rule {C' option 2f - Aux final, question, non-root}
C' = IP Aux
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2g">
rule {C' option 2g - head both sides, question, non-root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2h">
rule {C' option 2h - head both sides, initial required, question, non-root}
C' = C IP (C_1)
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2i">
rule {C' option 2i - head both sides, final required, question, non-root}
C' = (C) IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C_1 head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2j">
rule {C' option 2j - head-initial, non-question, non-root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2k">
rule {C' option 2k - head-final, non-question, non-root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2l">
rule {C' option 2l - head both sides, non-question, non-root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2m">
rule {C' option 2m - head both sides, initial required, non-question, non-root}
C' = C IP (C_1)
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<xsl:template name="CBarOption2n">
rule {C' option 2n - head both sides, final required, non-question, non-root}
C' = (C) IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C_1 head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type vacuous&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
</xsl:template>
	<!-- ************  NP  ************-->
	<xsl:template match="//np">
|-***********************************************************
<xsl:call-template name="NPDPOptions"/>
		<xsl:call-template name="NPDBarOptions"/>
		<xsl:call-template name="NPNPOptions"/>
		<xsl:call-template name="PronNPOptions"/>
		<xsl:call-template name="NPNDoubleBarOptions"/>
		<xsl:call-template name="NPNBarOptions"/>
	</xsl:template>
	<!-- DP options -->
	<xsl:template name="NPDPOptions">
rule {DP option 1 - no modifiers}
DP = D'
	&lt;DP head&gt; = &lt;D' head&gt;
		<xsl:if test="./@degree='yes'">
			<xsl:if test="./@degreePos='before' or ./@degreePos='unknown' and $Spec='initial' or ./@degreePos='unknown' and $Spec='internal' or ./@degreePos='either' and ./@degreeBoth='no' or ./@degreePos='either' and ./@degreeBoth='yesFinal' and ./@degreeFinalInitial='yes'">
rule {DP option 2 - modifiers initial}
DP = Deg D'
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head agr&gt; = &lt;D' head agr&gt;
	&lt;D' head agr case genitive&gt; = - |-Deg not w/in possessor
</xsl:if>
			<xsl:if test="./@degreePos='after' or ./@degreePos='unknown' and $Spec='final' or ./@degreePos='either' and ./@degreeBoth='no' or ./@degreePos='either' and ./@degreeBoth='yesInitial' and ./@degreeInitialFinal='yes'">
rule {DP option 3 - modifiers final}
DP = D' Deg
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head agr&gt; = &lt;D' head agr&gt;
	&lt;D' head agr case genitive&gt; = - |-Deg not w/in possessor
</xsl:if>
			<xsl:if test="./@degreePos='either'">
				<xsl:if test="./@degreeBoth='yesBoth'">
rule {DP option 4a - modifiers either side, both required}
DP = Deg_1 D' Deg_2
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;Deg_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Deg_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_2 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt;  = +
	&lt;Deg_2 head type DP-final&gt;    = +
	&lt;D' head agr case genitive&gt; = - |-Deg not w/in possessor
</xsl:if>
				<xsl:if test="./@degreeBoth='yesInitial'">
rule {DP option 4b - modifiers either side, initial required}
DP = Deg_1 D' (Deg_2)
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;Deg_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Deg_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_2 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt;  = +
	&lt;Deg_2 head type DP-final&gt;    = +
	&lt;D' head agr case genitive&gt; = - |-Deg not w/in possessor
</xsl:if>
				<xsl:if test="./@degreeBoth='yesFinal'">
rule {DP option 4c - modifiers either side, final required}
DP = (Deg_1) D' Deg_2
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;Deg_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Deg_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_2 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt;  = +
	&lt;Deg_2 head type DP-final&gt;    = +
	&lt;D' head agr case genitive&gt; = - |-Deg not w/in possessor
</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="NPDBarOptions">
|-********************************************************
<xsl:if test="@artAndDem='no'">
rule {D' option 1 - no determiners}
D' = NP
	&lt;D' head&gt; = &lt;NP head&gt;
</xsl:if>
		<xsl:if test="./@artAndDem='article'">
			<xsl:if test="./@artArtRequired='no'">
				<xsl:if test="./@artArtPos1='before' or ./@artArtPos1='unknown' and $Head='initial'">
rule {D' option 2a - only articles, initial , optional}
D' = (Art) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
</xsl:if>
				<xsl:if test="./@artArtPos1='after' or ./@artArtPos1='unknown' and $Head='final'">
rule {D' option 2b - only articles, final, optional}
D' = NP (Art)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
</xsl:if>
				<xsl:if test="./@artArtPos1='either'">
rule {D' option 2c - only articles, either side, optional}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
</xsl:if>
			</xsl:if>
			<xsl:if test="./@artArtRequired='yes'">
				<xsl:if test="./@artArtPos2='before' or ./@artArtPos2='unknown' and $Head='initial'">
rule {D' option 3a - only articles, initial, required}
D' = Art NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
</xsl:if>
				<xsl:if test="./@artArtPos2='after' or ./@artArtPos2='unknown' and $Head='final'">
rule {D' option 3b - only articles, final, required}
D' = NP Art
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
</xsl:if>
				<xsl:if test="./@artArtPos2='either'">
					<xsl:if test="./@artArtRequiredBoth='yes'">
rule {D' option 3c - only articles, either side, required}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artArtRequiredBoth='noBefore'">
rule {D' option 3d - only articles, initial required, final optional}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artArtRequiredBoth='noAfter'">
rule {D' option 3e - only articles, final required, initial optional}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@artAndDem='demonstrative'">
			<xsl:if test="./@artDemRequired='no'">
				<xsl:if test="./@artDemPos1='before' or ./@artDemPos1='unknown' and $Head='initial'">
rule {D' option 4a - only demonstratives, initial, optional}
D' = (Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artDemPos1='after' or ./@artDemPos1='unknown' and $Head='final'">
rule {D' option 4b - only demonstratives, final, optional}
D' = NP (Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artDemPos1='either'">
rule {D' option 4c - only demonstratives, either side, optional}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
			</xsl:if>
			<xsl:if test="./@artDemRequired='yes'">
				<xsl:if test="./@artDemPos2='before' or ./@artDemPos2='unknown' and $Head='initial'">
rule {D' option 5a - only demonstratives, initial, required}
D' = Dem NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artDemPos2='after' or ./@artDemPos2='unknown' and $Head='final'">
rule {D' option 5b - only demonstratives, final, required}
D' = NP Dem
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artDemPos2='either'">
					<xsl:if test="./@artDemRequiredBoth='yes'">
rule {D' option 5c - only demonstratives, either side, required}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artDemRequiredBoth='noBefore'">
rule {D' option 5d - only demonstratives, initial required, final optional}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artDemRequiredBoth='noAfter'">
rule {D' option 5e - only demonstratives, final required, initial optional}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@artAndDem='both'">
			<xsl:if test="./@artBothCooccur='no'">
				<xsl:if test="./@artBothRequired1='no'">
					<xsl:if test="./@artBothPos1='before' or ./@artBothPos1='unknown' and $Head='initial'">
rule {D' option 6a - article or demonstrative initial, optional}
D' = (Art / Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothPos1='after' or ./@artBothPos1='unknown' and $Head='final'">
rule {D' option 6b - article or demonstrative final, optional}
D' = NP (Art / Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothPos1='either'">
rule {D' option 6c - article or demonstrative either side, optional}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
				</xsl:if>
				<xsl:if test="./@artBothRequired1='yes'">
					<xsl:if test="./@artBothPos2='before' or ./@artBothPos2='unknown' and $Head='initial'">
rule {D' option 7a - article or demonstrative initial, required}
D' = {Art / Dem} NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothPos2='after' or ./@artBothPos2='unknown' and $Head='final'">
rule {D' option 7b - article or demonstrative final, required}
D' = NP {Art / Dem}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothPos2='either'">
						<xsl:if test="./@artBothRequiredBoth='yes'">
rule {D' option 7c - article or demonstrative either side, required}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
						<xsl:if test="./@artBothRequiredBoth='noBefore'">
rule {D' option 7d - article or demonstrative either side, initial required}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
</xsl:if>
						<xsl:if test="./@artBothRequiredBoth='noAfter'">
rule {D' option 7e - article or demonstrative either side, final required}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@artBothCooccur='yes'">
				<xsl:if test="./@artBothRequired2='no'">
					<xsl:if test="./@artBothBothPos='artNounDem'">
rule {D' option 8a - articles before, demonstratives after, both optional}
D' = (Art) NP (Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demNounArt'">
rule {D' option 8b - articles after, demonstratives before, both optional}
D' = (Dem) NP (Art)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='artDemNoun'">
rule {D' option 8c - article then demonstrative, both before, both optional}
D' = (Art) (Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='nounArtDem'">
rule {D' option 8d - article then demonstrative, both after, both optional}
D' = NP (Art) (Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='artDemEither'">
rule {D' option 8e - article then demonstrative, either side, optional}
D' = (Art_1) (Dem_1) NP (Art_2) (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demArtNoun'">
rule {D' option 8f - demonstrative then article, both before, both optional}
D' = (Dem) (Art) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='nounDemArt'">
rule {D' option 8g - demonstrative then article, both after, both optional}
D' = NP (Dem) (Art)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demArtEither'">
rule {D' option 8h - demonstrative then article, either side, optional}
D' = (Dem_1) (Art_1) NP (Dem_2) (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='artDemNounDemArt'">
rule {D' option 8i - articles external, demonstratives internal, optional}
D' = (Art_1) (Dem_1) NP (Dem_2) (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demArtNounArtDem'">
rule {D' option 8j - demonstratives external, articles internal, optional}
D' = (Dem_1) (Art_1) NP (Art_2) (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
				</xsl:if>
				<xsl:if test="./@artBothRequired2='yesArt'">
					<xsl:if test="./@artBothBothPos='artNounDem'">
rule {D' option 9a - articles before, demonstratives after, article required}
D' = Art NP (Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demNounArt'">
rule {D' option 9b - articles after, demonstratives before, article required}
D' = (Dem) NP Art
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='artDemNoun'">
rule {D' option 9c - article then demonstrative, both before, article required}
D' = Art (Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='nounArtDem'">
rule {D' option 9d - article then demonstrative, both after, article required}
D' = NP Art (Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='artDemEither'">
rule {D' option 9e - article then demonstrative, either side, article required}
D' = Art_1 (Dem_1) NP Art_2 (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demArtNoun'">
rule {D' option 9f - demonstrative then article, both before, article required}
D' = (Dem) Art NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='nounDemArt'">
rule {D' option 9g - demonstrative then article, both after, article required}
D' = NP (Dem) Art
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demArtEither'">
rule {D' option 9h - demonstrative then article, either side, article required}
D' = (Dem_1) Art_1 NP (Dem_2) Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='artDemNounDemArt'">
rule {D' option 9i - articles external, demonstratives internal, art. required}
D' = Art_1 (Dem_1) NP (Dem_2) Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demArtNounArtDem'">
rule {D' option 9j - demonstratives external, articles internal, art. required}
D' = (Dem_1) Art_1 NP Art_2 (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt; |-both agree?
</xsl:if>
				</xsl:if>
				<xsl:if test="./@artBothRequired2='yesDem'">
					<xsl:if test="./@artBothBothPos='artNounDem'">
rule {D' option 10a - articles before, demonstratives after, dem. required}
D' = (Art) NP Dem
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demNounArt'">
rule {D' option 10b - articles after, demonstratives before, dem. required}
D' = Dem NP (Art)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='artDemNoun'">
rule {D' option 10c - article then demonstrative, both before, dem. required}
D' = (Art) Dem NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='nounArtDem'">
rule {D' option 10d - article then demonstrative, both after, dem. required}
D' = NP (Art) Dem
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='artDemEither'">
rule {D' option 10e - article then demonstrative, either side, dem. required}
D' = (Art_1) Dem_1 NP (Art_2) Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demArtNoun'">
rule {D' option 10f - demonstrative then article, both before, dem. required}
D' = Dem (Art) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='nounDemArt'">
rule {D' option 10g - demonstrative then article, both after, dem. required}
D' = NP Dem (Art)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demArtEither'">
rule {D' option 10h - demonstrative then article, either side, dem. required}
D' = Dem_1 (Art_1) NP Dem_2 (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='artDemNounDemArt'">
rule {D' option 10i - articles external, demonstratives internal, dem. required}
D' = (Art_1) Dem_1 NP Dem_2 (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
					<xsl:if test="./@artBothBothPos='demArtNounArtDem'">
rule {D' option 10j - demonstratives external, articles internal, dem. required}
D' = Dem_1 (Art_1) NP (Art_2) Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@artBothRequired2='yesBoth'">
				<xsl:if test="./@artBothBothPos='artNounDem'">
rule {D' option 11a - articles before, demonstratives after, both required}
D' = Art NP Dem
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artBothBothPos='demNounArt'">
rule {D' option 11b - articles after, demonstratives before, both required}
D' = Dem NP Art
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artBothBothPos='artDemNoun'">
rule {D' option 11c - article then demonstrative, both before, both required}
D' = Art Dem NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artBothBothPos='nounArtDem'">
rule {D' option 11d - article then demonstrative, both after, both required}
D' = NP Art Dem
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artBothBothPos='artDemEither'">
rule {D' option 11e - article then demonstrative, either side, both required}
D' = Art_1 Dem_1 NP Art_2 Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
				<xsl:if test="./@artBothBothPos='demArtNoun'">
rule {D' option 11f - demonstrative then article, both before, both required}
D' = Dem Art NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artBothBothPos='nounDemArt'">
rule {D' option 11g - demonstrative then article, both after, both required}
D' = NP Dem Art
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
</xsl:if>
				<xsl:if test="./@artBothBothPos='demArtEither'">
rule {D' option 11h - demonstrative then article, either side, both required}
D' = Dem_1 Art_1 NP Dem_2 Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
				<xsl:if test="./@artBothBothPos='artDemNounDemArt'">
rule {D' option 11i - articles external, demonstratives internal, required}
D' = Art_1 Dem_1 NP Dem_2 Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
				<xsl:if test="./@artBothBothPos='demArtNounArtDem'">
rule {D' option 11j - demonstratives external, articles internal, required}
D' = Dem_1 Art_1 NP Art_2 Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="NPNPOptions">
|-*********************************************************
<xsl:if test="./@possMarked='no'">
			<xsl:if test="./@possNounPos1='before' or ./@possNounPos1='unknown' and $Spec='initial' or ./@possNounPos1='unknown' and $Spec='internal'">
				<xsl:call-template name="NPOption1a"/>
			</xsl:if>
			<xsl:if test="./@possNounPos1='after' or ./@possNounPos1='unknown' and $Spec='final'">
				<xsl:call-template name="NPOption1b"/>
			</xsl:if>
			<xsl:if test="./@possNounPos1='either'">
				<xsl:call-template name="NPOption1c"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@possMarked='yesAffix'">
			<xsl:if test="./@possNounPos2='before' or ./@possNounPos2='unknown' and $Spec='initial' or ./@possNounPos2='unknown' and $Spec='internal'">
				<xsl:call-template name="NPOption1a"/>
			</xsl:if>
			<xsl:if test="./@possNounPos2='after' or ./@possNounPos2='unknown' and $Spec='final'">
				<xsl:call-template name="NPOption1b"/>
			</xsl:if>
			<xsl:if test="./@possNounPos2='either'">
				<xsl:call-template name="NPOption1c"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@possMarked='yesClitic'">
			<xsl:if test="./@possCliticRequired='no'">
				<xsl:if test="./@possCliticPossPos='before'">
					<xsl:if test="./@possNounPos3='before' or ./@possNounPos3='unknown' and $Spec='initial' or ./@possNounPos3='unknown' and $Spec='internal'">
rule {NP option 2a - optional marker before, possessor initial}
NP = ({(Poss) DP} / Pron) {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP   head agr case genitive&gt; = +
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr case&gt; = &lt;Poss head agr case&gt;
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:if>
					<xsl:if test="./@possNounPos3='after' or ./@possNounPos3='unknown' and $Spec='final'">
rule {NP option 2b - optional marker before, possessor final}
NP = {N'' / N'} ({(Poss) DP} / Pron)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP   head agr case genitive&gt; = +
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr case&gt; = &lt;Poss head agr case&gt;
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:if>
					<xsl:if test="./@possNounPos3='either'">
rule {NP option 2c - optional marker before, possessor either side}
NP = ({(Poss_1) DP_1} / Pron_1) {N'' / N'} ({(Poss_2) DP_2} / Pron_2)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP_1   head agr case genitive&gt; = +
	&lt;Pron_1 head agr case genitive&gt; = +
	&lt;DP_1 head agr case&gt; = &lt;Poss_1 head agr case&gt;
	&lt;DP_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;DP_2   head agr case genitive&gt; = +
	&lt;Pron_2 head agr case genitive&gt; = +
	&lt;DP_2 head agr case&gt; = &lt;Poss_2 head agr case&gt;
	&lt;DP_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_1 head type wh&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_2 head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_2 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_2 head agr animate&gt;
</xsl:if>
				</xsl:if>
				<xsl:if test="./@possCliticPossPos='after'">
					<xsl:if test="./@possNounPos3='before' or ./@possNounPos3='unknown' and $Spec='initial' or ./@possNounPos3='unknown' and $Spec='internal'">
rule {NP option 3a - optional marker after, possessor initial}
NP = ({DP (Poss)} / Pron) {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP   head agr case genitive&gt; = +
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr case&gt; = &lt;Poss head agr case&gt;
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:if>
					<xsl:if test="./@possNounPos3='after' or ./@possNounPos3='unknown' and $Spec='final'">
rule {NP option 3b - optional marker after, possessor final}
NP = {N'' / N'} ({DP (Poss)} / Pron)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP   head agr case genitive&gt; = +
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr case&gt; = &lt;Poss head agr case&gt;
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:if>
					<xsl:if test="./@possNounPos3='either'">
rule {NP option 3c - optional marker after, possessor either side}
NP = ({DP_1 (Poss_1)} / Pron_1) {N'' / N'} ({DP_2 (Poss_2)} / Pron_2)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP_1   head agr case genitive&gt; = +
	&lt;Pron_1 head agr case genitive&gt; = +
	&lt;DP_1 head agr case&gt; = &lt;Poss_1 head agr case&gt;
	&lt;DP_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;DP_2   head agr case genitive&gt; = +
	&lt;Pron_2 head agr case genitive&gt; = +
	&lt;DP_2 head agr case&gt; = &lt;Poss_2 head agr case&gt;
	&lt;DP_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_1 head type wh&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_2 head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_2 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_2 head agr animate&gt;
</xsl:if>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@possCliticRequired='yes'">
				<xsl:if test="./@possCliticPossPos='before'">
					<xsl:if test="./@possNounPos3='before' or ./@possNounPos3='unknown' and $Spec='initial' or ./@possNounPos3='unknown' and $Spec='internal'">
rule {NP option 4a - required marker before, possessor initial}
NP = ({Poss DP} / Pron) {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP head agr case&gt; = &lt;Poss head agr case&gt;
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:if>
					<xsl:if test="./@possNounPos3='after' or ./@possNounPos3='unknown' and $Spec='final'">
rule {NP option 4b - required marker before, possessor final}
NP = {N'' / N'} ({Poss DP} / Pron)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP head agr case&gt; = &lt;Poss head agr case&gt;
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:if>
					<xsl:if test="./@possNounPos3='either'">
rule {NP option 4c - required marker before, possessor either side}
NP = ({Poss_1 DP_1} / Pron_1) {N'' / N'} ({Poss_2 DP_2} / Pron_2)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP_1 head agr case&gt; = &lt;Poss_1 head agr case&gt;
	&lt;Pron_1 head agr case genitive&gt; = +
	&lt;DP_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;DP_2 head agr case&gt; = &lt;Poss_2 head agr case&gt;
	&lt;Pron_2 head agr case genitive&gt; = +
	&lt;DP_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_1 head type wh&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_2 head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_2 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_2 head agr animate&gt;
</xsl:if>
				</xsl:if>
				<xsl:if test="./@possCliticPossPos='after'">
					<xsl:if test="./@possNounPos3='before' or ./@possNounPos3='unknown' and $Spec='initial' or ./@possNounPos3='unknown' and $Spec='internal'">
rule {NP option 5a - required marker after, possessor initial}
NP = ({DP Poss} / Pron) {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP head agr case&gt; = &lt;Poss head agr case&gt;
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:if>
					<xsl:if test="./@possNounPos3='after' or ./@possNounPos3='unknown' and $Spec='final'">
rule {NP option 5b - required marker after, possessor final}
NP = {N'' / N'} ({DP Poss} / Pron)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP head agr case&gt; = &lt;Poss head agr case&gt;
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:if>
					<xsl:if test="./@possNounPos3='either'">
rule {NP option 5c - required marker after, possessor either side}
NP = ({DP_1 Poss_1} / Pron_1) {N'' / N'} ({DP_2 Poss_2} / Pron_2)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP_1 head agr case&gt; = &lt;Poss_1 head agr case&gt;
	&lt;Pron_1 head agr case genitive&gt; = +
	&lt;DP_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;DP_2 head agr case&gt; = &lt;Poss_2 head agr case&gt;
	&lt;Pron_2 head agr case genitive&gt; = +
	&lt;DP_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_1 head type wh&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_2 head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_2 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_2 head agr animate&gt;
</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="NPOption1a">
rule {NP option 1a - no separate marker, possessor initial}
NP = (DP / Pron) {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP   head agr case genitive&gt; = +
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:template>
	<xsl:template name="NPOption1b">
rule {NP option 1b - no separate marker, possessor final}
NP = {N'' / N'} (DP / Pron)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP   head agr case genitive&gt; = +
	&lt;Pron head agr case genitive&gt; = +
	&lt;DP head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP head agr animate&gt;
</xsl:template>
	<xsl:template name="NPOption1c">
rule {NP option 1c - no separate marker, possessor either side}
NP = (DP_1 / Pron_1) {N'' / N'} (DP_2 / Pron_2)
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;DP_1   head agr case genitive&gt; = +
	&lt;Pron_1 head agr case genitive&gt; = +
	&lt;DP_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_1 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;DP_2   head agr case genitive&gt; = +
	&lt;Pron_2 head agr case genitive&gt; = +
	&lt;DP_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;DP_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N'' head possessor agr&gt;
	&lt;Pron_2 head agr&gt; = &lt;N' head possessor agr&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_1 head type wh&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron_2 head type wh&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_1 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;Pron_2 head agr animate&gt;
	&lt;NP head agr animate&gt; &lt;= &lt;DP_2 head agr animate&gt;
</xsl:template>
	<xsl:template name="PronNPOptions">
		<xsl:if test="//pron/@partitive='before'  or //pron/@partitive='unknown' and $Head='final'">
rule {NP option 6b - pronoun,dem,quantifiers w/ optional partitive PP before}
NP = (PP) {Pron / Dem / Q / Num / Deg}
	&lt;NP head&gt; = &lt;Pron head&gt;
	&lt;NP head&gt; = &lt;Dem head&gt;
	&lt;NP head&gt; = &lt;Q head&gt;
	&lt;NP head&gt; = &lt;Num head&gt;
	&lt;NP head&gt; = &lt;Deg head&gt;
	&lt;Pron head agr case genitive&gt; = -
	&lt;Deg head type quantifier&gt; = +
	&lt;Dem head type wh &gt; = -		|- so "which" not separate
	&lt;PP head type stranded&gt; = -	|- PP must have overt complement
	&lt;PP head type sentential&gt; = -	|- sentential not within NP
	&lt;PP head type partitive&gt; = +
</xsl:if>
		<xsl:if test="//pron/@partitive='after'  or //pron/@partitive='unknown' and $Head='initial'">
rule {NP option 6a - pronoun,dem,quantifiers w/ optional partitive PP after}
NP = {Pron / Dem / Q / Num / Deg} (PP)
	&lt;NP head&gt; = &lt;Pron head&gt;
	&lt;NP head&gt; = &lt;Dem head&gt;
	&lt;NP head&gt; = &lt;Q head&gt;
	&lt;NP head&gt; = &lt;Num head&gt;
	&lt;NP head&gt; = &lt;Deg head&gt;
	&lt;Pron head agr case genitive&gt; = -
	&lt;Deg head type quantifier&gt; = +
	&lt;Dem head type wh &gt; = -		|- so "which" not separate
	&lt;PP head type stranded&gt; = -	|- PP must have overt complement
	&lt;PP head type sentential&gt; = -	|- sentential not within NP
	&lt;PP head type partitive&gt; = +
</xsl:if>
	</xsl:template>
	<xsl:template name="NPNDoubleBarOptions">
|-********************************************************
<xsl:if test="./@qpPos='before' or ./@qpPos='unknown' and $Spec='initial' or ./@qpPos='unknown' and $Spec='internal'">
			<xsl:call-template name="NDoubleBarOption1"/>
		</xsl:if>
		<xsl:if test="./@qpPos='after' or ./@qpPos='unknown' and $Spec='final'">
			<xsl:call-template name="NDoubleBarOption2"/>
		</xsl:if>
		<xsl:if test="./@qpPos='either'">
			<xsl:if test="./@qpBoth='no'">
				<xsl:call-template name="NDoubleBarOption1"/>
				<xsl:call-template name="NDoubleBarOption2"/>
			</xsl:if>
			<xsl:if test="./@qpBoth='yesBoth'">
rule {N'' option 3a - QPs either side, both required}
N'' = QP_1 N' QP_2
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_1 head type DP-initial&gt; = +
	&lt;QP_2 head type DP-final&gt;   = +
</xsl:if>
			<xsl:if test="./@qpBoth='yesInitial'">
				<xsl:if test="./@qpBothAfter='yes'">
					<xsl:call-template name="NDoubleBarOption2"/>
				</xsl:if>
rule {N'' option 3b - QPs either side, initial required}
N'' = QP_1 N' (QP_2)
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_1 head type DP-initial&gt; = +
	&lt;QP_2 head type DP-final&gt;   = +
</xsl:if>
			<xsl:if test="./@qpBoth='yesFinal'">
				<xsl:if test="./@qpBothBefore='yes'">
					<xsl:call-template name="NDoubleBarOption1"/>
				</xsl:if>
rule {N'' option 3c - QPs either side, final required}
N'' = (QP_1) N' QP_2
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_1 head type DP-initial&gt; = +
	&lt;QP_2 head type DP-final&gt;   = +
</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="NDoubleBarOption1">
rule {N'' option 1 - QPs initial}
N'' = QP N'
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP head agr&gt; = &lt;N' head agr&gt;
</xsl:template>
	<xsl:template name="NDoubleBarOption2">
rule {N'' option 2 - QPs final}
N'' = N' QP
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP head agr&gt; = &lt;N' head agr&gt;
</xsl:template>
	<!-- N' options -->
	<xsl:template name="NPNBarOptions">
|-********************************************************
<xsl:if test="./@adjpPos='before' or ./@adjpPos='unknown' and $Spec='initial' or ./@adjpPos='unknown' and $Spec='internal'">
			<xsl:call-template name="NBarOption1a"/>
		</xsl:if>
		<xsl:if test="./@adjpPos='after' or ./@adjpPos='unknown' and $Spec='final'">
			<xsl:call-template name="NBarOption1b"/>
		</xsl:if>
		<xsl:if test="./@adjpPos='either'">
			<xsl:call-template name="NBarOption1a"/>
			<xsl:call-template name="NBarOption1b"/>
		</xsl:if>
		<xsl:if test="./@compHead='left'">
			<xsl:if test="./@compHeadPPPos='before'  or ./@compHeadPPPos='unknown' and $Head='final'">
				<xsl:call-template name="NBarOption2a"/>
			</xsl:if>
			<xsl:if test="./@compHeadPPPos='after'  or ./@compHeadPPPos='unknown' and $Head='initial'">
rule {N' option 2b - left-most noun head, PP final, optional}
N' = N_1 (N_2 (N_3)) (PP)
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	|- P must have overt complement
	&lt;PP head type passive&gt; = -	|- by-phrase not within NP
	&lt;PP head type sentential&gt; = -	|- sentential not within NP
</xsl:if>
			<xsl:if test="./@compHeadPPPos='either'">
				<xsl:call-template name="NBarOption2a"/>
rule {N' option 2c - left-most noun head, PP final, required}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	|- P must have overt complement
	&lt;PP head type passive&gt; = -	|- by-phrase not within NP
	&lt;PP head type sentential&gt; = -	|- sentential not within NP
</xsl:if>
		</xsl:if>
		<xsl:if test="./@compHead='right'">
			<xsl:if test="./@compHeadPPPos='before'  or ./@compHeadPPPos='unknown' and $Head='final'">
				<xsl:call-template name="NBarOption3a"/>
			</xsl:if>
			<xsl:if test="./@compHeadPPPos='after'  or ./@compHeadPPPos='unknown' and $Head='initial'">
rule {N' option 3b - right-most noun head, PP final, optional}
N' = ((N_3) N_2) N_1 (PP)
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	|- P must have overt complement
	&lt;PP head type passive&gt; = -	|- by-phrase not within NP
	&lt;PP head type sentential&gt; = -	|- sentential not within NP
</xsl:if>
			<xsl:if test="./@compHeadPPPos='either'">
				<xsl:call-template name="NBarOption3a"/>
rule {N' option 3c - right-most noun head, PP final, required}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	|- P must have overt complement
	&lt;PP head type passive&gt; = -	|- by-phrase not within NP
	&lt;PP head type sentential&gt; = -	|- sentential not within NP
</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="NBarOption1a">
rule {N' option 1a - AdjP initial, recursive}
N'_1 = AdjP N'_2
	&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
	&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
	&lt;AdjP head type DP-initial&gt; = +
</xsl:template>
	<xsl:template name="NBarOption1b">
rule {N' option 1b - AdjP final, recursive}
N'_1 = N'_2 AdjP
	&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
	&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
	&lt;AdjP head type DP-final&gt; = +
</xsl:template>
	<xsl:template name="NBarOption2a">
rule {N' option 2a - left-most noun head, PP initial, optional}
N' = (PP) N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	|- P must have overt complement
	&lt;PP head type passive&gt; = -	|- by-phrase not within NP
	&lt;PP head type sentential&gt; = -	|- sentential not within NP
</xsl:template>
	<xsl:template name="NBarOption3a">
rule {N' option 3a - right-most noun head, PP initial, optional}
N' = (PP) ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	|- P must have overt complement
	&lt;PP head type passive&gt; = -	|- by-phrase not within NP
	&lt;PP head type sentential&gt; = -	|- sentential not within NP
</xsl:template>
	<!-- ************  PP  ************-->
	<xsl:template match="//pp">
|-***********************************************************
<xsl:call-template name="PPOptions"/>
|-***********************************************************
<xsl:call-template name="PBarOptions"/>
	</xsl:template>
	<xsl:template name="PPOptions">
		<xsl:if test="./@degree='no'">
			<xsl:if test="./@manner='no'">
rule {PP option 1 - no modifiers}
PP = P'
	&lt;PP head&gt; = &lt;P' head&gt;
</xsl:if>
			<xsl:if test="./@manner='yes'">
				<xsl:if test="./@mannerPos='before' or ./@mannerPos='unknown' and $Spec='initial' or ./@mannerPos='unknown' and $Spec='internal'">
rule {PP option 2a - optional adverbial before}
PP = (AdvP) P'
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdvP head type manner&gt; = +
</xsl:if>
				<xsl:if test="./@mannerPos='after' or ./@mannerPos='unknown' and $Spec='final'">
rule {PP option 2b - optional adverbial after}
PP = P' (AdvP)
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdvP head type manner&gt; = +
</xsl:if>
				<xsl:if test="./@mannerPos='either'">
rule {PP option 2c - optional adverbial either side}
PP = (AdvP_1) P' (AdvP_2)
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;AdvP_1 head type manner&gt; = +
	&lt;AdvP_2 head type manner&gt; = +
</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@degree='yes'">
			<xsl:if test="./@manner='no'">
				<xsl:if test="./@degreePos='before' or ./@degreePos='unknown' and $Spec='initial' or ./@degreePos='unknown' and $Spec='internal'">
rule {PP option 3a - optional degree word before}
PP = (Deg) P'
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg head type modifies_PP&gt; = +
</xsl:if>
				<xsl:if test="./@degreePos='after' or ./@degreePos='unknown' and $Spec='final'">
rule {PP option 3b - optional degree word after}
PP = P' (Deg)
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg head type modifies_PP&gt; = +
</xsl:if>
				<xsl:if test="./@degreePos='either'">
rule {PP option 3c - optional degree word either side}
PP = (Deg_1) P' (Deg_2)
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg_1 head type modifies_PP&gt; = +
	&lt;Deg_1 head type PP-initial&gt; = +
	&lt;Deg_2 head type modifies_PP&gt; = +
	&lt;Deg_2 head type PP-final&gt; = +
</xsl:if>
			</xsl:if>
			<xsl:if test="./@manner='yes'">
				<xsl:if test="./@degreeMannerPos='bothBefore' or ./@degreeMannerPos='unknown' and $Spec='initial' or ./@degreeMannerPos='unknown' and $Spec='internal'">
rule {PP option 4a - optional degree word or adverbial before}
PP = (Deg / AdvP) P'
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg head type modifies_PP&gt; = +
	&lt;AdvP head type manner&gt; = +
</xsl:if>
				<xsl:if test="./@degreeMannerPos='bothAfter' or ./@degreeMannerPos='unknown' and $Spec='final'">
rule {PP option 4b - optional degree word or adverbial after}
PP = P' (Deg / AdvP)
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg head type modifies_PP&gt; = +
	&lt;AdvP head type manner&gt; = +
</xsl:if>
				<xsl:if test="./@degreeMannerPos='degreeManner'">
rule {PP option 4c - optional degree word before, adverbial after}
PP = (Deg) P' (AdvP)
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg head type modifies_PP&gt; = +
	&lt;AdvP head type manner&gt; = +
</xsl:if>
				<xsl:if test="./@degreeMannerPos='mannerDegree'">
rule {PP option 4d - optional degree word after, adverbial before}
PP = (AdvP) P' (Deg)
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg head type modifies_PP&gt; = +
	&lt;AdvP head type manner&gt; = +
</xsl:if>
				<xsl:if test="./@degreeMannerPos='either'">
rule {PP option 4e - optional degree word or adverbial either side}
PP = (Deg_1 / AdvP_1) P' (Deg_2 / Advp_2)
	&lt;PP head&gt; = &lt;P' head&gt;
	&lt;Deg_1 head type modifies_PP&gt; = +
	&lt;Deg_1 head type PP-initial&gt; = +
	&lt;AdvP_1 head type manner&gt; = +
	&lt;Deg_2 head type modifies_PP&gt; = +
	&lt;Deg_2 head type PP-final&gt; = +
	&lt;AdvP_2 head type manner&gt; = +
</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PBarOptions">
		<xsl:if test="./@prePost='pre' or ./@prePost='unknown' and $Head='initial'">
			<xsl:call-template name="PBarOption1a"/>
			<xsl:if test="./@sentComp='yes'">
				<xsl:call-template name="PBarOption2a"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@prePost='post' or ./@prePost='unknown' and $Head='final'">
			<xsl:call-template name="PBarOption1b"/>
			<xsl:if test="./@sentComp='yes'">
				<xsl:call-template name="PBarOption2b"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@prePost='both'">
			<xsl:call-template name="PBarOption1a"/>
			<xsl:call-template name="PBarOption1b"/>
			<xsl:if test="./@sentComp='yes'">
				<xsl:call-template name="PBarOption2a"/>
				<xsl:call-template name="PBarOption2b"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@alone='yes'">
			<xsl:call-template name="PBarOption3"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PBarOption1a">
rule {P' option 1a - prepositions, DP or locative complement only}
P' = P {DP / AdvP}
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;AdvP head type locative&gt; = +
	&lt;P' head type stranded&gt; = -		|- not missing a complement
	&lt;P' head object agr&gt; = &lt;DP head agr&gt;	|- for passive
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	|- wh for pied-piping
</xsl:template>
	<xsl:template name="PBarOption1b">
rule {P' option 1b - postpositions, DP or locative complement only}
P' = {DP / AdvP} P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-final&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;AdvP head type locative&gt; = +
	&lt;P' head type stranded&gt; = -		|- not missing a complement
	&lt;P' head object agr&gt; = &lt;DP head agr&gt;	|- for passive
	&lt;P' head type wh&gt; = &lt;DP head type wh&gt;	|- wh for pied-piping
</xsl:template>
	<xsl:template name="PBarOption2a">
rule {P' option 2a - prepositions, IP complement }
P' = P IP
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-initial&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head infl mood imperative&gt; = -
	&lt;IP head type copular&gt; = -
	&lt;P' head type stranded&gt; = -		|- not missing a complement
	&lt;P' head type sentential&gt; = +
</xsl:template>
	<xsl:template name="PBarOption2b">
rule {P' option 2b - postpositions, IP complement}
P' = IP P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P head type PP-final&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP head infl mood imperative&gt; = -
	&lt;IP head type copular&gt; = -
	&lt;P' head type stranded&gt; = -		|- not missing a complement
	&lt;P' head type sentential&gt; = +
</xsl:template>
	<xsl:template name="PBarOption3">
rule {P' option 3 - prepositions or postpositions with no complement }
P' = P
	&lt;P' head&gt; = &lt;P head&gt;
	&lt;P' head type stranded&gt; = +		|- missing a complement
</xsl:template>
	<!-- ************  IP  ************-->
	<xsl:template match="//ip">
|-***********************************************************
<xsl:call-template name="IPOptions"/>
	</xsl:template>
	<xsl:template name="IPOptions">
		<xsl:if test="//typology/@wordOrder='SVO'">
			<xsl:call-template name="IPSVO"/>
		</xsl:if>
		<xsl:if test="//typology/@wordOrder='SOV'">
			<xsl:call-template name="IPSOV"/>
		</xsl:if>
		<xsl:if test="//typology/@wordOrder='VOS'">
			<xsl:call-template name="IPVOS"/>
		</xsl:if>
		<xsl:if test="//typology/@wordOrder='OVS'">
			<xsl:call-template name="IPOVS"/>
		</xsl:if>
		<xsl:if test="//typology/@wordOrder='VSO'">
			<xsl:call-template name="IPVSO"/>
		</xsl:if>
		<xsl:if test="//typology/@wordOrder='OSV'">
			<xsl:call-template name="IPOSV"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="IPSVO">
		<!-- SVO -->
		<!-- Pro-drop -->
		<xsl:if test="./@proDrop4='no'">
			<xsl:call-template name="IPOption2a"/>
		</xsl:if>
		<xsl:if test="./@proDrop4='noImpv'">
			<xsl:call-template name="IPOption1"/>
			<xsl:call-template name="IPOption2a"/>
		</xsl:if>
		<xsl:if test="./@proDrop4='yes'">
			<xsl:call-template name="IPOption2b"/>
		</xsl:if>
		<!-- aux -->
		<xsl:if test="./@aux='no'">
			<xsl:call-template name="IBarOption1"/>
		</xsl:if>
		<xsl:if test="./@aux='yes'">
			<xsl:if test="./@auxRequired='no'">
				<xsl:call-template name="IBarOption1"/>
			</xsl:if>
			<xsl:call-template name="IBarOption2"/>
		</xsl:if>
		<xsl:if test="./@auxMany='yes'">
			<xsl:call-template name="VPOption1a"/>
		</xsl:if>
		<!-- Intrans -->
		<xsl:call-template name="VPOption2a"/>
		<xsl:call-template name="VPOption3a"/>
		<xsl:call-template name="VPOption4a"/>
		<!-- copula -->
		<xsl:if test="./@copular='yesNeither'">
			<xsl:call-template name="VPOption4c"/>
		</xsl:if>
		<xsl:if test="./@copular='yesAux'">
			<xsl:call-template name="VPOption4d"/>
		</xsl:if>
		<!-- trans -->
		<xsl:if test="//np/@nounCase='no' or //np/@nounCase='yes' and //np/@nounCaseType='nomAcc'">
			<xsl:call-template name="VPOption5a"/>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:call-template name="VPOption6a"/>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:call-template name="VPOption7a"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="//np/@nounCase='yes' and //np/@nounCaseType='erg'">
			<xsl:call-template name="VPOption5b"/>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:call-template name="VPOption6b"/>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:call-template name="VPOption7b"/>
			</xsl:if>
		</xsl:if>
		<!-- passive -->
		<xsl:if test="./@passive='yes'">
			<xsl:if test="./@proDrop4='no' or ./@proDrop4='noImpv'">
				<xsl:call-template name="IPOption2b"/>
			</xsl:if>
			<xsl:if test="./@proDrop4='yes'">
				<xsl:call-template name="IPOption2d"/>
			</xsl:if>
			<xsl:if test="./@passiveAux='no'">
				<!-- ditrans -->
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9a"/>
				</xsl:if>
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9b"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAux='yes'">
				<!-- ditrans -->
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9d"/>
				</xsl:if>
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9e"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAgent='yes'">
				<xsl:if test="./@passiveAgentCat='dp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:call-template name="VPOption9k"/>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:call-template name="VPOption9m"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@passiveAgentCat='pp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:call-template name="VPOption9g"/>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:call-template name="VPOption9i"/>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="IPSOV">
		<!-- SOV -->
		<!-- Pro-drop -->
		<xsl:if test="./@proDrop4='no'">
			<xsl:call-template name="IPOption2a"/>
		</xsl:if>
		<xsl:if test="./@proDrop4='noImpv'">
			<xsl:call-template name="IPOption1"/>
			<xsl:call-template name="IPOption2a"/>
		</xsl:if>
		<xsl:if test="./@proDrop4='yes'">
			<xsl:call-template name="IPOption2b"/>
		</xsl:if>
		<!-- aux -->
		<xsl:if test="./@aux='no'">
			<xsl:call-template name="IBarOption1"/>
		</xsl:if>
		<xsl:if test="./@aux='yes'">
			<xsl:if test="./@auxRequired='no'">
				<xsl:call-template name="IBarOption1"/>
			</xsl:if>
			<xsl:call-template name="IBarOption3"/>
		</xsl:if>
		<xsl:if test="./@auxMany='yes'">
			<xsl:call-template name="VPOption1b"/>
		</xsl:if>
		<!-- Intrans -->
		<xsl:call-template name="VPOption2a"/>
		<xsl:call-template name="VPOption3b"/>
		<xsl:call-template name="VPOption4b"/>
		<!-- copula -->
		<xsl:if test="./@copular='yesNeither'">
			<xsl:call-template name="VPOption4c"/>
		</xsl:if>
		<xsl:if test="./@copular='yesAux'">
			<xsl:call-template name="VPOption4d"/>
		</xsl:if>
		<!-- trans -->
		<xsl:if test="//np/@nounCase='no' or //np/@nounCase='yes' and //np/@nounCaseType='nomAcc'">
			<xsl:call-template name="VPOption5c"/>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:call-template name="VPOption6c"/>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:call-template name="VPOption7c"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="//np/@nounCase='yes' and //np/@nounCaseType='erg'">
			<xsl:call-template name="VPOption5d"/>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:call-template name="VPOption6d"/>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:call-template name="VPOption7d"/>
			</xsl:if>
		</xsl:if>
		<!-- passive -->
		<xsl:if test="./@passive='yes'">
			<xsl:if test="./@proDrop4='no' or ./@proDrop4='noImpv'">
				<xsl:call-template name="IPOption2f"/>
			</xsl:if>
			<xsl:if test="./@proDrop4='yes'">
				<xsl:call-template name="IPOption2h"/>
			</xsl:if>
			<xsl:if test="./@passiveAux='no'">
				<!-- ditrans -->
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9a"/>
				</xsl:if>
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9c"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAux='yes'">
				<!-- ditrans -->
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9d"/>
				</xsl:if>
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9f"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAgent='yes'">
				<xsl:if test="./@passiveAgentCat='dp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:call-template name="VPOption9l"/>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:call-template name="VPOption9n"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@passiveAgentCat='pp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:call-template name="VPOption9h"/>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:call-template name="VPOption9j"/>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="IPVOS">
		<!-- VOS -->
		<!-- Pro-drop -->
		<xsl:if test="./@proDrop4='no'">
			<xsl:call-template name="IPOption2c"/>
		</xsl:if>
		<xsl:if test="./@proDrop4='noImpv'">
			<xsl:call-template name="IPOption1"/>
			<xsl:call-template name="IPOption2c"/>
		</xsl:if>
		<xsl:if test="./@proDrop4='yes'">
			<xsl:call-template name="IPOption2d"/>
		</xsl:if>
		<!-- aux -->
		<xsl:if test="./@aux='no'">
			<xsl:call-template name="IBarOption1"/>
		</xsl:if>
		<xsl:if test="./@aux='yes'">
			<xsl:if test="./@auxRequired='no'">
				<xsl:call-template name="IBarOption1"/>
			</xsl:if>
			<xsl:call-template name="IBarOption2"/>
		</xsl:if>
		<xsl:if test="./@auxMany='yes'">
			<xsl:call-template name="VPOption1a"/>
		</xsl:if>
		<!-- Intrans -->
		<xsl:call-template name="VPOption2a"/>
		<xsl:call-template name="VPOption3a"/>
		<xsl:call-template name="VPOption4a"/>
		<!-- copula -->
		<xsl:if test="./@copular='yesNeither'">
			<xsl:call-template name="VPOption4c"/>
		</xsl:if>
		<xsl:if test="./@copular='yesAux'">
			<xsl:call-template name="VPOption4d"/>
		</xsl:if>
		<!-- trans -->
		<xsl:if test="//np/@nounCase='no' or //np/@nounCase='yes' and //np/@nounCaseType='nomAcc'">
			<xsl:call-template name="VPOption5a"/>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:call-template name="VPOption6a"/>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:call-template name="VPOption7a"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="//np/@nounCase='yes' and //np/@nounCaseType='erg'">
			<xsl:call-template name="VPOption5b"/>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:call-template name="VPOption6b"/>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:call-template name="VPOption7b"/>
			</xsl:if>
		</xsl:if>
		<!-- passive -->
		<xsl:if test="./@passive='yes'">
			<xsl:if test="./@proDrop4='no' or ./@proDrop4='noImpv'">
				<xsl:call-template name="IPOption2f"/>
			</xsl:if>
			<xsl:if test="./@proDrop4='yes'">
				<xsl:call-template name="IPOption2h"/>
			</xsl:if>
			<xsl:if test="./@passiveAux='no'">
				<!-- ditrans -->
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9a"/>
				</xsl:if>
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9b"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAux='yes'">
				<!-- ditrans -->
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9d"/>
				</xsl:if>
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9e"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAgent='yes'">
				<xsl:if test="./@passiveAgentCat='dp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:call-template name="VPOption9k"/>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:call-template name="VPOption9m"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@passiveAgentCat='pp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:call-template name="VPOption9g"/>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:call-template name="VPOption9i"/>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="IPOVS">
		<!-- OVS -->
		<!-- Pro-drop -->
		<xsl:if test="./@proDrop4='no'">
			<xsl:call-template name="IPOption2c"/>
		</xsl:if>
		<xsl:if test="./@proDrop4='noImpv'">
			<xsl:call-template name="IPOption1"/>
			<xsl:call-template name="IPOption2c"/>
		</xsl:if>
		<xsl:if test="./@proDrop4='yes'">
			<xsl:call-template name="IPOption2d"/>
		</xsl:if>
		<!-- aux -->
		<xsl:if test="./@aux='no'">
			<xsl:call-template name="IBarOption1"/>
		</xsl:if>
		<xsl:if test="./@aux='yes'">
			<xsl:if test="./@auxRequired='no'">
				<xsl:call-template name="IBarOption1"/>
			</xsl:if>
			<xsl:call-template name="IBarOption3"/>
		</xsl:if>
		<xsl:if test="./@auxMany='yes'">
			<xsl:call-template name="VPOption1b"/>
		</xsl:if>
		<!-- Intrans -->
		<xsl:call-template name="VPOption2a"/>
		<xsl:call-template name="VPOption3b"/>
		<xsl:call-template name="VPOption4b"/>
		<!-- copula -->
		<xsl:if test="./@copular='yesNeither'">
			<xsl:call-template name="VPOption4c"/>
		</xsl:if>
		<xsl:if test="./@copular='yesAux'">
			<xsl:call-template name="VPOption4d"/>
		</xsl:if>
		<!-- trans -->
		<xsl:if test="//np/@nounCase='no' or //np/@nounCase='yes' and //np/@nounCaseType='nomAcc'">
			<xsl:call-template name="VPOption5c"/>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:call-template name="VPOption6c"/>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:call-template name="VPOption7c"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="//np/@nounCase='yes' and //np/@nounCaseType='erg'">
			<xsl:call-template name="VPOption5d"/>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:call-template name="VPOption6d"/>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:call-template name="VPOption7d"/>
			</xsl:if>
		</xsl:if>
		<!-- passive -->
		<xsl:if test="./@passive='yes'">
			<xsl:if test="./@proDrop4='no' or ./@proDrop4='noImpv'">
				<xsl:call-template name="IPOption2f"/>
			</xsl:if>
			<xsl:if test="./@proDrop4='yes'">
				<xsl:call-template name="IPOption2h"/>
			</xsl:if>
			<xsl:if test="./@passiveAux='no'">
				<!-- ditrans -->
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9a"/>
				</xsl:if>
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9c"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAux='yes'">
				<!-- ditrans -->
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9d"/>
				</xsl:if>
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VPOption9f"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAgent='yes'">
				<xsl:if test="./@passiveAgentCat='dp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:call-template name="VPOption9l"/>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:call-template name="VPOption9n"/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@passiveAgentCat='pp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:call-template name="VPOption9h"/>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:call-template name="VPOption9j"/>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="IPVSO">
		<!-- VSO -->
		<xsl:call-template name="IPOption3"/>
		<!-- aux -->
		<xsl:if test="./@aux='no'">
			<xsl:call-template name="IBarOption1"/>
		</xsl:if>
		<xsl:if test="./@aux='yes'">
			<xsl:if test="./@auxRequired='no'">
				<xsl:call-template name="IBarOption1"/>
			</xsl:if>
			<xsl:call-template name="IBarOption2"/>
		</xsl:if>
		<xsl:if test="./@auxMany='yes'">
			<xsl:call-template name="VPOption1a"/>
		</xsl:if>
		<!-- Intrans -->
		<xsl:if test="./@proDrop2='no'">
			<xsl:call-template name="VPOption2b"/>
			<xsl:call-template name="VPOption3c"/>
			<xsl:call-template name="VPOption4e"/>
		</xsl:if>
		<xsl:if test="./@proDrop2='noImpv'">
			<xsl:call-template name="VPOption2b"/>
			<xsl:call-template name="VPOption2bi"/>
			<xsl:call-template name="VPOption3c"/>
			<xsl:call-template name="VPOption3ci"/>
			<xsl:call-template name="VPOption4e"/>
			<xsl:call-template name="VPOption4ei"/>
		</xsl:if>
		<xsl:if test="./@proDrop2='yes'">
			<xsl:call-template name="VPOption2bp"/>
			<xsl:call-template name="VPOption3cp"/>
			<xsl:call-template name="VPOption4ep"/>
		</xsl:if>
		<!-- copula -->
		<xsl:if test="./@copular='yesNeither'">
			<xsl:if test="./@proDrop2='no'">
				<xsl:call-template name="VPOption4f"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='noImpv'">
				<xsl:call-template name="VPOption4f"/>
				<xsl:call-template name="VPOption4fi"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='yes'">
				<xsl:call-template name="VPOption4fp"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@copular='yesAux'">
			<xsl:if test="./@proDrop2='no'">
				<xsl:call-template name="VPOption4fa"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='noImpv'">
				<xsl:call-template name="VPOption4fa"/>
				<xsl:call-template name="VPOption4fai"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='yes'">
				<xsl:call-template name="VPOption4fap"/>
			</xsl:if>
		</xsl:if>
		<!-- trans -->
		<xsl:if test="//np/@nounCase='no' or //np/@nounCase='yes' and //np/@nounCaseType='nomAcc'">
			<xsl:if test="./@proDrop2='no'">
				<xsl:call-template name="VPOption5e"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='noImpv'">
				<xsl:call-template name="VPOption5e"/>
				<xsl:call-template name="VPOption5ei"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='yes'">
				<xsl:call-template name="VPOption5ep"/>
			</xsl:if>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:if test="./@proDrop2='no'">
					<xsl:call-template name="VPOption6e"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='noImpv'">
					<xsl:call-template name="VPOption6e"/>
					<xsl:call-template name="VPOption6ei"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='yes'">
					<xsl:call-template name="VPOption6ep"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:if test="./@proDrop2='no'">
					<xsl:call-template name="VPOption7e"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='noImpv'">
					<xsl:call-template name="VPOption7e"/>
					<xsl:call-template name="VPOption7ei"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='yes'">
					<xsl:call-template name="VPOption7ep"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="//np/@nounCase='yes' and //np/@nounCaseType='erg'">
			<xsl:if test="./@proDrop2='no'">
				<xsl:call-template name="VPOption5f"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='noImpv'">
				<xsl:call-template name="VPOption5f"/>
				<xsl:call-template name="VPOption5fi"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='yes'">
				<xsl:call-template name="VPOption5fp"/>
			</xsl:if>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:if test="./@proDrop2='no'">
					<xsl:call-template name="VPOption6f"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='noImpv'">
					<xsl:call-template name="VPOption6f"/>
					<xsl:call-template name="VPOption6fi"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='yes'">
					<xsl:call-template name="VPOption6fp"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:if test="./@proDrop2='no'">
					<xsl:call-template name="VPOption7f"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='noImpv'">
					<xsl:call-template name="VPOption7f"/>
					<xsl:call-template name="VPOption7fi"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='yes'">
					<xsl:call-template name="VPOption7fp"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<!-- passive -->
		<xsl:if test="./@passive='yes'">
			<xsl:if test="./@passiveAgent='no'">
				<xsl:if test="./@passiveAux='no'">
					<!-- ditrans -->
					<xsl:if test="./@diCat='dp' or ./@diCat='both'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10a"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10ap"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@diCat='pp' or ./@diCat='both'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10c"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10cp"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@passiveAux='yes'">
					<!-- ditrans -->
					<xsl:if test="./@diCat='dp' or ./@diCat='both'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10e"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10ep"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@diCat='pp' or ./@diCat='both'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10g"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10gp"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAgent='yes'">
				<xsl:if test="./@passiveAgentCat='dp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10m"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10mp"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10o"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10op"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@passiveAgentCat='pp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10i"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10ip"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10k"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10kp"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@auxOrder='no'">
			<xsl:call-template name="VPOption11a"/>
			<xsl:call-template name="VPOption11b"/>
			<xsl:call-template name="VBarOption1"/>
			<xsl:call-template name="VBarOption2a"/>
			<xsl:call-template name="VBarOption3a"/>
			<xsl:if test="./@copular='no'">
				<xsl:call-template name="VBarOption3c"/>
			</xsl:if>
			<xsl:if test="//np/@nounCase='no' or //np/@nounCase='yes' and //np/@nounCaseType='nomAcc'">
				<xsl:call-template name="VBarOption4a"/>
				<!-- ditrans -->
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VBarOption5a"/>
				</xsl:if>
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VBarOption6a"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="//np/@nounCase='yes' and //np/@nounCaseType='erg'">
				<xsl:call-template name="VBarOption4b"/>
				<!-- ditrans -->
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VBarOption5b"/>
				</xsl:if>
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VBarOption6b"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAgent='yes'">
				<xsl:if test="./@passiveAgentCat='pp'">
					<xsl:call-template name="VBarOption7a"/>
					<xsl:call-template name="VBarOption7b"/>
				</xsl:if>
				<xsl:if test="./@passiveAgentCat='dp'">
					<xsl:call-template name="VBarOption7c"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="IPOSV">
		<!-- OSV -->
		<xsl:call-template name="IPOption3"/>
		<!-- aux -->
		<xsl:if test="./@aux='no'">
			<xsl:call-template name="IBarOption1"/>
		</xsl:if>
		<xsl:if test="./@aux='yes'">
			<xsl:if test="./@auxRequired='no'">
				<xsl:call-template name="IBarOption1"/>
			</xsl:if>
			<xsl:call-template name="IBarOption3"/>
		</xsl:if>
		<xsl:if test="./@auxMany='yes'">
			<xsl:call-template name="VPOption1b"/>
		</xsl:if>
		<!-- Intrans -->
		<xsl:if test="./@proDrop2='no'">
			<xsl:call-template name="VPOption2c"/>
			<xsl:call-template name="VPOption3d"/>
			<xsl:call-template name="VPOption4g"/>
		</xsl:if>
		<xsl:if test="./@proDrop2='noImpv'">
			<xsl:call-template name="VPOption2c"/>
			<xsl:call-template name="VPOption2ci"/>
			<xsl:call-template name="VPOption3d"/>
			<xsl:call-template name="VPOption3di"/>
			<xsl:call-template name="VPOption4g"/>
			<xsl:call-template name="VPOption4gi"/>
		</xsl:if>
		<xsl:if test="./@proDrop2='yes'">
			<xsl:call-template name="VPOption2cp"/>
			<xsl:call-template name="VPOption3dp"/>
			<xsl:call-template name="VPOption4gp"/>
		</xsl:if>
		<!-- copula -->
		<xsl:if test="./@copular='yesNeither'">
			<xsl:if test="./@proDrop2='no'">
				<xsl:call-template name="VPOption4h"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='noImpv'">
				<xsl:call-template name="VPOption4h"/>
				<xsl:call-template name="VPOption4hi"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='yes'">
				<xsl:call-template name="VPOption4hp"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@copular='yesAux'">
			<xsl:if test="./@proDrop2='no'">
				<xsl:call-template name="VPOption4ha"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='noImpv'">
				<xsl:call-template name="VPOption4ha"/>
				<xsl:call-template name="VPOption4hai"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='yes'">
				<xsl:call-template name="VPOption4hap"/>
			</xsl:if>
		</xsl:if>
		<!-- trans -->
		<xsl:if test="//np/@nounCase='no' or //np/@nounCase='yes' and //np/@nounCaseType='nomAcc'">
			<xsl:if test="./@proDrop2='no'">
				<xsl:call-template name="VPOption5g"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='noImpv'">
				<xsl:call-template name="VPOption5g"/>
				<xsl:call-template name="VPOption5gi"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='yes'">
				<xsl:call-template name="VPOption5gp"/>
			</xsl:if>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:if test="./@proDrop2='no'">
					<xsl:call-template name="VPOption6g"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='noImpv'">
					<xsl:call-template name="VPOption6g"/>
					<xsl:call-template name="VPOption6gi"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='yes'">
					<xsl:call-template name="VPOption6gp"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:if test="./@proDrop2='no'">
					<xsl:call-template name="VPOption7g"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='noImpv'">
					<xsl:call-template name="VPOption7g"/>
					<xsl:call-template name="VPOption7gi"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='yes'">
					<xsl:call-template name="VPOption7gp"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="//np/@nounCase='yes' and //np/@nounCaseType='erg'">
			<xsl:if test="./@proDrop2='no'">
				<xsl:call-template name="VPOption5h"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='noImpv'">
				<xsl:call-template name="VPOption5h"/>
				<xsl:call-template name="VPOption5hi"/>
			</xsl:if>
			<xsl:if test="./@proDrop2='yes'">
				<xsl:call-template name="VPOption5hp"/>
			</xsl:if>
			<!-- ditrans -->
			<xsl:if test="./@diCat='pp' or ./@diCat='both'">
				<xsl:if test="./@proDrop2='no'">
					<xsl:call-template name="VPOption6h"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='noImpv'">
					<xsl:call-template name="VPOption6h"/>
					<xsl:call-template name="VPOption6hi"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='yes'">
					<xsl:call-template name="VPOption6hp"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@diCat='dp' or ./@diCat='both'">
				<xsl:if test="./@proDrop2='no'">
					<xsl:call-template name="VPOption7h"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='noImpv'">
					<xsl:call-template name="VPOption7h"/>
					<xsl:call-template name="VPOption7hi"/>
				</xsl:if>
				<xsl:if test="./@proDrop2='yes'">
					<xsl:call-template name="VPOption7hp"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<!-- passive -->
		<xsl:if test="./@passive='no'">
			<xsl:if test="./@passiveAgent='no'">
				<xsl:if test="./@passiveAux='no'">
					<!-- ditrans -->
					<xsl:if test="./@diCat='dp' or ./@diCat='both'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10b"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10bp"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@diCat='pp' or ./@diCat='both'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10d"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10dp"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@passiveAux='yes'">
					<!-- ditrans -->
					<xsl:if test="./@diCat='dp' or ./@diCat='both'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10f"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10fp"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@diCat='pp' or ./@diCat='both'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10h"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10hp"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAgent='yes'">
				<xsl:if test="./@passiveAgentCat='dp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10n"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10np"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10p"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10pp"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<xsl:if test="./@passiveAgentCat='pp'">
					<xsl:if test="./@passiveAux='no'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10j"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10jp"/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="./@passiveAux='yes'">
						<xsl:if test="./@proDrop2='no' or ./@proDrop2='noImpv'">
							<xsl:call-template name="VPOption10l"/>
						</xsl:if>
						<xsl:if test="./@proDrop2='yes'">
							<xsl:call-template name="VPOption10lp"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
		<xsl:if test="./@auxOrder='yes'">
			<xsl:call-template name="VPOption11c"/>
			<xsl:call-template name="VPOption11d"/>
			<xsl:call-template name="VBarOption1"/>
			<xsl:call-template name="VBarOption2b"/>
			<xsl:call-template name="VBarOption3b"/>
			<xsl:if test="./@copular='no'">
				<xsl:call-template name="VBarOption3c"/>
			</xsl:if>
			<xsl:if test="//np/@nounCase='no' or //np/@nounCase='yes' and //np/@nounCaseType='nomAcc'">
				<xsl:call-template name="VBarOption4c"/>
				<!-- ditrans -->
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VBarOption5c"/>
				</xsl:if>
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VBarOption6c"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="//np/@nounCase='yes' and //np/@nounCaseType='erg'">
				<xsl:call-template name="VBarOption4d"/>
				<!-- ditrans -->
				<xsl:if test="./@diCat='pp' or ./@diCat='both'">
					<xsl:call-template name="VBarOption5d"/>
				</xsl:if>
				<xsl:if test="./@diCat='dp' or ./@diCat='both'">
					<xsl:call-template name="VBarOption6d"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./@passiveAgent='yes'">
				<xsl:if test="./@passiveAgentCat='pp'">
					<xsl:call-template name="VBarOption7a"/>
					<xsl:call-template name="VBarOption7d"/>
				</xsl:if>
				<xsl:if test="./@passiveAgentCat='dp'">
					<xsl:call-template name="VBarOption7e"/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="IPOption1">
rule {IP option 1 - no subject for imperatives}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head infl mood imperative&gt; = +
	&lt;IP head type question&gt; = -
</xsl:template>
	<xsl:template name="IPOption2a">
rule {IP option 2a - subject initial, required, not passive}
IP = DP I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head subject&gt; = &lt;DP&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="IPOption2b">
rule {IP option 2b - subject initial, required, passive}
IP = DP I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = +
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
</xsl:template>
	<xsl:template name="IPOption2c">
rule {IP option 2c - subject initial, optional for pro-drop, not passive}
IP = (DP) I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head subject&gt; = &lt;DP&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="IPOption2d">
rule {IP option 2d - subject initial, optional for pro-drop, passive}
IP = (DP) I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = +
	&lt;IP head type question&gt; = -
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
</xsl:template>
	<xsl:template name="IPOption2e">
rule {IP option 2e - subject final, required, not passive}
IP = I' DP
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head subject&gt; = &lt;DP&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="IPOption2f">
rule {IP option 2f - subject final, required, passive}
IP = I' DP
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = +
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
</xsl:template>
	<xsl:template name="IPOption2g">
rule {IP option 2g - subject final, optional for pro-drop, not passive}
IP = I' (DP)
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head subject&gt; = &lt;DP&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="IPOption2h">
rule {IP option 2h - subject final, optional for pro-drop, passive}
IP = I' (DP)
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = +
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
</xsl:template>
	<xsl:template name="IPOption3">
rule {IP option 3 - subject internal to VP for VSO, OSV}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
</xsl:template>
	<xsl:template name="IPOption4a">
rule {IP option 4a - subject questioned, not passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type passive&gt; = -
	&lt;IP head fronted cat&gt; = DP
	&lt;IP head fronted head type wh&gt; = +
	&lt;IP head fronted head agr case nominative&gt; = +
	&lt;IP head fronted&gt; = &lt;I' head subject&gt;
	&lt;IP rule&gt; = 4a
</xsl:template>
	<xsl:template name="IPOption4b">
rule {IP option 4b - subject questioned, passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type passive&gt; = +
	&lt;IP head fronted cat&gt; = DP
	&lt;IP head fronted head type wh&gt; = +
	&lt;IP head fronted head agr case nominative&gt; = +
	&lt;IP head fronted&gt; = &lt;I' head object&gt;
	&lt;IP rule&gt; = 4b
</xsl:template>
	<xsl:template name="IPOption5">
rule {IP option 5 - adverb questioned, copular verb}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head fronted cat&gt; = AdvP
	&lt;IP head fronted head type wh&gt; = +
	&lt;I' head type copular&gt; = +
	&lt;I' head type transitive&gt; = -
	&lt;I' head type passive&gt; = -
</xsl:template>
	<xsl:template name="IBarOption1">
rule {I' option 1 - no auxiliaries}
I' = VP
	&lt;I' head&gt; = &lt;VP head&gt;
	{&lt;I' head type auxiliary&gt; = -
	 &lt;I' head type question&gt; = -
	/&lt;I' head type question&gt; = +
	}
</xsl:template>
	<xsl:template name="IBarOption2">
rule {I' option 2 - Aux initial, required}
I' = Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;I' head subject agr&gt; = &lt;Aux head subject agr&gt;
</xsl:template>
	<xsl:template name="IBarOption3">
rule {I' option 3 - Aux final, required}
I' = VP Aux
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;I' head subject agr&gt; = &lt;Aux head subject agr&gt;
</xsl:template>
	<xsl:template name="VPOption1a">
rule {VP option 1a - Aux initial, VP complement}
VP = Aux VP_1
	&lt;VP head&gt; = &lt;VP_1 head&gt;
	&lt;VP head type auxiliary&gt; = +	|- must have higher aux
</xsl:template>
	<xsl:template name="VPOption1b">
rule {VP option 1b - Aux final, VP complement}
VP = VP_1 Aux
	&lt;VP head&gt; = &lt;VP_1 head&gt;
	&lt;VP head type auxiliary&gt; = +	|- must have higher aux
</xsl:template>
	<xsl:template name="VPOption1c">
rule {VP option 1c - Aux only for non-root copular questions - English specific?}
VP = Aux
	&lt;VP head&gt; = &lt;Aux head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type root&gt; = -
</xsl:template>
	<xsl:template name="VPOption2a">
rule {VP option 2a - V initial/final, intransitive}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption2b">
rule {VP option 2b - VSO order, intransitive}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption2bi">
rule {VP option 2bi - VSO order, intransitive, imperative}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption2bp">
rule {VP option 2bp - VSO order, intransitive, pro-drop}
VP = V (DP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption2c">
rule {VP option 2c - OSV order, intransitive}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption2ci">
rule {VP option 2ci - OSV order, intransitive, imperative}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption2cp">
rule {VP option 2cp - OSV order, intransitive, pro-drop}
VP = (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption2d">
rule {VP option 2d - VSO/OSV, intransitive, subject questioned}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V  head type transitive&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
</xsl:template>
	<xsl:template name="VPOption3a">
rule {VP option 3a - V initial, motion intransitive}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption3b">
rule {VP option 3b - V final, motion intransitive}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption3c">
rule {VP option 3c - VSO order, motion intransitive}
VP = V DP {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = PP
	}
</xsl:template>
	<xsl:template name="VPOption3ci">
rule {VP option 3ci - VSO order, motion intransitive, imperative}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type motion&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption3cp">
rule {VP option 3cp - VSO order, motion intransitive, pro-drop}
VP = V (DP) {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = PP
	}
</xsl:template>
	<xsl:template name="VPOption3d">
rule {VP option 3d - OSV order, motion intransitive}
VP = {PP / AdvP} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = PP
	}
</xsl:template>
	<xsl:template name="VPOption3di">
rule {VP option 3di - OSV order, motion intransitive, imperative}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type motion&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption3dp">
rule {VP option 3dp - OSV order, motion intransitive, pro-drop}
VP = {PP / AdvP} (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = PP
	}
</xsl:template>
	<xsl:template name="VPOption3e">
rule {VP option 3e - VSO order, motion intransitive, subject questioned}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
</xsl:template>
	<xsl:template name="VPOption3f">
rule {VP option 3f - OSV order, motion intransitive, subject questioned}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
</xsl:template>
	<xsl:template name="VPOption4a">
rule {VP option 4a - V initial, copular, not passive}
VP = V {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption4b">
rule {VP option 4b - V final, copular, not passive}
VP = {PP / AdjP / DP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption4c">
rule {VP option 4c - copular sentence, no verb, not passive, no aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;PP head type sentential&gt; = -
	&lt;VP head type copular&gt; = +
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption4d">
rule {VP option 4d - copular sentence, no verb, not passive, aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;PP head type sentential&gt; = -
	&lt;VP head type copular&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption4e">
rule {VP option 4e - VSO order, copular}
VP = V DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4ei">
rule {VP option 4ei - VSO order, copular, imperative}
VP = V {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption4ep">
rule {VP option 4ep - VSO order, copular, pro-drop}
VP = V (DP) {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4f">
rule {VP option 4f - VSO order, copular sentence, no verb, no Aux required}
VP = DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4fa">
rule {VP option 4f - VSO order, copular sentence, no verb, Aux required}
VP = DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4fi">
rule {VP option 4fi - VSO order, copular sentence, no verb, imperative, no Aux required}
VP = {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;VP head type copular&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption4fai">
rule {VP option 4fai - VSO order, copular sentence, no verb, imperative, Aux required}
VP = {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;VP head type copular&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption4fp">
rule {VP option 4fp - VSO order, copular sentence, no verb, pro-drop, no Aux required}
VP = (DP) {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4fap">
rule {VP option 4fap - VSO order, copular sentence, no verb, pro-drop, Aux required}
VP = (DP) {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4g">
rule {VP option 4g - OSV order, copular}
VP = {PP / AdjP / DP_1} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4gi">
rule {VP option 4gi - OSV order, copular, imperative}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption4gp">
rule {VP option 4gp - OSV order, copular, pro-drop}
VP = {PP / AdjP / DP_1} (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4h">
rule {VP option 4h - OSV order, copular sentence, no verb, no Aux required}
VP = {PP / AdjP / DP_1} DP
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4ha">
rule {VP option 4ha - OSV order, copular sentence, no verb, Aux required}
VP = {PP / AdjP / DP_1} DP
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4hi">
rule {VP option 4hi - OSV order, copular sentence, no verb, imperative, no Aux required}
VP = {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;VP head type copular&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption4hai">
rule {VP option 4hai - OSV order, copular sentence, no verb, imperative, Aux required}
VP = {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;VP head type copular&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption4hp">
rule {VP option 4hp - OSV order, copular sentence, no verb, pro-drop, no Aux required}
VP = {PP / AdjP / DP_1} (DP)
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4hap">
rule {VP option 4hap - OSV order, copular sentence, no verb, pro-drop, Aux required}
VP = {PP / AdjP / DP_1} (DP)
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type passive&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption4i">
rule {VP option 4i - VSO order, copular, subject questioned}
VP = V {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
</xsl:template>
	<xsl:template name="VPOption4j">
rule {VP option 4j - VSO/OSV order, copular sentence, no verb, subj/AdvP questioned}
VP = {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head type question&gt; = +
	{&lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head fronted cat&gt; = DP }
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
</xsl:template>
	<xsl:template name="VPOption4ja">
rule {VP option 4ja - VSO/OSV order, copular sentence, no verb, subj/AdvP questioned, Aux required}
VP = {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type copular&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type question&gt; = +
	{&lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head fronted cat&gt; = DP }
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
</xsl:template>
	<xsl:template name="VPOption4k">
rule {VP option 4k - OSV order, copular, subject questioned}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
</xsl:template>
	<xsl:template name="VPOption5a">
rule {VP option 5a - V initial, transitive (accusative case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5b">
rule {VP option 5b - V initial, transitive (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5c">
rule {VP option 5c - V final, transitive (accusative case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5d">
rule {VP option 5d - V final, transitive (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5e">
rule {VP option 5e - VSO order, transitive (accusative case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption5ei">
rule {VP option 5ei - VSO order, transitive (accusative case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption5ep">
rule {VP option 5ep - VSO order, transitive (accusative case object), pro-drop}
VP = V (DP) DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption5f">
rule {VP option 5f - VSO order, transitive (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption5fi">
rule {VP option 5fi - VSO order, transitive (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption5fp">
rule {VP option 5fp - VSO order, transitive (absolutive case object), pro-drop}
VP = V (DP) DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption5g">
rule {VP option 5g - OSV order, transitive (accusative case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption5gi">
rule {VP option 5gi - OSV order, transitive (accusative case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption5gp">
rule {VP option 5gp - OSV order, transitive (accusative case object), pro-drop}
VP = DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption5h">
rule {VP option 5h - OSV order, transitive (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption5hi">
rule {VP option 5hi - OSV order, transitive (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption5hp">
rule {VP option 5hp - OSV order, transitive (absolutive case object), pro-drop}
VP = DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption5i">
rule {VP option 5i - V initial/final, object questioned (accusative object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5j">
rule {VP option 5j - V initial/final, object questioned (absolutive object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5k">
rule {VP option 5k - VSO order, transitive, object questioned (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5kp">
rule {VP option 5kp - VSO order, transitive, object questioned (accusative), pro-drop}
VP = V (DP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5l">
rule {VP option 5l - VSO order, transitive, object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5lp">
rule {VP option 5lp - VSO order, transitive, object questioned (absolutive), pro-drop}
VP = V (DP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5m">
rule {VP option 5m - OSV order, transitive, object questioned (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5mp">
rule {VP option 5mp - OSV order, transitive, object questioned (accusative), pro-drop}
VP = (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5n">
rule {VP option 5n - OSV order, transitive, object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5np">
rule {VP option 5np - OSV order, transitive, object questioned (absolutive), pro-drop}
VP = (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5o">
rule {VP option 5o - VSO order, transitive, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;VP head fronted head agr case nominative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5p">
rule {VP option 5p - VSO order, transitive, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;VP head fronted head agr case ergative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5q">
rule {VP option 5q - OSV order, transitive, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;VP head fronted head agr case nominative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption5r">
rule {VP option 5r - OSV order, transitive, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;VP head fronted head agr case ergative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6a">
rule {VP option 6a - V initial, ditransitive with PP (accusative object)}
VP = V DP PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6b">
rule {VP option 6b - V initial, ditransitive with PP (absolutive object)}
VP = V DP PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6c">
rule {VP option 6c - V final, ditransitive with PP (accusative object)}
VP = (PP_1) PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6d">
rule {VP option 6d - V final, ditransitive with PP (absolutive object)}
VP = (PP_1) PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6e">
rule {VP option 6e - VSO order, ditransitive with PP (accusative object)}
VP = V DP DP_1 PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption6ei">
rule {VP option 6ei - VSO order, ditransitive with PP (accusative case object), imperative}
VP = V DP_1 PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption6ep">
rule {VP option 6ep - VSO order, ditransitive with PP (accusative object), pro-drop}
VP = V (DP) DP_1 PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption6f">
rule {VP option 6f - VSO order, ditransitive with PP (absolutive object)}
VP = V DP DP_1 PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption6fi">
rule {VP option 6fi - VSO order, ditransitive with PP (absolutive case object), imperative}
VP = V DP_1 PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption6fp">
rule {VP option 6fp - VSO order, ditransitive with PP (absolutive object), pro-drop}
VP = V (DP) DP_1 PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption6g">
rule {VP option 6g - OSV order, ditransitive with PP (accusative object)}
VP = (PP_1) PP DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption6gi">
rule {VP option 6gi - OSV order, ditransitive with PP (accusative case object), imperative}
VP = (PP_1) PP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption6gp">
rule {VP option 6gp - OSV order, ditransitive with PP (accusative object), pro-drop}
VP = (PP_1) PP DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption6h">
rule {VP option 6h - OSV order, ditransitive with PP (absolutive object)}
VP = (PP_1) PP DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption6hi">
rule {VP option 6hi - OSV order, ditransitive with PP (absolutive case object), imperative}
VP = (PP_1) PP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption6hp">
rule {VP option 6hp - OSV order, ditransitive with PP (absolutive object), pro-drop}
VP = (PP_1) PP DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption6i">
rule {VP option 6i - V initial, ditransitive with PP, accusative object questioned}
VP = V PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6j">
rule {VP option 6j - V initial, ditransitive with PP, absolutive object questioned}
VP = V PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6k">
rule {VP option 6k - V final, ditransitive with PP, accusative object questioned}
VP = (PP_1) PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6l">
rule {VP option 6l - V final, ditransitive with PP, absolutive object questioned}
VP = (PP_1) PP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6m">
rule {VP option 6m - VSO order, ditransitive with PP (accusative object questioned)}
VP = V DP PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6mp">
rule {VP option 6mp - VSO order, ditransitive with PP (accusative object questioned), pro-drop}
VP = V (DP) PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6n">
rule {VP option 6n - VSO order, ditransitive with PP (absolutive object questioned)}
VP = V DP PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;DP head agr case ergative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6np">
rule {VP option 6np - VSO order, ditransitive with PP (absolutive object questioned), pro-drop}
VP = V (DP) PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;DP head agr case ergative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6o">
rule {VP option 6o - OSV order, ditransitive with PP (accusative object questioned)}
VP = (PP_1) PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6op">
rule {VP option 6op - OSV order, ditransitive with PP (accusative object questioned), pro-drop}
VP = (PP_1) PP (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;DP head agr case nominative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6p">
rule {VP option 6p - OSV order, ditransitive with PP (absolutive object questioned)}
VP = (PP_1) PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;DP head agr case ergative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6pp">
rule {VP option 6pp - OSV order, ditransitive with PP (absolutive object questioned), pro-drop}
VP = (PP_1) PP (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;DP head agr case ergative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6q">
rule {VP option 6q - VSO order, ditransitive with PP (acc object), subj questioned}
VP = V DP PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case nominative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6r">
rule {VP option 6r - VSO order, ditransitive with PP (abs object), subj questioned}
VP = V DP PP (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case ergative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6s">
rule {VP option 6s - OSV order, ditransitive with PP (acc object), subj questioned}
VP = (PP_1) PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case nominative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6t">
rule {VP option 6t - OSV order, ditransitive with PP (abs object), subj questioned}
VP = (PP_1) PP DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head fronted head agr case ergative&gt; = +
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption6u">
rule {VP option 6u - VSO order, ditransitive with PP questioned (acc object)}
VP = V DP DP_1 (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head fronted cat&gt; = PP
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6up">
rule {VP option 6up - VSO order, ditransitive with PP questioned (acc object), pro-drop}
VP = V (DP) DP_1 (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head fronted cat&gt; = PP
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6v">
rule {VP option 6v - VSO order, ditransitive with PP questioned (abs object)}
VP = V DP DP_1 (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;VP head fronted cat&gt; = PP
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6vp">
rule {VP option 6vp - VSO order, ditransitive with PP questioned (abs object), pro-drop}
VP = V (DP) DP_1 (PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;VP head fronted cat&gt; = PP
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6w">
rule {VP option 6w - OSV order, ditransitive with PP questioned (acc object)}
VP = (PP_1) DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head fronted cat&gt; = PP
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6wp">
rule {VP option 6wp - OSV order, ditransitive with PP questioned (acc object), pro-drop}
VP = (PP_1) DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head fronted cat&gt; = PP
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6x">
rule {VP option 6x - OSV order, ditransitive with PP questioned (abs object)}
VP = (PP_1) DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;VP head fronted cat&gt; = PP
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption6xp">
rule {VP option 6xp - OSV order, ditransitive with PP questioned (abs object), pro-drop}
VP = (PP_1) DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;VP head fronted cat&gt; = PP
	&lt;VP head type question&gt; = +
</xsl:template>
	<xsl:template name="VPOption7a">
rule {VP option 7a - V initial, ditransitive with DP (accusative object)}
VP = V DP_1 DP_2 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7b">
rule {VP option 7b - V initial, ditransitive with DP (absolutive object)}
VP = V DP_1 DP_2 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7c">
rule {VP option 7c - V final, ditransitive with DP (accusative object)}
VP = (DP_3 / PP_1) DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7d">
rule {VP option 7d - V final, ditransitive with DP (absolutive object)}
VP = (DP_3 / PP_1) DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;VP head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7e">
rule {VP option 7e - VSO order, ditransitive with DP (accusative object)}
VP = V DP DP_1 DP_2 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption7ei">
rule {VP option 7ei - VSO order, ditransitive with DP (accusative case object), imperative}
VP = V DP_1 DP_2 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption7ep">
rule {VP option 7ep - VSO order, ditransitive with DP (accusative object), pro-drop}
VP = V (DP) DP_1 DP_2 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption7f">
rule {VP option 7f - VSO order, ditransitive with DP (absolutive object)}
VP = V DP DP_1 DP_2 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption7fi">
rule {VP option 7fi - VSO order, ditransitive with DP (absolutive case object), imperative}
VP = V DP_1 DP_2 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption7fp">
rule {VP option 7fp - VSO order, ditransitive with DP (absolutive object), pro-drop}
VP = V (DP) DP_1 DP_2 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption7g">
rule {VP option 7g - OSV order, ditransitive with DP (accusative object)}
VP = (DP_3 / PP_1) DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption7gi">
rule {VP option 7gi - OSV order, ditransitive with DP (accusative case object), imperative}
VP = (DP_3 / PP_1) DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption7gp">
rule {VP option 7gp - OSV order, ditransitive with DP (accusative object), pro-drop}
VP = (DP_3 / PP_1) DP_2 DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption7h">
rule {VP option 7h - OSV order, ditransitive with DP (absolutive object)}
VP = (DP_3 / PP_1) DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption7hi">
rule {VP option 7hi - OSV order, ditransitive with DP (absolutive case object), imperative}
VP = (DP_3 / PP_1) DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption7hp">
rule {VP option 7hp - OSV order, ditransitive with DP (absolutive object), pro-drop}
VP = (DP_3 / PP_1) DP_2 DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption7i">
rule {VP option 7i - VSO order, ditransitive with DP (acc object), subj questioned}
VP = V DP DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;DP head agr case accusative&gt; = +
</xsl:template>
	<xsl:template name="VPOption7j">
rule {VP option 7j - VSO order, ditransitive with DP (abs object), subj questioned}
VP = V DP DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case ergative&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;DP head agr case absolutive&gt; = +
</xsl:template>
	<xsl:template name="VPOption7k">
rule {VP option 7k - OSV order, ditransitive with DP (acc object), subj questioned}
VP = (DP_3 / PP_1) DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;DP head agr case accusative&gt; = +
</xsl:template>
	<xsl:template name="VPOption7l">
rule {VP option 7l - OSV order, ditransitive with DP (abs object), subj questioned}
VP = (DP_3 / PP_1) DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case ergative&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;DP head agr case absolutive&gt; = +
</xsl:template>
	<xsl:template name="VPOption7m">
rule {VP option 7m - VSO order, ditransitive with DP (acc object questioned)}
VP = V DP DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7mp">
rule {VP option 7mp - VSO order, ditransitive with DP (acc object questioned), pro-drop}
VP = V (DP) DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7n">
rule {VP option 7n - VSO order, ditransitive with DP (abs object questioned)}
VP = V DP DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7np">
rule {VP option 7np - VSO order, ditransitive with DP (abs object questioned), pro-drop}
VP = V (DP) DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7o">
rule {VP option 7o - OSV order, ditransitive with DP (acc object questioned)}
VP = (DP_3 / PP_1) DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7op">
rule {VP option 7op - OSV order, ditransitive with DP (acc object questioned), pro-drop}
VP = (DP_3 / PP_1) DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case accusative&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7p">
rule {VP option 7p - OSV order, ditransitive with DP (abs object questioned)}
VP = (DP_3 / PP_1) DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7pp">
rule {VP option 7pp - OSV order, ditransitive with DP (abs object questioned), pro-drop}
VP = (DP_3 / PP_1) DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case absolutive&gt; = +
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -

</xsl:template>
	<xsl:template name="VPOption7q">
rule {VP option 7q - VSO order, ditransitive with DP questioned (acc object)}
VP = V DP DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7qp">
rule {VP option 7qp - VSO order, ditransitive with DP questioned (acc object), pro-drop}
VP = V (DP) DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7r">
rule {VP option 7r - VSO order, ditransitive with DP questioned (abs object)}
VP = V DP DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7rp">
rule {VP option 7rp - VSO order, ditransitive with DP questioned (abs object), pro-drop}
VP = V (DP) DP_1 (DP_3 / PP_1)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7s">
rule {VP option 7s - OSV order, ditransitive with DP questioned (acc object)}
VP = (DP_3 / PP_1) DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7sp">
rule {VP option 7sp - OSV order, ditransitive with DP questioned (acc object), pro-drop}
VP = (DP_3 / PP_1) DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;DP head agr case nominative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7t">
rule {VP option 7t - OSV order, ditransitive with DP questioned (abs object)}
VP = (DP_3 / PP_1) DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption7tp">
rule {VP option 7tp - OSV order, ditransitive with DP questioned (abs object), pro-drop}
VP = (DP_3 / PP_1) DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;PP_1 head type sentential&gt; = -
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;DP head agr case ergative&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type passive&gt; = -
</xsl:template>
	<xsl:template name="VPOption8a">
rule {VP option 8a - V initial, sentential complement}
VP = V {CP / IP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;CP head type root&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
</xsl:template>
	<xsl:template name="VPOption8b">
rule {VP option 8b - V final, sentential complement}
VP = {CP / IP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;CP head type root&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
</xsl:template>
	<xsl:template name="VPOption8c">
rule {VP option 8c - VSO with sentential complement}
VP = V DP {CP / IP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;CP head type root&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption8ci">
rule {VP option 8ci - VSO with sentential complement, imperative}
VP = V {CP / IP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;CP head type root&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption8cp">
rule {VP option 8cp - VSO with sentential complement, pro-drop}
VP = V (DP) {CP / IP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;CP head type root&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption8d">
rule {VP option 8d - OSV with sentential complement}
VP = {CP / IP} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;CP head type root&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption8di">
rule {VP option 8di - OSV with sentential complement, imperative}
VP = {CP / IP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;CP head type root&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;VP head type question&gt; = -
</xsl:template>
	<xsl:template name="VPOption8dp">
rule {VP option 8dp - OSV with sentential complement, pro-drop}
VP = {CP / IP} (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;CP head type root&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption9a">
rule {VP option 9a - V initial/final, passive, no Agent phrase, no passive aux}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
</xsl:template>
	<xsl:template name="VPOption9b">
rule {VP option 9b - V initial, passive, no Agent but PP ditrans, no passive aux}
VP = V (PP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
</xsl:template>
	<xsl:template name="VPOption9c">
rule {VP option 9c - V final, passive, no Agent but PP ditrans, no passive aux}
VP = (PP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
</xsl:template>
	<xsl:template name="VPOption9d">
rule {VP option 9d - V initial/final, passive, no Agent phrase, passive aux}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;VP head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VPOption9e">
rule {VP option 9e - V initial, passive, no Agent but PP ditrans, passive aux}
VP = V (PP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VPOption9f">
rule {VP option 9f - V final, passive, no Agent but PP ditrans, passive aux}
VP = (PP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VPOption9g">
rule {VP option 9g - V initial, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V (PP_1) PP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head subject&gt; = &lt;PP head object&gt;
</xsl:template>
	<xsl:template name="VPOption9h">
rule {VP option 9h - V final, passive, with PP Agent, PP ditrans, no passive Aux}
VP =  (PP_1) PP (PP_2) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head subject&gt; = &lt;PP head object&gt;
</xsl:template>
	<xsl:template name="VPOption9i">
rule {VP option 9i - V initial, passive, with PP Agent, PP ditrans, passive Aux}
VP = V (PP_1) PP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VPOption9j">
rule {VP option 9j - V final, passive, with PP Agent, PP ditrans, passive Aux}
VP =  (PP_1) PP (PP_2) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VPOption9k">
rule {VP option 9k - V initial, passive, with DP Agent phrase, no passive Aux}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
</xsl:template>
	<xsl:template name="VPOption9l">
rule {VP option 9l - V final, passive, with DP Agent phrase, no passive Aux}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
</xsl:template>
	<xsl:template name="VPOption9m">
rule {VP option 9m - V initial, passive, with DP Agent phrase, passive Aux}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VPOption9n">
rule {VP option 9n - V final, passive, with DP Agent phrase, passive Aux}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VPOption10a">
rule {VP option 10a - VSO order, passive, no Agent phrase, no passive Aux}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10ap">
rule {VP option 10ap - VSO order, passive, no Agent phrase, no passive Aux, pro-drop}
VP = V (DP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10b">
rule {VP option 10b - OSV order, passive, no Agent phrase, no passive Aux}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10bp">
rule {VP option 10bp - OSV order, passive, no Agent phrase, no passive Aux, pro-drop}
VP = (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10c">
rule {VP option 10c - VSO order, passive, no Agent but PP ditrans, no passive Aux}
VP = V DP (PP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10cp">
rule {VP option 10cp - VSO order, passive, no Agent but PP ditrans, no passive Aux, pro-drop}
VP = V (DP) (PP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10d">
rule {VP option 10d - OSV order, passive, no Agent but PP ditrans, no passive Aux}
VP = (PP) DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10dp">
rule {VP option 10dp - OSV order, passive, no Agent but PP ditrans, no passive Aux, pro-drop}
VP = (PP) (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10e">
rule {VP option 10e - VSO order, passive, no Agent phrase, passive Aux}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10ep">
rule {VP option 10ep - VSO order, passive, no Agent phrase, passive Aux, pro-drop}
VP = V (DP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10f">
rule {VP option 10f - OSV order, passive, no Agent phrase, passive Aux}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10fp">
rule {VP option 10fp - OSV order, passive, no Agent phrase, passive Aux, pro-drop}
VP = (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10g">
rule {VP option 10g - VSO order, passive, no Agent but PP ditrans, passive Aux}
VP = V DP (PP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10gp">
rule {VP option 10gp - VSO order, passive, no Agent but PP ditrans, passive Aux, pro-drop}
VP = V (DP) (PP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10h">
rule {VP option 10h - OSV order, passive, no Agent but PP ditrans, passive Aux}
VP = (PP) DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10hp">
rule {VP option 10hp - OSV order, passive, no Agent but PP ditrans, passive Aux, pro-drop}
VP = (PP) (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10i">
rule {VP option 10i - VSO order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = V DP (PP_1) PP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10ip">
rule {VP option 10ip - VSO order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = V (DP) (PP_1) PP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10j">
rule {VP option 10j - OSV order, passive, with PP Agent, PP ditrans, no passive Aux}
VP = (PP_1) PP (PP_2) DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10jp">
rule {VP option 10jp - OSV order, passive, with PP Agent, PP ditrans, no passive Aux, pro-drop}
VP = (PP_1) PP (PP_2) (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10k">
rule {VP option 10k - VSO order, passive, with PP Agent, PP ditrans, passive Aux}
VP = V DP (PP_1) PP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10kp">
rule {VP option 10kp - VSO order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = V (DP) (PP_1) PP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10l">
rule {VP option 10l - OSV order, passive, with PP Agent, PP ditrans, passive Aux}
VP = (PP_1) PP (PP_2) DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10lp">
rule {VP option 10lp - OSV order, passive, with PP Agent, PP ditrans, passive Aux, pro-drop}
VP = (PP_1) PP (PP_2) (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10m">
rule {VP option 10m - VSO order, passive, with DP Agent phrase, no passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10mp">
rule {VP option 10mp - VSO order, passive, with DP Agent phrase, no passive Aux, pro-drop}
VP = V (DP) DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10n">
rule {VP option 10n - OSV order, passive, with DP Agent phrase, no passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10np">
rule {VP option 10np - OSV order, passive, with DP Agent phrase, no passive Aux, pro-drop}
VP = DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10o">
rule {VP option 10o - VSO order, passive, with DP Agent phrase, passive Aux}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10op">
rule {VP option 10op - VSO order, passive, with DP Agent phrase, passive Aux, pro-drop}
VP = V (DP) DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10p">
rule {VP option 10p - OSV order, passive, with DP Agent phrase, passive Aux}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10pp">
rule {VP option 10pp - OSV order, passive, with DP Agent phrase, passive Aux, pro-drop}
VP = DP_1 (DP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type auxiliary&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption10q">
rule {VP option 10q - VSO order, passive, no Agent, no passive Aux, subj questioned}
VP = V (PP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10r">
rule {VP option 10r - OSV order, passive, no Agent, no passive Aux, subj questioned}
VP = (PP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10s">
rule {VP option 10s - VSO order, passive, no Agent, passive Aux, subj questioned}
VP = V (PP)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10t">
rule {VP option 10t - OSV order, passive, no Agent, passive Aux, subj questioned}
VP = (PP) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10u">
rule {VP option 10u - VSO order, passive, PP Agent, no passive Aux, subj questioned}
VP = V (PP_1) PP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10v">
rule {VP option 10v - OSV order, passive, PP Agent, no passive Aux, subj questioned}
VP = (PP_1) PP (PP_2) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10w">
rule {VP option 10w - VSO order, passive, PP Agent, passive Aux, subj questioned}
VP = V (PP_1) PP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10x">
rule {VP option 10x - OSV order, passive, PP Agent, passive Aux, subj questioned}
VP = (PP_1) PP (PP_2) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10y">
rule {VP option 10y - VSO order, passive, DP Agent, no passive Aux, subj questioned}
VP = V (PP_1) DP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10z">
rule {VP option 10z - OSV order, passive, DP Agent, no passive Aux, subj questioned}
VP = (PP_1) DP (PP_2) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10ya">
rule {VP option 10ya - VSO order, passive, DP Agent, passive Aux, subj questioned}
VP = V (PP_1) DP (PP_2)
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption10za">
rule {VP option 10za - OSV order, passive, DP Agent, passive Aux, subj questioned}
VP = (PP_1) DP (PP_2) V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP_1 head type passive&gt; = -
	&lt;PP_2 head type passive&gt; = -
	&lt;PP_1 head type sentential&gt; = -
	&lt;PP_2 head type sentential&gt; = -
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head subject&gt; = &lt;DP head object&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head agr case nominative&gt; = +
</xsl:template>
	<xsl:template name="VPOption11a">
rule {VP option 11a - Aux Subject V for VSO languages, not passive}
VP = DP V'
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption11b">
rule {VP option 11b - Aux Subject V for VSO languages, passive}
VP = DP V'
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VPOption11c">
rule {VP option 11c - V Subject Aux for OSV languages, not passive}
VP = V' DP
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:[plural:+]]]]]
</xsl:template>
	<xsl:template name="VPOption11d">
rule {VP option 11d - V Subject Aux for OSV languages, passive}
VP = V' DP
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head object&gt; = &lt;DP&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = +
	{&lt;VP head type question&gt; = -
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted cat&gt; = AdvP
	/&lt;VP head type question&gt; = +
	 &lt;VP head fronted&gt; = none
	}
</xsl:template>
	<xsl:template name="VBarOption1">
rule {V' option 1 - V initial/final, intransitive}
V' = V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption2a">
rule {V' option 2a - V initial, motion intransitive}
V' = V {PP / AdvP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption2b">
rule {V' option 2b - V final, motion intransitive}
V' = {PP / AdvP} V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption3a">
rule {V' option 3a - V initial, copular}
V' = V {PP / AdjP / DP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
</xsl:template>
	<xsl:template name="VBarOption3b">
rule {V' option 3b - V final, copular}
V' = {PP / AdjP / DP} V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type copular&gt; = +
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
</xsl:template>
	<xsl:template name="VBarOption3c">
rule {V' option 3c - copular sentence, no verb}
V' = {PP / AdjP / DP}
	&lt;V' head&gt; = &lt;PP head&gt;
	&lt;V' head&gt; = &lt;AdjP head&gt;
	&lt;V' head&gt; = &lt;DP head&gt;
	&lt;V' head type copular&gt; = +
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
</xsl:template>
	<xsl:template name="VBarOption4a">
rule {V' option 4a - V initial, transitive (accusative case oject)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption4b">
rule {V' option 4b - V initial, transitive (absolutive case oject)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption4c">
rule {V' option 4c - V final, transitive (accusative case oject)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption4d">
rule {V' option 4d - V final, transitive (absolutive case oject)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;DP head agr case absolutive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption5a">
rule {V' option 5a - V initial, ditransitive with PP (accusative object)}
V' = V DP PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption5b">
rule {V' option 5b - V initial, ditransitive with PP (absolutive object)}
V' = V DP PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption5c">
rule {V' option 5c - V final, ditransitive with PP (accusative object)}
V' = PP DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption5d">
rule {V' option 5d - V final, ditransitive with PP (absolutive object)}
V' = PP DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP head agr case accusative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption6a">
rule {V' option 6a - V initial, ditransitive with DP (accusative object)}
V' = V DP_1 DP_2
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption6b">
rule {V' option 6b - V initial, ditransitive with DP (absolutive object)}
V' = V DP_1 DP_2
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption6c">
rule {V' option 6c - V final, ditransitive with DP (accusative object)}
V' = DP_1 DP_2 V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP_1 head agr case accusative&gt; = +
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption6d">
rule {V' option 6d - V final, ditransitive with DP (absolutive object)}
V' = DP_1 DP_2 V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;DP_1 head agr case absolutive&gt; = +
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption7a">
rule {V' option 7a - V initial/final, passive, no Agent phrase}
V' = V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption7b">
rule {V' option 7b - V initial, passive, with PP Agent phrase}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption7c">
rule {V' option 7c - V initial, passive, with DP Agent phrase}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption7d">
rule {V' option 7d - V final, passive, with PP Agent phrase}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<xsl:template name="VBarOption7e">
rule {V' option 7e - V final, passive, with DP Agent phrase}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V' head type auxiliary&gt; = +
</xsl:template>
	<!-- ************  QP  ************-->
	<xsl:template match="//qp">
|-***********************************************************
<xsl:call-template name="QPOptions"/>
		<xsl:call-template name="QPNumbers"/>
	</xsl:template>
	<xsl:template name="QPOptions">
		<xsl:if test="./@degree='no'">
rule {QP option 1 - no modifiers}
QP = Q
	&lt;QP head&gt; = &lt;Q head&gt;
</xsl:if>
		<xsl:if test="./@degree='yes'">
			<xsl:if test="./@degreePos='before' or ./@degreePos='unknown' and $Spec='initial' or $Spec='internal'">
rule {QP option 2 - modifiers initial}
QP = (Deg) Q
	&lt;QP head&gt; = &lt;Q head&gt;
	&lt;Deg head type modifies_Q&gt; = +
</xsl:if>
			<xsl:if test="./@degreePos='after' or ./@degreePos='unknown' and $Spec='final'">
rule {QP option 3 - modifiers final}
QP = Q (Deg)
	&lt;QP head&gt; = &lt;Q head&gt;
	&lt;Deg head type modifies_Q&gt; = +
</xsl:if>
			<xsl:if test="./@degreePos='either'">
rule {QP option 4 - modifiers both sides}
QP = (Deg_1) Q (Deg_2)
	&lt;QP head&gt; = &lt;Q head&gt;
	&lt;Deg_1 head type modifies_Q&gt; = +
	&lt;Deg_2 head type modifies_Q&gt; = +
	&lt;Deg_1 head type QP-initial&gt; = +
	&lt;Deg_2 head type QP-final&gt;   = +
</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="QPNumbers">
		<xsl:if test="./@ordinalPos='before'">
rule {QP as Numbers option 1 - modifiers initial}
QP = (Adj) Num (Num_1 (Num_2 (Num_3 (Num_4 (Num_5)))))
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Adj head type ordinal&gt; = +
</xsl:if>
		<xsl:if test="./@ordinalPos='after'">
rule {QP as Numbers option 2 - modifiers final}
QP = Num (Num_1 (Num_2 (Num_3 (Num_4 (Num_5))))) (Adj)
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Adj head type ordinal&gt; = +
</xsl:if>
		<xsl:if test="./@ordinalPos='either'">
rule {QP as Numbers option 3 - modifiers either side}
QP = (Adj_1) Num (Num_1 (Num_2 (Num_3 (Num_4 (Num_5))))) (Adj_2)
	&lt;QP head&gt; = &lt;Num head&gt;
	&lt;Adj_1 head type ordinal&gt; = +
	&lt;Adj_2 head type ordinal&gt; = +
</xsl:if>
	</xsl:template>
	<!-- following not needed -->
	<xsl:template match="//language"/>
	<xsl:template match="//example"/>
	<xsl:template match="//cardinalExample"/>
	<xsl:template match="//cardinalCompoundExample"/>
	<xsl:template match="//degreeExample"/>
	<xsl:template match="//ordinalExample"/>
	<xsl:template match="//locativeExample"/>
	<xsl:template match="//mannerExample"/>
	<xsl:template match="//reasonExample"/>
	<xsl:template match="//temporalExample"/>
	<xsl:template match="//embeddedExample"/>
	<xsl:template match="//ppExample"/>
	<xsl:template match="//relClExample"/>
	<xsl:template match="//qpExample"/>
	<xsl:template match="//adjpExample"/>
	<xsl:template match="//compExample"/>
	<xsl:template match="//compPPExample"/>
	<xsl:template match="//reflExample"/>
	<xsl:template match="//recipExample"/>
	<xsl:template match="//possExample"/>
	<xsl:template match="//indefNPExample"/>
	<xsl:template match="//indefExample"/>
	<xsl:template match="//standAloneNPExample"/>
	<xsl:template match="//partitiveExample"/>
	<xsl:template match="//pronRelClExample"/>
	<!-- Beginning of file material -->
	<xsl:template name="beginning">|-PC-PATR Grammar file for PAWS Starter Kit - starter3.doc
|- C Black    May 2001

|---------------------------------------------------------------------
|-Phrase structure rules

rule {start symbol}
<xsl:if test="//ip/@checkedOff='yes'">
S = IP / CP
	&lt;S head&gt; = &lt;IP head&gt;
	&lt;S head&gt; = &lt;CP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = -
	&lt;CP head type root&gt; = +
</xsl:if>
		<xsl:if test="//ip/@checkedOff='no'">
S = AdvP / AdjP / QP / DP / PP / VP
</xsl:if>
	</xsl:template>
	<!-- full set of feature templates -->
	<xsl:template name="featureTemplates">
|-Feature templates

Let absolutive		be	&lt;head agr case absolutive&gt;	= +
				&lt;head agr case ergative&gt;	= -
				&lt;head agr case genitive&gt;	= -
Let -absolutive		be	&lt;head agr case absolutive&gt;	= -
				&lt;head agr case ergative&gt;	= +
				&lt;head agr case genitive&gt;	= +
Let accusative		be	&lt;head agr case accusative&gt;	= +
				&lt;head agr case nominative&gt;	= -
				&lt;head agr case genitive&gt;	= -
Let -accusative		be	&lt;head agr case accusative&gt;	= -
				&lt;head agr case nominative&gt;	= +
				&lt;head agr case genitive&gt;	= +
Let AdjP-final		be	&lt;head type AdjP-final&gt;		= +
				&lt;head type AdjP-initial&gt;	= -
Let AdjP-initial	be	&lt;head type AdjP-initial&gt;	= +
				&lt;head type AdjP-final&gt;		= -
Let AdvP-final		be	&lt;head type AdvP-final&gt;		= +
				&lt;head type AdvP-initial&gt;	= -
Let AdvP-initial	be	&lt;head type AdvP-initial&gt;	= +
				&lt;head type AdvP-final&gt;		= -
Let animate		be	&lt;head agr animate&gt;		= +
Let animate_object	be	&lt;head object head agr animate&gt; 	= +
Let animate_subject	be	&lt;head subject head agr animate&gt;	= +
Let -animate		be	&lt;head agr animate&gt;		= -
Let -animate_object	be	&lt;head object head agr animate&gt; 	= -
Let -animate_subject	be	&lt;head subject head agr animate&gt;	= -
Let class_##		be	&lt;head agr class&gt;		= ##
	|- generate the above entry for ## = 1-99 as needed
Let class_##_object	be	&lt;head object agr class&gt;		= ##
	|- generate the above entry for ## = 1-99 as needed
Let class_##_subject	be	&lt;head subject agr class&gt;	= ##
	|- generate the above entry for ## = 1-99 as needed
Let completive		be	&lt;head infl aspect completive&gt;	= +
Let continuative	be	&lt;head infl aspect continuative&gt;	= +
Let copular		be	&lt;head type copular&gt;		= +
				&lt;head type transitive&gt;		= -
Let CP-final		be	&lt;head type CP-final&gt;		= +
Let CP-initial		be	&lt;head type CP-initial&gt;		= +
Let CP-specifier-initial be	&lt;head type CP-specifier-initial&gt; = +
Let declarative		be	&lt;head infl mood declarative&gt;	= +
Let ditransitive	be	&lt;head type ditransitive&gt;	= +
								&lt;head type transitive&gt;          = +
Let DP-final		be	&lt;head type DP-final&gt;		= +
				&lt;head type DP-initial&gt;		= -
Let DP-initial		be	&lt;head type DP-initial&gt;		= +
				&lt;head type DP-final&gt;		= -
Let dual		be	&lt;head agr number dual&gt;		= +
				&lt;head agr number singular&gt;	= -
				&lt;head agr number plural&gt;	= -
Let dual_object		be	&lt;head object head agr number dual&gt; = +
Let dual_subject	be	&lt;head subject head agr number dual&gt; = +
Let ergative		be	&lt;head agr case ergative&gt;	= +
				&lt;head agr case absolutive&gt;	= -
				&lt;head agr case genitive&gt;	= -
Let -ergative		be	&lt;head agr case ergative&gt;	= -
				&lt;head agr case absolutive&gt;	= +
				&lt;head agr case genitive&gt;	= +
Let exclusive		be	&lt;head agr person second&gt;	= -
Let feminine		be	&lt;head agr gender feminine&gt; 	= +
Let feminine_object	be	&lt;head object head agr gender feminine&gt; = +
Let feminine_subject	be	&lt;head subject head agr gender feminine&gt; = +
Let first		be	&lt;head agr person first&gt;		= +
				&lt;head agr person second&gt;	= !-
				&lt;head agr person third&gt;		= -
Let first_exclusive_subject be  &lt;head subject head agr person first&gt; = +
				&lt;head subject head agr person second&gt; = -
Let first_exclusive_object  be  &lt;head object head agr person first&gt; = +
				&lt;head object head agr person second&gt; = -
Let first_inclusive_subject be  &lt;head subject head agr person first&gt; = +
				&lt;head subject head agr person second&gt; = +
Let first_inclusive_object be   &lt;head object head agr person first&gt; = +
				&lt;head object head agr person second&gt; = +
Let first_object	be	&lt;head object head agr person first&gt;  = +
Let first_subject	be	&lt;head subject head agr person first&gt; = +
Let future		be	&lt;head infl tense future&gt;	= +
Let genitive		be	&lt;head agr case genitive&gt;	= +
Let -genitive		be	&lt;head agr case genitive&gt;	= -
Let habitual		be	&lt;head infl aspect habitual&gt;	= +
Let imperative		be	&lt;head infl mood imperative&gt;	= +
Let imperfective	be	&lt;head infl aspect perfective&gt;	= -
Let inclusive		be	&lt;head agr person second&gt;	= +
Let incompletive	be	&lt;head infl aspect completive&gt; 	= -
Let interrogative	be	&lt;head infl mood interrogative&gt;	= +
Let intransitive	be	&lt;head type transitive&gt;		= -
Let irrealis		be	&lt;head infl mood realis&gt;		= -
Let locative		be	&lt;head type locative&gt;		= +
Let manner		be	&lt;head type manner&gt;		= +
Let masculine		be	&lt;head agr gender masculine&gt;	= +
Let masculine_object	be	&lt;head object head agr gender masculine&gt; = +
Let masculine_subject	be	&lt;head subject head agr gender masculine&gt; = +
Let modifies_Adj	be	&lt;head type modifies_Adj&gt;	= +
Let modifies_Adv	be	&lt;head type modifies_Adv temporal&gt; = +
				&lt;head type modifies_Adv locative&gt; = +
				&lt;head type modifies_Adv manner&gt; = +
				&lt;head type modifies_Adv reason&gt; = +
Let modifies_Adv-reason be	&lt;head type modifies_Adv reason&gt;	= -
				&lt;head type modifies_Adv locative&gt; = +
				&lt;head type modifies_Adv manner&gt; = +
				&lt;head type modifies_Adv temporal&gt; = +
Let modifies_locative	be	&lt;head type modifies_Adv locative&gt; = +
Let modifies_manner	be	&lt;head type modifies_Adv manner&gt;	= +
Let modifies_NP		be	&lt;head type modifies_NP&gt;		= +
Let modifies_PP		be	&lt;head type modifies_PP&gt;		= +
Let modifies_Q 		be	&lt;head type modifies_Q&gt;		= +
Let modifies_reason	be	&lt;head type modifies_Adv reason&gt;	= +
Let modifies_temporal	be	&lt;head type modifies_Adv temporal&gt; = +
Let motion		be	&lt;head type motion&gt;		= +
				[intransitive]
Let negative		be	&lt;head type negative&gt;		= +
Let neuter		be	&lt;head agr gender neuter&gt;	= +
Let neuter_object	be	&lt;head object head agr gender neuter&gt; = +
Let neuter_subject	be	&lt;head subject head agr gender neuter&gt; = +
Let nominative		be	&lt;head agr case nominative&gt; 	= +
				&lt;head agr case accusative&gt;	= -
				&lt;head agr case genitive&gt;	= -
Let -nominative		be	&lt;head agr case nominative&gt; 	= -
				&lt;head agr case accusative&gt;	= +
				&lt;head agr case genitive&gt;	= +
Let partitive		be	&lt;head type partitive&gt;		= +
Let passive		be	&lt;head type passive&gt;		= +
Let past		be	&lt;head infl tense past&gt;		= +
Let perfective		be	&lt;head infl aspect perfective&gt;	= +
Let plural		be	&lt;head agr number plural&gt;	= +
				&lt;head agr number singular&gt;	= -
Let plural_object	be	&lt;head object head agr number plural&gt; = +
Let plural_subject	be	&lt;head subject head agr number plural&gt; = +
Let poss_dual		be	&lt;head possessor agr number dual&gt;     = +
				&lt;head possessor agr number singular&gt; = -
				&lt;head possessor agr number plural&gt;   = -
Let poss_exclusive	be	&lt;head possessor agr person first&gt;  = +
				&lt;head possessor agr person second&gt; = -
				&lt;head possessor agr person third&gt;  = -
Let poss_feminine	be	&lt;head possessor agr gender feminine&gt; = +
Let poss_first		be	[poss_exclusive]
Let poss_inclusive	be	&lt;head possessor agr person first&gt;  = +
				&lt;head possessor agr person second&gt; = +
				&lt;head possessor agr person third&gt;  = -
Let poss_masculine	be	&lt;head possessor agr gender masculine&gt; = +
Let poss_plural		be	&lt;head possessor agr number plural&gt;   = +
				&lt;head possessor agr number singular&gt; = -
Let poss_second		be	&lt;head possessor agr person first&gt;  = -
				&lt;head possessor agr person second&gt; = +
				&lt;head possessor agr person third&gt;  = -
Let poss_singular	be	&lt;head possessor agr number plural&gt;   = -
				&lt;head possessor agr number singular&gt; = +
Let poss_third		be	&lt;head possessor agr person first&gt;  = -
				&lt;head possessor agr person second&gt; = -
				&lt;head possessor agr person third&gt;  = +
Let possessed	be	&lt;head type possessed&gt; = +
Let potential		be	&lt;head infl aspect potential&gt;	= +
Let PP-final		be	&lt;head type QP-final&gt;		= +
				&lt;head type QP-initial&gt;		= -
Let PP-initial		be	&lt;head type QP-initial&gt;		= +
				&lt;head type QP-final&gt;		= -
Let present		be	&lt;head infl tense present&gt;	= +
Let progressive		be	&lt;head infl aspect progressive&gt; 	= +
Let -question		be	&lt;head type question&gt;		= -
Let QP-final		be	&lt;head type QP-final&gt;		= +
				&lt;head type QP-initial&gt;		= -
Let QP-initial		be	&lt;head type QP-initial&gt;		= +
				&lt;head type QP-final&gt;		= -
Let quantifier		be	&lt;head type quantifier&gt;		= +
Let reason		be	&lt;head type reason&gt;		= +
Let realis		be	&lt;head infl mood realis&gt;		= +
Let reciprocal 		be	&lt;head type reciprocal&gt;		= +
Let reflexive		be	&lt;head type reflexive&gt;		= +
Let +root		be	&lt;head type root&gt;		= +
Let -root		be	&lt;head type root&gt;		= -
Let second		be	&lt;head agr person second&gt;	= +
				&lt;head agr person first&gt;		= -
				&lt;head agr person third&gt;		= -
Let second_object	be	&lt;head object head agr person second&gt; = +
Let second_subject	be	&lt;head subject head agr person second&gt; = +
Let sentential		be	&lt;head type sentential&gt;		= +
Let singular		be	&lt;head agr number singular&gt;	= +
				&lt;head agr number plural&gt;	= -
Let singular_object	be	&lt;head object head agr number singular&gt; = +
Let singular_subject	be	&lt;head subject head agr number singular&gt; = +
Let stative		be	&lt;head infl aspect stative&gt;	= +
Let temporal		be	&lt;head type temporal&gt;		= +
Let third		be	&lt;head agr person third&gt;		= +
				&lt;head agr person first&gt;		= -
				&lt;head agr person second&gt;	= -
Let third_object	be	&lt;head object head agr person third&gt; = +
Let third_subject	be	&lt;head subject head agr person third&gt; = +
Let transitive		be	&lt;head type transitive&gt;		= +
Let wh			be	&lt;head type wh&gt;			= +
Let -wh			be	&lt;head type wh&gt; 			= -






|-Category changes and defaults

Let Adj			be	&lt;cat&gt; = Adj
				&lt;head type ordinal&gt;		= !-
				&lt;head type wh&gt;			= !-

Let Adv			be	&lt;cat&gt; = Adv
				&lt;head type wh&gt;			= !-

Let Art			be	&lt;cat&gt; = Art
				&lt;head type wh&gt;			= !-

Let Aux			be	&lt;cat&gt; = Aux
				&lt;head type passive&gt;		= !-

Let C			be	&lt;cat&gt; = C
				&lt;head type question&gt;		= !+
				&lt;head type CP-specifier-initial&gt; = !-

Let Deg 		be	&lt;cat&gt; = Deg
				&lt;head type modifies_Adj&gt;	= !-
				&lt;head type modifies_Adv temporal&gt; = !-
				&lt;head type modifies_Adv locative&gt; = !-
				&lt;head type modifies_Adv manner&gt;	= !-
				&lt;head type modifies_Adv reason&gt;	= !-
				&lt;head type modifies_NP&gt;		= !-
				&lt;head type modifies_PP&gt;		= !-
				&lt;head type modifies_Q&gt;		= !-
				&lt;head type quantifier&gt;		= !-
				&lt;head type wh&gt;			= !-

Let Dem			be	&lt;cat&gt; = Dem
				&lt;head type wh&gt;			= !-

Let N			be	&lt;head agr animate&gt;		= !-
				&lt;head agr person third&gt;		= !+
				&lt;head agr person first&gt;		= !-
				&lt;head agr person second&gt;	= !-
				&lt;head agr number singular&gt;	= !+
				&lt;head agr number plural&gt;	= !-
				&lt;head type wh&gt;			= -
				&lt;head type reciprocal&gt;		= !-

Let Num			be	&lt;cat&gt; = Num
				&lt;head type ordinal&gt;		= !-
				&lt;head type wh&gt;			= !-

Let ordinal     	be	&lt;cat&gt; = Adj
				&lt;head type ordinal&gt;		= +

Let P			be	&lt;cat&gt; = P
				&lt;head type passive&gt;		= !-
				&lt;head type wh&gt;			= -
				&lt;head type partitive&gt;		= !-

Let Poss		be	&lt;cat&gt; = Poss
				[genitive]

Let Pron		be	&lt;cat&gt; = Pron
				&lt;head type wh&gt;			= !-
				&lt;head agr animate&gt;		= !+
				&lt;head agr case genitive&gt;	= !-
				&lt;head type reciprocal&gt;		= !-

Let PropN		be	&lt;cat&gt; = N
				&lt;head agr animate&gt;		= !+
				&lt;head agr person third&gt;		= !+
				&lt;head agr person first&gt;		= !-
				&lt;head agr person second&gt;	= !-
				&lt;head agr number singular&gt;	= !+
				&lt;head agr number plural&gt;	= !-
				&lt;head type wh&gt;			= -

Let Q			be	&lt;cat&gt; = Q
				&lt;head type wh&gt;			= !-

Let V			be	&lt;cat&gt; = V
				&lt;head type passive&gt; 		= !-
				&lt;head type sentential&gt;		= !-
				&lt;head type copular&gt;		= !-
				&lt;head type motion&gt;		= !-
				&lt;head type reciprocal&gt;		= !-

</xsl:template>
</xsl:stylesheet>
