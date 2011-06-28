<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="n">
	<section1 id="sN">
		<secTitle>Los sustantivos</secTitle>
		<p>
<xsl:text>Los sustantivos son las palabras que describen principalmente personas, animales, lugares o cosas. Pueden también ser utilizados para expresar ideas, pensamientos o emociones.</xsl:text>
</p>
		<p>
<xsl:text>Las secciones siguientes cubren el acuerdo, el caso y la posesión del sustantivo de </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Los tipos de compuestos del sustantivo permitidos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se dan en la sección </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text>.  Todos los elementos que puede modificar sustantivos en frases nominales completas se cubren en la sección  </xsl:text>
<sectionRef sec="sNP" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sNPAgr">
			<secTitle>El acuerdo</secTitle>
			<p>
<xsl:text>Muchos idiomas requieren el acuerdo entre por lo menos algunos de los modificantes y el sustantivo principal. El español tiene el acuerdo de número y también acuerdo de género. Otros idiomas pueden tener acuerdo en animado o clase. </xsl:text>
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
					<xsl:when test="//np/@agreeNumber='no'"> no hay acuerdo de número. En lugar, la marca del número viene del número o del cuantificador.</xsl:when>
					<xsl:when test="//np/@agreeNumber='yes'">los varios modificantes nominales acuerden en número con el sustantivo principal.</xsl:when>
				</xsl:choose>
<xsl:text>  Además, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='no'">no hay acuerdo en animado, número de clase, ni género entre los modificantes y el sustantivo principal.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">los modificantes y el sustantivo principal acuerden en animado.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">los modificantes y el sustantivo principal acuerden en número de clase.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">los modificantes y el sustantivo principal acuerden en género.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<p>
<xsl:text>Los ejemplos que demuestran el acuerdo de número en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> frases nominales incluyen:</xsl:text>
</p>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<example num="xN.NPAgr.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeNumberExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//np/agreeNumberExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeNumberExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/agreeNumberExample)" />
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesAnimacy'">
<p>
<xsl:text>Los ejemplos que demuestran el acuerdo del animado en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> frases nominales incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@agreeOther)='yesAnimacy'">
<example num="xN.NPAgr.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeAnimacyExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//np/agreeAnimacyExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeAnimacyExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/agreeAnimacyExample)" />
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesClass'">
<p>
<xsl:text>Los ejemplos que demuestran el acuerdo de la clase en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> frases nominales incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@agreeOther)='yesClass'">
<example num="xN.NPAgr.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeClassExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//np/agreeClassExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeClassExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/agreeClassExample)" />
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<p>
<xsl:text>Los ejemplos que demuestran el acuerdo de género en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> frases nominales incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<example num="xN.NPAgr.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeGenderExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//np/agreeGenderExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeGenderExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/agreeGenderExample)" />
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
		<section2 id="sNPCase">
			<secTitle>El caso</secTitle>
			<p>
<xsl:text>Los sustantivos y sus modificantes se pueden también marcar para el caso. El sistema de caso más común es nominativo-acusativo.
					Éste es el español del sistema tiene, aunque solamente marcan los pronombres y a los poseedores para el caso en español.
					En un sistema del nominativo-acusativo, los temas de verbos intransitivos y transitivos están en caso nominativo, mientras que los objetos directos son caso de acusativo.
					Los poseedores son caso de genitivo. Los pronombres nominativos en español son: </xsl:text>
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
					En un sistema de caso ergativo-absolutivo, los temas de verbos transitivos se marcan con el caso ergativo, mientras que los objetos de verbos transitivos y los temas de verbos intransitivos se marcan con el caso absolutivo.
					El caso de poseedores no se fija en todos los idiomas de este tipo.  Algunos idiomas con un sistema ergativo-absolutivo tienen simplemente diversos sistemas de marcadores verbales del acuerdo, pero ninguna marca en sustantivos.
					Este tipo de marca del acuerdo será cubrido en la sección </xsl:text>
<sectionRef sec="sIPAgr" />
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>
					Algunos idiomas son aún más complejas en que tienen normalmente un sistema del nominativo-acusativo pero bajo algunas condiciones el sistema de caso cambia a ergativo-absolutivo. Esto se llama "ergativito-partido".</xsl:text>
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
					<xsl:when test="//np/@case='none'"> no tiene ningún sistema de caso. El mismo sistema de pronombres se puede utilizar en cualquier posición en la oración y no hay marca en sustantivos o en ningunos modificantes del sustantivo basados en su posición en la oración.</xsl:when>
					<xsl:when test="//np/@case='nominative'"> tiene un sistema de caso del nominativo-acusativo. Los temas de verbos intransitivos y transitivos se marcan de la misma manera y utilizan el mismo sistema de pronombres, pero los objetos de verbos transitivos se marcan diferentemente.</xsl:when>
					<xsl:when test="//np/@case='ergative'"> tiene un sistema de caso ergativo-absolutivo. Los temas de verbos intransitivos y los objetos de verbos transitivos se marcan de la misma manera y utilizan el mismo sistema de pronombres, pero los temas de verbos transitivos se marcan diferentemente.</xsl:when>
					<xsl:when test="//np/@case='split'"> tiene un sistema de caso de ergativo-partido. El idioma sigue normalmente el sistema de caso del nominativo-acusativo, pero el sistema ergativo-absolutivo se utiliza bajo ciertas condiciones.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//np/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
					<xsl:text>  El caso nominativo es el caso del "default" (no marcado).</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<p>
