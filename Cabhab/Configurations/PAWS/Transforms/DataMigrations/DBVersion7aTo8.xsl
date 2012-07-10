<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 7a to 8
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template match="@* |  node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<!--
		increment dbversion
	-->
	<xsl:template match="/paws[@dbversion='7a']">
		<paws dbversion="8">
			<xsl:apply-templates select="@*[name()!='dbversion']"/>
			<xsl:apply-templates/>
		</paws>
	</xsl:template>
	<!--
		typology: Move case attribute up from np; add many attributes and many examples for classifiers and class # agreement
	-->
	<xsl:template match="typology">
		<typology>
			<xsl:copy-of select="@*"/>
			<xsl:copy-of select="//np/@case"/>
			<xsl:attribute name="caseExperiencer">no</xsl:attribute>
			<xsl:attribute name="classifier">no</xsl:attribute>
			<xsl:attribute name="classifierNum">number</xsl:attribute>
			<xsl:attribute name="class1agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class2agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class3agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class4agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class5agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class6agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class7agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class8agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class9agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class10agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class11agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class12agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class13agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class14agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class15agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class16agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class17agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class18agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class19agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class20agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class21agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class22agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class23agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class24agr">irrelevant</xsl:attribute>
			<xsl:attribute name="class25agr">irrelevant</xsl:attribute>
			<xsl:attribute name="classifierTypeNumAgr">no</xsl:attribute>
			<example>
				<xsl:value-of select="//ip/example"/>
			</example>
			<pnExample/>
			<experiencerExample/>
			<experiencerPnExample/>
			<intExample>
				<xsl:value-of select="//ip/intransExample"/>
			</intExample>
			<pnIntExample/>
			<experiencerIntExample/>
			<experiencerPnIntExample/>
			<class1Example/>
			<class2Example/>
			<class3Example/>
			<class4Example/>
			<class5Example/>
			<class6Example/>
			<class7Example/>
			<class8Example/>
			<class9Example/>
			<class10Example/>
			<class11Example/>
			<class12Example/>
			<class13Example/>
			<class14Example/>
			<class15Example/>
			<class16Example/>
			<class17Example/>
			<class18Example/>
			<class19Example/>
			<class20Example/>
			<class21Example/>
			<class22Example/>
			<class23Example/>
			<class24Example/>
			<class25Example/>
			<classAnimalSgExample/>
			<classAnimalPlExample/>
			<classInsectSgExample/>
			<classInsectPlExample/>
			<classLiquidSgExample/>
			<classLiquidPlExample/>
			<classRoundSgExample/>
			<classRoundPlExample/>
			<classCylinderSgExample/>
			<classCylinderPlExample/>
			<classSphereSgExample/>
			<classSpherePlExample/>
			<classTreeSgExample/>
			<classTreePlExample/>
			<classWoodSgExample/>
			<classWoodPlExample/>
			<classOtherSgExample/>
			<classOtherPlExample/>
			<classAnimalExample/>
			<classInsectExample/>
			<classLiquidExample/>
			<classRoundExample/>
			<classCylinderExample/>
			<classSphereExample/>
			<classTreeExample/>
			<classWoodExample/>
			<classOtherExample/>
			<classifierAgrExample/>
			<classifierTypeExample/>
		</typology>
	</xsl:template>
	<!--
		adjp:  add attributes and examples
	-->
	<xsl:template match="adjp">
		<adjp>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="adjectiveClassifier">no</xsl:attribute>
			<xsl:attribute name="adjectiveDegreeClassifier">no</xsl:attribute>
			<xsl:copy-of select="example"/>
			<adjectiveDegreeExample/>
			<adjectiveDegreeAffixExample/>
			<adjectiveDegreeRedupExample/>
			<adjectivePhraseAffixExample/>
			<adjectivePhraseExample/>
			<xsl:copy-of select="adjectiveCategory"/>
		</adjp>
	</xsl:template>
	<!--
		advp:  add many attributes and examples
	-->
	<xsl:template match="advp">
		<advp>
			<xsl:copy-of select="@*[name()!='degree' and name()!='degreePos' and name()!='degreeEither' and name()!='degreeSet']"/>
			<xsl:attribute name="temporalDegree">
				<xsl:call-template name="advpDegreeDegreePosConversion"/>
			</xsl:attribute>
			<xsl:attribute name="locativeDegree">
				<xsl:call-template name="advpDegreeDegreePosConversion"/>
			</xsl:attribute>
			<xsl:attribute name="mannerDegree">
				<xsl:call-template name="advpDegreeDegreePosConversion"/>
			</xsl:attribute>
			<xsl:attribute name="negTemporalWordPos">unknown</xsl:attribute>
			<xsl:attribute name="locativeClassifier">no</xsl:attribute>
			<xsl:attribute name="advLocDem">no</xsl:attribute>
			<xsl:attribute name="negLocativeWordPos">unknown</xsl:attribute>
			<xsl:attribute name="mannerAffixDegree">no</xsl:attribute>
			<xsl:copy-of select="temporalExample"/>
			<temporalDegreeExample/>
			<temporalDegreeAffixExample/>
			<temporalDegreeRedupExample/>
			<temporalPhraseAffixExample/>
			<temporalPhraseExample/>
			<negTemporalAdverbWordExample/>
			<negTemporalAdverbWordsExample/>
			<negTemporalAdverbAffixExample/>
			<negTemporalAdverbExample/>
			<xsl:copy-of select="negTemporalExample"/>
			<xsl:copy-of select="negTemporalAffixExample"/>
			<negTemporalVerbExample/>
			<xsl:copy-of select="locativeExample"/>
			<locativeDegreeExample/>
			<locativeDegreeAffixExample/>
			<locativeDegreeRedupExample/>
			<locativePhraseAffixExample/>
			<locativePhraseExample/>
			<negLocativeAdverbWordExample/>
			<negLocativeAdverbWordsExample/>
			<negLocativeAdverbAffixExample/>
			<negLocativeAdverbExample/>
			<xsl:copy-of select="negLocativeExample"/>
			<xsl:copy-of select="negLocativeAffixExample"/>
			<negLocativeVerbExample/>
			<xsl:copy-of select="mannerExample"/>
			<mannerDegreeAffixExample/>
			<mannerDegreeExample/>
			<mannerAffixDegreeExample/>
			<mannerPhraseAffixExample/>
			<mannerDegreePhraseExample/>
			<mannerAffixDegreePhraseExample/>
			<mannerDegreeRedupExample/>
			<mannerAffixDegreeRedupExample/>
			<xsl:copy-of select="reasonExample"/>
			<reasonPPExample/>
			<reasonSentExample/>
			<xsl:copy-of select="adverbCategory"/>
		</advp>
	</xsl:template>
	<!--
		advpDegreeDegreePosConversion
	-->
	<xsl:template name="advpDegreeDegreePosConversion">
		<xsl:choose>
			<xsl:when test="@degree='yes'">
				<xsl:choose>
					<xsl:when test="@degreePos='after' or @degreePos='afterOrBoth'">yesAfter</xsl:when>
					<xsl:otherwise>yesBefore</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>no</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
		comp:  add some examples
	-->
	<xsl:template match="comp">
		<comp>
			<xsl:copy-of select="@*"/>
			<xsl:copy-of select="*[position() &lt; 7]"/>
			<raisingExample/>
			<causeExample/>
			<quotationExample/>
			<xsl:copy-of select="*[position() &gt; 6]"/>
		</comp>
	</xsl:template>
	<!--
		coord:  add attributes and examples
	-->
	<xsl:template match="coord">
		<coord>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="conjWord">yes</xsl:attribute>
			<xsl:attribute name="conjPos">before</xsl:attribute>
			<xsl:attribute name="noConj">no</xsl:attribute>
			<xsl:attribute name="gap">yes</xsl:attribute>
			<xsl:copy-of select="*[position() &lt; 15]"/>
			<listExample/>
			<appositiveExample/>
			<comparativeSentExample/>
			<xsl:copy-of select="*[position() &gt; 14]"/>
		</coord>
	</xsl:template>
	<!--
		ip:  add many attributes and examples
	-->
	<xsl:template match="ip">
		<ip>
			<xsl:copy-of select="@*[name()!='negAux']"/>
			<xsl:attribute name="negAux">
				<xsl:choose>
					<xsl:when test="starts-with(@negAux,'yes')">yes</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="negAuxAffix">
				<xsl:choose>
					<xsl:when test="contains(@negAux,'Affix') or @negAux='yesAll'">yes</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="negVAffix">
				<xsl:choose>
					<xsl:when test="contains(@negAux,'Verb') or @negAux='yesAll'">yes</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="same">yes</xsl:attribute>
			<xsl:attribute name="compareN">yes</xsl:attribute>
			<xsl:attribute name="as">yes</xsl:attribute>
			<xsl:attribute name="compareAdj">yes</xsl:attribute>
			<xsl:attribute name="comparative">yes</xsl:attribute>
			<xsl:attribute name="comparativeAdj">no</xsl:attribute>
			<xsl:attribute name="existVerb">no</xsl:attribute>
			<xsl:attribute name="causative">no</xsl:attribute>
			<xsl:attribute name="antipassive">no</xsl:attribute>
			<xsl:attribute name="voice">no</xsl:attribute>
			<xsl:attribute name="voiceCase">no</xsl:attribute>
			<xsl:copy-of select="*[position() = 2]"/>
			<impExample/>
			<cliticPnExample/>
			<xsl:copy-of select="*[position()&gt;2 and position()&lt;12]"/>
			<xsl:copy-of select="copularExample"/>
			<perceptionExample/>
			<sameExample/>
			<sameWordExample/>
			<sameAffixExample/>
			<compareNExample/>
			<asExample/>
			<compareAdjExample/>
			<asWordExample/>
			<comparativeExample/>
			<comparativeWordExample/>
			<comparativeAffixExample/>
			<comparativeDegExample/>
			<superlativeExample/>
			<superlativeAffixExample/>
			<superlativeDegExample/>
			<existExample/>
			<existVerbExample/>
			<existWordExample/>
			<xsl:copy-of select="motionExample"/>
			<xsl:copy-of select="diExample"/>
			<xsl:copy-of select="passiveExample"/>
			<passiveAgentPExample/>
			<passiveAuxExample/>
			<causativeExample/>
			<causativeAffixExample/>
			<antipassiveExample/>
			<antipassiveAffixExample/>
			<voiceExample/>
			<actorVoiceExample/>
			<objectVoiceExample/>
			<dativeVoiceExample/>
			<goalVoiceExample/>
			<instrumentalVoiceExample/>
			<locativeVoiceExample/>
			<xsl:copy-of select="*[position()&gt;16 and position()&lt;23]"/>
			<ipContents5 checkedOff="no"/>
			<ipContents6 checkedOff="{ipContents5/@checkedOff}"/>
			<ipContents7 checkedOff="{ipContents6/@checkedOff}"/>
			<ipContents8 checkedOff="{ipContents7/@checkedOff}"/>
			<ipContents9 checkedOff="{ipContents8/@checkedOff}"/>
			<ipContents10 checkedOff="{ipContents9/@checkedOff}"/>
			<xsl:copy-of select="*[position()&gt;27 and position()&lt;92]"/>
			<ipAgrFeatClassClassTypeAnimalSubject checked="no"/>
			<ipAgrFeatClassClassTypeInsectSubject checked="no"/>
			<ipAgrFeatClassClassTypeLiquidSubject checked="no"/>
			<ipAgrFeatClassClassTypeRoundSubject checked="no"/>
			<ipAgrFeatClassClassTypeCylinderSubject checked="no"/>
			<ipAgrFeatClassClassTypeSphericalSubject checked="no"/>
			<ipAgrFeatClassClassTypeTreeSubject checked="no"/>
			<ipAgrFeatClassClassTypeWoodSubject checked="no"/>
			<ipAgrFeatClassClassTypeOtherSubject checked="no"/>
			<ipAgrFeatClassClassTypeAnimalObject checked="no"/>
			<ipAgrFeatClassClassTypeInsectObject checked="no"/>
			<ipAgrFeatClassClassTypeLiquidObject checked="no"/>
			<ipAgrFeatClassClassTypeRoundObject checked="no"/>
			<ipAgrFeatClassClassTypeCylinderObject checked="no"/>
			<ipAgrFeatClassClassTypeSphericalObject checked="no"/>
			<ipAgrFeatClassClassTypeTreeObject checked="no"/>
			<ipAgrFeatClassClassTypeWoodObject checked="no"/>
			<ipAgrFeatClassClassTypeOtherObject checked="no"/>
			<ipAgrFeatClassClassTypeAnimalErgative checked="no"/>
			<ipAgrFeatClassClassTypeInsectErgative checked="no"/>
			<ipAgrFeatClassClassTypeLiquidErgative checked="no"/>
			<ipAgrFeatClassClassTypeRoundErgative checked="no"/>
			<ipAgrFeatClassClassTypeCylinderErgative checked="no"/>
			<ipAgrFeatClassClassTypeSphericalErgative checked="no"/>
			<ipAgrFeatClassClassTypeTreeErgative checked="no"/>
			<ipAgrFeatClassClassTypeWoodErgative checked="no"/>
			<ipAgrFeatClassClassTypeOtherErgative checked="no"/>
			<ipAgrFeatClassClassTypeAnimalAbsolutive checked="no"/>
			<ipAgrFeatClassClassTypeInsectAbsolutive checked="no"/>
			<ipAgrFeatClassClassTypeLiquidAbsolutive checked="no"/>
			<ipAgrFeatClassClassTypeRoundAbsolutive checked="no"/>
			<ipAgrFeatClassClassTypeCylinderAbsolutive checked="no"/>
			<ipAgrFeatClassClassTypeSphericalAbsolutive checked="no"/>
			<ipAgrFeatClassClassTypeTreeAbsolutive checked="no"/>
			<ipAgrFeatClassClassTypeWoodAbsolutive checked="no"/>
			<ipAgrFeatClassClassTypeOtherAbsolutive checked="no"/>
			<xsl:copy-of select="*[position()&gt;91 and position()&lt;95]"/>
			<ipInflFeatContemplative checked="no"/>
			<ipInflFeatContrafactual checked="no"/>
			<xsl:copy-of select="*[position()&gt;94 and position()&lt;100]"/>
			<ipInflFeatPerfect checked="no"/>
			<xsl:copy-of select="*[position()&gt;99 and position()&lt;104]"/>
			<ipInflFeatUnreal checked="no"/>
			<xsl:copy-of select="*[position()&gt;103 and position()&lt;109]"/>
			<ipInflFeatAntipassive checked="no"/>
			<ipInflFeatCausative checked="no"/>
			<xsl:copy-of select="ipInflFeatFinite"/>
			<xsl:copy-of select="ipInflFeatMinusFinite"/>
			<ipInflFeatGerund checked="no"/>
			<xsl:copy-of select="ipInflFeatPassive"/>
			<xsl:copy-of select="ipInflFeatParticiple"/>
			<ipInflFeatActorVoice checked="no"/>
			<ipInflFeatDativeVoice checked="no"/>
			<ipInflFeatGoalVoice checked="no"/>
			<ipInflFeatInstrumentalVoice checked="no"/>
			<ipInflFeatLocativeVoice checked="no"/>
			<ipInflFeatObjectVoice checked="no"/>
		</ip>
	</xsl:template>
	<!--
		np:  add attributes, delete two and add examples
	-->
	<xsl:template match="np">
		<np>
			<xsl:copy-of select="@*[name()!='case' and name()!='possNounAgrKeyed']"/>
			<xsl:attribute name="caseN">no</xsl:attribute>
			<xsl:attribute name="caseWord">yes</xsl:attribute>
			<xsl:attribute name="caseWordPos">unknown</xsl:attribute>
			<xsl:attribute name="caseWordEither">unrestricted</xsl:attribute>
			<xsl:attribute name="caseCliticPos">unknown</xsl:attribute>
			<xsl:attribute name="artDefOnly">no</xsl:attribute>
			<xsl:attribute name="artPl">no</xsl:attribute>
			<xsl:attribute name="demPl">no</xsl:attribute>
			<xsl:attribute name="artDemClassifier">no</xsl:attribute>
			<xsl:attribute name="compHeadMorpheme">right</xsl:attribute>
			<xsl:copy-of select="*[position()&lt;5]"/>
			<nominative/>
			<accusative/>
			<ergative/>
			<absolutive/>
			<genitive/>
			<dative/>
			<ablative/>
			<instrumental/>
			<locative/>
			<vocative/>
			<oblique/>
			<otherCase/>
			<xsl:copy-of select="articleExample"/>
			<xsl:copy-of select="demonstrativeExample"/>
			<articleSgExample/>
			<demonstrativeSgExample/>
			<articlePlExample/>
			<demonstrativePlExample/>
			<xsl:copy-of select="example"/>
			<possessorExample/>
			<xsl:copy-of select="*[position()&gt;7 and position()&lt;17]"/>
			<compPPPossessorExample/>
			<xsl:copy-of select="*[position()&gt;16]"/>
		</np>
	</xsl:template>
	<!--
		pron:  add many attributes and examples
	-->
	<xsl:template match="pron">
		<pron>
			<xsl:copy-of select="@*[name()!='pronounCat']"/>
			<xsl:attribute name="pronMod">
				<xsl:choose>
					<xsl:when test="@pronounCat='NP'">det</xsl:when>
					<xsl:when test="@pronounCat='N'">all</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="pronounClassifier">no</xsl:attribute>
			<xsl:attribute name="dependentPos">unknown</xsl:attribute>
			<xsl:attribute name="pronDepClassifier">no</xsl:attribute>
			<xsl:attribute name="demCase">no</xsl:attribute>
			<xsl:copy-of select="*[position() &lt; 13]"/>
			<personalFirstNomDativeExample/>
			<personalSecondNomDativeExample/>
			<personalThirdNomDativeExample/>
			<xsl:copy-of select="*[position()&gt;12 and position()&lt;22]"/>
			<personalFirstErgDativeExample/>
			<personalSecondErgDativeExample/>
			<personalThirdErgDativeExample/>
			<xsl:copy-of select="*[position()&gt;21 and position()&lt;31]"/>
			<personalFirstSplitDativeExample/>
			<personalSecondSplitDativeExample/>
			<personalThirdSplitDativeExample/>
			<xsl:copy-of select="*[position()&gt;30 and position()&lt;49]"/>
			<personalDependentFirstNomDativeExample/>
			<personalDependentSecondNomDativeExample/>
			<personalDependentThirdNomDativeExample/>
			<xsl:copy-of select="*[position()&gt;48 and position()&lt;58]"/>
			<personalDependentFirstErgDativeExample/>
			<personalDependentSecondErgDativeExample/>
			<personalDependentThirdErgDativeExample/>
			<xsl:copy-of select="*[position()&gt;57 and position()&lt;67]"/>
			<personalDependentFirstSplitDativeExample/>
			<personalDependentSecondSplitDativeExample/>
			<personalDependentThirdSplitDativeExample/>
			<xsl:copy-of select="*[position()&gt;66 and position()&lt;78]"/>
			<demProximalExample/>
			<demMedialExample/>
			<demDistalExample/>
			<demProximalNomExample/>
			<demMedialNomExample/>
			<demDistalNomExample/>
			<demProximalAccExample/>
			<demMedialAccExample/>
			<demDistalAccExample/>
			<demProximalErgExample/>
			<demMedialErgExample/>
			<demDistalErgExample/>
			<demProximalAbsExample/>
			<demMedialAbsExample/>
			<demDistalAbsExample/>
			<xsl:copy-of select="*[position()&gt;77 and position()&lt;83]"/>
			<pronSentExample/>
			<xsl:copy-of select="*[position() &gt; 82]"/>
		</pron>
	</xsl:template>
	<!--
		pp:  add attributes and change some names
	-->
	<xsl:template match="pp">
		<pp>
			<xsl:copy-of select="@*[name()!='sentComp']"/>
			<xsl:attribute name="tempComp">
				<xsl:value-of select="@sentComp"/>
			</xsl:attribute>
			<xsl:attribute name="locativePos">unknown</xsl:attribute>
			<xsl:attribute name="locativeRestricted">unrestricted</xsl:attribute>
			<xsl:attribute name="ppClassifier">no</xsl:attribute>
			<xsl:copy-of select="*[position() &lt; 6]"/>
			<tempExample>
				<xsl:value-of select="sentExample"/>
			</tempExample>
			<xsl:copy-of select="*[position() &gt; 6]"/>
		</pp>
	</xsl:template>
	<!--
		prop:  add attributes
	-->
	<xsl:template match="prop">
		<prop>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="pnClassifier">no</xsl:attribute>
			<xsl:attribute name="pnDeterminer">no</xsl:attribute>
			<xsl:copy-of select="*"/>
		</prop>
	</xsl:template>
	<!--
		q:  add one example
	-->
	<xsl:template match="q">
		<q>
			<xsl:copy-of select="@*"/>
			<xsl:copy-of select="*[position() &lt; 11]"/>
			<howMany/>
			<xsl:copy-of select="*[position() &gt; 10]"/>
		</q>
	</xsl:template>
	<!--
		qp:  add many attributes and an example
	-->
	<xsl:template match="qp">
		<qp>
			<xsl:copy-of select="@*[name()!='npDegree' and name()!='npDegreePosType' and name()!='determiner']"/>
			<xsl:attribute name="npDegree">
				<xsl:choose>
					<xsl:when test="@npDegree='yes' or @npDegree='yesPos' or @npDegree='yesPosOnly'">yes</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="npDegreeNeg">
				<xsl:choose>
					<xsl:when test="@npDegree='yes' or @npDegree='yesNeg'">yes</xsl:when>
					<xsl:when test="@npDegree='yesPos' or @npDegree='no'">no</xsl:when>
					<xsl:otherwise>none</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="npDegreeType">
				<xsl:value-of select="@npDegreePosType"/>
			</xsl:attribute>
			<xsl:attribute name="determiner">
				<xsl:choose>
					<xsl:when test="@determiner='yes' or @determiner='yesSome'">yes</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="determinerNeg">
				<xsl:choose>
					<xsl:when test="@determiner='yes' or @determiner='yesNo'">yes</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="npDegreeClassifier">no</xsl:attribute>
			<xsl:attribute name="determinerNegEither">unrestricted</xsl:attribute>
			<xsl:attribute name="determinerNegPos">unknown</xsl:attribute>
			<xsl:attribute name="npDegreeNegNPPos">unknown</xsl:attribute>
			<xsl:attribute name="determinerClassifier">no</xsl:attribute>
			<xsl:attribute name="quantifierClassifier">no</xsl:attribute>
			<xsl:attribute name="degreeClassifier">no</xsl:attribute>
			<xsl:attribute name="numberClassifier">no</xsl:attribute>
			<xsl:attribute name="ordinalWordPos">unknown</xsl:attribute>
			<xsl:copy-of select="*[position() &lt; 13]"/>
			<degreeWordExample/>
			<xsl:copy-of select="*[position() &gt; 12]"/>
		</qp>
	</xsl:template>
</xsl:stylesheet>
