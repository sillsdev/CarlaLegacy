<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="np">
	<section1 id="sNP">
		<secTitle>Las frases nominales</secTitle>
		<p>
<xsl:text>Las frases nominales pueden ser muy complejas.  Esta sección se enfoca en el orden de los modificadores que se escriben como palabras independientes permitidos en frases nominales con sustantivos comunes como el sustantivo principal. Se consideran la modificación producida por los artículos, los demostrativos, los posesivos, los cuantificadores y las palabras de grado, las frases adjetivales y las frases  </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
			</xsl:choose>
<xsl:text>. Los temas de participios y gerundios se tratan al final de esta sección, pero véase la sección </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text> para considerar los sustantivos compuestos si se escriben como una sola palabra o no. Las frases nominales que tienen nombres propios como núcleo se discuten en la sección </xsl:text>
<sectionRef sec="sProp" />
<xsl:text> y las frases que tienen pronombres de cualquier tipo o cuantificadores como núcleo se analizan en las secciones </xsl:text>
<sectionRef sec="sPronNP" />
<xsl:text> y </xsl:text>
<sectionRef sec="sQPPartitive" />
<xsl:text>.  Las cláusulas relativas, que normalmente aparecen al final de una frase nominal, se tratan en la sección </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
	   <p>
<xsl:text>Se empieza con los modificadores que tienen el alcance o ámbito más amplio, y luego se avanza presentando otros elementos con ámbito más limitado y más cerca del sustantivo..</xsl:text>
</p>
	   <section2 id="sNPDegree">
	      <secTitle>Cuantificadors y palabras de grado con con ámbito amplio  </secTitle>
	      <p contentType="ctPracticalIntro">
<xsl:text>Los cuantificadores de ámbito amplio  y palabras de grado que modifican a la frase nominal completa fueron analizadas en la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text>.  </xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>Los cuantificadores de ámbito amplio  y palabras de grado que modifican a la frase nominal,  tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente</langData>
<xsl:text>, fueron analizadas en la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text>.  </xsl:text>
</p>

	      <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@npDegreeClassifier)='yes'">
<p>
<xsl:text>El cuadro siguiente muestra un resumen de cómo se expresan las raíces de los cuantificadores de ámbito amplio y palabras de grado que modifican a la frase nominal completa en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Cada forma puede presentarse con el clasificador apropiado.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@npDegreeClassifier)!='yes'">
<p>
<xsl:text>El cuadro siguiente muestra un resumen de cómo se expresan los cuantificadores de ámbito amplio y palabras de grado que modificana la frase nominal completa en el </xsl:text>
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
	      <example num="xNP.NPDegree.12">
<table border="1">
	            <tr>
	               <th>Morfemas</th>
	               <th>Glosa</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/all),'.','')" />
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
<xsl:text>todos</xsl:text>
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
<xsl:text>todos</xsl:text>
</gloss>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//qp/almost),'.','')" />
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
	                  <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>casi</xsl:text>
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
<xsl:text>casi</xsl:text>
</gloss>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	            <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//qp/only),'.','')" />
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
	                  <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>solamente o apenas</xsl:text>
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
<xsl:text>solamente o apenas</xsl:text>
</gloss>
	               </td>
</tr>
</xsl:otherwise>
</xsl:choose>
	         </table>
</example>
	      
	      <xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Los cuantificadores y palabras de grado de ámbito amplio que son palabras independientes se presentan </xsl:text>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosOther/@checked)='no'">
