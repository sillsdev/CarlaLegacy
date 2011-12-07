<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="n">
	<section1 id="sN">
		<secTitle>Los sustantivos</secTitle>
		<p>
<xsl:text>Los sustantivos son las palabras que describen principalmente personas, animales, lugares o cosas. Pueden también ser utilizados para expresar ideas, pensamientos o emociones.</xsl:text>
</p>
		<p>
<xsl:text>En las siguientes secciones se considera la concordancia, el caso y la posesión del sustantivo en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Los tipos de sustantivos compuestos permitidos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> aparecen en la sección </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text>.  Todos los elementos que pueden modificar sustantivos en frases nominales completas se contemplan en la sección  </xsl:text>
<sectionRef sec="sNP" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sNPAgr">
			<secTitle>Concordancia</secTitle>
			<p>
<xsl:text>Muchos idiomas requieren la concordancia entre por lo menos algunos de los modificadores y el sustantivo principal. El español tiene la concordancia de número y también concordancia de género. Otros idiomas pueden tener concordancia en animado o clase. </xsl:text>
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
					<xsl:when test="//np/@agreeNumber='no'"> no hay concordancia de número. En lugar del indicador del número aparece el número o el cuantificador.</xsl:when>
					<xsl:when test="//np/@agreeNumber='yes'">los diversos modificadores nominales coinciden en número con el sustantivo principal.</xsl:when>
				</xsl:choose>
<xsl:text>  Además, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='no'">no hay concordancia en animado, número de clase, ni género entre los modificadores y el sustantivo principal.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">los modificadores y el sustantivo principal coccuerden en animado.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">los modificadores y el sustantivo principal concuerden en número de clase.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">los modificadores y el sustantivo principal concuerden en género.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<p>
<xsl:text>Algunos ejemplos que muestran la concordancia de número en las frases nominales en</xsl:text>
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
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<example num="xN.NPAgr.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeNumberExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeNumberExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeNumberExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeNumberExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.10.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesAnimacy'">
<p>
<xsl:text>Algunos ejemplos que muestran la concordancia del animado en las frases nominales en </xsl:text>
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesAnimacy'">
<example num="xN.NPAgr.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeAnimacyExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeAnimacyExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeAnimacyExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeAnimacyExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.14.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesClass'">
<p>
<xsl:text>Algunos ejemplos que muestran la concordancia de clase en las frases nominales en </xsl:text>
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesClass'">
<example num="xN.NPAgr.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeClassExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeClassExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeClassExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeClassExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.18.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<p>
<xsl:text>Algunos ejemplos que muestran la concordancia de género en las frases nominales en </xsl:text>
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<example num="xN.NPAgr.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeGenderExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeGenderExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeGenderExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeGenderExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.22.1</xsl:text>
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
		<section2 id="sNPCase">
			<secTitle>Caso</secTitle>
			<p>
<xsl:text>En los sustantivos y sus modificadores también se pueden indicar para el caso. El sistema de caso más común es el nominativo-acusativo.
					Éste es el sistema que español tiene, aunque solamente se indica el caso en los pronombres y los poseedores.
					En un sistema del nominativo-acusativo, los sujetos de los verbos intransitivos y transitivos son casos del nominativo, mientras que los objetos directos son casos del acusativo.
					Los poseedores son casos del genitivo. Los pronombres del nominativo en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>yo, nosotros, usted, ustedes, él, ella, ellos, ellas</langData>
<xsl:text>.  Los pronombres del acusativo son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>me, nos, te, le, les</langData>
<xsl:text>.  Los pronombres del genitivo incluyen: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mi, nuestro, su, suyo, suya</langData>
<xsl:text>.  Por lo tanto, decimos </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ellos le golpearon a él</langData>
<xsl:text> y no </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Les golpearon él</langData>
<xsl:text>. </xsl:text>
</p>
			<p>
<xsl:text>
					En un sistema de caso ergativo-absolutivo, los sujetos de los verbos transitivos se indican con el caso del ergativo, mientras que los objetos de verbos transitivos y los sujetos de verbos intransitivos se indican con el caso del absolutivo.
					El caso de poseedores no se fija en todos los idiomas de este tipo.  Algunos idiomas con un sistema ergativo-absolutivo tienen simplemente diversos sistemas de indicadores verbales de la concordancia, pero ningún indicador en sustantivos.
					Este tipo de indicador en la concordancia será considerado en la sección </xsl:text>
