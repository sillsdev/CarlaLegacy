<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="v">
	<section1 id="sV">
		<secTitle>Los verbos</secTitle>
		<p>
<xsl:text>Los verbos expresan acciones, estados, o emociones. Primers se analizarán los tipos de la inflexión verbal y la concordancia de los verbos.
				Las condiciones de cuando un sujeto no debe estar presente se analizan en la sección </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>, y los auxiliares se tratan en la sección
			</xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>.  Los ejemplos de los verbos usados en oraciones básicas se encuentran en la sección
			</xsl:text>
<sectionRef sec="sIP" />
<xsl:text>.  Las construcciones más complejas incluyendo los verbos se tratan en las secciones </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text> - </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sIPInfl">
			<secTitle>Características de la inflexión</secTitle>
			<p>
<xsl:text>Los verbos y los auxiliares generalmente tienen características de la inflexión, tales como tiempo, aspecto, y/o modo.  En la mayoría de los casos, estas características se agregan con afijos, pero también pueden ser parte de los verbos irregulares.</xsl:text>
</p>
			<p>
<xsl:text>Las siguientes características de la inflexión se indican en los verbos y/o los auxiliares en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
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
						<th>Tipo de característica</th>
						<th>Característica</th>
						<th>Morfema(s)</th>
					</tr>
					<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>tiempo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>presente</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>tiempo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>pasado</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>tiempo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>futuro</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipinflFeatContemplative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>aspecto</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>contemplativo</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipinflFeatContrafactual/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>aspecto</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>contrariamente al hecho</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>completivo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>continuativo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeattHabitual/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>habitual</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>imperfectivo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>incompletivo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>aspecto</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>perfecto</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>perfectivo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>potencial</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>progresivo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>estativo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>
					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>aspecto</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>no realidad</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatDeclarative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>declarativo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatImperative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>imperativo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatInterrogative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>interrogativo</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatIrrealis/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>irrealis</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatRealis/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>realis</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatFinite/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>otro</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>finito</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatMinusFinite/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>otro</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>infinitivo</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatGerund/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>otro</xsl:text>
						</td>
						<td align="left">
							<xsl:text>gerundio</xsl:text>
						</td>
						<td align="left">
							<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
						</td>					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatParticiple/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>otro</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>participio</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatAntipassive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>voz</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>antipasivo</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatCausative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>voz</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>causativo</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>				   <xsl:if test="normalize-space(//ip/ipInflFeatPassive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>voz</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>pasivo</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatActorVoice/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>voz</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>de actor</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatDativeVoice/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>voz</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>de dativo</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatGoalVoice/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>voz</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>de meta</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatInstrumentalVoice/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>voz</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>de instrumento</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatLocativeVoice/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>voz</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>de locativo</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatObjectoice/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>voz</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>de objeto</xsl:text>
					  </td>
					  <td align="left">
						 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ESCRIBA_LOS_MORFEMAS</langData>
					  </td>
				   </tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sIPAgr">
			<secTitle>Características de la concordancia</secTitle>
			<p>
<xsl:text>Los verbos y los auxiliares también pueden tener características de la concordancia que requieren las concordancia con el sujeto, y a veces también con el objeto directo. La mayor parte de estas características se agregan con afijos o con clíticos pronominales que pueden adherirse con el verbo. La característica de animado de un sujeto o de un objeto es más probable que sea una característica de la semántica del verbo individualen sí mismo, pero en algunas lenguas se indica con un afijo.</xsl:text>
</p>
			<p>