<xsl:text> del resto de la frase nominal.  </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='no' and normalize-space(//qp/NPDegreePosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/npDegreePosOther" />
<xsl:text>.  </xsl:text>
	         </xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosOther/@checked)='yes' or normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosOther/@checked)='yes' or normalize-space(//qp/npDegreePosBoth/@checked)='yes' and normalize-space(//qp/npDegreePosOther/@checked)='yes'">
<xsl:text> del resto de la frase nominal y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//qp/npDegreePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
</p>
</xsl:if>
	      
	      <xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Algunas ejemplos de las palabras independientes en frases nominales completas son:</xsl:text>
</p>
</xsl:if>                        
	      <example num="xNP.NPDegree.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.18.1</xsl:text>
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
	      
	      <xsl:if test="normalize-space(//qp/@npDegree)='no'">
<p>
<xsl:text>Estos elementos no se expresan como palabras independientes. Por el contrario, todos se unen a otra palabra de la frase nominal.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Algunos de estos elementos no se expresan como palabras independientes. Por el contrario, se unen a otra palabra de la frase nominal.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes'">
<p>
<xsl:text>Algunas ejemplos de los clíticos en frases nominales completas son:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes'">
<example num="xNP.NPDegree.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/npDegreeCliticExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/npDegreeCliticExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/npDegreeCliticExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/npDegreeCliticExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.26.1</xsl:text>
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
	      <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<p>
<xsl:text>Algunas ejemplos de los afijos en frases nominales completas son:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<example num="xNP.NPDegree.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/npDegreeAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/npDegreeAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/npDegreeAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/npDegreeAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.30.1</xsl:text>
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
	      <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes'">
<p>
<xsl:text>Algunas ejemplos de las formas que se unen como se permiten en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluídos en frases nominales completas son:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes'">
<example num="xNP.NPDegree.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/npDegreeOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/npDegreeOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/npDegreeOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/npDegreeOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.34.1</xsl:text>
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
<xsl:text>El indicador de nega ción de una frase nominal se presenta en esta posición de ámbito amplio también.  Véase la sección </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> para ejemplos.</xsl:text>
</p>
	      
		</section2>
		<section2 id="sNPArtDem">
		   <secTitle>
<xsl:choose>
		      <xsl:when test="//np/@artAndDem='no'">Artículos y demostrativos</xsl:when>
		      <xsl:when test="//np/@artAndDem='art'">Artículos</xsl:when>
		      <xsl:when test="//np/@artAndDem='dem'">Demostrativos</xsl:when>
		      <xsl:when test="//np/@artAndDem='both'">Artículos y demostrativos</xsl:when>
		   </xsl:choose>
</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>
					En español, los artículos y los demostrativos no se presentan en la misma frase nominal, sino que ambos se presentan antes del sustantivo. 
					Algunas lenguas permiten que ambos se presentan en la misma frase, y pueden presentarse en diversas posiciones con respecto al sustantivo. 
					Por lo tanto, necesitan categorías sintácticas distintas. Algunas lenguas tienen solamente una categoría, los artículos o los demostrativos. 
					Algunas lenguas no tienen cualquier tipo expresado como palabras independientes. </xsl:text>
</p>
			<p>
<xsl:text>De acuerdo con lo considerado en la sección </xsl:text>
<sectionRef sec="sAdjArtDem" />
<xsl:text>, en el </xsl:text>
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
					<xsl:when test="//np/@artAndDem='no'"> no hay ni artículos ni demonstrativos que son palabras independientes.</xsl:when>
					<xsl:when test="//np/@artAndDem='article'"> solamente hay artículos que son palabras independientes, ningún demostrativo.</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'"> solamente hay demostrativos que son palabras independientes, ningún artículo.</xsl:when>
					<xsl:when test="//np/@artAndDem='both'"> hay los artículos y demostrativos que son palabras independientes.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
					<xsl:text> Los </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">artículos</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">demostrativos</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">artículos y demostrativos</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
					<xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
						<xsl:text>no </xsl:text>
					</xsl:if>
					<xsl:text>se indican para el caso.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@artAndDem)='article'">
