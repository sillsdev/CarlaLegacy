<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to remove any needed content  from XLingPaper file
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" doctype-public="-//XMLmind//DTD XLingPap//EN" doctype-system="/Transforms/XLingPap.dtd"/>

   <xsl:variable name="chosenContentControl" select="//contentControlChoices/contentControlChoice[@active='yes']"/>
   <xsl:variable name="chosenContentTypes" select="id($chosenContentControl/@exclude)"/>

   <!-- 
      Main copy template
   -->
   <xsl:template match="@* |  node()">
      <xsl:copy>
         <xsl:apply-templates select="@*"/>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>
   <!-- 
      Ignore or copy elements that can be ignored
   -->
   <xsl:template match="abstract">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="acknowledgements">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="affiliation">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="appendix">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="authorContactInfo">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="blockquote">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="chapter">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="chapterBeforePart">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="chapterInCollection">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="chart">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="contents">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="date">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="dd">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="dl">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="dt">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="emailAddress">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="example">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="figure">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="framedUnit">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="glossary">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="index">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="interlinear-text">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="li">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="ol">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="p">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="pc">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="part">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="preface">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="presentedAt">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="prose-text">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="section1">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="section2">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="section3">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="section4">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="section5">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="section6">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="selectedBibliography">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="table">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="tablenumbered">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="tree">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="ul">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>
   <xsl:template match="version">
      <xsl:call-template name="IgnoreOrCopyElement"/>
   </xsl:template>

   <!-- 
      Figure out if we need to ignore or copy this element
   -->
   <xsl:template name="IgnoreOrCopyElement">
      <xsl:variable name="contentType" select="id(@contentType)/@id"/>
      <xsl:variable name="inSet">
         <xsl:if test="$chosenContentTypes">
            <xsl:for-each select="$chosenContentTypes">
               <xsl:if test="@id = $contentType">x</xsl:if>
            </xsl:for-each>
         </xsl:if>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="string-length($inSet) &gt; 0">
            <!-- ignore this one -->
         </xsl:when>
         <xsl:otherwise>
            <xsl:copy>
               <xsl:apply-templates select="@*"/>
               <xsl:apply-templates/>
            </xsl:copy>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
