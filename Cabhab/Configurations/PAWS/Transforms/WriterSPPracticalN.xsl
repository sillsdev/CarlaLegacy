<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="n">
	<section1 id="sN">
		<secTitle>Los sustantivos</secTitle>
	   <p>
<xsl:text>Los sustantivos son las palabras que describen principalmente a personas, animales, lugares o cosas. También se pueden utilizar para expresar ideas, pensamientos o emociones.</xsl:text>
</p>
	   <p>
<xsl:text>En las siguientes secciones se consideran la concordancia, el caso y la posesión del sustantivo en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Los tipos de sustantivos compuestos permitidos aparecen en la sección </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text>.  Todos los elementos que pueden modificar a sustantivos en frases nominales completas se presentan en la sección  </xsl:text>
<sectionRef sec="sNP" />
<xsl:text>.</xsl:text>
</p>
	   <section2 id="sNPAgr">
	      <secTitle>Concordancia</secTitle>
	      <p contentType="ctPracticalIntro">
<xsl:text> La concordancia de número, género, animacidad o clase se puede requerir entre por lo menos algunos de los modificadores y el sustantivo principal o núcleo de la frase nominal.</xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>En muchas lenguas se requieren la concordancia entre por lo menos algunos de los modificadores y el sustantivo principal o núcleo de la frase nominal. El español tiene la concordancia de número y también concordancia de género. Otras lenguas pueden tener concordancia en animacidad o clase. </xsl:text>
</p>
	      <p>
<xsl:text>En el </xsl:text>
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
	            <xsl:when test="//np/@agreeNumber='yes'">los diversos modificadores nominales concuerdan en número con el sustantivo principal.</xsl:when>
	         </xsl:choose>
</p>
	   	<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<p>
<xsl:text>Algunos ejemplos que muestran la concordancia de número en las frases nominales son:</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<example num="xN.NPAgr.12">
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
<xsl:with-param name="sExNumber">xN.NPAgr.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.12.1</xsl:text>
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
	   	
	   	<xsl:if test="normalize-space(//np/agreeClass/@checked)='no' and normalize-space(//np/agreeClassifier/@checked)='no' and normalize-space(//np/agreeGender/@checked)='no' and normalize-space(//np/agreeAnimacy/@checked)='no' and normalize-space(//np/agreeOtherFeat/@checked)='no' and normalize-space(//np/agreeOtherNone/@checked)='yes'">
<p>
<xsl:text>No hay concordancia en animacidad, clase, ni género entre los modificadores y el sustantivo principal. </xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//np/agreeClass/@checked)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los modificadores y el sustantivo principal concuerdan en clase.  Algunos ejemplos que muestran la concordancia de clase en las frases nominales son:</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//np/agreeClass/@checked)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
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
	   	<xsl:if test="normalize-space(//np/agreeClassifier/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>Un clasificador que concuerda con la clase o tipo del sustantivo está presente con los sustantivos que son contados o especificados, pero otros modificadores no se marcan para clase, como se muestran en estos ejemplos:</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//np/agreeClassifier/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific'">
<example num="xN.NPAgr.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeClassifierExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeClassifierExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeClassifierExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeClassifierExample))" />
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
	   	<xsl:if test="normalize-space(//np/agreeAnimacy/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos que muestran la concordancia de animacidad en las frases nominales son:</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//np/agreeAnimacy/@checked)='yes'">
<example num="xN.NPAgr.26">
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
<xsl:with-param name="sExNumber">xN.NPAgr.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.26.1</xsl:text>
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
	   	<xsl:if test="normalize-space(//np/agreeGender/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos que muestran la concordancia de género en las frases nominales son:</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//np/agreeGender/@checked)='yes'">
<example num="xN.NPAgr.30">
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
<xsl:with-param name="sExNumber">xN.NPAgr.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.30.1</xsl:text>
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
	   	<xsl:if test="normalize-space(//np/agreeOtherFeat/@checked)='yes'">
<p>
<xsl:text>Las frases nominales en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> muestran la concordancia de  ___</xsl:text>
<xsl:value-of select="//np/agreeOtherFeat" />
<xsl:text>.  Algunos ejemplos de este tipo de concordancia son:</xsl:text>
</p>
</xsl:if>
	   	<xsl:if test="normalize-space(//np/agreeOtherFeat/@checked)='yes'">
<example num="xN.NPAgr.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPAgr.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPAgr.34.1</xsl:text>
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
	      <p contentType="ctPracticalIntro">
<xsl:text>Los sustantivos y sus modificadores también pueden presentar indicadores de caso. Los sistemas de caso ayudan a distinguir la función gramatical de un sustantivo o un pronombre en relación con el verbo.</xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>Los sustantivos y sus modificadores también pueden presentar indicadores de caso. El sistema de caso más común es el nominativo-acusativo. 
	            Este es el sistema que español tiene, aunque solamente se indica el caso en los pronombres y los posesivos.  
	            En un sistema del nominativo-acusativo, los sujetos de los verbos intransitivos y transitivos son casos del nominativo, mientras que los objetos directos son casos del acusativo. 
	            Los posesivos son casos del genitivo. Los pronombres del nominativo en español son: </xsl:text>
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
	      <p contentType="ctComparativeIntro">
<xsl:text> Una lengua con un sistema de caso básico nominativo-accusativo puede usar un indicador diferente para sujeto-experimentador en vez de sujeto-agente.  Algunos verbos de sujeto-experimentador  son
	           </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>aparecer, ver, temer, encontrar, querer, gustar</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>sonreir</langData>