<sectionRef sec="sIPAgr" />
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>
					Algunos idiomas son aún más complejas en que tienen normalmente un sistema de caso del nominativo-acusativo pero bajo ciertas condiciones el sistema de caso cambia a ergativo-absolutivo. Esto se llama "ergatividad escindida".</xsl:text>
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
					<xsl:when test="//np/@case='none'"> no hay ningún sistema de caso. El mismo sistema de pronombres se puede utilizar en cualquier posición de la oración y no hay un indicador en los sustantivos o en ningún modificador del sustantivo basado en su posición de la oración.</xsl:when>
					<xsl:when test="//np/@case='nominative'"> tiene un sistema de caso del nominativo-acusativo. Los sujetos de los verbos intransitivos y transitivos se indican de la misma manera y utilizan el mismo sistema de pronombres, pero los objetos de los verbos transitivos se indican de una manera diferente.</xsl:when>
					<xsl:when test="//np/@case='ergative'"> tiene un sistema de caso ergativo-absolutivo. Los sujetos de los verbos intransitivos y los objetos de los verbos transitivos se indican de la misma manera y utilizan el mismo sistema de pronombres, pero los sujetos de los verbos transitivos se indican de una manera diferente.</xsl:when>
					<xsl:when test="//np/@case='split'"> tiene un sistema de caso de ergatividad escindida. El idioma sigue normalmente el sistema de caso del nominativo-acusativo, pero el sistema ergativo-absolutivo se utiliza bajo ciertas condiciones.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//np/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
					<xsl:text>  El caso nominativo es un caso predeterminado (no indicado).</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<p>
<xsl:text>Los sistemas del pronombre se proporcionan en la sección </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>.</xsl:text>
</p>
		</section2>
		<section2 id="sNPoss">
			<secTitle>Poseedores</secTitle>
			<p>
<xsl:text>La posesión se puede expresar normalmente por un pronombre posesivo (será tratado en la sección </xsl:text>
<sectionRef sec="sPronPoss" />
<xsl:text>), por un sustantivo simple, o por una frase nominal completa (véase la sección </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text>).  El caso y las características de la concordancia en los sustantivos poseídos o los sustantivos que funcionan como poseedores se especifican a continuación. </xsl:text>
</p>
			<section3 id="sNPPossCase">
				<secTitle>Caso del poseedor</secTitle>
				<xsl:if test="normalize-space(//np/@case)='none'">
<p>
<xsl:text>Conforma a lo argumentado en la sección </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text>, en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no existe ningún sistema de caso. Por lo tanto, no hay un indicador independiente que marque el caso en sustantivos ni un sistema distinto de pronombres usados para los poseedores.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)='nominative'">
<p>
<xsl:text>Con el sistema nromal de caso nominativo-acusativo que tiene el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los poseedores se indican con el caso genitivo.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)='split'">
<p>
<xsl:text>Los poseedores en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se indican con el caso genitivo, siguiendo estructura común de la parte nominativo-acusativo en el sistema de caso ergatividad escindida.  En las partes que adoptan el ergativo-absolutivo, indican a los poseedores con el </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">caso ergativo, el mismo indicador que los sujetos de los verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">caso absolutivo, el mismo indicador que los sujetos de los verbos intransitivos y los objetos de los verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">caso genitivo también.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)='ergative'">
<p>
<xsl:text>Dentro del sistema de caso ergativo-absolutivo aceptado en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, se indica a los poseedores con el </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">caso ergativo, el mismo indicador que los sujetos de los verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">caso absolutivo, el mismo indicador que los sujetos de los verbos intransitivos y los objetos de los verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">caso de genitivo, un indicador distinto para los poseedores.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none'">
<p>
<xsl:text>En algunos idiomas, en una oración nominal poseída, el sustantivo principal y cualquier modificador concuerda con el caso del poseedor. En otros idiomas, indican al poseedor con su propio caso, es decir el genitivo, mientras que el sustantivo principal se indica con el caso dependiendo de su posición relativa al verbo: nominativo o acusativo, ergativo o absolutivo dependiendo del sistema de caso.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none'">
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
						<xsl:when test="//np/@possNounCaseChange='no'">la función gramatical del sustantivo principal relativo al verbo determina su caso, no la presencia de un poseedor.</xsl:when>
						<xsl:when test="//np/@possNounCaseChange='yes'">el caso del sustantivo principal concuerda con el caso del poseedor, cuando un poseedor está presente.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<p>
