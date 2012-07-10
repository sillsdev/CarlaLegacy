<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="excl">
  <section1 id="sExcl">
	 <secTitle>Los saludos, interjecciones y exclamaciones</secTitle>
	<p>
<xsl:text>Esta sección considera los varios tipos de locuciones comunes que no son oraciones completas. Los saludos, las interjecciones y las exclamaciones serán vistas como corresponde.</xsl:text>
</p>
<section2 id="sExclGreet">
	<secTitle>Saludos</secTitle>
	<p>
<xsl:text>Los saludos consisten típicamente en una palabra o una frase particular, que puede ser seguido por un nombre o una frase nominal que describe la persona o el animal que es saludado.
	Algunos son las oraciones completas o las preguntas completas, tales como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Cómo está usted? </langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Tenga un buen día!</langData>
<xsl:text> Las cuáles no necesitan ser tratadas por separado. </xsl:text>
</p>
   <p>
<xsl:text>Algunos ejemplos de saludos en español son:  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Hola!</langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Adiós!</langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Hasta luego</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Buen día, señor</langData>
<xsl:text> y  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Buenas noches, ducle bebé</langData>
<xsl:text>.</xsl:text>
</p>

	<p>
<xsl:text>Algunos ejemplos de saludos en </xsl:text>
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
			<example num="xExcl.ExclGreet.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//excl/greetExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//excl/greetExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//excl/greetExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//excl/greetExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xExcl.ExclGreet.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclGreet.10.1</xsl:text>
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
<section2 id="sExclIntj">
	<secTitle>Interjecciones</secTitle>
	<p>
<xsl:text>Las interjecciones consisten típicamente en una palabra o una frase particular que se utilicen solo, generalmente con puntos de exclamación. Muchas de las palabras en interjecciones no se utilizan en ninguna otra situación. Sin embargo, los adjetivos regulares también se utilizan de esta manera.</xsl:text>
</p>
	<p>
<xsl:text>Algunos ejemplos de interjecciones en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Ay!</langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Caramba!</langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Cuidado!</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Jesús, María y José!</langData>
</p>

	<p>
<xsl:text>Algunos ejemplos de interjecciones en </xsl:text>
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
			<example num="xExcl.ExclIntj.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//excl/intjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//excl/intjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//excl/intjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//excl/intjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xExcl.ExclIntj.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclIntj.10.1</xsl:text>
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
<xsl:text>Las respuestas de ‘Sí’ y ‘No’ a las preguntas sea similar a las interjecciones.  En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se utiliza las palabras siguientes para expresar estas respuestas: </xsl:text>
</p>
<example num="xExcl.ExclIntj.14">
<table border="1">
					<tr>
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
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//excl/yesExample),'.','')" />
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
<td align="left" rowspan="1">
							<xsl:text>sí</xsl:text>
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
<td align="left" rowspan="1">
							<xsl:text>sí</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//excl/noExample),'.','')" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left" rowspan="1">
							<xsl:text>no</xsl:text>
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
<td align="left" rowspan="1">
							<xsl:text>no</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</example>
</section2>
<section2 id="sExclExcl">
	<secTitle>Exclamaciones</secTitle>
   <p>
<xsl:text>Las exclamaciones consisten típicamente en una palabra particular, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>qué</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cómo</langData>
<xsl:text> en español, seguida por una frase adjetival y puntuada generalmente con puntos de exclamación. </xsl:text>
</p>
	<p>
<xsl:text>Algunos ejemplos en español son:  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Qué tremendo para usted!</langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Qué agradable!</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¡Cómo es maravilloso que su familia podría venir!</langData>
</p>

	<xsl:if test="normalize-space(//excl/@exclM)='no'">
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
<xsl:text> no hay una palabra especial que indica exclamaciones, así que no son diferentes de las interjecciones que consisten en adjetivos como en la sección anterior.</xsl:text>
</p>
</xsl:if>
   <xsl:if test="normalize-space(//excl/@exclM)='yes'">
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
<xsl:text>, hay una o más palabras especiales que señalen una exclamación.  Las cuáles se presentan </xsl:text>
<xsl:choose>
<xsl:when test="//excl/@exclMPos='before'">antes</xsl:when>
		<xsl:when test="//excl/@exclMPos='after'">después</xsl:when>
		<xsl:when test="//excl/@exclMPos='either'">de cualquier lado</xsl:when>
		<xsl:when test="//excl/@exclMPos='both'">en ambos lados</xsl:when>
		 <xsl:when test="//excl/@exclMPos='unknown'">________</xsl:when>
	  </xsl:choose>
<xsl:text> de la frase adjetival. </xsl:text>
<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='either' and normalize-space(//excl/@exclMEither)='no' or normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='both' and normalize-space(//excl/@exclMEither)='no'">
<xsl:text>Hay restricciones en cuanto a cuáles indicadores pueden presentarse en cada lado de la frase adjetival. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='either' and normalize-space(//excl/@exclMEither)='yes' or normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='both' and normalize-space(//excl/@exclMEither)='yes'">
<xsl:text>Todos los indicadores pueden presentarse de cualquier lado de la frase adjetival. </xsl:text>
</xsl:if>
<xsl:text>Estas palabras que indican exclamaciones son:</xsl:text>
</p>
</xsl:if>
<xsl:if test="normalize-space(//excl/@exclM)='yes'">
<example num="xExcl.ExclExcl.12">
<table border="1">
<tr>
	<th>Indicadores de la exclamación</th>
	<th>Glosa</th>
</tr>
	<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//excl/exclMExample),'.','')" />
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
   <p>
<xsl:text>Algunos ejemplos de exclamaciones en </xsl:text>
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
   <example num="xExcl.ExclExcl.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//excl/exclExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//excl/exclExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//excl/exclExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//excl/exclExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xExcl.ExclExcl.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclExcl.16.1</xsl:text>
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