<p>
<xsl:text>El artículo se presenta </xsl:text>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyOther/@checked)='no'">
<xsl:text> del sustantivo.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='no' and normalize-space(//np/artOnlyOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/artOnlyOther" />
<xsl:text>.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyOther/@checked)='yes' or normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyOther/@checked)='yes' or normalize-space(//np/artOnlyBoth/@checked)='yes' and normalize-space(//np/artOnlyOther/@checked)='yes'">
<xsl:text> del sustantivo y también puede presentarse  ___</xsl:text>
<xsl:value-of select="//np/artOnlyOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  La presencia de un artículo es </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artRequired='no'">siempre opcional.</xsl:when>
					<xsl:when test="//np/@artRequired='mass'">opcional con sustantivos plurales o no contables, pero se requiere con sustantivos singulares.</xsl:when>
					<xsl:when test="//np/@artRequired='yes'">siempre requirido.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative'">
<p>
<xsl:text>El demostrativo se presenta </xsl:text>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyOther/@checked)='no'">
<xsl:text> del sustantivo.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='no' and normalize-space(//np/demOnlyOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demOnlyOther" />
<xsl:text>r.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyOther/@checked)='yes' or normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyOther/@checked)='yes' or normalize-space(//np/demOnlyBoth/@checked)='yes' and normalize-space(//np/demOnlyOther/@checked)='yes'">
<xsl:text> del sustantivo y también puede presentarse ___</xsl:text>
<xsl:value-of select="//np/demOnlyOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  La presencia de un demostrativo es </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demRequired='no'">siempre opcional.</xsl:when>
					<xsl:when test="//np/@demRequired='mass'">opcional con sustantivos plurales o no contables, pero se requiere con sustantivos singulares.</xsl:when>
					<xsl:when test="//np/@demRequired='yes'">siempre requirido.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no'">
<p>
<xsl:text>Los artículos y los demonstrativos se presentan en la misma posición, así que no se presenten en la misma frase nominal. Los artículos o los demostrativos se presentan </xsl:text>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosOther/@checked)='no'">
<xsl:text> del sustantivo.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='no' and normalize-space(//np/demOrArtPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demOrArtPosOther" />
<xsl:text>.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosOther/@checked)='yes' or normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosOther/@checked)='yes' or normalize-space(//np/demOrArtPosBoth/@checked)='yes' and normalize-space(//np/demOrArtPosOther/@checked)='yes'">
<xsl:text> del sustantivo y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//np/demOrArtPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  La presencia de un artículo o un demostrativo es </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demOrArtRequired='no'">siempre opcional.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='mass'">opcional con sustantivos plurales o no contables, pero se requiere con sustantivos singulares.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='yes'">siempre requirido.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>Los artículos y los demostrativos no se presentan en la misma posición con respecto al sustantivo, </xsl:text>
<xsl:choose>
				   <xsl:when test="//np/@artBothCooccur='different'">pero no pueden presentarse un artículo y un demostrativo </xsl:when>
				   <xsl:when test="//np/@artBothCooccur='yes'">y un artículo y un demostrativo pueden presentarse </xsl:when>
				</xsl:choose>
<xsl:text>en la misma frase nominal.  </xsl:text>
</p>
</xsl:if>
		   
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>  El artículo se presenta </xsl:text>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>después de o ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtOther/@checked)='no'">
<xsl:text> del sustantivo.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='no' and normalize-space(//np/demAndArtArtOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demAndArtArtOther" />
<xsl:text>.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtOther/@checked)='yes' or normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtOther/@checked)='yes' or normalize-space(//np/demAndArtArtBoth/@checked)='yes' and normalize-space(//np/demAndArtArtOther/@checked)='yes'">
<xsl:text> de sustantivo y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//np/demAndArtArtOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  La presencia de un artículo es </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@demAndArtArtRequired='no'">siempre opcional.</xsl:when>
		         <xsl:when test="//np/@demAndArtArtRequired='mass'">opcional con sustantivos plurales o no contables, pero se requiere con sustantivos singulares.</xsl:when>
		         <xsl:when test="//np/@demAndArtArtRequired='yes'">siempre requirido.</xsl:when>
		      </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>El demostrativo se presenta </xsl:text>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemOther/@checked)='no'">
