<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="v">
	<section1 id="sV">
		<secTitle>Verbs</secTitle>
		<p>
<xsl:text>Verbs express actions, states, or emotions.  The types of verbal inflection and agreement features carried by verbs are detailed first.  The issue of when a subject may be missing is discussed in section </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>, and auxiliaries are covered in section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>.  Examples of the verbs used in basic sentences are found in section </xsl:text>
<sectionRef sec="sIP" />
<xsl:text>.  More complex constructions including verbs are covered in sections </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text> - </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sIPInfl">
			<secTitle>Inflection Features</secTitle>
			<p>
<xsl:text>Verbs and auxiliaries usually carry inflection features, such as tense, aspect, and/or mood.  In most cases, these features are added by affixes, but they may also be part of irregular verb forms.</xsl:text>
</p>
			<p>
<xsl:text>The following inflection features are marked on verbs and/or auxiliaries in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			<example num="xV.IPInfl.8">
<table border="1">
					<tr>
						<th>Type of feature</th>
						<th>Feature</th>
						<th>Form(s)</th>
					</tr>
					<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
						<td align="left">
							<xsl:text>present</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
						<td align="left">
							<xsl:text>past</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
						<td align="left">
							<xsl:text>future</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>contemplative</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>contrafactual</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
						<td align="left">
							<xsl:text>completive</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
						<td align="left">
							<xsl:text>continuative</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
						<td align="left">
							<xsl:text>habitual</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
						<td align="left">
							<xsl:text>imperfective</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
						<td align="left">
							<xsl:text>incompletive</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>perfect</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>					<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
						<td align="left">
							<xsl:text>perfective</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
						<td align="left">
							<xsl:text>potential</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
						<td align="left">
							<xsl:text>progressive</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
						<td align="left">
							<xsl:text>stative</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>unreal</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatDeclarative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
						<td align="left">
							<xsl:text>declarative</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatImperative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
						<td align="left">
							<xsl:text>imperative</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatInterrogative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
						<td align="left">
							<xsl:text>interrogative</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatIrrealis/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
						<td align="left">
							<xsl:text>irrealis</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatRealis/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
						<td align="left">
							<xsl:text>realis</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
                        	   <xsl:if test="normalize-space(//ip/ipInflFeatFinite/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>finite</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatMinusFinite/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>nonfinite</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatGerund/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>gerund</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatParticiple/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>participle</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatAntipassive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>antipassive</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatCausative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>causative</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>	
				   <xsl:if test="normalize-space(//ip/ipInflFeatPassive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>voice</xsl:text>
						</td>
						<td align="left">
							<xsl:text>passive</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
						</td>
					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatActorVoice/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>actor voice</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatDativeVoice/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>dative voice</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatGoalVoice/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>goal voice</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatInstrumentalVoice/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>instrumental voice</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatLocativeVoice/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>locative voice</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatObjectoice/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>object voice</xsl:text>
				      </td>
				      <td align="left">
				         <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ENTER_POSSIBLE_FORMS</langData>
				      </td>
				   </tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sIPAgr">
			<secTitle>Agreement Features</secTitle>
			<p>
<xsl:text>Verbs and auxiliaries may also carry agreement features that force agreement with the subject, and sometimes also with the direct object.  Most of these features are added by affixes or pronominal clitics which may attach to the verb.  Animacy of a subject or object is most likely a property of the semantics of the individual verb itself, but it is marked by an affix in some languages.</xsl:text>
</p>
			<p>