<xsl:text>. </xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>
	            En un sistema de caso ergativo-absolutivo, los sujetos de los verbos transitivos se indican con el caso del ergativo, mientras que los objetos de verbos transitivos y los sujetos de verbos intransitivos se indican con el caso del absolutivo.
	            El caso de posesivos no se fija en todos las lenguas de este tipo.  Algunas lenguas con un sistema ergativo-absolutivo tienen simplemente diversos sistemas de indicadores verbales de la concordancia, pero ningún indicador en sustantivos. 
	            Este tipo de indicador en la concordancia será considerado en la sección </xsl:text>
<sectionRef sec="sIPAgr" />
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>
	            Algunas lenguas son aún más complejas en que tienen normalmente un sistema de caso del nominativo-acusativo pero bajo ciertas condiciones gramaticales, como un aspecto particular o una característica de persona particular, el sistema de caso cambia a ergativo-absolutivo. Esto se llama “ergatividad escindida”.</xsl:text>
</p>
	      <p>
<xsl:text>El </xsl:text>
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
	            <xsl:when test="//typology/@case='none'"> no utiliza ningún sistema de caso. El mismo sistema de pronombres se puede utilizar en cualquier posición de la oración y no hay un indicador en los sustantivos o en ningún modificador del sustantivo basado en su posición de la oración.</xsl:when>
	            <xsl:when test="//typology/@case='nominative'"> tiene un sistema de caso del nominativo-acusativo. Los sujetos de los verbos intransitivos y transitivos se indican de la misma manera y utilizan el mismo sistema de pronombres, pero los objetos de los verbos transitivos se indican de una manera diferente.</xsl:when>
	            <xsl:when test="//typology/@case='ergative'"> tiene un sistema de caso ergativo-absolutivo. Los sujetos de los verbos intransitivos y los objetos de los verbos transitivos se indican de la misma manera y utilizan el mismo sistema de pronombres, pero los sujetos de los verbos transitivos se indican de una manera diferente.</xsl:when>
	            <xsl:when test="//typology/@case='split'"> tiene un sistema de caso de ergatividad escindida. La lengua sigue normalmente el sistema de caso del nominativo-acusativo, pero el sistema ergativo-absolutivo se utiliza bajo ciertas condiciones gramaticales.</xsl:when>
	         </xsl:choose>
<xsl:if test="normalize-space(//typology/@case)='split'"> 
	      		<xsl:text> Las condiciones gramaticales en que el sistema ergativo-absolutivo se utiliza son ___</xsl:text>
<xsl:value-of select="//typology/splitConditions" />
	      		<xsl:text>.   </xsl:text>
	      	</xsl:if>
</p>
	      
	      <p>
<xsl:text>Esto se muestra en los siguientes ejemplos de oraciones transitivas con frases nominales como sujetos y objetos:</xsl:text>
</p>
	      <example num="xN.NPCase.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.18.1</xsl:text>
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
	      <p>
<xsl:text>Observe las formas de pronombres que se presentan como sujetos y objetos en estas oraciones transitivas:</xsl:text>
</p>
	      <example num="xN.NPCase.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.22.1</xsl:text>
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
	      <xsl:if test="normalize-space(//np/@caseN)='yes' and normalize-space(//typology/@case)!='none'">
<p>
<xsl:text>En los ejemplos de oraciones intransitivas con frases nominales como sujetos, </xsl:text>
<xsl:choose>
	            <xsl:when test="//typology/@case='nominative'">los indicadores de caso son los mismos que los sujetos de los verbos transitivos arriba.</xsl:when>
	            <xsl:when test="//typology/@case='ergative'">los indicadores de caso son los mismos que los objetos de los verbos transitivos arriba.</xsl:when>
	            <xsl:when test="//typology/@case='split'">en la mayoría de situaciones los indicadores de caso son los mismos que los sujetos de los verbos transitivos arriba, pero bajo ciertas condicciones los indicadores de caso son los mismos que los objetos de los verbos transitivos.</xsl:when>
	         </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//np/@caseN)='yes' and normalize-space(//typology/@case)!='none'">
<example num="xN.NPCase.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/intExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/intExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/intExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/intExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.26.1</xsl:text>
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
	      <p>
<xsl:text>Los ejemplos de oraciones intransitivas con pronombres independientes como sujetos confirman que </xsl:text>
<xsl:choose>
	            <xsl:when test="//typology/@case='none'">no hay ningún sistema de caso, así que los mismos pronombres pueden presentarse como sujetos de ambos verbos transitivos e intransitivos y como objetos de verbos transitivos.</xsl:when>
	            <xsl:when test="//typology/@case='nominative'">los mismos pronombres pueden presentarse como sujetos de ambos verbos transitivos e intransitivos, pero los pronombres para objetos de verbos transitivos son diferentes.</xsl:when>
	            <xsl:when test="//typology/@case='ergative'">los mismos pronombres pueden presentarse como sujetos de verbos intransitivos y objetos de verbos transitivos, pero los pronombres para sujetos de verbos transitivos son diferentes.</xsl:when>
	            <xsl:when test="//typology/@case='split'">normalmente los mismos pronombres pueden presentarse como sujetos de ambos verbos transitivos e intransitivos, pero los pronombres para objetos de verbos transitivos son diferentes.  Sin embargo, bajo ciertas condiciones, los mismos pronombres pueden presentarse como sujetos de verbos intransitivos y objetos de verbos transitivos, pero los pronombres para sujetos de verbos transitivos son diferentes.</xsl:when>
	         </xsl:choose>