<xsl:text> del sustantivo.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='no' and normalize-space(//np/demAndArtDemOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demAndArtDemOther" />
<xsl:text>.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemOther/@checked)='yes' or normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemOther/@checked)='yes' or normalize-space(//np/demAndArtDemBoth/@checked)='yes' and normalize-space(//np/demAndArtDemOther/@checked)='yes'">
<xsl:text> del sustantivo y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//np/demAndArtDemOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  La presencia de un demostrativo es </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtDemRequired='no'">siempre opcional.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='mass'">opcional con sustantivos plurales o no contables, pero se requiere con sustantivos singulares.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='yes'">siempre requirido.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
		   
			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Algunos ejemplos de frases nominales con </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artAndDem='article'">los artículos</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'">los demostrativos</xsl:when>
					<xsl:when test="//np/@artAndDem='both'">los artículos o los demostrativos</xsl:when>
				</xsl:choose>
<xsl:text> de acuerdo con lo permitido en el </xsl:text>
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
			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<example num="xNP.NPArtDem.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPArtDem.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPArtDem.22.1</xsl:text>
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
		<section2 id="sNPPoss">
			<secTitle>Posesivos</secTitle>
		   <p contentType="ctPracticalIntro">
<xsl:text>Normalmente, la posesión se puede expresar normalmente con un pronombre, un sustantivo simple, un nombre propio o con una frase nominal completa.</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Normalmente, la posesión se puede expresar normalmente con un pronombre, un sustantivo simple, un nombre propio o con una frase nominal completa.
		         El español permite solamente pronombres en la posición del posesivo antes del sustantivo,  
					con todos los posesivos que se expresan como sustantivos o frases nominales en una frase preposicional con la preposición </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de</langData>
<xsl:text>, después del sustantivo.</xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>Dentro de las lenguas que expresan a los posesivos con sustantivos o frases nominales completas así como con pronombres, muchas también agregan un indicador, como el </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>’s</langData>
<xsl:text> en inglés, para marcar la frase posesiva.  Estos indicadores son afijos en el sustantivo principal o clíticos que se unen a un lado de la frase completa.  
					El indicador de inglés es el segundo tipo, porque junto a frases en que el </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>’s</langData>
<xsl:text> se presenta unido al sustantivo principal, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s mother</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘la madre del muchacho’</xsl:text>
</gloss>
<xsl:text>, hay las frases que muestran claramente que el clítico se une al final de la frase nominal completa, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy that I just talked to’s mother</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘la madre del muchacho que acabo de hablar con’</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the girl in green’s wonderful speech</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘el discurso maravilloso de la muchacha en verde’</xsl:text>
</gloss>
<xsl:text>.  Estos ejemplos muestran que los posesivos pueden incluir frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
				</xsl:choose>
<xsl:text> y cláusulas relativas.  Los posesivos también pueden ser subordinados uno en otro, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s sister’s dog</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘el perro de la hermana del muchacho’</xsl:text>
</gloss>
<xsl:text>.  Esto se permite en español dentro de la frase preposicional después del sustantivo. </xsl:text>
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
		         <xsl:when test="//np/@possNP='yes'">los pronombres posesivos y los que son frases nominales pueden poseer un sustantivo directamente y pueden presentarse adentro de frases <xsl:choose>
		            <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
		         </xsl:choose> también.  </xsl:when>
		         <xsl:when test="//np/@possNP='yesOnly'">los pronombres posesivos y los que son frases nominales pueden poseer un sustantivo directamente, pero no se permiten frases <xsl:choose>
		            <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
		         </xsl:choose> como posesivos.  </xsl:when>
		         <xsl:when test="//np/@possNP='no'">solamente los pronombres posesivos pueden poseer un sustantivo directamente; las frases nominales como posesivos solamente pueden presentarse adentro de frases <xsl:choose>
		            <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
		         </xsl:choose>.  </xsl:when>
		         <xsl:when test="//np/@possNP='none'">ni pronombres posesivos ni frases nominales pueden poseer un sustantivo directamente; el posesivo solamente se expresa adentro de frases <xsl:choose>
		            <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
		            <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
		         </xsl:choose>.  </xsl:when>
		      </xsl:choose>
<xsl:if test="normalize-space(//np/@possNP)!='yesOnly'">
<xsl:text>La frase </xsl:text>
<xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
		      </xsl:choose>
<xsl:text> que expresa el poseedor se presenta </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@possPPPos='before'">antes</xsl:when>
		         <xsl:when test="//np/@possPPPos='after'">después</xsl:when>
		         <xsl:when test="//np/@possPPPos='either'">de cualquier lado</xsl:when>
		      </xsl:choose>
<xsl:text> del sustantivo. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='yes' or normalize-space(//np/@possNP)='yesOnly'">
<xsl:text>La frase nominal o pronombre que expresa el poseedor se presenta </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@possNounPos='before'">antes</xsl:when>
		         <xsl:when test="//np/@possNounPos='after'">después</xsl:when>
		         <xsl:when test="//np/@possNounPos='either'">de cualquier lado</xsl:when>
		      </xsl:choose>
<xsl:text> del sustantivo. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='no'">
<xsl:text>El pronombre que expresa el poseedor se presenta </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@possPronPos='before'">antes</xsl:when>
		         <xsl:when test="//np/@possPronPos='after'">después</xsl:when>
		         <xsl:when test="//np/@possPronPos='either'">de cualquier lado</xsl:when>
		      </xsl:choose>
<xsl:text> del sustantivo. </xsl:text>
</xsl:if>
</p>
		   	   
			<p>
<xsl:text>Algunos ejemplos de frases nominales poseídas por posesivos simples y subordinados en el </xsl:text>
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
			<example num="xNP.NPPoss.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/embeddedExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/embeddedExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/embeddedExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/embeddedExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.14.1</xsl:text>
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
<xsl:text>Algunos ejemplos de frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
				</xsl:choose>
<xsl:text> en el posesivo son:</xsl:text>
</p>
			<example num="xNP.NPPoss.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/ppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.18.1</xsl:text>
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
<xsl:text>Algunos ejemplos en oraciones completas de cláusulas relativas en el posesivo son:</xsl:text>
</p>
			<example num="xNP.NPPoss.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/relClExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/relClExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/relClExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/relClExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.22.1</xsl:text>
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
		   <xsl:if test="normalize-space(//np/@possNP)='yes' or normalize-space(//np/@possNP)='yesOnly'">
<p>
<xsl:text>
		      De acuerdo con lo considerado anteriormente en los ejemplos,
		      </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@possMarked='no'"> no hay un indicador especial para distinguir entre posesivos y cualquier otra frase nominal.</xsl:when>
		         <xsl:when test="//np/@possMarked='yesAffix'"> se indica el sustantivo principal dentro del posesivo con un afijo para distinguir entre posesivos y cualquier otra frase nominal.  El afijo es:</xsl:when>
		         <xsl:when test="//np/@possMarked='yesProclitic'"> se indica la frase completa con un proclítico que se une al inicio de la primera palabra en el posesivo para distinguir entre posesivos y cualquier otra frase nominal.  Este proclítico es </xsl:when>
		         <xsl:when test="//np/@possMarked='yesEnclitic'"> se indica la frase completa con un enclítico que se une al final de la última palabra en el posesivo para distinguir entre posesivos y cualquier otra frase nominal.  Este enclítico es: </xsl:when>
		         <xsl:when test="//np/@possMarked='yesWord'"> se indica la frase completa con una palabra independiente para distinguir entre posesivos y cualquier otra frase nominal.  La presencia de esta palabra es <xsl:choose>
		            <xsl:when test="//np/@possWordRequired='no'">opcional en algunos casos.</xsl:when>
		            <xsl:when test="//np/@possWordRequired='yes'">siempre requirido.</xsl:when>
		         </xsl:choose>  Se presenta </xsl:when>
		      </xsl:choose>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordOther/@checked)='no'">
<xsl:text> de la frase nominal posesiva.  Esta palabra es:</xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='no' and normalize-space(//np/possWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/possWordOther" />
<xsl:text>.  Esta palabra es:</xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordOther/@checked)='yes' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordOther/@checked)='yes' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/possWordOther/@checked)='yes'">
<xsl:text> de la frase nominal posesiva y también puede presentarse  ___</xsl:text>
<xsl:value-of select="//np/possWordOther" />
<xsl:text>.  Esta palabra es:</xsl:text>
</xsl:if>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@possMarked)='yesAffix'">
<example num="xNP.NPPoss.26">
<table border="1">
		         <tr>
		            <th>Afijo posesivo</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possMarkerAffix),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@possMarked)='yesProclitic' or normalize-space(//np/@possMarked)='yesEnclitic'">
<example num="xNP.NPPoss.28">
<table border="1">
		         <tr>
		            <th>Clítico posesivo</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possMarkerClitic),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@possMarked)='yesWord'">
