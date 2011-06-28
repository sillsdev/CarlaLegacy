<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="pron">
	<section1 id="sPron">
		<secTitle>Los pronombres</secTitle>
		<p>
<xsl:text>Los pronombres vienen en varios tipos, incluyendo pronombre personales, posesivos, reflexivos, recíprocos, e indefinidos.
	Cada tipo de pronombre será mirado en turno, después de cubrir las características del acuerdo en todos los tipos de pronombres. </xsl:text>
</p>
		<section2 id="sPronAgreement">
			<secTitle>Las características del acuerdo en pronombres</secTitle>
			<p>
<xsl:text>Los pronombres tienen normalmente más que o el mismo número de características del acuerdo que los sustantivos tienen. La carta siguiente demuestra las características del acuerdo usadas para los pronombres en </xsl:text>
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
			<example num="xPron.PronAgreement.6">
<table border="1">
					<tr>
						<th>Tipo de característica</th>
						<th>Característica</th>
					</tr>
					<xsl:if test="normalize-space(//pron/pronAgrFeatFirst/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatFirstExclusive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera exclusiva</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatFirstInclusive/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>primera inclusiva</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatSecond/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>segunda</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatThird/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>persona</xsl:text>
						</td>
						<td align="left">
							<xsl:text>tercera</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatSingular/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>singular</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatDual/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>dual</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatPlural/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>número</xsl:text>
						</td>
						<td align="left">
							<xsl:text>plural</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatMasculine/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>masculino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatFeminine/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>feminino</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatNeuter/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>género</xsl:text>
						</td>
						<td align="left">
							<xsl:text>neutro</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatAnimate/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatMinusAnimate/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>inanimado</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatHuman/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatMinusHuman/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>animado</xsl:text>
						</td>
						<td align="left">
							<xsl:text>no humano</xsl:text>
						</td>
					</tr>
</xsl:if>
					<xsl:if test="normalize-space(//pron/pronAgrFeatClassNumber/@checked)='yes'">
<tr>
						<td align="left">
							<xsl:text>clase</xsl:text>
						</td>
						<td align="left">
							<xsl:text>número de clase</xsl:text>
						</td>
					</tr>
</xsl:if>
				</table>
</example>
		</section2>
		<section2 id="sPronPersonal">
			<secTitle>Los pronombres personales</secTitle>
			<p>
<xsl:text>Todos los idiomas tienen pronombres personales independientes que sean las palabras separadas que pueden aparecer en todas las posiciones que pueden los sustantivos o las frases nominales.
				Algunos idiomas también tienen formas dependientes de los pronombres personales que juntan a otra palabra en la oración. </xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
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
				<xsl:when test="//pron/@dependentPron='no'"> no tiene un sistema separado de pronombres personales dependientes.</xsl:when>
				<xsl:when test="//pron/@dependentPron='yes'"> tiene pronombres personales dependientes así como los pronombres personales independientes. Ambos sistemas de pronombres personales serán presentados aquí, con las formas independientes cubiertas primero.</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
</p>
			<p>
<xsl:text>Los pronombres personales tienen normalmente más que o el mismo número de características del caso que los sustantivos tienen. </xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@case)='none'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene ningunas distinciones del caso, entonces hay solamente un solo sistema de los pronombres que se pueden utilizar en cualquier posición en la oración, según lo ejemplificado aquí.</xsl:text>
</p>
</xsl:if>

			<xsl:if test="normalize-space(//np/@case)='none'">
<example num="xPron.PronPersonal.12">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombre</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstNoCaseExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondNoCaseExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdNoCaseExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
</xsl:choose>				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de caso del nominativo-acusativo, entonces hay sistemas distintos de los pronombres para los temas, los objetos, y los poseedores.
					Los pronombres personales independientes que pueden aparecer en la posición sujeta son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<example num="xPron.PronPersonal.16">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes nominativos</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para sujetos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstNomSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondNomSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdNomSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