<xsl:text>Las características siguientes de la concordancia se indican en verbos y/o auxiliares en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
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
						<th>Tipo de característica</th>
						<th>Característica</th>
					</tr>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona sujeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona objeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona ergativo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona absolutivo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona exclusivo sujeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona exclusivo objeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona exclusivo ergativo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona exclusivo absolutivo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona inclusivo sujeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona inclusivo objeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona inclusivo ergativo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera persona inclusivo absolutivo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>segunda persona sujeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>segunda persona objeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>segunda persona ergativo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>segunda persona absolutivo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>tercera persona sujeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>tercera persona objeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>tercera persona ergativo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>tercera persona absolutivo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto singular</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto singular</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo singular</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo singular</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto dual</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto dual</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo dual</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo dual</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto plural</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto plural</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo plural</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo plural</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto masculino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto masculino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo masculino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo masculino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto feminino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto feminino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo feminino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo feminino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto neutral</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto neutral</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo neutral</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo neutral</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto animado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto animado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo animado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo animado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto inanimado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto inanimado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo inanimado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo inanimado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto no humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto no humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo no humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo no humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberSubject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>clase</xsl:text>
						</td>
						<td align="left">
							<xsl:text>sujeto de clase ##</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>clase</xsl:text>
						</td>
						<td align="left">
							<xsl:text>objeto de clase ##</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>clase</xsl:text>
						</td>
						<td align="left">
							<xsl:text>ergativo de clase ##</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>clase</xsl:text>
						</td>
						<td align="left">
							<xsl:text>absolutivo de clase ##</xsl:text>
						</td>
					</tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeAnimalSubject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>sujeto de tipo animal</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeInsectSubject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>sujeto de tipo insecto</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeLiquidSubject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>sujeto de tipo líquido</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeRoundSubject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>sujeto de tipo redondo</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeCylinderSubject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>sujeto de tipo cilíndrico</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeSphericalSubject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>sujeto de tipo esférico</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeTreeSubject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>sujeto de tipo árbol</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeWoodSubject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>sujeto de tipo madera</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeOtherSubject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>sujeto de otro tipo u inanimado general</xsl:text>
					  </td>
				   </tr>
</xsl:if>

				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeAnimalObject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>objeto de tipo animal</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeInsectObject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>objeto de tipo insecto</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeLiquidObject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>objeto de tipo líquido</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeRoundObject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>objeto de tipo redondo</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeCylinderObject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>objeto de tipo cilíndrico</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeSphericalObject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>objeto de tipo esférico</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeTreeObject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>objeto de tipo árbol</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeWoodObject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>objeto de tipo madera</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeOtherObject/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>objeto de otro tipo u inanimado general</xsl:text>
					  </td>
				   </tr>
</xsl:if>

				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeAnimalErgative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>ergativo de tipo animal</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeInsectErgative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>ergativo de tipo insecto</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeLiquidErgative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>ergativo de tipo líquido</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeRoundErgative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>ergativo de tipo redondo</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeCylinderErgative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>ergativo de tipo cilíndrico</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeSphericalErgative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>ergativo de tipo esférico</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeTreeErgative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>ergativo de tipo árbol</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeWoodErgative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>ergativo de tipo madera</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeOtherErgative/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>ergativo de otro tipo u inanimado general</xsl:text>
					  </td>
				   </tr>
</xsl:if>

				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeAnimalAbsolutive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>absolutivo de tipo animal</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeInsectAbsolutive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>absolutivo de tipo insecto</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeLiquidAbsolutive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>absolutivo de tipo líquido</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeRoundAbsolutive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>absolutivo de tipo redondo</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeCylinderAbsolutive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>absolutivo de tipo cilíndrico</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeSphericalAbsolutive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>absolutivo de tipo esférico</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeTreeAbsolutive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>absolutivo de tipo árbol</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeWoodAbsolutive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>absolutivo de tipo madera</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipAgrFeatClassClassTypeOtherAbsolutive/@checked)='yes'">
<tr>
					  <td align="left">
						 <xsl:text>clase</xsl:text>
					  </td>
					  <td align="left">
						 <xsl:text>absolutivo de otro tipo u inanimado general</xsl:text>
					  </td>
				   </tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sIPProDrop">
			<secTitle>Los sujetos que no deben estar presentes</secTitle>
			<p>
<xsl:text>En algunas lenguas un sujeto, o a veces un objeto, no debe estar presente en su posición normal sintáctica.  Por ejemplo, en español la manera normal de decir el ejemplo en inglés </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I buy a book</langData>
<xsl:text> es </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Compro un libro</langData>
<xsl:text> en vez de algo con el pronombre sujeto abierto incluido: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo compro un libro</langData>
<xsl:text>.  Esto no se permite en inglés, con excepción de imperativos. (El sujeto de infinitivos que no estar presente en complementos subordinados se tratan en la sección </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.) </xsl:text>
</p>
			<p>