<example num="xNP.NPPoss.30">
<table border="1">
		         <tr>
		            <th>Palabra posesiva</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possMarkerWord),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   
		   
				<p contentType="ctComparativeIntro">
<xsl:text>En español y otras lenguas, los posesivos y los artículos o los demonstrativos no se presentan en la misma frase nominal, a menos que expresan el posesivo en una frase preposicional. Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*esos [sus] libros</langData>
<xsl:text> no es gramatical; por el contrario deciría </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>esos libros [de él]</langData>
<xsl:text> para expresar el mismo significado. Algunas lenguas permiten que los posesivos y los artículos o los demonstrativos se presentan en la misma frase, así que el primer ejemplo antedicho sería gramatical.</xsl:text>
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
				      <xsl:when test="//np/@possCooccur='some'">algunos de </xsl:when>
				      </xsl:choose>
<xsl:text>los pronombres o frases nominales posesivos </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCooccur='yes'">pueden</xsl:when>
					   <xsl:when test="//np/@possCooccur='some'">pueden</xsl:when>
						<xsl:when test="//np/@possCooccur='no'">no pueden</xsl:when>
					</xsl:choose>
<xsl:text> presentarse en la misma frase que </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">los artículos</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">los demonstrativos</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">los artículos o los demonstrativos</xsl:when>
					</xsl:choose>
