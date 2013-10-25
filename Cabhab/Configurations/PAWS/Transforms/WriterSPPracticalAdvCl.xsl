<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advcl">
    <section1 id="sAdvCl">
        <secTitle>Las cláusulas adverbiales</secTitle>
        <p>
<xsl:text>En esta sección se analizan los complementos de los adverbios de tiempo y de razón, que fueron introducidos en las secciones </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> y </xsl:text>
<sectionRef sec="sAdvPReason" />
<xsl:text>.  Todas estas cláusulas (o frases) adverbiales funcionan igual que adverbios simples, así que se consideran frases adverbiales con el tipo apropiado de complemento. Las cláusulas adverbiales normalmente pueden presentarse al inicio o al final de la oración. </xsl:text>
</p>
        <section2 id="sAdvClTemporal">
            <secTitle>Complementos de adverbios de tiempo</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text>Algunos ejemplos en español de adverbios de tiempo con los complementos usados en oraciones completas son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Desde entonces], Juan ha sido cambiante</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan ha sido en casa [desde la semana pasada]</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Puesto que Juan vuelto a casa del hospital] él está haciendo mejor</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan está sintiendo fino [ahora que él vuelto a casa del hospital]</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El perro siguió a Susana por todas partes [cuando ella volvió de universidad]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Cuando ella volvió de universidad], el perro siguió a Susana por todas partes</langData>
<xsl:text>.  Estos ejemplos muestran que los adverbios de tiempo permiten ciertos tipos de complementos. Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>desde</langData>
<xsl:text> es seguido de otro adverbio de tiempo o de una frase nominal de tiempo.  Los adverbios de tiempo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>puesto</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ahora</langData>
<xsl:text> pueden tener un complemento clausal finito con un complementizador, mientras que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuando</langData>
<xsl:text> tiene una oración finito como complemento.</xsl:text>
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
<xsl:text>, los adverbios de tiempo permiten complementos similares a los discutidos en la sección </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>. Los complementos se presentan </xsl:text>
<xsl:choose>
                    <xsl:when test="//advcl/@advOrNPPos='before'">antes</xsl:when>
                    <xsl:when test="//advcl/@advOrNPPos='after'">después</xsl:when>
                    <xsl:when test="//advcl/@advOrNPPos='either'">de cualquier lado</xsl:when>
                    <xsl:when test="//advcl/@advOrNPPos='unknown'">_______</xsl:when>
                </xsl:choose>
<xsl:text> del adverbio.  Algunos ejemplos de oraciones completas con cláusulas adverbiales de tiempo son: </xsl:text>
</p>
            <example num="xAdvCl.AdvClTemporal.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advcl/tempSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advcl/tempSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advcl/tempSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advcl/tempSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvCl.AdvClTemporal.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvCl.AdvClTemporal.8.1</xsl:text>
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
        <section2 id="sAdvClReason">
           <secTitle>Complementos de adverbios que expresan razón o propósito</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text>Las frases o las cláusulas adverbiales que expresan razón o propósito pueden consistir en adverbios independientes, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por lo tanto</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pues</langData>
<xsl:text> (que a veces se consideran conjunciones de oraciones), y también en los que toman varios tipos de cláusulas de complemento.  
                   Algunos ejemplos en español de los adverbios que expresan razón o propósito que tienen complementos clausales son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan fue de prisa al hospital [porque Susana estaba en un accidente]</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Puesto que Juliana dijo que ella tiene gusto de él], José sonríe todo el tiempo</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David fue de prisa al aeropuerto [de modo que él pudiera ver a María antes de que ella se fuera]</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Las tropas lanzaron las granadas en el enemigo [para escaparse]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Las tropas lanzaron las granadas en el enemigo [en orden que los presos escaparse]</langData>
<xsl:text>.  En los ejemplos anteriores, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>porque</langData>
<xsl:text> puede tener una oracion finita como complemento, pero </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>puesto </langData>
<xsl:text>  y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de modo</langData>
<xsl:text> tienen cláusulas finitas con un complementador como complementos.  En cambio, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>para</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en orden</langData>
<xsl:text> tienen una oración o cláusula no finita.  Este es el mismo sistema de complementos como se muestra para </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>gustar</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>odiar</langData>
<xsl:text> en la sección </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text>Las frases o las cláusulas adverbiales que expresan razón o propósito pueden consistir en adverbios independientes, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por lo tanto</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pues</langData>
<xsl:text> (que a veces se consideran conjunciones de oraciones), y también en adverbios que toman varios tipos de cláusulas de complemento similares a los que toman algunos verbos presentados en la sección </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.</xsl:text>
</p>
                 <p>
<xsl:text>Algunos ejemplos de las cláusulas adverbiales que expresan razón o propósito en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, incluidos en oraciones completas son: </xsl:text>
</p>
            <example num="xAdvCl.AdvClReason.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/reasonExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/reasonExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/reasonExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/reasonExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvCl.AdvClReason.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvCl.AdvClReason.10.1</xsl:text>
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