<xsl:text>Los sistemas del pronombre serán dados en la sección </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>.</xsl:text>
</p>
		</section2>
		<section2 id="sNPoss">
			<secTitle>Los poseedores</secTitle>
			<p>
<xsl:text>La posesión se puede expresar normalmente por un pronombre posesivo (ser tratado en la sección </xsl:text>
<sectionRef sec="sPronPoss" />
<xsl:text>), por un sustantivo simple, o por una frase nominal completa (véase la sección </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text>).  El caso y las características del acuerdo en los sustantivos poseídos o los sustantivos que actúan como poseedores se cubre aquí. </xsl:text>
</p>
			<section3 id="sNPPossCase">
				<secTitle>Caso del poseedor</secTitle>
				<xsl:if test="normalize-space(//np/@case)='none'">
<p>
<xsl:text>Según lo discutido en la sección </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text>, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene ningún sistema de caso. Por lo tanto, no hay marca separada del caso en sustantivos ni un sistema distinto de pronombres usados para los poseedores.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)='nominative'">
<p>
<xsl:text>Con el sistema de caso nominativo-acusativo del normal siguió por </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los poseedores se marca con el caso de genitivo.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)='split'">
<p>
<xsl:text>Marcan a los poseedores en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> con el caso de genitivo, siguiendo la pieza normal del nominativo-acusativo del sistema de caso de ergativo-partido.  En las piezas que exhiben ergativo-partido, marcan a los poseedores con el </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">caso ergativo, la misma marca que los temas de verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">caso absolutivo, la misma marca que los temas de verbos intransitivos y los objetos de verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">caso de genitivo también.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)='ergative'">
<p>
<xsl:text>Dentro del sistema de caso ergativo-absolutivo seguido por </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, marcan a los poseedores con el </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">caso ergativo, la misma marca que los temas de verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">caso absolutivo, la misma marca que los temas de verbos intransitivos y los objetos de verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">caso de genitivo, una marca distinta para los poseedores.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none'">
<p>
<xsl:text>En algunos idiomas, en una oración nominal poseída el sustantivo principal y cualquier modificante empareja el caso del poseedor. En otros idiomas, marcan al poseedor con su propio caso, dice genitivo, mientras que el sustantivo principal se marca con el caso dependiendo de su posición concerniente al verbo: nominativo o acusativo, ergativo o absolutivo dependiendo del sistema de caso.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none'">
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
						<xsl:when test="//np/@possNounCaseChange='no'">la función gramatical del sustantivo principal relativo al verbo determina su caso, no la presencia de un poseedor.</xsl:when>
						<xsl:when test="//np/@possNounCaseChange='yes'">el caso del sustantivo principal empareja el caso del poseedor, cuando un poseedor está presente.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<p>
<xsl:text>Los idiomas como </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> que cambian el caso del sustantivo principal cuando un poseedor es actual normalmente también cambio el caso de los adjetivos de intervención a emparejar. Algunos idiomas de este tipo también cambian el caso del sustantivo principal cuando solamente un modificante adjetival está presente, incluso cuando no hay poseedor.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
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
<xsl:text>, el caso del sustantivo principal </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseChange='no'">solamente cambio cuando un poseedor está presente, aunque en esa situación que un adjetivo de intervención puede o debe también llevar este caso.</xsl:when>
						<xsl:when test="//np/@adjpCaseChange='yes'">cambio para emparejar el caso normal de un poseedor incluso si apenas un modificante adjetival está presente.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
<p>
<xsl:text>Además, algunos idiomas de este último tipo tienen un afijo abierto que marque el caso de genitivo (o el caso normal de poseedores) en el sustantivo principal para indicar que debe haber un adjetivo o un poseedor en esa frase nominal. En esta situación, el adjetivo y/o el poseedor también estarán en caso de genitivo (o el caso normal de poseedores), aunque la marca del caso no será abierta en el primero modificante de la frase nominal.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//np/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
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
<xsl:text>, la marca del caso </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseAffix='no'">no se dirige vía un afijo.</xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">se dirige de esta manera distintiva.  </xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">se dirige de esta manera distintiva.  </xsl:when>
					</xsl:choose>