<xsl:text> en la posición normal del posesivo</xsl:text>
<xsl:choose>
				      <xsl:when test="//np/@possCooccur='yes'">.</xsl:when>
				      <xsl:when test="//np/@possCooccur='some'"> pero algunos otros no pueden.  Para estos posesivos, </xsl:when>
				      <xsl:when test="//np/@possCooccur='no'">.  Por el contrario,  </xsl:when>
				   </xsl:choose>
<xsl:if test="normalize-space(//np/@possCooccur)='no' or normalize-space(//np/@possCooccur)='some'">
<xsl:text>deben ser expresados en una frase </xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicional.</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicional.</xsl:when>
						<xsl:when test="//pp/@pPos='both'">adposicional.</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">adposicional.</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
					</xsl:if>
</p>

		</section2>
		<section2 id="sNPQP">
			<secTitle>Frases cuantificadoras</secTitle>
		   <p contentType="ctPracticalIntro">
<xsl:text>Las frases cuantificadoras incluyen tanto números (véase la sección </xsl:text>
<sectionRef sec="sAdjNumbers" />
<xsl:text>) como cuantificadores de ámbito limitado (véase la sección </xsl:text>
<sectionRef sec="sQPOtherQuantifiers" />
<xsl:text>).</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Las frases cuantificadoras incluyen tanto números (véase la sección </xsl:text>
<sectionRef sec="sAdjNumbers" />
<xsl:text>) como cuantificadores de ámbito limitado (véase la sección </xsl:text>
<sectionRef sec="sQPOtherQuantifiers" />
<xsl:text>).  Tales modificadores indican el número de la frase del nominal completo. Algunos ejemplos de frases nominales cuantificadas en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ésos muy pocos libros</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>los muchos perros del muchacho</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute> solamente los primeros cien muchachos</langData>
<xsl:text>.  Todas las frases cuantificadoras se presentan antes del sustantivo en español.</xsl:text>
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
<xsl:text>, las frases cuantificadoras se presentan </xsl:text>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosOther/@checked)='no'">
<xsl:text> del sustantivo.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='no' and normalize-space(//np/qpPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/qpPosOther" />
<xsl:text>.   </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosOther/@checked)='yes' or normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosOther/@checked)='yes' or normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//np/qpPosOther/@checked)='yes'">
<xsl:text> del sustantivo y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//np/qpPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='before' and normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' or normalize-space(//np/@qpEitherRestrictedNumPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes'">
						<xsl:text>Todos los números se presentan antes del sustantivo. </xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='after' and normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' or normalize-space(//np/@qpEitherRestrictedNumPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes'">
						<xsl:text>Todos los números se presentan después del sustantivo. </xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:text> Algunos ejemplos de frases nominales cuantificadas son:</xsl:text>