</xsl:choose>				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<p>
<xsl:text>Los pronombres personales independientes que pueden aparecer en la posición del objeto son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<example num="xPron.PronPersonal.20">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes acusativos</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para objetos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstNomObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondNomObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdNomObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
</xsl:choose>				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<p>
<xsl:text>Los pronombres personales independientes que pueden aparecer en la posición del poseedor son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<example num="xPron.PronPersonal.24">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes genitivos</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para poseedor</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstNomPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondNomPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdNomPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
</xsl:choose>				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='ergative'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de caso del ergativo-absolutivo, entonces hay sistemas distintos de los pronombres que se pueden utilizar como temas de verbos transitivos contra los temas de verbos intransitivos y los objetos de verbos transitivos. Los pronombres personales independientes que pueden aparecer en la posición sujeta de verbos transitivos son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='ergative'">
<example num="xPron.PronPersonal.28">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes ergativos</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres ergativos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstErgSubjectTransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondErgSubjectTransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdErgSubjectTransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='ergative'">
<p>
<xsl:text>Los pronombres personales independientes que pueden aparecer en la posición sujeta de verbos intransitivos o en la posición del objeto de verbos transitivos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='ergative'">
<example num="xPron.PronPersonal.32">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes absolutivos</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres Absolutivos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstErgSubjectIntransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondErgSubjectIntransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdErgSubjectIntransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='ergative'">
<p>
<xsl:text>Los pronombres personales independientes que pueden aparecer en la posición del poseedor son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='ergative'">
<example num="xPron.PronPersonal.36">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes genitivos</xsl:text>
</caption>
					<tr>
						<th>Persone</th>
						<th>Pronombres para poseedores</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstErgPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondErgPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdErgPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='split'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de caso del ergativo-partido, entonces hay sistemas distintos de los pronombres que se utilizan normalmente como temas, objetos, y poseedores siguiendo el sistema de nominativo-acusativo, más algunos sistemas especiales que se utilicen en los casos del ergativo-partido.
					Los pronombres personales independientes que aparecen normalmente en la posición sujeta son:  </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='split'">
<example num="xPron.PronPersonal.40">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes nominativos</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para sujetos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstSplitSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondSplitSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdSplitSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
</xsl:choose>				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<p>
<xsl:text>Los pronombres personales independientes que pueden aparecer en la posición del objeto son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<example num="xPron.PronPersonal.44">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes acusativos</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para objetos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstSplitObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondSplitObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdSplitObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
</xsl:choose>				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<p>
<xsl:text>Los pronombres personales independientes que pueden aparecer en la posición del poseedor son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative'">
<example num="xPron.PronPersonal.48">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes genitivos</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para poseedor</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstSplitPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondSplitPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdSplitPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='split'">
<p>
<xsl:text>Los pronombres personales independientes que pueden aparecer en la posición sujeta de verbos transitivos en los casos especiales del ergativo-partido son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='split'">
<example num="xPron.PronPersonal.52">
<table border="1">
					<caption>
<xsl:text>Los pronombres personalss independientes ergativos</xsl:text>
</caption>
				<tr>
					<th>Persona</th>
					<th>Pronombres Ergativos</th>
					<th>Significado</th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstSplitErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
				<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondSplitErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
				<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdSplitErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='split'">
<p>
<xsl:text>Los pronombres personales independientes que aparecen mientras que son los temas de verbos intransitivos y los objetos de verbos transitivos en los casos especiales del ergativo-partido son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='split'">
<example num="xPron.PronPersonal.56">
<table border="1">
					<caption>
<xsl:text>Los pronombres personales independientes absolutivos</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres absolutivos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalFirstSplitAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalSecondSplitAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalThirdSplitAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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

			<xsl:if test="normalize-space(//np/@case)='none' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Moviendo ahora a los pronombres dependientes, según lo visto arriba </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene ningunos distinciones del caso, entonces hay solamente un solo sistema de los pronombres que se pueden utilizar en cualquier posición en la oración, según lo ejemplificado aquí.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='none' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.60">
<table border="1">
					<caption>
<xsl:text>Pronombres personales dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombre</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstNoCaseExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondNoCaseExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdNoCaseExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='nominative' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Moviendo ahora a los pronombres dependientes, según lo visto arriba </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de caso del nominativo-acusativo, entonces hay sistemas distintos de los pronombres para los temas, los objetos, y los poseedores. Los pronombre personals dependientes que pueden aparecer en la posición sujeta son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.64">
<table border="1">
					<caption>
