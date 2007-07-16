<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ip">
	<section1 id="sIP">
		<secTitle>Basic, Single-Clause Sentences</secTitle>
		<p>
<xsl:text>This section covers intransitive, copular, transitive, ditransitive and passive sentences in their basic surface word order (i.e. not changed by focus, topic, interrogative, or negation constructions).  As noted in section </xsl:text>
<sectionRef sec="sIntro" />
<xsl:text>,  the typology of </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> is </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">
<xsl:text>SVO, so the basic word order is the subject, then any auxiliary elements, then the verb phrase which consists of the verb in initial position and any complements following it.</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">
<xsl:text>SOV, so the basic word order is the subject, then the verb phrase which consists of the verb in final position with any complements preceding it, then any auxiliary elements.</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">
<xsl:text>VSO, so the basic word order is the verb in initial position, then the subject, then any complements.</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">
<xsl:text>VOS, so the basic word order is the verb phrase which consists of the verb in initial position and any complements following it, then any auxiliary elements, then the subject.</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">
<xsl:text>OVS, so the basic word order is the verb phrase which consists of the verb in final position with any complements preceding it, then any auxiliary elements, then the subject.</xsl:text>
</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">
<xsl:text>OSV, so the basic word order is any verbal complements first, then the subject, then the verb in final position.</xsl:text>
</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////typology/@wordOrder)='VSO' or normalize-space(////typology/@wordOrder)='OSV'">
				<xsl:text>  The order with any auxiliaries present will be discussed in section </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
		<p>
<xsl:text>Before discussing each of the sentence types in turn, general issues of inflection and agreement features, pro-drop, and auxiliaries will be covered.</xsl:text>
</p>
		<section2 id="sIPInfl">
			<secTitle>Inflection Features</secTitle>
			<p>
<xsl:text>Verbs and auxiliaries usually carry inflection features, such as tense, aspect, and/or mood.  In most cases, these features are added by affixes, but may also be part of irregular verb forms.</xsl:text>
</p>
			<p>
<xsl:text>The following inflection features are marked on verbs and/or auxiliaries in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>:</xsl:text>
</p>
			<example num="xIP.IPInfl.8">
<table border="1">
					<tr>
						<th>Type of feature</th>
						<th>Feature</th>
					</tr>
					<xsl:if test="normalize-space(////ip/ipInflFeatPresent/@checked)='yes'">
<tr>
						<td>
							<xsl:text>tense</xsl:text>
						</td>
						<td>
							<xsl:text>present</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatPast/@checked)='yes'">
<tr>
						<td>
							<xsl:text>tense</xsl:text>
						</td>
						<td>
							<xsl:text>past</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatFuture/@checked)='yes'">
<tr>
						<td>
							<xsl:text>tense</xsl:text>
						</td>
						<td>
							<xsl:text>future</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>aspect</xsl:text>
						</td>
						<td>
							<xsl:text>completive</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>aspect</xsl:text>
						</td>
						<td>
							<xsl:text>continuative</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeattHabitual/@checked)='yes'">
<tr>
						<td>
							<xsl:text>aspect</xsl:text>
						</td>
						<td>
							<xsl:text>habitual</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
						<td>
							<xsl:text>aspect</xsl:text>
						</td>
						<td>
							<xsl:text>imperfective</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>aspect</xsl:text>
						</td>
						<td>
							<xsl:text>incompletive</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
						<td>
							<xsl:text>aspect</xsl:text>
						</td>
						<td>
							<xsl:text>perfective</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatPotential/@checked)='yes'">
<tr>
						<td>
							<xsl:text>aspect</xsl:text>
						</td>
						<td>
							<xsl:text>potential</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>aspect</xsl:text>
						</td>
						<td>
							<xsl:text>progressive</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatStative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>aspect</xsl:text>
						</td>
						<td>
							<xsl:text>stative</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatDeclarative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>mood</xsl:text>
						</td>
						<td>
							<xsl:text>declarative</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatImperative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>mood</xsl:text>
						</td>
						<td>
							<xsl:text>imperative</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatInterrogative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>mood</xsl:text>
						</td>
						<td>
							<xsl:text>interrogative</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatIrrealis/@checked)='yes'">
<tr>
						<td>
							<xsl:text>mood</xsl:text>
						</td>
						<td>
							<xsl:text>irrealis</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatRealis/@checked)='yes'">
<tr>
						<td>
							<xsl:text>mood</xsl:text>
						</td>
						<td>
							<xsl:text>realis</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatPassive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>other</xsl:text>
						</td>
						<td>
							<xsl:text>passive</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatParticiple/@checked)='yes'">