<xsl:if test="normalize-space(//np/@adjpCaseAffix)!='no' and normalize-space(//np/@adjpCaseChange)='yes'">
						<xsl:text>Cuando el </xsl:text>
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
							<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">sufijo</xsl:when>
							<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefijo</xsl:when>
						</xsl:choose>
						<xsl:text> está presente en el sustantivo principal, indica que un modificante adjetival y/o un poseedor deben estar presentes en la frase. Si el adjetivo se marca con este </xsl:text>
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
						<xsl:text> entonces otro adjetivo y/o un poseedor debe también estar presente.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			</section3>

			<section3 id="sNPPossAgreement">
				<secTitle>El acuerdo del poseedor</secTitle>
				<p>
<xsl:text>El acuerdo del poseedor viene normalmente en dos formas básicas:</xsl:text>
</p>
				<ul>
					<li>
						<xsl:text>Un afijo que ocurre en sustantivos "alienably" poseídos para indicar que están poseídas y por lo tanto debe tener un poseedor en la frase nominal. Los sustantivos "inalienably" poseídos no toman ninguna marca, sino deben siempre tener un poseedor. Éstos incluyen, pero no se limitan a, los términos del parentesco y las partes del cuerpo.</xsl:text>
					</li>
					<li>
						<xsl:text>Un afijo que conviene con el poseedor (o expresa posiblemente al poseedor por sí mismo). </xsl:text>
					</li>
				</ul>
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
						<xsl:when test="//np/@possAlienable='no'"> no hace distinguir</xsl:when>
						<xsl:when test="//np/@possAlienable='yes'"> hace una distinción</xsl:when>
					</xsl:choose>
<xsl:text> entre los sustantivos "alienably" e "inalienably" poseídos. </xsl:text>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
						<xsl:text>El afijo que las marcas sustantivos "alienably" poseídos cuando tienen un poseedor es:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<example num="xN.NPoss.NPPossAgreement.10">
<table border="1">
					<tr>
						<th>Afijo posesivo</th>
						<th>Significado o restricciones</th>
					</tr>
						<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/possAlienableAffixExample),'.','')" />
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
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los sustantivos </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAgr='no'">no son</xsl:when>
						<xsl:when test="//np/@possAgr='yes'">son</xsl:when>
					</xsl:choose>
<xsl:text> marcados con un afijo pronominal o clitic que conviene con el poseedor o expresa el poseedor por sí mismo.  </xsl:text>
<xsl:if test="normalize-space(//np/@possAgr)='yes'">
						<xsl:text>Estos afijos marcan las características siguientes del poseedor:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//np/@possAgr)='yes'">
<example num="xN.NPoss.NPPossAgreement.14">
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
			<secTitle>Los compuestos del sustantivo</secTitle>
			<p>
<xsl:text>Mientras que el español requiere una frase con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de</langData>
<xsl:text> en esta situación, muchos otros idiomas son como inglés, en que tienen modificantes del sustantivo.
					Puede parecer como todos los sustantivos se pueden también utilizar como adjetivos, pero una mirada más atenta revela que los adjetivos verdaderos vienen antes del modificante del sustantivo, como en </xsl:text>
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
<xsl:text>.  Por lo tanto, los modificantes del sustantivo serán tratados como sustantivos compuestos que se escriban como palabras separadas.</xsl:text>
</p>
			<p>
<xsl:text>En los ejemplos ingleses arriba, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'botella'</xsl:text>
</gloss>
<xsl:text> está luego claramente el sustantivo principal algo que el </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'jarabe'</xsl:text>
</gloss>
<xsl:text>, porque el </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'jarabe'</xsl:text>
</gloss>
<xsl:text> está restringiendo el tipo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'botella'</xsl:text>
</gloss>
<xsl:text>, no la otra manera alrededor. En todos los sustantivos compuestos y construcciones del modificante del sustantivo en inglés, la cabeza es el sustantivo de derecha en la serie. </xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@comp)='no'">
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
<xsl:text> no tiene ningunos sustantivos compuestos o modificantes del sustantivo que se escriban como palabras separadas. Todas se escriben como sola palabra con el sustantivo principal. Los ejemplos incluyen: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@comp)='yes'">
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
<xsl:text> tiene los sustantivos compuestos o modificantes del sustantivo que se escriben como palabras separadas.  Extremo</xsl:text>
<xsl:choose>
					<xsl:when test="//np/@compHead='left'">izquierdo</xsl:when>
					<xsl:when test="//np/@compHead='right'">de derecha</xsl:when>
				</xsl:choose>
<xsl:text> el sustantivo es la cabeza en estas construcciones. Los ejemplos incluyen:</xsl:text>
</p>
</xsl:if>
			<example num="xN.NPCompounds.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/compExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//np/compExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/compExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/compExample)" />
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
		</section2>

	</section1>






























































































































































































</xsl:template>
</xsl:stylesheet>