</p>
			<example num="xNP.NPQP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/qpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/qpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/qpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/qpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPQP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPQP.10.1</xsl:text>
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
		<section2 id="sNPAdjP">
			<secTitle>Frases adjetivales</secTitle>
		   <p contentType="ctPracticalIntro">
<xsl:text>Las frases adjetivales fueron analizadas anteriormente en la sección </xsl:text>
<sectionRef sec="sAdjP" />
<xsl:text>.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>Las frases adjetivales fueron analizadas anteriormente en la sección </xsl:text>
<sectionRef sec="sAdjP" />
<xsl:text>.  Las frases adjetivales se presentan cerca del sustantivo.  Algunas frases nominales en inglés con adjetivos son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just those very few old, dirty books</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘solo los muy pocos libros viejos y sucios’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all the boy’s many black dogs</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘todos los muchos perros negros del muchacho’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only the first one hundred very eager young boys</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘solamente los primeros cien muchachos jovenes que están muy impacientes’</xsl:text>
</gloss>
<xsl:text>.  Como se puede ver en los ejemplos en inglés, todos los adjetivos se presentan antes del sustantivo, y, al contrario de los otros modificadores, se permitan más de una frase adjetival.  
				   En español, los adjetivos se presentan después del sustantivo y solamente se permite una frase adjetival, a menos que los adjetivos son coordinados (véase la sección </xsl:text>
<sectionRef sec="sCoordAdj" />
<xsl:text>) o en una cláusula relativa (véase la sección </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>).</xsl:text>
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
<xsl:text>, las frases adjetivales se presentan </xsl:text>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjPosOther/@checked)='no'">
<xsl:text> del sustantivo que las modifican.  </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no' and normalize-space(//np/adjPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text>.   </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjPosOther/@checked)='yes' or normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjPosOther/@checked)='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjPosOther/@checked)='yes'">
<xsl:text> del sustantivo que las modifican y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
</p>
		   <p>
<xsl:text> Algunos ejemplos de frases nominales con adjetivos calificativos o frases adjetivales como modificadores son:</xsl:text>
</p>
			<example num="xNP.NPAdjP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/adjpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/adjpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/adjpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/adjpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPAdjP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPAdjP.12.1</xsl:text>
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
		<section2 id="sNPPP">
			<secTitle>            <xsl:choose>
				<xsl:when test="//pp/@pPos='before'">Frases preposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='after'">Frases posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='both'">Frases adposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">Frases adposicionales</xsl:when>
			</xsl:choose>
</secTitle>
		   <p contentType="ctPracticalIntro">