<xsl:text>Pronombres personaels nominativos dependientes </xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para sujetos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstNomSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondNomSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdNomSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
</xsl:choose>				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Los pronombres personales dependientes que pueden aparecer en la posición del objeto son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.68">
<table border="1">
					<caption>
<xsl:text>Pronombres personales acusativos dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para objetos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstNomObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondNomObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdNomObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
</xsl:choose>				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Los pronombres personales dependientes que pueden aparecer en la posición del poseedor son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='nominative' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.72">
<table border="1">
					<caption>
<xsl:text>Pronombres personales genitivos dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para poseedor</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstNomPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondNomPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
</xsl:choose>					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdNomPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
</xsl:choose>				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='ergative' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Moviendo ahora a los pronombres dependientes, según lo visto arriba </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de caso del ergativo-absolutivo, entonces hay sistemas distintos de los pronombres que se pueden utilizar como temas de verbos transitivos contra los temas de verbos intransitivos y los objetos de verbos transitivos. Los pronombres personales dependientes que pueden aparecer en la posición sujeta de verbos transitivos son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='ergative' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.76">
<table border="1">
					<caption>
<xsl:text>Pronombres personales ergativos dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres ergativos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstErgSubjectTransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondErgSubjectTransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdErgSubjectTransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='ergative' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Los pronombres personales dependientes que pueden aparecer en la posición sujeta de verbos intransitivos o en la posición del objeto de verbos transitivos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='ergative' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.80">
<table border="1">
					<caption>
<xsl:text>Pronombres personales absolutivos dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres absolutivos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstErgSubjectIntransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondErgSubjectIntransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdErgSubjectIntransExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='ergative' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Los pronombres personales dependientes que pueden aparecer en la posición del poseedor son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='ergative' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.84">
<table border="1">
					<caption>
<xsl:text>Pronombres personales genitivos dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para poseedor</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstErgPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondErgPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdErgPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Moviendo ahora a los pronombres dependientes, según lo visto arriba </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un sistema de caso delergativo-partido, entonces hay sistemas distintos de los pronombres que se utilizan normalmente como temas, objetos, y poseedores, más algunos sistemas especiales que se utilicen en los casos del ergativo-partido. Los pronombres personales dependientes que aparecen normalmente en la posición sujeta son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.88">
<table border="1">
					<caption>
<xsl:text>Pronombres personales nominativos dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para sujetos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstSplitSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondSplitSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdSplitSubjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Los pronombres personales dependientes que aparecen normalmente en la posición del objeto son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.92">
<table border="1">
					<caption>
<xsl:text>Pronombres personales acusativos dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para objetos</th>
						<th>Signifiacdo</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstSplitObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondSplitObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdSplitObjectExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Los pronombres personales dependientes que aparecen normalmente en la posición del poseedor son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.96">
<table border="1">
					<caption>
<xsl:text>Pronombres personales genitivos dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres para poseedor</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstSplitPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondSplitPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdSplitPossessorExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Los pronombres personales dependientes que pueden aparecer en la posición sujeta de verbos transitivos en los casos especiales del ergativo-partido son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.100">
<table border="1">
					<caption>
<xsl:text>Pronombres personales ergativos dependientes</xsl:text>
</caption>
				<tr>
					<th>Persona</th>
					<th>Pronombres ergativos</th>
					<th>Significado</th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstSplitErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
				<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondSplitErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
				<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdSplitErgExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Los pronombres personales dependientes que aparecen mientras que son los temas de verbos intransitivos y los objetos de verbos transitivos en los casos especiales del ergativo-partido son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//pron/@dependentPron)='yes'">
<example num="xPron.PronPersonal.104">
<table border="1">
					<caption>
<xsl:text>Pronombres personales absolutivos dependientes</xsl:text>
</caption>
					<tr>
						<th>Persona</th>
						<th>Pronombres absolutivos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/personalDependentFirstSplitAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Primera</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//pron/personalDependentSecondSplitAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Segunda</xsl:text>
</td>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//pron/personalDependentThirdSplitAbsExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
<td align="left" rowspan="1">
<xsl:text>Tercera</xsl:text>
</td>
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
			<xsl:if test="normalize-space(//pron/@dependentPron)='yes'">