<xsl:text>The following agreement features are marked on verbs and/or auxiliaries in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			<example num="xV.IPAgr.8">
<table border="1">
					<tr>
						<th>Type of feature</th>
						<th>Feature</th>
					</tr>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person exclusive subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person exclusive object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person exclusive ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person exclusive absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person inclusive subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person inclusive object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person inclusive ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>first person inclusive absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>second person subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>second person object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>second person ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>second person absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>third person subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>third person object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>third person ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>person</xsl:text>
						</td>
						<td align="left">
							<xsl:text>third person absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>singular subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>singular object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>singular ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>singular absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>dual subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>dual object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>dual ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>dual absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>plural subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>plural object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>plural ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>number</xsl:text>
						</td>
						<td align="left">
							<xsl:text>plural absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>masculine subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>masculine object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>masculine ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>masculine absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>feminine subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>feminine object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>feminine ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>feminine absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>neuter subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>neuter object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>neuter ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
						<td align="left">
							<xsl:text>neuter absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>animate subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>animate object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>animate ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>animate absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>inanimate subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>inanimate object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>inanimate ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>inanimate absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>human subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>human object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>human ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>human absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>nonhuman subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>nonhuman object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>nonhuman ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
						<td align="left">
							<xsl:text>nonhuman absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>class</xsl:text>
						</td>
						<td align="left">
							<xsl:text>class ## subject</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>class</xsl:text>
						</td>
						<td align="left">
							<xsl:text>class ## object</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>class</xsl:text>
						</td>
						<td align="left">
							<xsl:text>class ## ergative argument</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>class</xsl:text>
						</td>
						<td align="left">
							<xsl:text>class ## absolutive argument</xsl:text>
						</td>
					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeAnimalSubject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type animal subject</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeInsectSubject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type insect subject</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeLiquidSubject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type liquid subject</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeRoundSubject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type round subject</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeCylinderSubject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type cylinder subject</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeSphericalSubject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type spherical subject</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeTreeSubject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type tree subject</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeWoodSubject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type wooden subject</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeOtherSubject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type other subject</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeAnimalObject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type animal object</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeInsectObject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type insect object</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeLiquidObject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type liquid object</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeRoundObject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type round object</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeCylinderObject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type cylinder object</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeSphericalObject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type spherical object</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeTreeObject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type tree object</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeWoodObject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type wooden object</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeOtherObject/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type other object</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeAnimalErgative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type animal ergative argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeInsectErgative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type insect ergative argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeLiquidErgative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type liquid ergative argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeRoundErgative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type round ergative argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeCylinderErgative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type cylinder ergative argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeSphericalErgative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type spherical ergative argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeTreeErgative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type tree ergative argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeWoodErgative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type wooden ergative argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeOtherErgative/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type other ergative argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeAnimalAbsolutive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type animal absolutive argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeInsectAbsolutive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type insect absolutive argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeLiquidAbsolutive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type liquid absolutive argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeRoundAbsolutive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type round absolutive argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeCylinderAbsolutive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type cylinder absolutive argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeSphericalAbsolutive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type spherical absolutive argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeTreeAbsolutive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type tree absolutive argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeWoodAbsolutive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type wooden absolutive argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeOtherAbsolutive/@checked)='yes'">
<tr>
				      <td align="left">
				         <xsl:text>class</xsl:text>
				      </td>
				      <td align="left">
				         <xsl:text>class type other absolutive argument</xsl:text>
				      </td>
				   </tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sIPProDrop">
			<secTitle>Missing Subjects</secTitle>
			<p>
<xsl:text>Some languages are called pro-drop languages because they allow a subject and/or object to be missing or unexpressed in their normal syntactic position.  For example, in Spanish the normal way to say “I buy a book” is </xsl:text>
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
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@proDrop='noImp'">pro-drop is not allowed.  The subject must be overt except in imperatives.</xsl:when>
					<xsl:when test="//ip/@proDrop='no'">pro-drop is not allowed.  The subject must be overt even in imperatives.</xsl:when>
					<xsl:when test="//ip/@proDrop='yes'">pro-drop of the subject is allowed in any type of sentence.</xsl:when>
					<xsl:when test="//ip/@proDrop='yesClitic'">the subject may look like it is missing due to pronominal clitics attaching to the verb, but it is not a true pro-drop language.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@proDrop)='yes'">
					<xsl:text>  Pro-drop of the object is </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@proDropObject='no'">not</xsl:when>
						<xsl:when test="//ip/@proDropObject='yes'">also</xsl:when>
					</xsl:choose>
					<xsl:text> allowed.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//ip/@proDrop)='noImp'">
<p>
<xsl:text>  Examples showing a missing subject in imperatives include:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@proDrop)='noImp'">
<example num="xV.IPProDrop.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/impExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/impExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/impExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/impExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.12.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>				
		   <xsl:if test="normalize-space(//ip/@proDrop)='no'">
<p>
<xsl:text>  Examples of imperatives showing the overt subject include:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@proDrop)='no'">
<example num="xV.IPProDrop.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/impExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/impExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/impExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/impExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.16.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>		
		   <xsl:if test="normalize-space(//ip/@proDrop)='yes'">
<p>
<xsl:text>  Examples with pro-drop include:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@proDrop)='yes'">
<example num="xV.IPProDrop.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/proDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/proDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/proDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/proDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.20.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>				
				<xsl:if test="normalize-space(//ip/@proDrop)='yesClitic'">
<p>
<xsl:text>  Examples that look like pro-drop due to clitic pronouns attached to the verb include:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/@proDrop)='yesClitic'">
<example num="xV.IPProDrop.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/cliticPnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/cliticPnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/cliticPnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/cliticPnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.24.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
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
<xsl:text>There are several kinds of auxiliary elements, including positive and negative varieties, as well as nonfinite, motion and other types.  Each type will be covered in turn.</xsl:text>
</p>
		   
		   <section3 id="sIPAuxPositive">
		      <secTitle>Positive Auxuliary words</secTitle>
		   
		   <p>