<xsl:text>Los idiomas como </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> que cambian el caso del sustantivo principal cuando hay un poseedor, normalmente también camban los casos de los adjetivos correspondientes para concordar. Algunos idiomas de este tipo también cambian el caso del sustantivo principal cuando solamente un modificador adjetival está presente, incluso cuando no hay poseedor.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
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
<xsl:text>, el caso del sustantivo principal </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseChange='no'">solamente cambia cuando un poseedor está presente, aunque en esa situación un adjetivo puede o debe corresponder a este caso.</xsl:when>
						<xsl:when test="//np/@adjpCaseChange='yes'">cambia para concordar con el caso normal de un poseedor incluso si solamente un modificador adjetival estuviera presente.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
<p>
<xsl:text>Además, algunos idiomas de este último tipo tienen un afijo que indica el caso de genitivo (o el caso normal de poseedores) en el sustantivo principal para indicar que debe haber un adjetivo o un poseedor en esa frase nominal. En esta situación, el adjetivo y/o el poseedor también estarán en caso genitivo (o el caso normal de poseedores), aunque el indicador de caso no será evidente en el modificador más adelante en la frase nominal.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
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
<xsl:text>, el indicador de caso </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseAffix='no'">no se indica con un afijo.</xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">se indica de la siguiente manera.  </xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">se indica de la siguiente manera.  </xsl:when>
					</xsl:choose>
<xsl:if test="normalize-space(//np/@adjpCaseAffix)!='no' and normalize-space(//np/@adjpCaseChange)='yes'">
						<xsl:text>Cuando el </xsl:text>
						<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@case)='nominative'">
							<xsl:text>genitivo </xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
							<xsl:text>o el </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
							<xsl:text>ergativo </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
							<xsl:text>absolutivo </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:choose>
							<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">sufijo</xsl:when>
							<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefijo</xsl:when>
						</xsl:choose>
						<xsl:text> está presente en el sustantivo principal, indica que un modificador adjetival y/o un poseedor deben estar presentes en la frase. Si el adjetivo está indicado con este </xsl:text>
						<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@case)='nominative'">
							<xsl:text>genitivo </xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//np/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
							<xsl:text>o </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
							<xsl:text>ergativo </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
							<xsl:text>absolutivo </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:choose>
							<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">sufijo,</xsl:when>
							<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefijo,</xsl:when>
						</xsl:choose>
						<xsl:text> así que otro adjetivo y/o un poseedor también deben estar presentes.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			</section3>

			<section3 id="sNPPossAgreement">
				<secTitle>Concordancia del poseedor</secTitle>
				<p>
<xsl:text>La concordancia del poseedor se manifiesta comúnmente de dos formas básicas:</xsl:text>
</p>
				<ul>
					<li>
						<xsl:text>Un afijo que se encuentra en sustantivos poseídos alienables para indicar que están poseídas y por lo tanto deben tener un poseedor en la frase nominal. Los sustantivos poseídos inalienables no tienen ningún indicador, sino que siempre deben tener un poseedor. Éstos incluyen, pero no se limitan a, los términos del parentesco y las partes del cuerpo.</xsl:text>
					</li>
					<li>
						<xsl:text>Un afijo que corresponde al poseedor (o expresa posiblemente al poseedor en sí mismo). </xsl:text>
					</li>
				</ul>
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
						<xsl:when test="//np/@possAlienable='no'"> no se hace distinción</xsl:when>
						<xsl:when test="//np/@possAlienable='yes'"> se hace distinción</xsl:when>
					</xsl:choose>
<xsl:text> entre los sustantivos poseídos alienables e inalienables. </xsl:text>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
						<xsl:text>El afijo que indica los sustantivos poseídos alienables cuando tienen un poseedor es:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<example num="xN.NPoss.NPPossAgreement.10">
<table border="1">
					<tr>
						<th>Afijo posesivo</th>
						<th>Glosa o restricciones</th>
					</tr>
						<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/possAlienableAffixExample),'.','')" />
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
<xsl:text>ESCRIBA LA GLOSA (O RESTRICCIONES)</xsl:text>
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
<xsl:text>ESCRIBA LA GLOSA (O RESTRICCIONES)</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					</table>
</example>
</xsl:if>
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
<xsl:text>, los sustantivos </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAgr='no'">no se</xsl:when>
						<xsl:when test="//np/@possAgr='yes'">se</xsl:when>
					</xsl:choose>