</p>
	      <example num="xN.NPCase.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.30.1</xsl:text>
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
	      
	      <xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseN)='yes' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>En el </xsl:text>
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
	         <xsl:when test="//typology/@caseExperiencer='no'">el sujeto-experimentador y el sujeto-agenta utiliza el mismo indicador de caso y sistema de pronombres.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesObj'">el sujeto-experimentador y el objeto directo utiliza el mismo indicador de caso y sistema de pronombres.  Normalmente el sujeto-experimentador tiene caso dativo, como el objeto indirecto, y por eso asumimos que el caso accusativo y caso dativo se marcan lo mismo en esa lengua.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesDat'">el sujeto-experimentador utiliza un indicador de caso y sistema de pronombres distinto al que utilizan tanto el sujeto-agente como el objeto directo. Esos son los que marcan el dativo y que se utilizan también para el objeto indirecto.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseN)='no' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>En el </xsl:text>
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
	         <xsl:when test="//typology/@caseExperiencer='no'">el sujeto-experimentador y el sujeto-agenta utiliza el mismo sistema de pronombres.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesObj'">el sujeto-experimentador y el objeto directo utiliza el mismo sistema de pronombres.  Normalmente el sujeto-experimentador tiene caso dativo, como el objeto indirecto, y por eso asumimos que el caso accusativo y caso dativo se marcan lo mismo en esa lengua.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesDat'">el sujeto-experimentador utiliza un sistema de pronombres distinto al que utilizan tanto el sujeto-agente como el objeto directo. Esos pronombres son los que marcan el dativo y que se utilizan también para el objeto indirecto.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>En el </xsl:text>
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
	         <xsl:when test="//typology/@caseExperiencer='no'">el sujeto-experimentador y el sujeto-agenta utiliza el mismo indicador de caso y sistema de pronombres.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesObj'">el sujeto-experimentador y el objeto directo utiliza el mismo indicador de caso y sistema de pronombres.  Normalmente el sujeto-experimentador tiene caso dativo, como el objeto indirecto, y por eso asumimos que el caso accusativo y caso dativo se marcan lo mismo en esa lengua.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesDat'">el sujeto-experimentador utiliza un indicador de caso y sistema de pronombres distinto al que utilizan tanto el sujeto-agente como el objeto directo. Esos son los que marcan el dativo y que se utilizan también para el objeto indirecto.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>En el </xsl:text>
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
	         <xsl:when test="//typology/@caseExperiencer='no'">el sujeto-experimentador y el sujeto-agenta utiliza el mismo sistema de pronombres.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesObj'">el sujeto-experimentador y el objeto directo utiliza el mismo sistema de pronombres.  Normalmente el sujeto-experimentador tiene caso dativo, como el objeto indirecto, y por eso asumimos que el caso accusativo y caso dativo se marcan lo mismo en esa lengua.</xsl:when>
	         <xsl:when test="//typology/@caseExperiencer='yesDat'">el sujeto-experimentador utiliza un sistema de pronombres distinto al que utilizan tanto el sujeto-agente como el objeto directo. Esos pronombres son los que marcan el dativo y que se utilizan también para el objeto indirecto.</xsl:when>
	      </xsl:choose>
</p>
</xsl:if>
	      
	      <xsl:if test="normalize-space(//typology/@case)='none' and normalize-space(//typology/@caseExperiencer)='no'">