<p>
<xsl:text>Para otros detalles sobre cómo los pronombres dependientes pueden ser utilizados, véanse las secciones </xsl:text>
<sectionRef sec="sIPAgr" />
<xsl:text> y </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text> donde se discuten el acuerdo verbal y los temas que no debe estar presente.</xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sPronPoss">
			<secTitle>Los pronombres posesivos</secTitle>
			<p>
<xsl:text>Muchos idiomas también tienen los pronombres posesivos que pueden colocar solamente, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suya</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mío</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>suyos</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tuyo</langData>
<xsl:text> en español. Éstos son distintos de esos pronombres que puedan ocurrir en la posición del poseedor, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>su</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mi</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>sus</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tu</langData>
<xsl:text>, que fueron ejemplificados bajo los pronombres personales arriba.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
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
					<xsl:when test="//pron/@poss='no'"> no tiene cualesquiera</xsl:when>
					<xsl:when test="//pron/@poss='yes'"> tiene</xsl:when>
				</xsl:choose>
<xsl:text> pronombres posesivos que se colocan solamente como frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//pron/@poss)='yes'">
					<xsl:text>Estos pronombres posesivos </xsl:text>
					<xsl:choose>
						<xsl:when test="//pron/@possAffix='no'">no son construidos agregando un afijo a los pronombres personales. Son un sistema distinto.</xsl:when>
						<xsl:when test="//pron/@possAffix='yes'">son construidos agregando un afijo a los pronombres personales.</xsl:when>
						<xsl:when test="//pron/@possAffix='both'">son construidos agregando un afijo a los pronombres personales, aunque algunas formas son distintas, pronombres solos del soporte.</xsl:when>
					</xsl:choose>
					<xsl:text>  Los pronombres posesivos se dan aquí, comenzando con la primera persona, entonces segunda persona, entonces tercera persona:</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//pron/@poss)='yes'">
<example num="xPron.PronPoss.8">
<table border="1">
					<tr>
						<th>Pronombres posesivos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/possExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
		</section2>
		<section2 id="sPronRefl">
			<secTitle>Los reflexivos</secTitle>
			<p>
<xsl:text>Los reflexivos son otro tipo de pronombres que la mayoría de los idiomas tengan. Ocurren solamente en el mismo caso que los objetos directos y deben convenir normalmente con el tema personalmente, el género, y las características del número. Los ejemplos en inglés son:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>herself</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'ella misma'</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>himself</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'sí mismo'</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>themselves</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'ellos mismos'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>myself</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'yo mismo'</xsl:text>
</gloss>
<xsl:text>.    Algunos idiomas tienen un sistema totalmente separado de las formas del pronombre para los reflexivos, mientras que otras tales como español
				utilizan una frase que consista en un sustantivo (que significa generalmente el </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘mismo'</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘self'</xsl:text>
</gloss>
<xsl:text>) que es poseído por el pronombre que se refiere de nuevo al tema.
					Algunos idiomas tienen un afijo verbal que indique la acción reflexiva, y algunos idiomas no distinguen construcciones reflexivas en absoluto.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
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
					<xsl:when test="//pron/@refl='no'"> no tiene ningún tipo de reflexivos.</xsl:when>
					<xsl:when test="//pron/@refl='yesVerbal'"> tiene un afijo verbal para indicar la acción reflexiva. </xsl:when>
					<xsl:when test="//pron/@refl='yes'"> tiene reflexivos</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pron/@refl)='yes'">
					<xsl:text> cuales </xsl:text>
					<xsl:choose>
						<xsl:when test="//pron/@reflAffix='yes'">son construidos agregando un afijo a otro pronombre.</xsl:when>
						<xsl:when test="//pron/@reflAffix='noWord'">son un sistema distinto de pronombres.</xsl:when>
						<xsl:when test="//pron/@reflAffix='noNoun'">son expresados por un cierto sustantivo con un pronombre como el poseedor, como en español.</xsl:when>
					</xsl:choose>
					<xsl:text>  Las formas usadas para los reflexivos se dan aquí, comenzando con la primera persona, entonces segunda persona, entonces tercera persona:</xsl:text>
				</xsl:if>
<xsl:if test="normalize-space(//pron/@refl)='yesVerbal'">
					<xsl:text> Los ejemplos de reflexivos en </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text> son:</xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//pron/@refl)!='no'">
<example num="xPron.PronRefl.8">
<table border="1">
					<tr>
						<th>Reflexivos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/reflExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
			<xsl:if test="normalize-space(//pron/@refl)='yes'">
