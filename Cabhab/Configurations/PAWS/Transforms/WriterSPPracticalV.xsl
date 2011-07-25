<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="v">
	<section1 id="sV">
		<secTitle>Los verbos</secTitle>
		<p>
<xsl:text>Los verbos expresan acciones, estados, o emociones. Los tipos de características verbales de la inflexión y del acuerdo llevaron por verbos se detallan primero.
			La aplicación cuando un tema puede faltar se discute en la sección </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>, y los auxiliares se cubre en la sección
			</xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>.  Los ejemplos de los verbos usados en oraciones básicas se encuentran en la sección
			</xsl:text>
<sectionRef sec="sIP" />
<xsl:text>.  Construcciones más complejas incluyendo verbos se cubren en las secciones </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text> - </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sIPInfl">
			<secTitle>Las características de la inflexión</secTitle>
			<p>
<xsl:text>Los verbos y los auxiliares llevan generalmente características de la inflexión, tales como tiempo, aspecto, y/o modo.  En la mayoría de los casos, estas características son agregadas por los afijos, pero pueden también ser parte de los verbos irregulares.</xsl:text>
</p>
			<p>
<xsl:text>Las características siguientes de la inflexión se marcan en verbos y/o auxiliares en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
					</tr>
					<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>tiempo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>presente</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>tiempo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>pasado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>tiempo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>futuro</xsl:text>
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
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>continuativo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeattHabitual/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>habitual</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>imperfectivo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>incompletivo</xsl:text>
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
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>potencial</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>progresivo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>aspecto</xsl:text>
						</td>
						<td align="left">
							<xsl:text>estativo</xsl:text>
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
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatImperative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>imperativo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatInterrogative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>interrogativo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatIrrealis/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>irrealis</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatRealis/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>modo</xsl:text>
						</td>
						<td align="left">
							<xsl:text>realis</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPassive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>otro</xsl:text>
						</td>
						<td align="left">
							<xsl:text>pasivo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatParticiple/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>otro</xsl:text>
						</td>
						<td align="left">
							<xsl:text>participio</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatFinite/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>otro</xsl:text>
						</td>
						<td align="left">
							<xsl:text>finito</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatMinusFinite/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>otro</xsl:text>
						</td>
						<td align="left">
							<xsl:text>infinitivo</xsl:text>
						</td>
					</tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sIPAgr">
			<secTitle>Las características del acuerdo</secTitle>
			<p>
<xsl:text>Los verbos y los auxiliares pueden también llevar las características del acuerdo que fuerzan el acuerdo con el tema, y a veces también con el objeto directo. La mayor parte de estas características son agregadas por los afijos o el clitics pronominal que pueden juntar al verbo. Animacy de un tema o de un objeto es más probable una característica de la semántica del verbo individual sí mismo, pero es marcado por un afijo en algunos idiomas.</xsl:text>
</p>
			<p>
<xsl:text>Las características siguientes del acuerdo se marcan en verbos y/o auxiliares en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
							<xsl:text>clase_## sujeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberObject/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>clase</xsl:text>
						</td>
						<td align="left">
							<xsl:text>clase_## objeto</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberErgative/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>clase</xsl:text>
						</td>
						<td align="left">
							<xsl:text>clase_## ergativo</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatClassClassNumberAbsolutive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>clase</xsl:text>
						</td>
						<td align="left">
							<xsl:text>clase_## absolutivo</xsl:text>
						</td>
					</tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sIPProDrop">
			<secTitle>Los temas que falta</secTitle>
			<p>
<xsl:text>En algunos idiomas un tema, o a veces un objeto, puede ser faltado o inexpresado en su posición normal sintáctica.  Por ejemplo, en español la manera normal de decir el ingles </xsl:text>
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
<xsl:text>.  Esto no se permite en inglés, con excepción de imperativos. (El tema que falta de infinitivos en complementos subordinados será cubierto en la sección </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.) </xsl:text>
</p>
			<p>