<p>
<xsl:text>En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, se usan los mismos pronombres tanto para los sujetos-experimentadores como los sujetos-agentes.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)='none' and normalize-space(//typology/@caseExperiencer)!='no'">
<p>
<xsl:text>En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, al menos algunos de los prnombres que se usan para los sujetos-experimentadores son distintos que los que se usan para los sujetos-agentes.</xsl:text>
</p>
</xsl:if>
	      
	      <p>
<xsl:text>Esto se muestran en los siguientes ejemplos de oraciones transitivas con sujetos-experimentadores en que el sujeto y el objeto son frases nominales:</xsl:text>
</p>
	      <example num="xN.NPCase.46">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.46</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.46.1</xsl:text>
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
	      <p>
<xsl:text>Observe las formas de los pronombres que se presentan como sujetos-experimendadores y objetos en estas oraciones transitivas:</xsl:text>
</p>
	      <example num="xN.NPCase.50">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerPnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerPnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerPnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerPnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xN.NPCase.50</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xN.NPCase.50.1</xsl:text>
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
	      
	      <p contentType="ctPracticalIntro">
<xsl:text>Hay casos adicionales que se pueden marcar en la frase nominal en las lenguas que marcan el caso en sustantivos o frases nominales así como en pronombres. Para las lenguas sin ningún marcador de caso y las que solamente lo marcan en los pronombres, estas relaciones gramaticales adicionales normalmente se expresan con frases adposicionales.
	      </xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>Hay casos adicionales que se pueden marcar.  Estos pueden incluir el caso ablativo para una fuente o el origen, el caso genitivo para las clases o los posesivos, el caso dativo para los objetos indirectos, el caso instrumental para los medios o los instrumentos, el caso locativo para lugares, el caso vocativo para discurso directo, y el caso oblicuo que se utiliza a veces para las relaciones gramaticales de menor importancia en general. 
	         Estos casos adicionales se indican generalmente con indicadores de caso en la frase nominal en las lenguas que marcan el caso en sustantivos o frases nominales así como en pronombres.  Para las lenguas sin ningún marcador de caso y las que solamente lo marcan en los pronombres, estas relaciones gramaticales adicionales normalmente se expresan con frases adposicionales.
	      </xsl:text>
</p>
	      <xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, no hay marcadores de caso de cualquier tipo.  Por eso, las relaciones gramaticales adicionales normalmente se expresan con frases </xsl:text>
<xsl:choose>
	         <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
	         <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
	         <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
	         <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
	      </xsl:choose>
<xsl:text>, en vez de frases nominales.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, no se marca el caso en los sustantivos o en las frases nominales, solamente en los pronombres.  Por eso, las relaciones gramaticales adicionales se expresan normalmente con frases </xsl:text>
<xsl:choose>
	         <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
	         <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
	         <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
	         <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
	      </xsl:choose>
<xsl:text>, en vez de frases nominales.   Los sistemas de pronombres se presentan en la sección </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
	      
	      
	      <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>  En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los sustantivos y posiblements sus modificadores en las frases nominales se indican el caso así como los pronombres. </xsl:text>
<xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
	         <xsl:text>  El caso nominativo es un caso predeterminado (no marcado). </xsl:text>
	      </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='yes' and normalize-space(//np/caseWordOther/@checked)='no'">	            
	            <xsl:text>El marcador de caso se escribe como una palabra independiente y se presenta </xsl:text>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:text> del resto de la frase nominal.  </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='yes' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'"> 
	            <xsl:text>El marcador de caso se escriben como una palabra independiente y se presenta  ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='yes' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='yes' or normalize-space(//np/@caseWord)!='no' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' or normalize-space(//np/@caseWord)!='no' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
	            <xsl:text>El marcador de caso se escribe como una palabra independiente y se presenta </xsl:text>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:text> del resto de la frase nominal, y también puede presentarse ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
<xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='no'">	            
	            <xsl:text>Algunos de los marcadores de caso se escriben como palabras independientes y se presentan </xsl:text>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:text> del resto de la frase nominal.  </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'"> 
	            <xsl:text>Algunos de los marcadores de caso se escriben como palabras independientes y se presentan ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBefore/@checked)='yes' or normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' or normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseWordOther/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
	            <xsl:text>Algunos de los marcadores de caso se escriben como palabras independientes y se presentan  </xsl:text>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='no' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='no' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseWordBefore/@checked)='yes' and normalize-space(//np/caseWordAfter/@checked)='yes' and normalize-space(//np/caseWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
	            <xsl:text> del resto de la frase nominal, y algunos también pueden presentarse  ___</xsl:text>
<xsl:value-of select="//np/caseWordOther" />
<xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some'">
<xsl:text>Otros marcadores de caso </xsl:text>
	            <xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>se unen al principio de la palabra inicial en la frase nominal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>se unen al final de la palabra final en la frase nominal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>se unen al principio de la palabra inicial y algunos se unen al final de la palabra final en la frase nominal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>son prefijos que se unen al sustantivo principal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>son sufijos que se unen al sustantivo principal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>son prefijos y algunos son sufijos que se unen al sustantivo principal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes'">
<xsl:text>son clíticos que se unen al principio de la palabra inicial o el final de la palabra final en la frase nominal y algunos afijos que se unen al sustantivo principal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes'">
<xsl:text>  También, algunos pueden unirse  ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	               <xsl:text>.   </xsl:text>
</xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='some' and normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'"> 
	            <xsl:text>Algunos de los marcadores de caso se unen ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='no'">  <xsl:text></xsl:text>
	            <xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>Los marcadores de caso se unen al principio de la palabra inicial en la frase nominal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>Los marcadores de caso se unen al final de la palabra final en la frase nominal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'">
<xsl:text>Algunos de los marcadores de caso se unen al principio de la palabra inicial y algunos se unen al final de la palabra final en la frase nominal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>son prefijos que se unen al sustantivo principal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>Los marcadores de caso son sufijos que se unen al sustantivo principal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no'">
<xsl:text>Los marcadores de caso son prefijos y algunos son sufijos que se unen al sustantivo principal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='no' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesPrefix/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes'">
<xsl:text>Algunos de los marcadores de caso son clíticos que se unen al principio de la palabra inicial o el final de la palabra final en la frase nominal y algunos son afijos que se unen al sustantivo principal.</xsl:text>
</xsl:if>
	            <xsl:if test="normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesEnclitic/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesPrefix/@checked)='yes' or normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesSuffix/@checked)='yes'">
<xsl:text>  También, algunos pueden unirse  ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	               <xsl:text>.   </xsl:text>
</xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//np/@caseWord)='no' and normalize-space(//np/caseAttachesOther/@checked)='yes' and normalize-space(//np/caseAttachesProclitic/@checked)='no' and normalize-space(//np/caseAttachesEnclitic/@checked)='no' and normalize-space(//np/caseAttachesPrefix/@checked)='no' and normalize-space(//np/caseAttachesSuffix/@checked)='no'"> 
	            <xsl:text>Los marcadores de caso se unen  ___</xsl:text>
<xsl:value-of select="//np/caseAttachesOther" />
	            <xsl:text>.   </xsl:text>
	         </xsl:if>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>Los marcadores de caso que se utilizan con sustantivos o frases nominales en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran en el siguiente cuadro.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<example num="xCase">
<table border="1">
	            <caption>
	               <xsl:text>Marcadores de caso</xsl:text>
	            </caption>
	            <tr>
	               <th>Morfemas</th>
	               <th>Caso</th>
	               <th>Uso</th>
	            </tr>
	            <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/nominative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>nominativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos</xsl:text>
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
	                  <xsl:text>nominativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//np/accusative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.0" select="string-length(normalize-space($sExampleValue1.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.0 != 0 and $sExampleValue1.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>accusativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>objetos directos y otros usos</xsl:text>
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
	                  <xsl:text>accusativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>objetos directos y otros usos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)!='ergative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='ergative'">
<xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//np/ergative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.0" select="string-length(normalize-space($sExampleValue2.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.0 != 0 and $sExampleValue2.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>ergativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos de verbos transitivos</xsl:text>
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
	                  <xsl:text>ergativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos de verbos transitivos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//np/ergative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.0" select="string-length(normalize-space($sExampleValue3.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.0 != 0 and $sExampleValue3.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>ergativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos de verbos transitivos y posesivos</xsl:text>
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
	                  <xsl:text>ergativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos de verbos transitivos y posesivos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)!='absolutive' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='absolutive'">