<p>
<xsl:text>Algunos ejemplos con un reflexivo usado en la posición del objeto de una oración simple son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//pron/@refl)='yes'">
<example num="xPron.PronRefl.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/reflSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pron/reflSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/reflSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/reflSentExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronRefl.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronRefl.12.1</xsl:text>
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
		<section2 id="sPronRecip">
			<secTitle>Los recíprocos</secTitle>
			<p>
<xsl:text>Los recíprocos son similares a los reflexivos salvo que ocurren solamente con los temas plurales. Pueden ser de la misma manera formados reflexivos son, o pueden ser distintos. Por ejemplo, en español, las formas recíprocas son frases: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el uno al otro </langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>uno a otro</langData>
<xsl:text>.  Algunos idiomas usan solamente un afijo verbal de indicar la acción recíproca del tema plural, otros tiene pronombres separados, otros utilizan una oración nominal poseída o una oración nominal cuantificada (como en español), y algunos no marcan la acción recíproca en absoluto. </xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
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
					<xsl:when test="//pron/@recip='no'"> no tiene ningún tipo de recíprocos.</xsl:when>
					<xsl:when test="//pron/@recip='verbal'"> tiene un afijo verbal de indicar la acción recíproca..</xsl:when>
					<xsl:when test="//pron/@recip='yes'"> tiene recíprocos</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pron/@recip)='yes'">
					<xsl:text> cuales </xsl:text>
					<xsl:choose>
						<xsl:when test="//pron/@recipAffix='yes'">son construidos agregando un afijo a otro pronombre. </xsl:when>
						<xsl:when test="//pron/@recipAffix='noWord'">son un sistema distinto de pronombres.</xsl:when>
						<xsl:when test="//pron/@recipAffix='noNoun'">son expresados consistir en cierto sustantivo con un pronombre como el poseedor.</xsl:when>
						<xsl:when test="//pron/@recipAffix='noQP'">son oraciones nominales cuantificadas especiales</xsl:when>
					</xsl:choose>

					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//pron/@recip)='yes'">
<example num="xPron.PronRecip.8">
<table border="1">
					<tr>
						<th>Pronombres recíprocos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/recipExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
			<xsl:if test="normalize-space(//pron/@recip)='verbal'">
<example num="xPron.PronRecip.10">
<table border="1">
					<tr>
						<th>Afijos recíprocos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/recipExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
			<xsl:if test="normalize-space(//pron/@recip)!='no'">
<p>
<xsl:text>Algunos ejemplos de reciprocales en oraciones son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//pron/@recip)!='no'">
<example num="xPron.PronRecip.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/recipSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pron/recipSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/recipSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/recipSentExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronRecip.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronRecip.14.1</xsl:text>
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
		<section2 id="sPronIndef">
			<secTitle>Los indefinidos</secTitle>
			<p>
<xsl:text>Los indefinidos pueden ser pronombres como en español </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todo</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>algunos</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>algo</langData>
<xsl:text>,o pueden ser un cuantificador más un sustantivo genérico indefinido como en español </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>algunas personas</langData>
<xsl:text>, etc.</xsl:text>
</p>
			<p>
<xsl:text>Las versiones negativas de los pronombres indefinidos incluyen </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nadie</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nada</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ninguno</langData>
<xsl:text>.  Algunos idiomas pueden no combinarlas en una sola palabra, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no one</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'nadie'</xsl:text>
</gloss>
<xsl:text> para el inglés.</xsl:text>
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
					<xsl:when test="//pron/@indef='no'">todos los indefinites negativos son frases nominales, algo que siendo pronombres de una palabra.</xsl:when>
					<xsl:when test="//pron/@indef='yes'">algunos o todos los indefinites negativos se combinan en pronombres de una palabra.  Los ejemplos de los pronombres indefinidos negativos incluyen:</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//pron/@indef)='yes'">