<xsl:text>Algunos idiomas no son realmente idiomas que permiten los temas que falta, pero por lo menos algunos de los pronombres son clíticos que pueden juntar al verbo. Cuando sucede esto, no hay pronombre o frase nominal en la posición sujeta, así que la oración aparece igual que en un idioma verdadera que permite los temas que falta.</xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@proDrop='noImp'">un tema que falta no se permite.  El tema debe ser expresado a menos que en los imperativos</xsl:when>
					<xsl:when test="//ip/@proDrop='no'">un tema que falta no se permite.  El tema debe ser expresado aun cuando en los imperativos</xsl:when>
					<xsl:when test="//ip/@proDrop='yes'">un tema que falta se permite en cualquier tipo de oración</xsl:when>
					<xsl:when test="//ip/@proDrop='yesClitic'">el tema puede mirar como él es falta debido a los pronombres dependientes (clíticos pronominales) que juntan al verbo, pero no es una lengua verdadera que permite un tema que falta</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@proDrop)='yes'">
					<xsl:text>  Un objeto que falta </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@proDropObject='no'">no</xsl:when>
						<xsl:when test="//ip/@proDropObject='yes'">también</xsl:when>
					</xsl:choose>
					<xsl:text> se permite.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@proDrop)='noImp'">
					<xsl:text>  Los ejemplos que demuestran un tema que falta en imperativos incluyen:</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@proDrop)='yes'">
					<xsl:text>  Los ejemplos con un tema que falta incluyen:</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@proDrop)='yesClitic'">
					<xsl:text>  Los ejemplos que parecen un tema que falta incluyen:</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//ip/@proDrop)!='no'">
<example num="xV.IPProDrop.10">
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
<xsl:with-param name="sExNumber">xV.IPProDrop.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos idiomas tienen elementos auxiliares que sean palabras separadas, y algunos pueden tener más de un elemento auxiliar antes del verbo principal. Los ejemplos para las oraciones transitivas inglesas incluyen: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy will hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'El muchacho golpeará el beísbol'</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'El muchacho pudo haber golpeado el beísbol'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have been hitting the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'El muchacho pudo habiendo golpeado el beísbol'</xsl:text>
</gloss>
<xsl:text>.  En español, éstos son expresados principalmente por los cambios del tiempo y del aspecto, a excepción de ejemplos tales como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>He oido algo importante</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@aux='no'"> no tiene cualesquiera </xsl:when>
					<xsl:when test="//ip/@aux='yes'"> tiene algunos </xsl:when>
				</xsl:choose>
<xsl:text>auxiliares que se escriben como palabras separadas.  </xsl:text>
<xsl:if test="normalize-space(//ip/@aux)='yes'">
					<xsl:text>Un auxiliar es </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxRequired='no'">opcional</xsl:when>
						<xsl:when test="//ip/@auxRequired='no'">requerido</xsl:when>
					</xsl:choose>
					<xsl:text> en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text> y  </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxMany='no'">solamente uno es posible</xsl:when>
						<xsl:when test="//ip/@auxMany='yes'">más de uno puede ocurrir</xsl:when>
					</xsl:choose>
					<xsl:text> en una sola cláusula. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Después de un auxiliar, la orden normal del VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. La orden es Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el tema aparece directamente después del auxiliar y antes del verbo. La orden en estas cláusulas es Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Antes de un auxiliar, la orden normal del OSV </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. La orden es O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el tema aparece directamente después del verbo y antes del auxiliar. La orden en estas cláusulas es O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>Los ejemplos de auxiliares en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.10">
<table border="1">
					<tr>
						<th>Palabras auxiliares</th>
						<th>Significado</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:text>Los ejemplos de oraciones incluyendo estos auxiliares son:</xsl:text>
</p>
</xsl:if>

				<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.14">
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
<xsl:with-param name="sExNumber">xV.IPAux.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.14.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
			<p>