<xsl:text>
		   Some languages have positive auxiliary elements that are separate words, and some can have more than one auxiliary element before the main verb.  Examples for English transitive sentences include: </xsl:text>
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
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@aux='no'"> does not have any </xsl:when>
					<xsl:when test="//ip/@aux='yes'"> has some</xsl:when>
				</xsl:choose>
<xsl:text> positive auxiliaries which are written as separate words.  </xsl:text>
<xsl:if test="normalize-space(//ip/@aux)='yes'">
					<xsl:text>An auxiliary is </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxRequired='no'">optional</xsl:when>
						<xsl:when test="//ip/@auxRequired='no'">required</xsl:when>
					</xsl:choose>
					<xsl:text> in </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text> and  </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxMany='no'">only one is possible</xsl:when>
						<xsl:when test="//ip/@auxMany='yes'">more than one may occur</xsl:when>
					</xsl:choose>
					<xsl:text> in a single clause. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> After an auxiliary, the normal VSO order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">is maintained.  The order is Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">may change so the subject appears directly after the auxiliary and before the verb.  The order in these clauses is Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Before an auxiliary, the normal OSV order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">is maintained.  The order is O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">may change so the subject appears directly after the verb and before the auxiliary.  The order in these clauses is O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>Examples of auxiliaries in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.IPAuxPositive.10">
<table border="1">
					<tr>
						<th>Auxiliary Words</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/auxiliaryExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>Examples of sentences including these auxiliaries are:</xsl:text>
</p>
</xsl:if>
			
				<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.IPAuxPositive.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.IPAuxPositive.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.IPAuxPositive.14.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
		   </section3>
		   <section3 id="sIPAuxNegative">
		      <secTitle>Negative Auxiliaries</secTitle>
	   
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
</xsl:attribute>-n’t</langData>
<xsl:text>, which is written as a suffix on the auxiliary.  Examples of English negative transitive sentences include:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy did not hit the ball</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy didn’t hit the ball</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might not have hit the ball</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAux='yes'"> has one or more</xsl:when>				
					<xsl:when test="//ip/@negAux='no'"> does not have any</xsl:when>			
				</xsl:choose>
<xsl:text> negative auxiliaries which are written as separate words. </xsl:text>
<xsl:if test="normalize-space(//ip/@negAux)='yes'">
			      <xsl:text> The negative auxiliary </xsl:text>
			      <xsl:choose>
			         <xsl:when test="//ip/@negAuxRequiresAux='no'">may</xsl:when>
			         <xsl:when test="//ip/@negAuxRequiresAux='yes'">may not</xsl:when>
			      </xsl:choose>
			      <xsl:text> be the only auxiliary in the phrase; </xsl:text>
			      <xsl:choose>
			         <xsl:when test="//ip/@negAuxRequiresAux='no'">no other</xsl:when>
			         <xsl:when test="//ip/@negAuxRequiresAux='yes'">the presence of another</xsl:when>
			      </xsl:choose>
			      <xsl:text> auxiliary is required.</xsl:text>
			   </xsl:if>
</p>
			   
	<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAuxAffix='yes'"> there is <xsl:choose>
<xsl:when test="//ip/@negAux='yes'">also</xsl:when>
</xsl:choose> a negative affix which attaches to a positive auxiliary to make it negative, </xsl:when>
	      <xsl:when test="//ip/@negAuxAffix='no'"> there is not any negative affix which attaches to a positive auxiliary to make it negative, </xsl:when>
	   </xsl:choose>
<xsl:choose>
	      
					<xsl:when test="//ip/@negVAffix='yes'">
<xsl:choose>
<xsl:when test="//ip/@negAuxAffix='yes'">and</xsl:when>
					   <xsl:when test="//ip/@negAuxAffix='no'">but there is</xsl:when>
</xsl:choose> a negative verbal affix. </xsl:when>
					
	      <xsl:when test="//ip/@negVAffix='no'">
<xsl:choose>
<xsl:when test="//ip/@negAuxAffix='yes'">but not</xsl:when>
	         <xsl:when test="//ip/@negAuxAffix='no'">nor</xsl:when>