<xsl:variable name="sExampleValue4.0">
<xsl:value-of select="translate(string(//np/absolutive),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.0" select="string-length(normalize-space($sExampleValue4.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.0 != 0 and $sExampleValue4.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>absolutivo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos de verbos intransitivos y objetos de verbos transitivos</xsl:text>
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
	                  <xsl:text>absolutivo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos de verbos intransitivos y objetos de verbos transitivos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:variable name="sExampleValue5.0">
<xsl:value-of select="translate(string(//np/absolutive),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.0" select="string-length(normalize-space($sExampleValue5.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.0 != 0 and $sExampleValue5.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>absolutivo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos de verbos intransitivos y objetos de verbos transitivos y posesivos</xsl:text>
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
	                  <xsl:text>absolutivo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>sujetos de verbos intransitivos y objetos de verbos transitivos y posesivos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split' or normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='genitive'">
<xsl:variable name="sExampleValue6.0">
<xsl:value-of select="translate(string(//np/genitive),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.0" select="string-length(normalize-space($sExampleValue6.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.0 != 0 and $sExampleValue6.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>genitivo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>posesivos</xsl:text>
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
	                  <xsl:text>genitivo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>posesivos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@caseExperiencer)='no'">
<xsl:variable name="sExampleValue7.0">
<xsl:value-of select="translate(string(//np/dative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.0" select="string-length(normalize-space($sExampleValue7.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.0 != 0 and $sExampleValue7.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>dativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>objetos indirectos</xsl:text>
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
	                  <xsl:text>dativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>objetos indirectos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:if test="normalize-space(//typology/@caseExperiencer)!='no'">
<xsl:variable name="sExampleValue8.0">
<xsl:value-of select="translate(string(//np/dative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.0" select="string-length(normalize-space($sExampleValue8.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.0 != 0 and $sExampleValue8.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>dativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>objetos indirectos y sujetos-experimentadores</xsl:text>
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
	                  <xsl:text>dativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>objetos indirectos y sujetos-experimentadores</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
	            <xsl:variable name="sExampleValue9.0">
<xsl:value-of select="translate(string(//np/ablative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.0" select="string-length(normalize-space($sExampleValue9.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.0 != 0 and $sExampleValue9.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>ablativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>fuentes o origen</xsl:text>
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
	                  <xsl:text>ablativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>fuentes o origen</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue10.0">
<xsl:value-of select="translate(string(//np/instrumental),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.0" select="string-length(normalize-space($sExampleValue10.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.0 != 0 and $sExampleValue10.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>instrumento</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>medios o instrumentos</xsl:text>
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
	                  <xsl:text>instrumento</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>medios o instrumentos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue11.0">
<xsl:value-of select="translate(string(//np/locative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.0" select="string-length(normalize-space($sExampleValue11.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.0 != 0 and $sExampleValue11.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>locativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>locativos</xsl:text>
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
	                  <xsl:text>locativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>locativos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue12.0">
<xsl:value-of select="translate(string(//np/vocative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.0" select="string-length(normalize-space($sExampleValue12.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.0 != 0 and $sExampleValue12.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>vocativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>discursos directos</xsl:text>
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
	                  <xsl:text>vocativo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>discursos directos</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue13.0">
<xsl:value-of select="translate(string(//np/oblique),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.0" select="string-length(normalize-space($sExampleValue13.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.0 != 0 and $sExampleValue13.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>oblicuo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>relaciones gramaticales de menor importancia en general</xsl:text>
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
	                  <xsl:text>oblicuo</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>relaciones gramaticales de menor importancia en general</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue14.0">
<xsl:value-of select="translate(string(//np/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.0" select="string-length(normalize-space($sExampleValue14.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.0 != 0 and $sExampleValue14.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
	                  <xsl:text>otro</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>cualquier otro indicador específico</xsl:text>
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
	                  <xsl:text>otro</xsl:text>
	               </td>
<td align="left">
	                  <xsl:text>cualquier otro indicador específico</xsl:text>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
</xsl:if>	      
	   </section2>
	   
		<section2 id="sNPoss">
			<secTitle>Posesivos</secTitle>
			<p>
<xsl:text>La posesión se puede expresar normalmente con un pronombre, un sustantivo simple o una frase nominal completa (véase la sección </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text>).  A continuación se especifican el caso y los accidentes gramaticales que concuerdan en los sustantivos poseídos o los sustantivos que funcionan como posesivos. </xsl:text>
<xsl:if test="normalize-space(//np/@possAbsolutive)='yes'">
<xsl:text>  También se describe el afijo especial que se presenta en sustantivos cuando no están poseídos o pluralizados.</xsl:text>
</xsl:if>
</p>
			<section3 id="sNPPossCase">
				<secTitle>Caso del posesivo</secTitle>
			   <xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>Conforma a lo argumentado en la sección </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text>, en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no existe ningún sistema de caso. Por lo tanto, no hay ninguna marca de caso en sustantivos ni un sistema distinto de pronombres usados para los posesivos.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='nominative'">