<tr>
						<td>
							<xsl:text>other</xsl:text>
						</td>
						<td>
							<xsl:text>participle</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatFinite/@checked)='yes'">
<tr>
						<td>
							<xsl:text>other</xsl:text>
						</td>
						<td>
							<xsl:text>finite</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipInflFeatMinusFinite/@checked)='yes'">
<tr>
						<td>
							<xsl:text>other</xsl:text>
						</td>
						<td>
							<xsl:text>nonfinite</xsl:text>
						</td>
					</tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sIPAgr">
			<secTitle>Agreement Features</secTitle>
			<p>
<xsl:text>Verbs and auxiliaries may also carry agreement features that force agreement with the subject, and sometimes also with the direct object.  Most of these features are added by affixes or pronominal clitics which may attach to the verb.  Animacy of a subject or object is most likely a property of the semantics of the individual verb itself.</xsl:text>
</p>
			<p>
<xsl:text>The following agreement features are marked on verbs and/or auxiliaries in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>:</xsl:text>
</p>
			<example num="xIP.IPAgr.8">
<table border="1">
					<tr>
						<th>Type of feature</th>
						<th>Feature</th>
					</tr>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstExclusiveSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person exclusive subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstExclusiveObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person exclusive object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstExclusiveErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person exclusive ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstExclusiveAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person exclusive absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstInclusiveSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person inclusive subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstInclusiveObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person inclusive object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstInclusiveErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person inclusive ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFirstInclusiveAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>first person inclusive absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatSecondSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>second person subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatSecondObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>second person object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatSecondErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>second person ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatSecondAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>second person absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatThirdSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>third person subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatThirdObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>third person object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatThirdErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>third person ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatThirdAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>person</xsl:text>
						</td>
						<td>
							<xsl:text>third person absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatSingularSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>singular subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatSingularObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>singular object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatSingularErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>singular ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatSingularAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>singular absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatDualSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>dual subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatDualObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>dual object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatDualErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>dual ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatDualAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>dual absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatPluralSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>plural subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatPluralObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>plural object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatPluralErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>plural ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatPluralAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>number</xsl:text>
						</td>
						<td>
							<xsl:text>plural absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMasculineSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>masculine subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMasculineObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>masculine object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMasculineErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>masculine ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMasculineAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>masculine absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFeminineSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>feminine subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFeminineObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>feminine object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFeminineErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>feminine ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatFeminineAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>feminine absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatNeuterSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>neuter subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatNeuterObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>neuter object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatNeuterErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>neuter ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatNeuterAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>gender</xsl:text>
						</td>
						<td>
							<xsl:text>neuter absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatAnimateSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>animate subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatAnimateObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>animate object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatAnimateErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>animate ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatAnimateAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>animate absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMinusAnimateSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>inanimate subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMinusAnimateObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>inanimate object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMinusAnimateErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>inanimate ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMinusAnimateAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>inanimate absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatHumanSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>human subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatHumanObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>human object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatHumanErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>human ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatHumanAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>human absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMinusHumanSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>nonhuman subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMinusHumanObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>nonhuman object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMinusHumanErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>nonhuman ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatMinusHumanAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>animacy</xsl:text>
						</td>
						<td>
							<xsl:text>nonhuman absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatClassClassNumberSubject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>class</xsl:text>
						</td>
						<td>
							<xsl:text>class_## subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatClassClassNumberObject/@checked)='yes'">
<tr>
						<td>
							<xsl:text>class</xsl:text>
						</td>
						<td>
							<xsl:text>class_## object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatClassClassNumberErgative/@checked)='yes'">
<tr>
						<td>
							<xsl:text>class</xsl:text>
						</td>
						<td>
							<xsl:text>class_## ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/ipAgrFeatClassClassNumberAbsolutive/@checked)='yes'">
<tr>
						<td>
							<xsl:text>class</xsl:text>
						</td>
						<td>
							<xsl:text>class_## absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sIPProDrop">
			<secTitle>Pro-Drop</secTitle>
			<p>
<xsl:text>Some languages are pro-drop languages which allow a subject and/or object to be missing.  For example, in Spanish the normal way to say "I buy a book" is </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Compro un libro</langData>
<xsl:text> rather than with the overt subject pronoun included: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo compro un libro</langData>
<xsl:text>.  This is not allowed in English, except for imperatives.  (The missing subject of infinitives in embedded complements will be covered in section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.) </xsl:text>
</p>
			<p>