<xsl:text> indican con un afijo pronominal o clítico que concuerda con el poseedor o expresa el poseedor en sí mismo.  </xsl:text>
<xsl:if test="normalize-space(//np/@possAgr)='yes'">
						<xsl:text>Estos afijos indican las características siguientes del poseedor:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//np/@possAgr)='yes'">
<example num="xNPosFeatures">
<table border="1">
						<tr>
							<th>Tipo de característica</th>
							<th>Característica</th>
						</tr>
						<xsl:if test="normalize-space(//np/npPossAgrPossFirst/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>persona</xsl:text>
							</td>
							<td align="left">
								<xsl:text>primera</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossExclusive/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>persona</xsl:text>
							</td>
							<td align="left">
								<xsl:text>primera exclusiva</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossInclusive/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>persona</xsl:text>
							</td>
							<td align="left">
								<xsl:text>primera inclusiva</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossSecond/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>persona</xsl:text>
							</td>
							<td align="left">
								<xsl:text>segunda</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossThird/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>persona</xsl:text>
							</td>
							<td align="left">
								<xsl:text>tercera</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossSingular/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>número</xsl:text>
							</td>
							<td align="left">
								<xsl:text>singular</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossDual/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>número</xsl:text>
							</td>
							<td align="left">
								<xsl:text>dual</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossPlural/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>número</xsl:text>
							</td>
							<td align="left">
								<xsl:text>plural</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossMasculine/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>género</xsl:text>
							</td>
							<td align="left">
								<xsl:text>masculino</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossFeminine/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>género</xsl:text>
							</td>
							<td align="left">
								<xsl:text>feminino</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossNeuter/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>género</xsl:text>
							</td>
							<td align="left">
								<xsl:text>neutro</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossAnimate/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>animado</xsl:text>
							</td>
							<td align="left">
								<xsl:text>animado</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossInanimate/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>animado</xsl:text>
							</td>
							<td align="left">
								<xsl:text>inanimado</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossHuman/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>animado</xsl:text>
							</td>
							<td align="left">
								<xsl:text>humano</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossNonHuman/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>animado</xsl:text>
							</td>
							<td align="left">
								<xsl:text>no humano</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossClassClassNumber/@checked)='yes'">
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
</xsl:if>
			</section3>
		</section2>
		<section2 id="sNPCompounds">
			<secTitle>Sustantivos compuestos</secTitle>
			<p>
<xsl:text>Mientras que el español requiere una frase con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de</langData>
<xsl:text> en esta situación, muchos otros idiomas son al igual que inglés y tienen modificadores del sustantivo.
					Pareciera que todos los sustantivos también se pueden utilizar al igual que adjetivos, pero un estudio más detallada revela que los adjetivos verdaderos se presentan antes del modificador del sustantivo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>large, round [syrup bottle]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'grande, redondo [botella del jarabe]'</xsl:text>
</gloss>
<xsl:text> pero no </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*round, syrup large bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'redondo, botella grande del jarabe'</xsl:text>
</gloss>
<xsl:text>.  Por lo tanto, los modificadores del sustantivo serán tratados al igual que sustantivos compuestos que se escriben con palabras independientes.</xsl:text>
</p>
			<p>
<xsl:text>En los ejemplos anteriores en inglés, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'botella'</xsl:text>
</gloss>
<xsl:text> es claramente el sustantivo principal porque </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'jarabe'</xsl:text>
</gloss>
<xsl:text> limita el tipo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'botella'</xsl:text>
</gloss>
<xsl:text>, no al revés. En inglés todos los sustantivos compuestos y construcciones con modificadores del sustantivo, el sustantivo principal en la serie es el de la derecha. </xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@comp)='no'">
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
<xsl:text> no hay ningún sustantivo compuesto o modificador del sustantivo que se escriben con palabras independientes. Todas se escriben como una sola palabra unida al sustantivo principal. Algunos ejemplos son los siguientes: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@comp)='yes'">
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
<xsl:text> hay sustantivos compuestos o modificadores del sustantivo que se escriben con palabras independientes.  El sustantivo principal en la serie es el de la </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@compHead='left'">izquierda</xsl:when>
					<xsl:when test="//np/@compHead='right'">derecha</xsl:when>
				</xsl:choose>
<xsl:text>. Algunos ejemplos son los siguientes:</xsl:text>
</p>
</xsl:if>
			<example num="xN.NPCompounds.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/compExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/compExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/compExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/compExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCompounds.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCompounds.12.1</xsl:text>
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
		</section2>

	</section1>






























































































































































































</xsl:template>
</xsl:stylesheet>