<p>
<xsl:text>Dentro del sistema de caso nominativo-acusativo usado en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, se indican los posesivos con el caso genitivo.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='split'">
<p>
<xsl:text>Los posesivos en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se indican con el caso genitivo en la parte normal que usa el nominativo-acusativo en el sistema de caso ergatividad escindida.  En las partes que adoptan el ergativo-absolutivo, se indican los posesivos con el </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">caso ergativo, el mismo marca que los sujetos de los verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">caso absolutivo, el mismo marca que los sujetos de los verbos intransitivos y los objetos de los verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">caso genitivo también.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='ergative'">
<p>
<xsl:text>Dentro del sistema de caso ergativo-absolutivo usado en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, se indicas los posesivos con el </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">caso ergativo, el mismo indicador que los sujetos de los verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">caso absolutivo, el mismo indicador que los sujetos de los verbos intransitivos y los objetos de los verbos transitivos.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">caso de genitivo, un indicador distinto para los posesivos.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>

			   <xsl:if test="normalize-space(//typology/@case)!='none'">
<p contentType="ctPracticalIntro">
<xsl:text>En el </xsl:text>
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
			         <xsl:when test="//np/@possNounCaseChange='no'">la relación gramatical del sustantivo principal relativo al verbo determina su caso, no la presencia de un posesivo.</xsl:when>
			         <xsl:when test="//np/@possNounCaseChange='yes'">el caso del sustantivo principal concuerda con el caso del posesivo, cuando se presenta un posesivo.</xsl:when>
			      </xsl:choose>
<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<xsl:text> Si en la frase nominal hay un modificador adjetival, el caso del sustantivo principal  </xsl:text>
			         <xsl:choose>
			            <xsl:when test="//np/@adjpCaseChange='no'">solamente cambia cuando un posesivo se presenta, aunque en esa situación el modificador adjetival puede o debe corresponder a este caso.</xsl:when>
			            <xsl:when test="//np/@adjpCaseChange='yes'">cambia para concordar con el caso normal de un posesivo incluso si el posesivo no está explícito.</xsl:when>
			         </xsl:choose>
			      </xsl:if>
<xsl:if test="normalize-space(//np/@adjpCaseAffix)!='no' and normalize-space(//np/@adjpCaseChange)='yes'">
			         <xsl:text> Cuando el </xsl:text>
			         <xsl:text></xsl:text>
			         <xsl:choose>
			            <xsl:when test="//np/@adjpCaseAffix='yesSuffix'">sufijo</xsl:when>
			            <xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefijo</xsl:when>
			         </xsl:choose>
			         <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
			            <xsl:text> genitivo </xsl:text>
			         </xsl:if>
			         <xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
			            <xsl:text>o</xsl:text>
			         </xsl:if>
			         <xsl:text></xsl:text>
			         <xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
			            <xsl:text> ergativo </xsl:text>
			         </xsl:if>
			         <xsl:text></xsl:text>
			         <xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
			            <xsl:text> absolutivo </xsl:text>
			         </xsl:if>
			         <xsl:text> se presenta en el sustantivo principal, indica que un modificador adjetival y/o un posesivo deben estar presentes en la frase. Si el adjetivo está marcado con este </xsl:text>
			         <xsl:text></xsl:text>
			         <xsl:choose>
			            <xsl:when test="//np/@adjpCaseAffix='yesSuffix'">sufijo</xsl:when>
			            <xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefijo</xsl:when>
			         </xsl:choose>
			         <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
			            <xsl:text> genitivo </xsl:text>
			         </xsl:if>
			         <xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
			            <xsl:text>o</xsl:text>
			         </xsl:if>
			         <xsl:text></xsl:text>
			         <xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
			            <xsl:text> ergativo </xsl:text>
			         </xsl:if>
			         <xsl:text></xsl:text>
			         <xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
			            <xsl:text> absolutivo </xsl:text>
			         </xsl:if>
			         <xsl:text> entonces otro adjetivo y/o un posesivo también deben estar presentes.</xsl:text>
			      </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none'">