<xsl:text>
Some languages are not really pro-drop languages, but at least some of the pronouns are clitics which can attach to the verb.  When this happens, there is no pronoun or nominal phrase in subject position, so the sentence appears the same as in a true pro-drop language.</xsl:text>
</p>
			<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@proDrop='noImp'">
<xsl:text>pro-drop is not allowed.  The subject must be overt except in imperatives.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@proDrop='no'">
<xsl:text>pro-drop is not allowed.  The subject must be overt even in imperatives.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@proDrop='yes'">
<xsl:text>pro-drop of the subject is allowed in any type of sentence.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@proDrop='yesClitic'">
<xsl:text>the subject may look like it is missing due to pronominal clitics attaching to the verb, but it is not a true pro-drop language.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@proDrop)='yes'">
					<xsl:text>  Pro-drop of the object is </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@proDropObject='no'">
<xsl:text>not</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@proDropObject='yes'">
<xsl:text>also</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> allowed.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@proDrop)='noImp'">
					<xsl:text>  Examples showing a missing subject in imperatives include:</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@proDrop)='yes'">
					<xsl:text>  Examples with pro-drop include:</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@proDrop)='yesClitic'">
					<xsl:text>  Examples that look like pro-drop include:</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(////ip/@proDrop)!='no'">
<example num="xIP.IPProDrop.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/proDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/proDropExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/proDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/proDropExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPProDrop.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPProDrop.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
		</section2>
		<section2 id="sIPAux">
			<secTitle>Auxiliaries</secTitle>
			<p>
<xsl:text>Some languages have auxiliary elements that are separate words, and some can have more than one auxiliary element before the main verb.  Examples for English transitive single-clause sentences include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy will hit the ball</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have hit the ball</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have been hitting the ball</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@aux='no'">
<xsl:text> does not have any </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@aux='yes'">
<xsl:text> has some</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> auxiliaries which are written as separate words.  </xsl:text>
<xsl:if test="normalize-space(////ip/@aux)='yes'">
					<xsl:text>Examples including auxiliaries that are like the English auxiliaries are:</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(////ip/@aux)='yes'">
<example num="xIP.IPAux.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/auxExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/auxExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPAux.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPAux.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<p>
<xsl:text>In some languages verbal negation is an auxiliary element, while in others it is simply a verbal affix. English has both the negative auxiliary </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text>, which is a separate word that must always follow another auxiliary, and the contraction form </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-n't</langData>
<xsl:text>, which is written as a suffix on the auxiliary.  Examples of English negative transitive single-clause sentences include:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy did not hit the ball</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy won't hit the ball</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might not have hit the ball</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAux='yesOnly'">
<xsl:text> has one or more</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesAffix'">
<xsl:text> has one or more</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesVerb'">
<xsl:text> has one or more</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesAll'">
<xsl:text> has one or more</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixOnly'">
<xsl:text> does not have any</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixAndVerb'">
<xsl:text> does not have any</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noVerb'">
<xsl:text> does not have any</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> negative auxiliaries which are written as separate words, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAux='yesOnly'">
<xsl:text>and that is the only type of verbal negation in the language.  There is no negative verbal affix nor negative auxiliary affix. </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesAffix'">
<xsl:text>and there is also a negative auxiliary affix, but no negative verbal affix. </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesVerb'">
<xsl:text>and there is also a negative verbal affix, but no negative auxiliary affix. </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesAll'">
<xsl:text>and there is also a negative auxiliary affix and a negative verbal affix. </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixOnly'">
<xsl:text>but there is a negative affix which goes on the auxiliary and that is the only type of verbal negation in the language.  There is no negative verbal affix.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixAndVerb'">
<xsl:text>but there is a negative affix which goes on the auxiliary and a negative verbal affix as well.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noVerb'">
<xsl:text>nor any negative affix which goes on an auxiliary.  The only way to express verbal negation is by one or more negative verbal affixes.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@negAux)='yesOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='yesAll'">
					<xsl:text> The negative auxiliary </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">
<xsl:text>may</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">
<xsl:text>may not</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> be the only auxiliary in the phrase; </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">
<xsl:text>no other</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">
<xsl:text>the presence of another</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> auxiliary is required.</xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(////ip/@negAux)!='noVerb'">
<p>
<xsl:text>Examples of the negative auxiliaries in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)!='noVerb'">
<example num="xIP.IPAux.16">
<table border="1">
					<caption>
						<xsl:text>Negative Auxiliaries</xsl:text>
					</caption>
					<xsl:if test="normalize-space(////ip/@negAux)='yesOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='yesAll'">
<tr>
						<td>
							<xsl:text>words</xsl:text>
						</td>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//ip/negAuxExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(////ip/@negAux)='noAffixOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<tr>
						<td>
							<xsl:text>affix on an auxiliary</xsl:text>
						</td>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//ip/negAuxAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
</xsl:if>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noVerb' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<p>
<xsl:text>Examples of the negative verbal affixes attached to a verb in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noVerb' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<example num="xIP.IPAux.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/negVerbExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/negVerbExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/negVerbExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/negVerbExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPAux.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPAux.20.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<p>
<xsl:text>See section </xsl:text>
<sectionRef sec="sNegVerbal" />
<xsl:text> for examples of these negative elements used in sentences and further discussion of the negation constructions in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>The nonfinite word </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>to</langData>
<xsl:text> used in English embedded clauses also acts as an auxiliary in that it fills the same position and can occur before other auxiliaries.  For example, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy would like to have hit the ball</langData>
<xsl:text>. </xsl:text>
</p>
			<p>
<xsl:text>Nonfinite examples from </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> are given here, though they may not include a nonfinite auxiliary element:</xsl:text>
</p>
			<example num="xIP.IPAux.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/auxNonfiniteExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/auxNonfiniteExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPAux.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPAux.28.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<xsl:if test="normalize-space(////ip/@aux)='yes'">
<p>
<xsl:text>Some languages have other words that act like auxiliaries, such as motion auxiliaries or loan markers, which are written </xsl:text>
<xsl:if test="normalize-space(////typology/@wordOrder)='VSO' or normalize-space(////typology/@wordOrder)='VOS' or normalize-space(////typology/@wordOrder)='SVO'">
					<xsl:text>before</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////typology/@wordOrder)='OSV' or normalize-space(////typology/@wordOrder)='OVS' or normalize-space(////typology/@wordOrder)='SOV'">
					<xsl:text>after</xsl:text>
				</xsl:if>
<xsl:text> the verb and share the same subject and complements.  Examples of these other kinds of auxiliaries, if used in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, are given below:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@aux)='yes'">
<example num="xIP.IPAux.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/auxOtherExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/auxOtherExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPAux.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPAux.32.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@aux)='yes'">
<p>
<xsl:text>An auxiliary is </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxRequired='no'">
<xsl:text>optional</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@auxRequired='no'">
<xsl:text>required</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> and  </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxMany='no'">
<xsl:text>only one is possible</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@auxMany='yes'">
<xsl:text>more than one may occur</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> in a single clause. </xsl:text>
<xsl:if test="normalize-space(////typology/@wordOrder)='VSO'">
					<xsl:text> After an auxiliary, the normal VSO order </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxOrder='yes'">
<xsl:text>is maintained.  The order is Aux V S O.</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@auxOrder='no'">
<xsl:text>may change so the subject appears directly after the auxiliary and before the verb.  The order in these clauses is Aux S V O.</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////typology/@wordOrder)='OSV'">
					<xsl:text> Before an auxiliary, the normal OSV order </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxOrder='yes'">
<xsl:text>is maintained.  The order is O S V Aux.</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@auxOrder='no'">
<xsl:text>may change so the subject appears directly after the verb and before the auxiliary.  The order in these clauses is O V S Aux.</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sIPMotion">
			<secTitle>Intransitives and Motion Verbs</secTitle>
			<p>
<xsl:text>Simple intransitives do not have any complements after the verb, such as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl swims</langData>
<xsl:text>.  Motion verbs include a location in the form of either a PP or adverb.  English examples of motion verbs include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl ran around the track</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My mother went to the store</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My teacher came here</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Examples of simple intransitive sentences in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xIP.IPMotion.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/intransExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/intransExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/intransExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/intransExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPMotion.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> examples with motion verbs include:</xsl:text>
</p>
			<example num="xIP.IPMotion.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/motionExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/motionExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/motionExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/motionExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPMotion.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.12.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
		</section2>
		<section2 id="sIPCop">
			<secTitle>Copular Constructions</secTitle>
			<p>
<xsl:text>Copular sentences can have an adjective, PP, or nominal phrase following the copular verb.  Some languages do not require a copular verb or auxiliary to be present.  English examples include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl is pretty</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>She seems nice</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl is in charge</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>He is the leader</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> copular sentences, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@copular='yes'">
<xsl:text>an overt copular verb is required.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@copular='yesOptional'">
<xsl:text>a copular verb is optional, and no auxiliary is required either.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@copular='yesAux'">
<xsl:text>a copular verb is optional, but an auxiliary is required if the copular verb is not present.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@copular='noAux'">
<xsl:text>there is no copular verb, but an auxiliary is required.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@copular='noNeither'">
<xsl:text>neither an overt copular verb nor an auxiliary is used.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@copular)='noNeither' or normalize-space(////ip/@copular)='yesOptional'">
					<xsl:text>  There is </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@copularAffix='no'">
<xsl:text>not any copular affix on the predicate nominal or predicate adjective either.</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@copularAffix='yesPrefix'">
<xsl:text>a copular prefix on the predicate nominal or predicate adjective, however</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@copularAffix='yesSuffix'">
<xsl:text>a copular suffix on the predicate nominal or predicate adjective, however</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@copularAffix='yesEither'">
<xsl:text>either a copular prefix or suffix on the predicate nominal or predicate adjective, however</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@copular)='noNeither'">
					<xsl:text>.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@copular)='yesOptional'">
					<xsl:text>, that occurs when there is no copular verb present.</xsl:text>
				</xsl:if>
