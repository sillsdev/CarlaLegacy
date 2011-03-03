<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ms="urn:schemas-microsoft-com:xslt" xmlns:saxon="http://icl.com/saxon" exclude-result-prefixes="ms saxon">
    <!--
        MSXSL's node-set function needs
            auto-ns1:msxsl="" xmlns:auto-ns1="urn:schemas-microsoft-com:xslt"
        Saxon uses
        xmlns:saxon="http://icl.com/saxon"
    -->
    <!-- common templates for both comparative and practical writer master transforms -->
    <xsl:param name="prmSDateTime" select="'DATE GOES HERE'"/>
    <xsl:param name="prmSVersionNumber" select="'PAWS VERSION NUMBER GOES HERE'"/>
    <xsl:variable name="sMasterLetterList">a b c d e f g h i j k l m n o p q r s t u v w x y z aa bb cc dd ee ff gg hh ii jj kk ll mm nn oo pp qq rr ss tt uu vv ww xx yy zz </xsl:variable>
    <!--
        ======================================
        Special handling of rowspan in columns of tables
        ======================================
    -->
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        handle processing the row span value
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <!-- this is needed in order to make sure that the parameter gets properly passed down -->
    <xsl:template match="/" mode="processRowSpans">
        <xsl:param name="iRowsToSpan"/>
        <xsl:apply-templates mode="processRowSpans">
            <xsl:with-param name="iRowsToSpan" select="$iRowsToSpan"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="td[@rowspan]" mode="processRowSpans">
        <xsl:param name="iRowsToSpan"/>
        <td rowspan="{$iRowsToSpan}">
            <xsl:apply-templates mode="processRowSpans"/>
        </td>
    </xsl:template>
    <xsl:template match="@* |  node()" mode="processRowSpans">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="processRowSpans"/>
            <xsl:apply-templates mode="processRowSpans"/>
        </xsl:copy>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        skip any td elements with a rowspan attribute
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template match="td[@rowspan]" mode="skipRowSpans">
        <!-- do nothing; we skip this one -->
    </xsl:template>
    <xsl:template match="@* |  node()" mode="skipRowSpans">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="skipRowSpans"/>
            <xsl:apply-templates mode="skipRowSpans"/>
        </xsl:copy>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        CalculateRows
        routine to create frontmatter items common to both types
        Parameters: sExamples -  string containing list of examples to be counted
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="CalculateRows">
        <xsl:param name="sExamples"/>
        <xsl:if test="string-length($sExamples) != 0">
            <!-- remember that we have one -->
            <xsl:text>x</xsl:text>
            <!-- now recurse -->
            <xsl:call-template name="CalculateRows">
                <xsl:with-param name="sExamples">
                    <xsl:value-of select="substring-after($sExamples,'&#xA;')"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        DoFree
        routine to create empty free line for interlinear
        Parameters: none
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="DoFree">
        <free>
            <gloss lang="lGloss">ENTER FREE TRANSLATION HERE.</gloss>
        </free>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        DoGloss
        routine to create empty gloss line for interlinear
        Parameters: none
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="DoGloss">
        <line>
            <gloss lang="lGloss">ENTER GLOSS HERE</gloss>
        </line>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        DoMorphemeGloss
        routine to create empty word gloss line for interlinear
        Parameters: none
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="DoMorphemeGloss">
        <line>
            <gloss lang="lGloss">IMP.enter morpheme gloss-PL here</gloss>
        </line>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        DoWordGloss
        routine to create empty word gloss line for interlinear
        Parameters: none
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="DoWordGloss">
        <line>
            <gloss lang="lGloss">ENTER WORD GLOSS HERE</gloss>
        </line>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        OutputColExamples
        routine to create column examples recursively
        Parameters: sExamples: text of examples
        iLength: length of example text
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="OutputColExamples">
        <xsl:param name="sExamples"/>
        <xsl:param name="iLength"/>
        <xsl:param name="columnsBefore"/>
        <xsl:param name="columnsAfter"/>
        <xsl:param name="bHandleRowSpans" select="'N'"/>
        <xsl:param name="iRowsToSpan"/>
        <xsl:if test="string-length($sExamples) != 0">
            <tr>
                <xsl:if test="$columnsBefore">
                    <xsl:choose>
                        <xsl:when test="$bHandleRowSpans='Y'">
                            <xsl:choose>
                                <xsl:when test="function-available('ms:node-set')">
                                    <xsl:apply-templates select="ms:node-set($columnsBefore)" mode="processRowSpans">
                                        <xsl:with-param name="iRowsToSpan" select="$iRowsToSpan"/>
                                    </xsl:apply-templates>
                                </xsl:when>
                                <xsl:when test="function-available('saxon:node-set')">
                                    <xsl:apply-templates select="saxon:node-set($columnsBefore)" mode="processRowSpans">
                                        <xsl:with-param name="iRowsToSpan" select="$iRowsToSpan"/>
                                    </xsl:apply-templates>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="function-available('ms:node-set')">
                                    <xsl:apply-templates select="ms:node-set($columnsBefore)" mode="skipRowSpans"/>
                                </xsl:when>
                                <xsl:when test="function-available('saxon:node-set')">
                                    <xsl:apply-templates select="saxon:node-set($columnsBefore)" mode="skipRowSpans"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <xsl:variable name="sBefore" select="substring-before($sExamples, '&#xA;')"/>
                <xsl:variable name="sLine">
                    <xsl:choose>
                        <xsl:when test="string-length($sBefore) = 0">
                            <xsl:value-of select="$sExamples"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$sBefore"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <td>
                    <langData>
                        <xsl:attribute name="lang">
                            <xsl:text>lVernacular</xsl:text>
                            <!-- Now we want to use lVernacular so XXE works well
                                <xsl:value-of select="//language/langAbbr"/>-->
                        </xsl:attribute>
                        <xsl:value-of select="$sLine"/>
                    </langData>
                </td>
                <xsl:if test="$columnsAfter">
                    <xsl:choose>
                        <xsl:when test="$bHandleRowSpans='Y'">
                            <xsl:choose>
                                <xsl:when test="function-available('ms:node-set')">
                                    <xsl:apply-templates select="ms:node-set($columnsAfter)" mode="processRowSpans">
                                        <xsl:with-param name="iRowsToSpan" select="$iRowsToSpan"/>
                                    </xsl:apply-templates>
                                </xsl:when>
                                <xsl:when test="function-available('saxon:node-set')">
                                    <xsl:apply-templates select="saxon:node-set($columnsAfter)" mode="processRowSpans">
                                        <xsl:with-param name="iRowsToSpan" select="$iRowsToSpan"/>
                                    </xsl:apply-templates>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="function-available('ms:node-set')">
                                    <xsl:apply-templates select="ms:node-set($columnsAfter)" mode="skipRowSpans"/>
                                </xsl:when>
                                <xsl:when test="function-available('saxon:node-set')">
                                    <xsl:apply-templates select="saxon:node-set($columnsAfter)" mode="skipRowSpans"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </tr>
            <!-- now recurse -->
            <xsl:call-template name="OutputColExamples">
                <xsl:with-param name="sExamples">
                    <xsl:value-of select="substring-after($sExamples,'&#xA;')"/>
                </xsl:with-param>
                <xsl:with-param name="iLength">
                    <xsl:value-of select="string-length(substring-after($sExamples,'&#xA;'))"/>
                </xsl:with-param>
                <xsl:with-param name="columnsBefore" select="$columnsBefore"/>
                <xsl:with-param name="columnsAfter" select="$columnsAfter"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        OutputCommonBackmatterLanguagesAndTypes
        routine to create frontmatter items common to both types
        Parameters: none
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="OutputCommonBackmatterLanguagesAndTypes">
        <backMatter>
            <endnotes/>
            <references/>
        </backMatter>
        <languages>
            <language id="lPAWSSKEnglish" name="PAWSSKEnglish" color="black" font-style="italic"/>
            <language id="lGloss" name="GlossLanguage" color="#446688"/>
            <language name="vernacular">
                <xsl:attribute name="id">
                    <xsl:text>lVernacular</xsl:text>
                    <!-- Now we want to use lVernacular so XXE works well
                        <xsl:value-of select="//language/langAbbr"/>-->
                </xsl:attribute>
                <xsl:attribute name="font-family">
                    <xsl:value-of select="//language/font/fontName"/>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:value-of select="//language/font/fontSize"/>
                    <xsl:text>pt</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="color">
                    <xsl:value-of select="//language/font/fontColor"/>
                </xsl:attribute>
                <xsl:if test="//language/font/@bold='True'">
                    <xsl:attribute name="font-weight">
                        <xsl:text>bold</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="//language/font/@italic='True'">
                    <xsl:attribute name="font-style">
                        <xsl:text>italic</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="//language/font/@under='True' or //language/font/@strike='True'">
                    <xsl:attribute name="cssSpecial">
                        <xsl:text>text-decoration:</xsl:text>
                        <xsl:choose>
                            <xsl:when test="//language/font/@under='True'">
                                <xsl:text>underline;</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>line-through;</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="//language/font/@rtl='True'">
                    <xsl:attribute name="rtl">
                        <xsl:text>yes</xsl:text>
                    </xsl:attribute>
                </xsl:if>
            </language>
        </languages>
        <types>
            <type id="tComment" font-weight="bold" color="red"/>
        </types>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        OutputCommonFrontmatter
        routine to create frontmatter items common to both types
        Parameters: none
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="OutputCommonFrontmatter">
        <author>FIRST AUTHOR NAME GOES HERE</author>
        <author>SECOND AUTHOR NAME GOES HERE (if there's only one, delete this)</author>
        <affiliation>AFFILIATION GOES HERE</affiliation>
        <date>
            <xsl:value-of select="$prmSDateTime"/>
        </date>
        <version>Draft generated by PAWS Starter Kit <xsl:value-of select="$prmSVersionNumber"/></version>
        <contents showLevel="3"/>
    </xsl:template>
    <!--
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        OutputInterlinearExamples
        routine to create interlinear examples recursively
        Parameters: sExamples: text of examples
        iLength: length of example text
        sExNumber: example number to use
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -->
    <xsl:template name="OutputInterlinearExamples">
        <xsl:param name="sExamples"/>
        <xsl:param name="iLength"/>
        <xsl:param name="sExNumber"/>
        <xsl:param name="sLetterList"/>
        <xsl:if test="string-length($sExamples) != 0">
            <xsl:variable name="sNewLetterList" select="concat(normalize-space($sLetterList),' ')"/>
            <xsl:variable name="sFirstLetter" select="substring-before($sNewLetterList,' ')"/>
            <xsl:variable name="sRestOfTheLetters" select="substring-after($sNewLetterList,' ')"/>
            <xsl:variable name="sBefore" select="substring-before($sExamples, '&#xA;')"/>
            <xsl:variable name="sLine">
                <xsl:choose>
                    <xsl:when test="string-length($sBefore) = 0">
                        <xsl:value-of select="$sExamples"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$sBefore"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <listInterlinear>
                <xsl:attribute name="letter">
                    <xsl:value-of select="$sExNumber"/>
                    <xsl:value-of select="$sFirstLetter"/>
                </xsl:attribute>
                <lineGroup>
                    <line>
                        <langData>
                            <xsl:attribute name="lang">
                                <xsl:text>lVernacular</xsl:text>
                                <!-- Now we want to use lVernacular so XXE works well
                                    <xsl:value-of select="//language/langAbbr"/>-->
                            </xsl:attribute>
                            <xsl:value-of select="$sLine"/>
                        </langData>
                    </line>
                    <xsl:call-template name="DoInterlinearGlossLines"/>
                </lineGroup>
                <xsl:call-template name="DoFree"/>
            </listInterlinear>
            <!-- now recurse -->
            <xsl:call-template name="OutputInterlinearExamples">
                <xsl:with-param name="sExamples">
                    <xsl:value-of select="substring-after($sExamples,'&#xA;')"/>
                </xsl:with-param>
                <xsl:with-param name="iLength">
                    <xsl:value-of select="string-length(substring-after($sExamples,'&#xA;'))"/>
                </xsl:with-param>
                <xsl:with-param name="sExNumber">
                    <xsl:value-of select="$sExNumber"/>
                </xsl:with-param>
                <xsl:with-param name="sLetterList">
                    <xsl:value-of select="$sRestOfTheLetters"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