<p contentType="ctComparativeIntro">
<xsl:text>En algunas lenguas, en una oración nominal poseída, el sustantivo principal y cualquier modificador concuerda con el caso del posesivo. En otras lenguas, se marca el posesivo con su propio caso, es decir el genitivo, mientras que el sustantivo principal se marca con el caso dependiendo de su posición relativa al verbo: nominativo o acusativo, ergativo o absolutivo dependiendo del sistema de caso.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none'">
<p contentType="ctComparativeIntro">
<xsl:text>En el </xsl:text>
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
						<xsl:when test="//np/@possNounCaseChange='no'">la relación gramatical del sustantivo principal relativo al verbo determina su caso, no la presencia de un posesivo.</xsl:when>
						<xsl:when test="//np/@possNounCaseChange='yes'">el caso del sustantivo principal concuerda con el caso del posesivo, cuando un posesivo se presenta.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>Las lenguas como el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> que cambian el caso del sustantivo principal cuando se presnta un posesivo, normalmente también cambian los casos de los adjetivos correspondientes para concordar. Algunas lenguas de este tipo también cambian el caso del sustantivo principal cuando solamente un modificador adjetival se presenta, incluso cuando no hay un posesivo.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>En el </xsl:text>
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
					   <xsl:when test="//np/@adjpCaseChange='no'">solamente cambia cuando un posesivo se presenta, aunque en esa situación el modificador adjetival  puede o debe corresponder a este caso.</xsl:when>
					   <xsl:when test="//np/@adjpCaseChange='yes'">cambia para concordar con el caso normal de un posesivo incluso si solamente se trata de un modificador adjetival.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>Además, algunas lenguas de este último tipo tienen un afijo que indica el caso genitivo (o el caso normal de posesivos) en el sustantivo principal para indicar que debe haber un adjetivo o un posesivo en esa frase nominal. En esta situación, el adjetivo y/o el posesivo también tienen el caso genitivo (o el caso normal de posesivos), aunque el indicador de caso no está explícito en el modificador más adelante en la frase nominal.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@adjpCaseChange)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>En el </xsl:text>
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
						<xsl:when test="//np/@adjpCaseAffix='no'">no se marca con un afijo.</xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">se marca en la siguiente manera.  </xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">se marca en la siguiente manera.  </xsl:when>
					</xsl:choose>
<xsl:if test="normalize-space(//np/@adjpCaseAffix)!='no' and normalize-space(//np/@adjpCaseChange)='yes'">
						<xsl:text>Cuando el </xsl:text>
					   <xsl:text></xsl:text>
					   <xsl:choose>
					      <xsl:when test="//np/@adjpCaseAffix='yesSuffix'">sufijo</xsl:when>
					      <xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefijo</xsl:when>
					   </xsl:choose>
					   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
							<xsl:text> genitivo </xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
							<xsl:text>o</xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
							<xsl:text> ergativo </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
							<xsl:text> absolutivo </xsl:text>
						</xsl:if>
						<xsl:text> se presenta en el sustantivo principal, indica que un modificador adjetival y/o un posesivo debe presentarse en la frase. Si el adjetivo está marcado con este </xsl:text>
					   <xsl:text></xsl:text>
					   <xsl:choose>
					      <xsl:when test="//np/@adjpCaseAffix='yesSuffix'">sufijo</xsl:when>
					      <xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefijo</xsl:when>
					   </xsl:choose>
					   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
							<xsl:text> genitivo </xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
							<xsl:text>o</xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
							<xsl:text> ergativo </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
							<xsl:text> absolutivo </xsl:text>
						</xsl:if>
						<xsl:text> entonces otro adjetivo y/o un posesivo también debe presentarse.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			</section3>
			
			<section3 id="sNPPossAgreement">
				<secTitle>Concordancia del posesivo</secTitle>
				<p>
<xsl:text>La concordancia del posesivo se manifiesta comúnmente de dos formas básicas:</xsl:text>
</p>
				<ul>
					<li>
					   <xsl:text>Un afijo que se encuentra en sustantivos de posesión alienable para indicar que están poseídos y por lo tanto deben tener un posesivo en la frase nominal. Los sustantivos de posesión inalienable no tienen ningún indicador, pero siempre deben tener un posesivo. Estos incluyen pero no se limitan a los términos de parentesco y las partes del cuerpo.</xsl:text>
					</li>
					<li>
					   <xsl:text>Un afijo que concuerda con el posesivo (o posiblemente expresa al poseedor mismo). </xsl:text>
					</li>
				</ul>
				<p>
<xsl:text>En el </xsl:text>
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
<xsl:text> entre los sustantivos de posesión alienable y los de posesión inalienable. </xsl:text>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
					   <xsl:text>El afijo que marca los sustantivos de posesión alienable cuando tienen un poseedor es:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<example num="xN.NPoss.NPPossAgreement.10">
<table border="1">
					<tr>
						<th>Afijo posesivo</th>
						<th>Glosa</th>
					</tr>
						<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possAlienableAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
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
				<p>
<xsl:text>En el </xsl:text>
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
<xsl:text> marcan con un afijo pronominal o clítico que concuerda con el posesivo o expresa al poseedor mismo.  </xsl:text>
<xsl:if test="normalize-space(//np/@possAgr)='yes'">
					   <xsl:text>Los pronombres personales dependientes que funcionan como posesivos se presentan en la sección </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>. </xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
			   <p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNPPoss" />
<xsl:text> para ejemplos de sustantivos poseídos.</xsl:text>
</p>
			</section3>
		   <xsl:if test="normalize-space(//np/@possAbsolutive)='yes'">
<section3 id="sNPossAbsolutive">
		      <secTitle>Indicador absolutivo</secTitle>
		   	<p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene un afijo que se presenta en sustantivos cuando no están poseídos o pluralizados, o tal vez cuando no tiene ningún modificador. Este afijo es conocido como el indicador absolutivo, pero el nombre no está relacionado con el indicador de caso absolutivo usado en lenguas con un sistema de caso ergativo-absolutivo.</xsl:text>
</p>
		      <p>
<xsl:text>Las formas de esta afijo que se utilizan en el </xsl:text>
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
		      <xsl:if test="normalize-space(//np/@possAbsolutive)='yes'">
<example num="xN.NPoss.NPossAbsolutive.8">
<table border="1">
		            <tr>
		               <th>Afijo absolutivo</th>
		               <th>Glosa</th>
		            </tr>
		            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possAbsolutiveAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
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
		      
		   </section3>
</xsl:if>
		</section2>
		<section2 id="sNPCompounds">
			<secTitle>Sustantivos compuestos</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Mientras que el español requiere una frase con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de</langData>
