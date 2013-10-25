<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:xhtml="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="xhtml">
    <!-- 
        Variables and templates common to all "canned" style sheets.
    -->
    <!--
        DoAppendixRef
    -->
    <xsl:template name="DoAppendixRef">
        <xsl:variable name="appendix" select="id(@app)"/>
        <xsl:choose>
            <xsl:when test="@showTitle='short'">
                <xsl:choose>
                    <xsl:when test="$appendix/shortTitle and string-length($appendix/shortTitle) &gt; 0">
                        <xsl:apply-templates select="$appendix/shortTitle/child::node()[name()!='endnote']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="$appendix/secTitle/child::node()[name()!='endnote']"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@showTitle='full'">
                <xsl:apply-templates select="$appendix/secTitle/child::node()[name()!='endnote']"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="$appendix" mode="numberAppendix"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--  
        DoCollectionEdition
    -->
    <xsl:template name="DoCollectionEdition">
        <xsl:if test="collection/edition">
            <xsl:text>&#x20;</xsl:text>
            <xsl:value-of select="normalize-space(collection/edition)"/>
            <xsl:call-template name="OutputPeriodIfNeeded">
                <xsl:with-param name="sText" select="collection/edition"/>
            </xsl:call-template>
            <xsl:text>&#x20;</xsl:text>
        </xsl:if>
    </xsl:template>
    <!--  
        DoExampleRefContent
    -->
    <xsl:template name="DoExampleRefContent">
        <xsl:if test="not(@paren) or @paren='both' or @paren='initial'">(</xsl:if>
        <xsl:if test="@equal='yes'">=</xsl:if>
        <xsl:choose>
            <xsl:when test="@letter and name(id(@letter))!='example'">
                <xsl:if test="not(@letterOnly='yes')">
                    <!--                        <xsl:apply-templates select="id(@letter)" mode="example"/>-->
                    <xsl:call-template name="GetExampleNumber">
                        <xsl:with-param name="example" select="id(@letter)"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:apply-templates select="id(@letter)" mode="letter"/>
            </xsl:when>
            <xsl:when test="@num">
                <!--                    <xsl:apply-templates select="id(@num)" mode="example"/>-->
                <xsl:call-template name="GetExampleNumber">
                    <xsl:with-param name="example" select="id(@num)"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="@punct">
            <xsl:value-of select="@punct"/>
        </xsl:if>
        <xsl:if test="not(@paren) or @paren='both' or @paren='final'">)</xsl:if>
    </xsl:template>
    <!--  
        DoFigureRef
    -->
    <xsl:template name="DoFigureRef">
        <xsl:variable name="figure" select="id(@figure)"/>
        <xsl:choose>
            <xsl:when test="@showCaption='short'">
                <xsl:choose>
                    <xsl:when test="$figure/shortCaption and string-length($figure/shortCaption) &gt; 0">
                        <xsl:apply-templates select="$figure/shortCaption/child::node()[name()!='endnote']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="$figure/caption/child::node()[name()!='endnote']"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@showCaption='full'">
                <xsl:apply-templates select="$figure/caption/child::node()[name()!='endnote']"/>
            </xsl:when>
            <xsl:otherwise>
<!--                <xsl:apply-templates select="$figure" mode="figure"/>-->
                <xsl:call-template name="GetFigureNumber">
                    <xsl:with-param name="figure" select="$figure"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--  
        DoInterlinearRefCitationShowTitleOnly
    -->
    <xsl:template name="DoInterlinearRefCitationShowTitleOnly">
        <xsl:variable name="interlinear" select="key('InterlinearReferenceID',@textref)"/>
        <xsl:choose>
            <xsl:when test="@showTitleOnly='short'">
                <!-- only one of these will work -->
                <xsl:apply-templates select="$interlinear/textInfo/shortTitle/child::node()[name()!='endnote']"/>
                <xsl:apply-templates select="$interlinear/../textInfo/shortTitle/child::node()[name()!='endnote']"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- only one of these will work -->
                <xsl:apply-templates select="$interlinear/textInfo/textTitle/child::node()[name()!='endnote']"/>
                <xsl:apply-templates select="$interlinear/../textInfo/textTitle/child::node()[name()!='endnote']"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--  
        DoReferenceShowTitleAfter
    -->
    <xsl:template name="DoReferenceShowTitleAfter">
        <xsl:param name="showTitle"/>
        <xsl:if test="$showTitle='short' or $showTitle='full'">
            <xsl:text>”</xsl:text>
        </xsl:if>
    </xsl:template>
    <!--  
        DoReferenceShowTitleBefore
    -->
    <xsl:template name="DoReferenceShowTitleBefore">
        <xsl:param name="showTitle"/>
        <xsl:if test="$showTitle='short' or $showTitle='full'">
            <xsl:text>“</xsl:text>
        </xsl:if>
    </xsl:template>
    <!--  
        DoSectionRef
    -->
    <xsl:template name="DoSectionRef">
        <xsl:variable name="section" select="id(@sec)"/>
        <xsl:choose>
            <xsl:when test="@showTitle='short'">
                <xsl:choose>
                    <xsl:when test="$section/shortTitle and string-length($section/shortTitle) &gt; 0">
                        <xsl:apply-templates select="$section/shortTitle/child::node()[name()!='endnote']"/>
                    </xsl:when>
                    <xsl:when test="$section/frontMatter/shortTitle and string-length($section/frontMatter/shortTitle) &gt; 0">
                        <xsl:apply-templates select="$section/frontMatter/shortTitle/child::node()[name()!='endnote']"/>
                    </xsl:when>
                    <xsl:when test="name($section)='chapterInCollection'">
                        <xsl:apply-templates select="$section/frontMatter/title/child::node()[name()!='endnote']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="$section/secTitle/child::node()[name()!='endnote']"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@showTitle='full'">
                <xsl:choose>
                    <xsl:when test="name($section)='chapterInCollection'">
                        <xsl:apply-templates select="$section/frontMatter/title/child::node()[name()!='endnote']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="$section/secTitle/child::node()[name()!='endnote']"/>        
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="name($section)='part'">
                <xsl:apply-templates select="$section" mode="numberPart"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="$section" mode="number"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--  
        DoTablenumberedRef
    -->
    <xsl:template name="DoTablenumberedRef">
        <xsl:variable name="table" select="id(@table)"/>
        <xsl:choose>
            <xsl:when test="@showCaption='short'">
                <xsl:choose>
                    <xsl:when test="$table/shortCaption and string-length($table/shortCaption) &gt; 0">
                        <xsl:apply-templates select="$table/shortCaption/child::node()[name()!='endnote']"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="$table/table/caption/child::node()[name()!='endnote']"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="@showCaption='full'">
                <xsl:apply-templates select="$table/table/caption/child::node()[name()!='endnote']"/>
            </xsl:when>
            <xsl:otherwise>
<!--                <xsl:apply-templates select="$table" mode="tablenumbered"/>-->
                <xsl:call-template name="GetTableNumberedNumber">
                    <xsl:with-param name="tablenumbered" select="$table"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--
        HandleLiteralLabelLayoutInfo
    -->
    <xsl:template name="HandleLiteralLabelLayoutInfo" priority="-1">
        <xsl:param name="layoutInfo"/>
        <!-- default is to do nothing -->
    </xsl:template>
    <!--  
        OutputFigureLabel
    -->
    <xsl:template name="OutputFigureLabel">
        <xsl:variable name="label" select="$lingPaper/@figureLabel"/>
        <xsl:choose>
            <xsl:when test="string-length($label) &gt; 0">
                <xsl:value-of select="$label"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Figure </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