<xsl:text>Algunas lenguas no en realidad son lenguas que permiten los sujetos que no deben estar presentes, pero por lo menos algunos de los pronombres son clíticos que se pueden unir al verbo. Cuando sucede esto, no hay pronombre o frase nominal en la posición del sujeto, así que la oración se ve igual que en una lengua verdadera que permite los sujetos que no deben estar presentes.</xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@proDrop='noImp'">no se permite un sujeto que no está presente.  El sujeto debe ser expresado excepto en los imperativos.</xsl:when>
					<xsl:when test="//ip/@proDrop='no'">no se permite un sujeto que no está presente.  El sujeto debe ser expresado aun en los imperativos.</xsl:when>
					<xsl:when test="//ip/@proDrop='yes'">un sujeto no debe estar presente en cualquier tipo de oración.</xsl:when>
					<xsl:when test="//ip/@proDrop='yesClitic'">el sujeto puede parecer como que no está presente debido a los pronombres dependientes (clíticos pronominales) que se unen al verbo, pero en realidad no es una lengua que permite un sujeto ausente.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@proDrop)='yes'">
					<xsl:text>  Un objeto que no está presente </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@proDropObject='no'">no</xsl:when>
						<xsl:when test="//ip/@proDropObject='yes'">también</xsl:when>
					</xsl:choose>
					<xsl:text> se permite.</xsl:text>
				</xsl:if>
</p>

				<xsl:if test="normalize-space(//ip/@proDrop)='noImp'">
<p>
<xsl:text>  Algunos ejemplos que muestran que el sujeto no debe estar presente en imperativos son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>  Algunos ejemplos que muestran que el sujeto debe estar presente en imperativos son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>  Algunos ejemplos que muestran que el sujeto no debe estar presente son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>  Algunos ejemplos que parecen como que el sujeto no debe estar presente porque hay pronombres clíticos unidos a los verbos son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
			<secTitle>Los auxiliares</secTitle>
		   <p>
<xsl:text>Hay varias clases de elementos auxiliares, incluyendo variedades positivas y negativas, así como el indicador de infinito, el movimiento y otros tipos. Cada tipo será cubierto en orden.</xsl:text>
</p>

		   <section3 id="sIPAuxPositive">
			  <secTitle>Auxuliares positivos</secTitle>
			  <p>
<xsl:text>Algunas lenguas tienen elementos auxiliares que son palabras independientes, y algunos pueden tener más de un elemento auxiliar con el verbo principal. Algunos ejemplos de las oraciones transitivas en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy will hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho golpeará el beísbol’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho pudo haber golpeado el beísbol’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have been hitting the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho pudo habiendo golpeado el beísbol’</xsl:text>
</gloss>
<xsl:text>.  En español, éstos son expresados principalmente por los cambios del tiempo y del aspecto.</xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@aux='no'"> no hay </xsl:when>
					<xsl:when test="//ip/@aux='yes'"> hay algunos </xsl:when>
				</xsl:choose>
<xsl:text>auxiliares que se escriben como palabras independientes.  </xsl:text>
<xsl:if test="normalize-space(//ip/@aux)='yes'">
					<xsl:text>Un auxiliar es </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxRequired='no'">opcional</xsl:when>
						<xsl:when test="//ip/@auxRequired='no'">requerido</xsl:when>
					</xsl:choose>
					<xsl:text> en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text> y  </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxMany='no'">solamente es posible un auxiliar</xsl:when>
						<xsl:when test="//ip/@auxMany='yes'">se puede presentar más de un auxiliar</xsl:when>
					</xsl:choose>
					<xsl:text> en una sola cláusula. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Después de un auxiliar, el orden normal VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. El orden es Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el sujeto se presenta directamente después del auxiliar y antes del verbo. El orden en estas cláusulas es Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Antes de un auxiliar, el orden normal OSV </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. El orden es O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el sujeto se presenta directamente después del verbo y antes del auxiliar. El orden en estas cláusulas es O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>Los auxiliares en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.IPAuxPositive.10">