<xsl:text>Los sustantivos simples y compuestos pueden tener frases </xsl:text>
<xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
		      </xsl:choose>
<xsl:text> como modificadores o complementos. </xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Los sustantivos simples y compuestos pueden tener frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
				</xsl:choose>
<xsl:text> como modificadores o complementos, tal como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la botella grande, redonda [de jarabe]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la carta del muchacho [a esa muchacha]</langData>
<xsl:text>.  Además, las frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
				</xsl:choose>
<xsl:text> del genitivo pueden funcionar como el posesivo, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>esos perros [de él]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el mantel [de mi madre]</langData>
<xsl:text>.    En español, la frase preposicional siempre se presenta después del sustantivo.</xsl:text>
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
<xsl:text>, la frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
				</xsl:choose>
<xsl:text> se presenta </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@ppPos='before'">antes</xsl:when>
					<xsl:when test="//np/@ppPos='after'">después</xsl:when>
					<xsl:when test="//np/@ppPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//np/@ppPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo principal.  </xsl:text>
<xsl:text> Algunos ejemplos de frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
				</xsl:choose>
<xsl:text> como modificadores o complementos son:</xsl:text>
</p>
			<example num="xNP.NPPP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/compPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/compPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/compPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/compPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPP.10.1</xsl:text>
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
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> para el análisis de las frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
				</xsl:choose>
<xsl:text>.</xsl:text>
</p>
		</section2>
<section2 id="sNPParticiple">
	<secTitle>Participios y gerundios</secTitle>
   <p contentType="ctPracticalIntro">
<xsl:text>Los participios o las frases de participio pueden también funcionar como adjetivos modificando a un sustantivo. </xsl:text>
</p>
   <p contentType="ctComparativeIntro">
<xsl:text>Los participios o las frases de participio pueden también funcionar como adjetivos modificando a un sustantivo en muchas lenguas. Algunos ejemplos en inglés con el participio o la frase del participio entre corchetes son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the bright, [shining] sun</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘el brillante, [brillando] sol’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>my [crying] child</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘mi niño, [gritando]’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the books [loved by millions]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘los libros [amados por millones]’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
   <p>
<xsl:text>  Algunos ejemplos en el </xsl:text>
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
   <example num="xNP.NPParticiple.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiple.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.10.1</xsl:text>
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
<xsl:text>Un gerundio o frase de gerundio se puede parecer a un sustantivo y un complemento. Esta frase completa se presenta en la posición normal de una frase nominal, sea como sujeto, objeto directo, objeto indirecto o el objeto de una adposición. </xsl:text>
</p>
   <p contentType="ctComparativeIntro">
<xsl:text>Un gerundio o frase de gerundio se puede parecer a un sustantivo y un complemento. Esta frase completa se presenta en la posición normal de una frase nominal, sea como sujeto, objeto directo, objeto indirecto o el objeto de una adposición Algunos ejemplos en oraciones completas en inglés con la frase de gerundio entre corchetes son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Studying grammar] is difficult</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘[Estudiando gramática] es dificil’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>He likes [reading Latin poetry]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Él tiene gusto [leyendo la poesía latina]’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The receiver showed his worth by [making the catch]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El receptor mostró su valor cerca [haciendo el retén]’</xsl:text>
</gloss>
<xsl:text>.  Tales frases se pueden poseer o modificar también, y a veces se presenta solamente el gerundio como el elemento principal de una frase nominal, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el gravemente herido</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el agonizante</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>your following</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘su siguiente’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text> Algunos ejemplos de gerundios o frases de gerundio que pueden sustituir a una frase nominal en el </xsl:text>
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
			<example num="xNP.NPParticiple.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partHeadExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partHeadExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiple.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.18.1</xsl:text>
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
<xsl:text>Estas frases de gerundio pueden presentarse en oraciones completas como se muestra a continuación: </xsl:text>
</p>
			<example num="xNP.NPParticiple.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partHeadSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partHeadSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiple.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.22.1</xsl:text>
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