<xsl:text>En algunos idiomas la negación verbal es un elemento auxiliar, mientras que en otros es simplemente un afijo verbal. El español utiliza el auxiliar verbal negativo </xsl:text>
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
<xsl:text>'no'</xsl:text>
</gloss>
<xsl:text>, que es una palabra separada que debe seguir siempre a otro auxiliar, y la forma de la contracción </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-n't</langData>
<xsl:text>, que se escribe como sufijo en el auxiliar. Los ejemplos de las oraciones transitivas negativas inglesas incluyen:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy did not hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'El muchacho no golpeó el beísbol'</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy won't hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'El muchacho no golpeará el beísbol'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might not have hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'El muchacho no pudo haber golpeado el beísbol'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAux='yesOnly'"> tiene uno o más</xsl:when>
					<xsl:when test="//ip/@negAux='yesAffix'"> tiene uno o más</xsl:when>
					<xsl:when test="//ip/@negAux='yesVerb'"> tiene uno o más</xsl:when>
					<xsl:when test="//ip/@negAux='yesAll'"> tiene uno o más</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixOnly'"> no tiene cualesquiera</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixAndVerb'"> no tiene cualesquiera</xsl:when>
					<xsl:when test="//ip/@negAux='noVerb'"> no tiene cualesquiera</xsl:when>
				</xsl:choose>
<xsl:text> auxiliares negativos que se escriben como palabras separadas, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAux='yesOnly'">y ése es el único tipo de negación verbal en el idioma. No hay afijo verbal negativo ni afijo auxiliar negativo. </xsl:when>
					<xsl:when test="//ip/@negAux='yesAffix'">y hay también un afijo auxiliar negativo, pero ningún afijo verbal negativo. </xsl:when>
					<xsl:when test="//ip/@negAux='yesVerb'">y hay también un afijo verbal negativo, pero ningún afijo auxiliar negativo. </xsl:when>
					<xsl:when test="//ip/@negAux='yesAll'">y hay también un afijo auxiliar negativo y un afijo verbal negativo. </xsl:when>
					<xsl:when test="//ip/@negAux='noAffixOnly'">pero hay un afijo negativo que junta al auxiliar y ése es el único tipo de negación verbal en el idioma. No hay afijo verbal negativo.</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixAndVerb'">pero hay un afijo negativo que junta al auxiliar y un afijo verbal negativo también.</xsl:when>
					<xsl:when test="//ip/@negAux='noVerb'">ni cualquier afijo negativo que junta al auxiliar. La única manera de expresar la negación verbal está con uno o más afijos verbales negativos.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@negAux)='yesOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='yesAll'">
					<xsl:text> El auxiliar negativo </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">pueda</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">no pueda</xsl:when>
					</xsl:choose>
					<xsl:text> ser el único auxiliar en la frase; </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">ningún otro</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">la presencia de otro</xsl:when>
					</xsl:choose>
					<xsl:text> auxiliar es requerido.</xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@negAux)='yesOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='yesAll'">
<p>
<xsl:text>Los ejemplos de los auxiliares negativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='yesOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='yesAll'">
<example num="xV.IPAux.22">
<table border="1">
				<tr>
					<th>Palabras auxiliares negativas</th>
					<th>Significado</th>
				</tr>
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
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noAffixOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<p>
<xsl:text>Los ejemplos de los afijos negativos juntados a una palabra auxiliar en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noAffixOnly' or normalize-space(//ip/@negAux)='yesAffix' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<example num="xV.IPAux.26">
<table border="1">
					<tr>
						<th>Auxiliares negativos marcados</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/negAuxAffixExample),'.','')" />
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
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noVerb' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<p>
<xsl:text>Los ejemplos de los afijos verbales negativos juntados a un verbo en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='noVerb' or normalize-space(//ip/@negAux)='yesVerb' or normalize-space(//ip/@negAux)='noAffixAndVerb' or normalize-space(//ip/@negAux)='yesAll'">
<example num="xV.IPAux.30">
<table border="1">
				<tr>
					<th>Verbos negativos marcados</th>
					<th>Significado</th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/negVerbExample),'.','')" />
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
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			</table>
</example>
</xsl:if>
			<p>