<table border="1">
					<tr>
						<th>Palabras auxiliares</th>
						<th>Glosa</th>
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones que incluyen estos auxiliares son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
		   <section3 id="ipAuxNegative">
			  <secTitle>Auxilares negativos</secTitle>


		   <p>
<xsl:text>En algunas lenguas la negación verbal es un elemento auxiliar, mientras que en otras lenguas es simplemente un afijo verbal. El español utiliza el auxiliar verbal negativo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> antes del verbo.
					El inglés tiene el auxiliar negativo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘no’</xsl:text>
</gloss>
<xsl:text>, que es una palabra independiente que siempre debe seguir a otro auxiliar, y la forma de la contracción </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-n’t</langData>
<xsl:text>, que se escribe como sufijo en el auxiliar. Algunos ejemplos de las oraciones transitivas negativas en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy did not hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho no golpeó el beísbol’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy won’t hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho no golpeará el beísbol’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might not have hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho no pudo haber golpeado el beísbol’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
			  <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAux='yes'"> hay uno o más</xsl:when>
					<xsl:when test="//ip/@negAux='no'"> no hay</xsl:when>
				 </xsl:choose>
<xsl:text> auxiliares negativos que se escriben como palabras independientes. </xsl:text>
<xsl:if test="normalize-space(//ip/@negAux)='yes'">
					<xsl:text> El auxiliar negativo </xsl:text>
					<xsl:choose>
					   <xsl:when test="//ip/@negAuxRequiresAux='no'">puede</xsl:when>
					   <xsl:when test="//ip/@negAuxRequiresAux='yes'">no puede</xsl:when>
					</xsl:choose>
					<xsl:text> ser el único auxiliar en la frase; </xsl:text>
					<xsl:choose>
					   <xsl:when test="//ip/@negAuxRequiresAux='no'">ningún otro</xsl:when>
					   <xsl:when test="//ip/@negAuxRequiresAux='yes'">la presencia de otro</xsl:when>
					</xsl:choose>
					<xsl:text> auxiliar es requerido.</xsl:text>
				 </xsl:if>
</p>
			  <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAuxAffix='yes'"> hay <xsl:choose>
<xsl:when test="//ip/@negAux='yes'">también</xsl:when>
</xsl:choose> un afijo negativo que se une con un auxiliar positivo, </xsl:when>
					<xsl:when test="//ip/@negAuxAffix='no'"> no hay un afijo negativo que se une con un auxiliar positivo, </xsl:when>
				 </xsl:choose>
<xsl:choose>

					<xsl:when test="//ip/@negVAffix='yes'">
<xsl:choose>
<xsl:when test="//ip/@negAuxAffix='yes'">y</xsl:when>
					   <xsl:when test="//ip/@negAuxAffix='no'">pero hay</xsl:when>
</xsl:choose> un afijo verbal negativo. </xsl:when>

					<xsl:when test="//ip/@negVAffix='no'">
<xsl:choose>
<xsl:when test="//ip/@negAuxAffix='yes'">pero no hay</xsl:when>
					   <xsl:when test="//ip/@negAuxAffix='no'">ni</xsl:when>
</xsl:choose> un afijo verbal negativo.</xsl:when>
				 </xsl:choose>
<xsl:text></xsl:text>
</p>
			  <xsl:if test="normalize-space(//ip/@negAux)='yes' or normalize-space(//ip/@negAuxAffix)='yes' or normalize-space(//ip/@negVAffix)='yes'">
<p>
<xsl:text>El cuadro siguiente da un resumen de los auxiliares negativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//ip/@negAux)='yes' or normalize-space(//ip/@negAuxAffix)='yes' or normalize-space(//ip/@negVAffix)='yes'">
<example num="xV.IPAux..12">
<table border="1">
					<tr>
					   <th>Tipo</th>
					   <th>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
