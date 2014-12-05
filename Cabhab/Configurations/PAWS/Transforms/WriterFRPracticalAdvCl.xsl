<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advcl">
    <section1 id="sAdvCl">
        <secTitle>Propositions adverbiales</secTitle>
        <p>
<xsl:text>Cette section considère les compléments qui peuvent suivre les adverbes de temps et de raison, que nous avons présentés à la section </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> et à la section </xsl:text>
<sectionRef sec="sAdvPReason" />
<xsl:text>.  Toutes ces propositions adverbiales fonctionnent de la même façon que les adverbes simples; on les traitera comme des syntagmes adverbiaux complétifs de type approprié. Les propositions adverbiales peuvent normalement se mettre en position initiale ou finale</xsl:text>
</p>
        <section2 id="sAdvClTemporal">
            <secTitle>Les compléments d’adverbes temporels</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text>Des exemples en français d’adverbes temporels avec compléments utilisés dans des phrases complètes: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Depuis ce temps là], Jean est de mauvaise humeur</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jean est à la maison  [depuis la semaine dernière]</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Depuis que Jean est rentré de l’hôpital], il se porte mieux</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jean se sent bien  [maintenant qu’il est rentré de l’hôpital]</langData>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le chien a suivi Suzanne partout  [depuis qu’elle est revenue de l’université]</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Quand elle est revenue de l’université], le chien a suivi Suzanne partout</langData>
<xsl:text>. Ces exemples montrent que certains adverbes temporels admettent certains types de compléments. Par exemple, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>depuis</langData>
<xsl:text> peut être suivi d’un deuxième adverbe temporel ou bien d’un syntagme nominal temporel, ou bien il peut avoir un complément à proposition finie, avec complémentiseur.  L’adverbe temporel </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>quand</langData>
<xsl:text> prend un complément sententiel fini; par contre </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>maintenant</langData>
<xsl:text> prend un complément à proposition finie, avec complémentiseur.</xsl:text>
</p>
            <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, les adverbes temporels admettent les compléments semblables à ceux qu’on a cités à la section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.  Les compléments se mettent </xsl:text>
<xsl:choose>
                    <xsl:when test="//advcl/@advOrNPPos='before'">avant</xsl:when>
                    <xsl:when test="//advcl/@advOrNPPos='after'">après</xsl:when>
                    <xsl:when test="//advcl/@advOrNPPos='either'">d’un côté ou de l’autre de</xsl:when>
                    <xsl:when test="//advcl/@advOrNPPos='unknown'">_______</xsl:when>
                </xsl:choose>
<xsl:text> l’adverbe temporel. Voici des exemples de propositions adverbiales de temps qui figurent dans les phrases complètes: </xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
            <secTitle>Les compléments d’adverbes de raison</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text>Les syntagmes adverbiaux ou les propositions adverbiales qui expriment la raison ou le but consistent d’adverbes autonomes comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>donc</langData>
<xsl:text> (qu’on appelle quelquefois les conjonctions sententielles), et de ceux qui prennent une variété de propositions complétives.  Voici des exemples en anglais et français d’adverbes de raison ou de but qui prennent des propositions complétives: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John rushed to the hospital [because Sue was in an accident]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Jean est allé vite à l’hôpital [parce que Suzanne était dans un accident] »</xsl:text>
</gloss>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Since Jill said that she likes him], Joe smiles all the time</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « [Puisque Jeanne a dit qu’elle l’aime] Jacques sourit tout le temps »</xsl:text>
</gloss>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Bill rushed to the airport [so that he could see Kay before she left]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Guillaume est allé vite à l’aéroport [pour qu’il puisse voir Gaby avant qu’elle soit partie] »</xsl:text>
</gloss>
<xsl:text>; </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The troops threw grenades at the enemy [in order to escape]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Les soldats ont lancé des grenades à l’ennemi [pour qu’il puissent s’évader] »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The troops threw grenades at the enemy [in order for the prisoners to escape]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>  « Les soldats ont lancé des grenades à l’ennemi [pour que les prisonniers puissent s’évader] »</xsl:text>
</gloss>
<xsl:text>.  Dans ces examples en anglais, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>because</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « parce que »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>since</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « puisque »</xsl:text>
</gloss>
<xsl:text> prennent seulement des complements phrastiques finis et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>so</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « donc, pour »</xsl:text>
</gloss>
<xsl:text> prend une proposition finie avec un complémentiseur comme complément. Par contre </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>in order</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « pour »</xsl:text>
</gloss>
<xsl:text> prend ou un complément phrastique non-fini avec un sujet coréférentiel nul, ou bien une proposition non-fini avec un complémentiseur comme complément. Ceci est pareil à la sous-catégorie représentée par </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>like</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « aimer »</xsl:text>
</gloss>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hate</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> « haïr »</xsl:text>
</gloss>
<xsl:text> à la section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text>Les syntagmes adverbiaux ou les propositions adverbiales qui expriment la raison ou le but consistent d’adverbes autonomes, comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>donc</langData>
<xsl:text> (qu’on appelle quelquefois les conjonctions sententielles), et de ceux qui prennent une variété de propositions complétives pareilles à celles qu’on a citées pour les verbes à la section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.</xsl:text>
</p>
           <p>
<xsl:text>Voici des exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de propositions adverbiales de raison ou de but dans des phrases complètes:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