<xsl:text>Véase a sección </xsl:text>
<sectionRef sec="sNegVerbal" />
<xsl:text> para ejemplos de estos elementos negativos usados en oraciones y más discusión de las construcciones de la negación en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>La palabra no acabada </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>to</langData>
<xsl:text> utilizó en cláusulas subordinadas inglesas también actúa como un auxiliar en que llena la misma posición y puede ocurrir antes de otros auxiliares. Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy would like to have hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'El muchacho quisiera haber golpeado el beísbol'</xsl:text>
</gloss>
<xsl:text>.  En cambio, el español no tiene un marcador separado para las cláusulas subordinadas no acabadas, sino utiliza simplemente la forma infinitiva del verbo. </xsl:text>
</p>
			<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxNonfinite='no'"> no tiene cualesquiera</xsl:when>
					<xsl:when test="//ip/@auxNonfinite='yes'"> tiene algunos</xsl:when>
				</xsl:choose>
<xsl:text> marcadores no acabados similares a auxiliares que se escriben como palabras separadas.  </xsl:text>
<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
					<xsl:text>Una palabra auxiliar no acabada es </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxRequired='no'">opcional</xsl:when>
						<xsl:when test="//ip/@auxRequired='no'">requerido</xsl:when>
					</xsl:choose>
					<xsl:text> en cláusulas no acabadas en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text>. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Después de un auxiliar no acabado, la orden normal del VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxNonfiniteOrder='yes'">se mantiene. La orden es Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxNonfiniteOrder='no'">puede cambiar así que el tema aparece directamente después del auxiliar y antes del verbo. La orden en estas cláusulas es Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Antes de un auxiliar no acabado, la orden normal del OSV </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. La orden es O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el tema aparece directamente después del verbo y antes del auxiliar. La orden en estas cláusulas es O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<p>
<xsl:text>Los ejemplos de auxiliares no acabados en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux.40">
<table border="1">
					<tr>
						<th>Palabras auxiliares no acabadas</th>
						<th>Significado</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:text>Los ejemplos de cláusulas no acabadas incluyendo estos auxiliares no acabados son:</xsl:text>
</p>
</xsl:if>

			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux.44">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxNoonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxNoonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxNoonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxNoonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.44</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.44.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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

			<p>
<xsl:text>Algunas idiomas tienen otras palabras que actúen como auxiliares, tales como auxiliares del movimiento o marcadores del préstamo, que se escriben </xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//typology/@wordOrder)='SVO'">
					<xsl:text>antes</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//typology/@wordOrder)='SOV'">
					<xsl:text>después</xsl:text>
				</xsl:if>
<xsl:text> del verbo y comparten el mismo tema y los complementos. </xsl:text>
</p>
			<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxOther='no'"> no tiene cualesquiera </xsl:when>
					<xsl:when test="//ip/@auxOther='yes'"> tiene algunos</xsl:when>
				</xsl:choose>
<xsl:text> auxiliares de este tipo que se escriben como palabras separadas.  </xsl:text>
<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Después de uno de estos auxiliares, la orden normal del VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOtherOrder='yes'">se mantiene. La orden es Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxOtherOrder='no'">puede cambiar así que el tema aparece directamente después del auxiliar y antes del verbo. La orden en estas cláusulas es Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Antes de uno de estos auxiliares, la orden normal del OSV </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">se mantiene. La orden es  O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">puede cambiar así que el tema aparece directamente después del verbo y antes del auxiliar. La orden en estas cláusulas es O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<p>
<xsl:text>Los ejemplos de estos otros auxiliares en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux.52">
<table border="1">
					<tr>
						<th>Otras palabras del auxiliar</th>
						<th>Significado</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:text>Los ejemplos de oraciones incluyendo estos otros auxiliares son:</xsl:text>
</p>
</xsl:if>

			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux.56">
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
<xsl:with-param name="sExNumber">xV.IPAux.56</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.56.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
	</section1>











































































































































































































































































































































































</xsl:template>
</xsl:stylesheet>