<example num="xPron.PronIndef.10">
<table border="1">
					<tr>
						<th>Pronombres indefinidos positivos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/indefExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
			<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
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
					<xsl:when test="//pron/@negIndef='no'">todos los indefinidos negativos son frases nominales, algo que siendo pronombres de una palabra.</xsl:when>
					<xsl:when test="//pron/@negIndef='yes'">algunos o todos los indefinites negativos se combinan en pronombres de una palabra. Los ejemplos de los pronombres indefinidos negativos incluyen: </xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='yesPosOnly'">
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
					<xsl:when test="//pron/@negIndef='no'">no hay pronombres indefinidos negativos y ningún nominal indefinido negativo expresa tampoco, puesto que el idioma no tiene ninguna medios de negar una frase nominal.</xsl:when>
					<xsl:when test="//pron/@negIndef='yes'">todos los indefinidos negativos se combinan en pronombres de una palabra. No hay frases nominales indefinidas negativas, puesto que lel idioma no tiene ninguna medios de negar una frase nominal. Los ejemplos de los pronombres indefinidos negativos incluyen:</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//pron/@negIndef)='yes'">
<example num="xPron.PronIndef.16">
<table border="1">
					<tr>
						<th>Pronombres indefinidos negativos</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/negIndefExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<xsl:text>Los ejemplos de frases nominales indefinidas positivas </xsl:text>
<xsl:if test="normalize-space(//pron/@indef)='yes'">
					<xsl:text>(si hay) </xsl:text>
				</xsl:if>
<xsl:text>incluyen:</xsl:text>
</p>
			<example num="xPron.PronIndef.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/indefNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pron/indefNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/indefNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/indefNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronIndef.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronIndef.20.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Los ejemplos de frases nominales indefinidas negativas </xsl:text>
<xsl:if test="normalize-space(//pron/@negIndef)='yes'">
					<xsl:text>(si hay) </xsl:text>
				</xsl:if>
<xsl:text>incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<example num="xPron.PronIndef.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/negIndefNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pron/negIndefNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/negIndefNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/negIndefNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronIndef.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronIndef.24.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='noPosOnly' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='noPosOnly' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> para ejemplos de los elementos negativos usados en oraciones y la discusión de las construcciones de la negación en </xsl:text>
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
</xsl:if>
		</section2>

		<section2 id="sPronNP">
			<secTitle>Los pronombres como frases nominales</secTitle>
			<p>
<xsl:text>Los pronombres se colocan normalmente solamente en el lugar de una frase nominal entera, pero pueden también ser modificados por una frase del partitivo y en algunos idiomas los pronombres se pueden modificar por los determinadores y los cuantificadores, llenando el lugar de sustantivos en ese caso.
				Los ejemplos españoles de pronombres, de demonstratives o de cuantificadores modificados incluyen los siguientes: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos los doce</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente él</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas dos</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas esos pocos</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Los ejemplos similares en </xsl:text>
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
			<example num="xPron.PronNP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/standAloneNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pron/standAloneNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/standAloneNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/standAloneNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronNP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronNP.8.1</xsl:text>
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
			<p>
<xsl:text>Además, es posible hacer un pronombre, demostrativo, o cuantificador modificar por una cláusula relativa, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos que vayan con nosotros</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente estos dos que vi</langData>
<xsl:text>.  Los ejemplos similares en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, incluido ien oraciones completas son:</xsl:text>
</p>
			<example num="xPron.PronNP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/pronRelClExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pron/pronRelClExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/pronRelClExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/pronRelClExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronNP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronNP.12.1</xsl:text>
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
			<p>
<xsl:text>Finalmente, estas categorías se pueden también modificar por una frase del partitivo (u otra frase preposicional y/o posposicional), como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente algunos de ustedes</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas que muchos de ésos</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente ésos adentro allí</langData>
<xsl:text>.   Los ejemplos similares en </xsl:text>
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
			<example num="xPron.PronNP.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/partitiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//pron/partitiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/partitiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//pron/partitiveExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPron.PronNP.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPron.PronNP.16.1</xsl:text>
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
			<p>
<xsl:text> La frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional y/o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional y/o posposicional</xsl:when>
				</xsl:choose>
<xsl:text> opcional ocurre </xsl:text>
<xsl:choose>
					<xsl:when test="//pron/@partitivePos='before'">antes</xsl:when>
					<xsl:when test="//pron/@partitivePos='after'">después</xsl:when>
					<xsl:when test="//pron/@partitivePos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del elemento que actúa como la cabeza de la frase nominal.</xsl:text>
</p>
		</section2>
	</section1>




























































































































































































</xsl:template>
</xsl:stylesheet>