<xsl:text> en esta situación, muchas otras lenguas tienen modificadores del sustantivo.  
					Parece que todos los sustantivos también se pueden funcionar como adjetivos, pero un estudio más detallada revela que los adjetivos verdaderos se presentan antes del modificador del sustantivo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>large, round [syrup bottle]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘grande, redondo [botella del jarabe]’</xsl:text>
</gloss>
<xsl:text> pero no </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*round, syrup large bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘redondo, botella grande del jarabe’</xsl:text>
</gloss>
<xsl:text>.  Por lo tanto, los modificadores del sustantivo se tratan como sustantivos compuestos que se escriben con palabras independientes.</xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>En los ejemplos anteriores en inglés, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘botella’</xsl:text>
</gloss>
<xsl:text> es claramente el sustantivo principal porque </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘jarabe’</xsl:text>
</gloss>
<xsl:text> limita el tipo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘botella’</xsl:text>
</gloss>
<xsl:text>, no al revés. En inglés, en todos los sustantivos compuestos y construcciones con modificadores del sustantivo, el sustantivo principal en la serie es el de la derecha. </xsl:text>
</p>
		   <p>
<xsl:text>Los sustantivos compuestos incluyen tanto los que se combinan en una sola palabra como los que se escriben con dos o más palabras independientes. Algunas categorías típicas de los sustantivos compuestos se ejemplifican aquí.</xsl:text>
</p>
		   <example num="xN.NPCompounds.10">
<table border="1">
		         <caption>
<xsl:text>Compuestos para partes del cuerpo</xsl:text>
</caption>
		         <tr>
		            <th>Compuesto</th>
		            <th>Glosa para cada palabra</th>
		            <th>Glosa para el compuesto</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compBodyPartExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
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
		   <example num="xN.NPCompounds.12">
<table border="1">
		         <caption>
<xsl:text>Compuestos para términos de parentesco</xsl:text>
</caption>
		         <tr>
		            <th>Compuesto</th>
		            <th>Glosa para cada palabra</th>
		            <th>Glosa para el compuesto</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compKinshipExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
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
		   <example num="xN.NPCompounds.14">
<table border="1">
		         <caption>
<xsl:text>Compuestos para alimentos</xsl:text>
</caption>
		         <tr>
		            <th>Compuesto</th>
		            <th>Glosa para cada palabra</th>
		            <th>Glosa para el compuesto</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compFoodExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
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
		   <example num="xN.NPCompounds.16">
<table border="1">
		         <caption>
<xsl:text>Compuestos que describen el material usado para construirlos</xsl:text>
</caption>
		         <tr>
		            <th>Compuesto</th>
		            <th>Glosa para cada palabra</th>
		            <th>Glosa para el compuesto</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compMaterialExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
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
		   <example num="xN.NPCompounds.18">
<table border="1">
		         <caption>
<xsl:text>Otros sustantivos compuestos</xsl:text>
</caption>
		         <tr>
		            <th>Compuesto</th>
		            <th>Glosa para cada palabra</th>
		            <th>Glosa para el compuesto</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/compExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
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
		   
		   <xsl:if test="normalize-space(//np/@comp)='no'">
<p>
<xsl:text>Como se muestra en los ejemplos, en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no hay ningún sustantivo compuesto o modificador del sustantivo que se escriben con palabras independientes. Todas se escriben como una sola palabra unida al sustantivo principal.  </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@compHeadMorpheme='left'">La raíz de la izquierda es </xsl:when>
		         <xsl:when test="//np/@compHeadMorpheme='right'">La raíz de la izquierda  es </xsl:when>
		         <xsl:when test="//np/@compHeadMorpheme='either'">Cualquiera raíz puede ser </xsl:when>
		      </xsl:choose>
<xsl:text>el núcleo en los compuestos de una sola palabra.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@comp)='yes'">
<p>
<xsl:text>Como se muestra en los ejemplos, en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> hay sustantivos compuestos o modificadores del sustantivo que se escriben con palabras independientes. </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@compHead='left'">El sustantivo de la izquierda en la serie es </xsl:when>
		         <xsl:when test="//np/@compHead='right'">El sustantivo de la derecha en la serie es </xsl:when>
		         <xsl:when test="//np/@compHead='either'">Cualquier sustantivo en la serie puede ser </xsl:when>
		      </xsl:choose>
<xsl:text>el sustantivo principal en los compuestos de varias palabras.  En los compuestos que se escriben como una sola palabra,  </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@compHeadMorpheme='left'">la raíz a la izquierda es </xsl:when>
		         <xsl:when test="//np/@compHeadMorpheme='right'">la raíz a la izquierda  es </xsl:when>
		         <xsl:when test="//np/@compHeadMorpheme='either'">cualquiera raíz puede ser </xsl:when>
		      </xsl:choose>
<xsl:text>el núcleo.</xsl:text>
</p>
</xsl:if>
			</section2>

	</section1>
	
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
			
			
			
		
		
			
			
			
		
		
			
		
		
			
		
		
			
		
		
	
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
   
      
      
      
      
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
      
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
       
         
         
         
         
         
      
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
  
      
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	

	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
		 
		
	
	
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
	
	
		
	
	
	
	
		
		
		
	
	
	
		
		
		
	
		
		
	
	
		
		
		

		
		
		
	
	
		
		
		
	
	
		
	
	
		
	
   
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
   
   
      
   
</xsl:template>
</xsl:stylesheet>