</p>
			<p>
<xsl:text>Examples of copular sentences in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xIP.IPCop.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/copularExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/copularExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/copularExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/copularExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
		</section2>
		<section2 id="sIPTrans">
			<secTitle>Transitives and Ditransitives</secTitle>
			<p>
<xsl:text>Examples of English transitive single-clause sentences include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The batter will hit the ball</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My baby wants that toy</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The dog might have buried his bone</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> examples of transitive sentences include:</xsl:text>
</p>
			<example num="xIP.IPTrans.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/example)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/example)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPTrans.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<p>
<xsl:text>Ditransitives can have the second object expressed as a PP or as a nominal phrase.  Some languages, like English, allow both types via Dative Movement, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl gave the gift to her mother</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl gave her mother the gift</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, the second object in a ditransitive </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@diCat='pp'">
<xsl:text>is always a PP.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@diCat='dp'">
<xsl:text>is always a nominal phrase.  The </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@diCat='both'">
<xsl:text>can be either a PP or a nominal phrase.  When both objects are nominal phrases, the </xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(////ip/@diCat)!='pp'">
					<xsl:choose>
						<xsl:when test="//ip/@diOrder='direct'">
<xsl:text>direct object</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@diOrder='indirect'">
<xsl:text>indirect object</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> appears closest to the verb.</xsl:text>
				</xsl:if>
<xsl:text>  Examples of ditransitive sentences in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xIP.IPTrans.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/diExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/diExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/diExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/diExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPTrans.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.14.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
		</section2>
		<section2 id="sIPPassive">
			<secTitle>Passives</secTitle>
			<p>
<xsl:text>Most languages also have passive sentences, where the Theme or Patient fills the subject position.  The Agent may be optionally expressed in some languages, but is not allowed at all in others.  If expressed, it may take the form of a PP (as in English with the particular preposition </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>by</langData>
<xsl:text>) or of a nominal phrase, depending on the language.  In addition, a particular auxiliary may be required in passives (a form of </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>be</langData>
<xsl:text> in English).  English examples with and without an agent phrase, including some showing interaction with multiple auxiliaries are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The glass was broken</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The glass was broken by the child</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The ball might have been hit</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The ball might have been hit by the boy</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@passive='no'">
<xsl:text> does not have any passives.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@passive='yes'">
<xsl:text> has passives</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@passive)='yes'">
					<xsl:text> in which the Agent </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@passiveAgent='no'">
<xsl:text>may not be expressed.</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@passiveAgent='yes'">
<xsl:text>may be expressed</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(////ip/@passiveAgent)='yes'">
						<xsl:text> as a </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@passiveAgentCat='pp'">
<xsl:text>PP.</xsl:text>
</xsl:when>
							<xsl:when test="//ip/@passiveAgentCat='dp'">
<xsl:text>nominal phrase.</xsl:text>
</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text>  A particular auxiliary </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@passiveAux='no'">
<xsl:text>is not</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@passiveAux='yes'">
<xsl:text>is</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> required in passive sentences.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(////ip/@passive)='yes'">
<p>
<xsl:text>Examples of passive sentences in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@passive)='yes'">
<example num="xIP.IPPassive.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/passiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/passiveExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/passiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/passiveExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPPassive.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPPassive.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
		</section2>
	</section1>

























































































































































































































































































































































</xsl:template>
</xsl:stylesheet>