</xsl:choose> any negative verbal affix.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//ip/@negAux)='yes' or normalize-space(//ip/@negAuxAffix)='yes' or normalize-space(//ip/@negVAffix)='yes'">
<p>
<xsl:text>The following chart summarizes the negative auxiliaries in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='yes' or normalize-space(//ip/@negAuxAffix)='yes' or normalize-space(//ip/@negVAffix)='yes'">
<example num="xV.IPAux.IPAuxNegative.12">
<table border="1">
				<tr>
					<th>Type</th>
				   <th>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
</th>
					<th>Gloss</th>
				</tr>

					<xsl:if test="normalize-space(//ip/@negAux)='yes'">
<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/negAuxExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Negative Auxiliary Word</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>Negative Auxiliary Word</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/@negAuxAffix)='yes'">
<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//ip/negAuxAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length(normalize-space($sExampleValue1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1 != 0 and $sExampleValue1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Negative Affix attached to an  Auxiliary</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>Negative Affix attached to an  Auxiliary</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/@negVAffix)='yes'">
<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//ip/negVerbExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length(normalize-space($sExampleValue2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2 != 0 and $sExampleValue2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Negative Affix attached to a Verb</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>Negative Affix attached to a Verb</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				</table>
</example>
</xsl:if>

			<p>
<xsl:text>See section </xsl:text>
<sectionRef sec="sNegVerbal" />
<xsl:text> for examples of these negative elements used in sentences and further discussion of the negation constructions in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
		   </section3>
		   <section3 id="sIPAuxNonfinite">
		      <secTitle>Nonfinite Auxiliary</secTitle>
		
		   
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
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxNonfinite='no'"> does not have any </xsl:when>
					<xsl:when test="//ip/@auxNonfinite='yes'"> has some</xsl:when>
				</xsl:choose>
<xsl:text> nonfinite auxiliary-type markers which are written as separate words.  </xsl:text>
<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
					<xsl:text>A nonfinite auxiliary word is </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxRequired='no'">optional</xsl:when>
						<xsl:when test="//ip/@auxRequired='no'">required</xsl:when>
					</xsl:choose>
					<xsl:text> in nonfinte clauses in </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> After a nonfinite auxiliary, the normal VSO order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxNonfiniteOrder='yes'">is maintained.  The order is Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxNonfiniteOrder='no'">may change so the subject appears directly after the auxiliary and before the verb.  The order in these clauses is Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Before a nonfinite auxiliary, the normal OSV order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">is maintained.  The order is O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">may change so the subject appears directly after the verb and before the auxiliary.  The order in these clauses is O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<p>
<xsl:text>The nonfinite auxiliary marker(s) in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is/are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux.IPAuxNonfinite.10">
<table border="1">
					<tr>
						<th>Nonfinite Auxiliary Marker(s)</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/auxiliaryNonfiniteExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>nonfinite marker in subordinate clauses</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>nonfinite marker in subordinate clauses</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<p>
<xsl:text>Examples of nonfinite clauses including these nonfinite auxiliaries are:</xsl:text>
</p>
</xsl:if>
			
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux.IPAuxNonfinite.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.IPAuxNonfinite.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.IPAuxNonfinite.14.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
		   </section3>
		   <section3 id="sIPAuxOther">
		      <secTitle>Other types of Auxiliaries</secTitle>
		  		   
		   <p>
<xsl:text>Some languages have other words that act like auxiliaries, such as motion auxiliaries or loan markers, which share the same subject and complements as the main verb.</xsl:text>
</p>
			<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxOther='no'"> does not have any </xsl:when>
					<xsl:when test="//ip/@auxOther='yes'"> has some</xsl:when>
				</xsl:choose>
<xsl:text> auxiliaries of this type which are written as separate words.  </xsl:text>
<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> After one of these auxiliaries, the normal VSO order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOtherOrder='yes'">is maintained.  The order is Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxOtherOrder='no'">may change so the subject appears directly after the auxiliary and before the verb.  The order in these clauses is Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Before one of these auxiliaries, the normal OSV order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">is maintained.  The order is O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">may change so the subject appears directly after the verb and before the auxiliary.  The order in these clauses is O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<p>
<xsl:text>These other auxiliaries in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux.IPAuxOther.10">
<table border="1">
					<tr>
						<th>Other Auxiliary Words</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/auxiliaryOtherExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<p>
<xsl:text>Examples of sentences including these other auxiliaries are:</xsl:text>
</p>
</xsl:if>
			
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux.IPAuxOther.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.IPAuxOther.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.IPAuxOther.14.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
		   </section3>	

		</section2>
	</section1>
	
		
		
		
	
	
		
	
	
		
	
	
		
	
   
      
   
   
      
   
   
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
      
   
	
		
	
	
		
	
	
		
	
	
		
	
   
      
   
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
		
	
	
		
	
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   

	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	 
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
   
   
	
		
	
	
		
	
   
      
   
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
   
	
		
	
	
		
	
   
      
   
   
      
      
      
      
      
   
   
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
</xsl:template>
</xsl:stylesheet>