</th>
					   <th>Glosa</th>
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
<xsl:text>Negativa auxiliar palabra</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Negativa auxiliar palabra</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Afijo negativo unido a un auxiliar</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Afijo negativo unido a un auxiliar</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Afijo negativo unido a un verbo</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Afijo negativo unido a un verbo</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Véase a sección </xsl:text>
<sectionRef sec="sNegVerbal" />
<xsl:text> para considerar otros ejemplos de los elementos negativos usados en las oraciones y vea también un análisis de las construcciones de la negación en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
		   </section3>
		   <section3 id="ipAuxNonfinite">
			  <secTitle>Auxilar para infinitivo</secTitle>


		   <p>
<xsl:text>En  inglés la palabra que indica el infinitivo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>to</langData>
<xsl:text>, utilizada en cláusulas subordinadas, también funciona al igual que un auxiliar en que ocupa la misma posición y puede presentarse antes de otros auxiliares. Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy would like to have hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho quisiera haber golpeado el beísbol’</xsl:text>
</gloss>
<xsl:text>.  Por el contrario, el español no tiene un indicador independiente para las cláusulas subordinadas infinitivas, sino utiliza simplemente la forma infinitiva del verbo. </xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxNonfinite='no'"> no hay ningún</xsl:when>
					<xsl:when test="//ip/@auxNonfinite='yes'"> hay un (o más)</xsl:when>
				</xsl:choose>
<xsl:text> indicador de infinitivo similar a un auxiliar que se escribe como una palabra independiente.  </xsl:text>
<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
					<xsl:text>Un indicador auxiliar infinitivo es </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxRequired='no'">opcional</xsl:when>
						<xsl:when test="//ip/@auxRequired='no'">requerido</xsl:when>
					</xsl:choose>
					<xsl:text> en cláusulas infinitivas subordinadas en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Después de un indicador infinitivo, el orden normal VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxNonfiniteOrder='yes'">se mantiene. El orden es Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxNonfiniteOrder='no'">puede cambiar así que el sujeto se presenta directamente después del auxiliar y antes del verbo. El orden en estas cláusulas es Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Antes de un indicador infinitivo, el orden normal OSV </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. El orden es O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el sujeto se presenta directamente después del verbo y antes del auxiliar. El orden en estas cláusulas es O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<p>
<xsl:text>El/Los indicador(es) del infinitivo en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es/son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux..10">
<table border="1">
					<tr>
						<th>Indicador(es) del infinitivo</th>
						<th>Glosa</th>
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
<xsl:text>infinitivo en cláusulas subordinadas</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>infinitivo en cláusulas subordinadas</xsl:text>
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
<xsl:text>Algunos ejemplos con cláusulas subordinadas infinitivas incluyendo esto(s) indicador(es) del infinitivo son:</xsl:text>
</p>
</xsl:if>

			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux..14">
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
<xsl:with-param name="sExNumber">xV.IPAux..14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux..14.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
		   <section3 id="ipAuxOther">
			  <secTitle>Otros auxialares</secTitle>

		   <p>
<xsl:text>En algunas lenguas hay otras palabras que funcionan al igual que auxiliares, tales como auxiliares del movimiento o indicadores del préstamo, que comparten el mimso sujeto y complementos con el verbo principal.</xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxOther='no'"> no hay </xsl:when>
					<xsl:when test="//ip/@auxOther='yes'"> hay algunos</xsl:when>
				</xsl:choose>
<xsl:text> auxiliares de este tipo que se escriben como palabras independientes.  </xsl:text>
<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Después de uno de estos auxiliares, el orden normal VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOtherOrder='yes'">se mantiene. El orden es Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxOtherOrder='no'">puede cambiar así que el sujeto se presenta directamente después del auxiliar y antes del verbo. El orden en estas cláusulas es Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Antes de uno de estos auxiliares, el orden normal OSV </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. El orden es  O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el sujeto se presenta directamente después del verbo y antes del auxiliar. El orden en estas cláusulas es O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<p>
<xsl:text>Estos otros auxiliares en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux..10">
<table border="1">
					<tr>
						<th>Otras palabras del auxiliar</th>
						<th>Glosa</th>
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones incluyendo estos otros auxiliares son:</xsl:text>
</p>
</xsl:if>

			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux..14">
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
<xsl:with-param name="sExNumber">xV.IPAux..14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux..14.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
