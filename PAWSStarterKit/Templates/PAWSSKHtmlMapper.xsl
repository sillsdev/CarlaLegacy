<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet
[<!ENTITY nbsp "&#160;">]
>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- main template -->
  <xsl:template match="/">
	<html>
	  <head>
		<!-- generated automatically? <meta http-equiv="Content-Type" content="text/html; "/> -->
		<title>
		  <xsl:value-of select="/page/title"/>
		</title>
		<link rel="stylesheet" href="../styles/PAWSStarterKitMaster.css"/>
	  </head>
	  <body>
		<xsl:apply-templates/>
	  </body>
	</html>
  </xsl:template>
  <!-- **************************************************************************
	  Remaining templates are in alphabetical order
	  *************************************************************************** -->
  <!-- br -->
  <xsl:template match="//br">
	<br/>
  </xsl:template>
  <!-- button -->
  <xsl:template match="//button">
	<xsl:element name="input">
	  <xsl:attribute name="type">button</xsl:attribute>
	  <xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute>
	  <xsl:attribute name="name">B<xsl:value-of select="@value"/></xsl:attribute>
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:attribute name="style">width: 78px; height: 24px</xsl:attribute>
	</xsl:element>
	<xsl:if test="position()=1">&nbsp;</xsl:if>
  </xsl:template>
  <!-- buttons -->
  <xsl:template match="//buttons">
	<xsl:apply-templates/>
  </xsl:template>
  <!-- category -->
  <xsl:template match="//category">
	<span class="category">
	  <xsl:value-of select="."/>
	</span>
  </xsl:template>
  <!-- codeInfo -->
  <xsl:template match="//codeInfo">
	<xsl:comment>
	  <xsl:value-of select="."/>
	</xsl:comment>&#xa;
</xsl:template>
  <!-- contents -->
  <xsl:template match="//contents">
	<span class="contents">
	  <xsl:value-of select="."/>
	</span>
</xsl:template>
  <!-- EnglishExample -->
  <xsl:template match="//EnglishExample">
	<xsl:if test="name(preceding-sibling::node()[1])='introduction'"><br/></xsl:if>
	<div align="left" class="EnglishExample">
	  <table border="0">
		<xsl:apply-templates/>
	  </table>
	</div>
  </xsl:template>
  <!-- example -->
  <xsl:template match="//example">
	<span class="example">
	  <xsl:value-of select="."/>
	</span>
  </xsl:template>
  <!-- exItem -->
  <xsl:template match="//exItem">
	<tr>
	  <td valign="top">
		<xsl:if test="not(@label)">&nbsp;</xsl:if>
		<xsl:if test="@label">
		  <xsl:value-of select="@label"/>
		</xsl:if>
	  </td>
	  <td>
		<xsl:apply-templates/>
	  </td>
	</tr>
  </xsl:template>
  <!-- feature -->
  <xsl:template match="//feature">
	<span class="feature">
	  <xsl:value-of select="."/>
	</span>
  </xsl:template>
  <!-- featureChart -->
  <xsl:template match="//featureChart">
<br/><table border="1" style="BACKGROUND-COLOR: transparent" class="featureChart">
<tr>
<xsl:if test="@types='yes'"><th align="left" valign="top">Type of feature</th></xsl:if>
<th align="left"  valign="top">Feature</th>
<xsl:if test="not(@explanations='no')"><th align="left"  valign="top">Explanation</th></xsl:if>
</tr>
<xsl:apply-templates/>
</table>
  </xsl:template>
  <!-- featureExplanation -->
  <xsl:template match="//featureExplanation">
<xsl:if test="not(ancestor::featureChart/@explanations='no')">
<td valign="top"><xsl:value-of select="."/></td></xsl:if>
  </xsl:template>
  <!-- featureItem -->
  <xsl:template match="//featureItem">
<td valign="top"><span class="feature">
	  <xsl:value-of select="."/>
	</span></td>
  </xsl:template>
  <!-- featureRow -->
  <xsl:template match="//featureRow">
<tr><xsl:apply-templates/></tr>
  </xsl:template>
  <!-- featureType -->
  <xsl:template match="//featureType">
<xsl:if test="ancestor::featureChart/@types='yes'">
<td valign="top"><xsl:value-of select="."/></td></xsl:if>
  </xsl:template>
  <!-- file -->
  <xsl:template match="//file">
<xsl:element name="span">
<xsl:attribute name="class">file</xsl:attribute>
<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:value-of select="."/>
</xsl:element>
  </xsl:template>
  <!-- form -->
  <xsl:template match="//form">
	<xsl:element name="div">
	  <xsl:attribute name="class">form</xsl:attribute>
	  <xsl:if test="@transparent='yes'">
		<xsl:attribute name="style">BACKGROUND-COLOR: transparent</xsl:attribute>
	  </xsl:if>
	  <form action="--WEBBOT-SELF--" method="post">
		<xsl:apply-templates/>
	  </form>
	</xsl:element>
  </xsl:template>
  <!-- groupName -->
  <xsl:template match="//groupName"/>
  <!-- just eat it here; used in radio -->
  <!-- instruction -->
  <xsl:template match="//instruction">
<xsl:if test="not(@id)">    <br/>
</xsl:if>
	<xsl:element name="div">
	  <xsl:attribute name="class">instruction</xsl:attribute>
	  <xsl:if test="@id">
		<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  </xsl:if>
	  <p>
		<xsl:apply-templates/>
	  </p>
	</xsl:element>
  </xsl:template>
<!-- help -->
<xsl:template match="//help">
<xsl:element name="a">
<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
<xsl:value-of select="."/>
</xsl:element>
  </xsl:template>
  <!-- i -->
  <xsl:template match="//i">
	  <i><xsl:apply-templates/></i>
  </xsl:template>
  <!-- introduction -->
  <xsl:template match="//introduction">
	<!-- top level case -->
	<xsl:if test="name(..)='page'">
	  <xsl:if test="position()>2">
		<br/>
	  </xsl:if>
	  <div class="introduction">
		<p>
		  <xsl:apply-templates/>
		</p>
	  </div>
	</xsl:if>
	<!-- within a form case -->
	<xsl:if test="name(..)='form'">
	  <p class="introduction">
		<xsl:apply-templates/>
	  </p>
	</xsl:if>
  </xsl:template>
  <!-- li -->
  <xsl:template match="//li">
	<xsl:element name="li">
	  <xsl:if test="@id">
		<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  </xsl:if>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!-- ol -->
  <xsl:template match="//ol">
	<ol style="margin-top: .025in">
	  <xsl:apply-templates/>
	</ol>
  </xsl:template>
  <!-- p -->
  <xsl:template match="//p">
	<xsl:element name="p">
	  <xsl:if test="@style">
		<xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
	  </xsl:if>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!-- prompt -->
  <xsl:template match="//prompt">
	<!-- within a radioGroup case -->
	<xsl:if test="name(..)='radioGroup'">
	  <tr>
		<td colspan="2">
		  <span class="radioPrompt">
<!--            <xsl:value-of select="."/> -->
	<xsl:apply-templates/>
		  </span>
		</td>
	  </tr>
	</xsl:if>
	<!-- normal case -->
	<xsl:if test="not(name(..)='radioGroup')">
<xsl:if test="name(preceding-sibling::node()[1])='textBox'"><br/><br/></xsl:if>
<!--      <xsl:value-of select="."/> -->
<xsl:apply-templates/>
	  <br/>
	</xsl:if>
  </xsl:template>
  <!-- radio -->
  <xsl:template match="//radio">
	<tr>
	  <td valign="top">
		<xsl:element name="input">
		  <xsl:attribute name="type">radio</xsl:attribute>
		  <xsl:attribute name="name"><xsl:value-of select="../groupName"/></xsl:attribute>
		  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
		  <xsl:if test="@checked">
			<xsl:attribute name="checked"/>
		  </xsl:if>
		</xsl:element>
	  </td>
	  <xsl:element name="td">
<xsl:attribute name="width">99%</xsl:attribute>
		<xsl:attribute name="id"><xsl:value-of select="@id"/>Prompt</xsl:attribute>
		<xsl:apply-templates/>
	  </xsl:element>
	</tr>
  </xsl:template>
  <!-- radioGroup -->
  <xsl:template match="//radioGroup">
	<!-- outer-level case -->
	<xsl:if test="not(name(..)='radioGroup')">
	  <xsl:element name="table">
		<xsl:attribute name="border">0</xsl:attribute>
		<xsl:attribute name="style">margin-left: 0.5in</xsl:attribute>
		<xsl:if test="@id">
		  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
		</xsl:if>
		<xsl:apply-templates/>
	  </xsl:element>
	</xsl:if>
	<!-- embedded within another radioGroup case -->
	<xsl:if test="name(..)='radioGroup'">
<xsl:element name="tr">
			<xsl:if test="@id">
			  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>
		<td>&nbsp;</td>
		<td>
		  <xsl:element name="table">
			<xsl:attribute name="border">0</xsl:attribute>
			<xsl:apply-templates/>
		  </xsl:element>
		</td>
</xsl:element>
	</xsl:if>
  </xsl:template>
  <!-- ruleInfo -->
  <xsl:template match="//ruleInfo">
	<xsl:comment>
	  <xsl:value-of select="."/>
	</xsl:comment>&#xa;
</xsl:template>
  <!-- section -->
  <xsl:template match="//section">section <xsl:element name="span">
<xsl:attribute name="class">section</xsl:attribute><xsl:value-of select="./@number"/>&nbsp;<xsl:value-of select="."/>
	</xsl:element>
</xsl:template>
  <!-- span -->
  <xsl:template match="//span">
	<xsl:element name="span">
	  <xsl:if test="@id">
		<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  </xsl:if>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!-- textBox -->
  <xsl:template match="//textBox">&#xa;
<xsl:element name="textarea">
	  <xsl:attribute name="class">vernacular</xsl:attribute>
	  <xsl:attribute name="style">margin-left: 0.5in</xsl:attribute>
	  <xsl:attribute name="wrap">off</xsl:attribute>
	  <xsl:if test="not(@rows)">
		<xsl:attribute name="rows">7</xsl:attribute>
	  </xsl:if>
	  <xsl:if test="@rows">
		<xsl:attribute name="rows"><xsl:value-of select="@rows"/></xsl:attribute>
	  </xsl:if>
	  <xsl:if test="not(@cols)">
		<xsl:attribute name="cols">40</xsl:attribute>
	  </xsl:if>
	  <xsl:if test="@cols">
		<xsl:attribute name="cols"><xsl:value-of select="@cols"/></xsl:attribute>
	  </xsl:if>
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
<xsl:if test="@contenteditable">
<xsl:attribute name="contenteditable"><xsl:value-of select="@contenteditable"/></xsl:attribute>
</xsl:if>
	</xsl:element>
  </xsl:template>
  <!-- title -->
  <xsl:template match="//title">
	<xsl:if test="not(@level)">
	  <h1>
		<xsl:apply-templates/>
	  </h1>
	</xsl:if>
	<xsl:if test="@level = 2">
	  <h2>
		<xsl:apply-templates/>
	  </h2>
	</xsl:if>
  </xsl:template>
  <!-- tool -->
  <xsl:template match="//tool">
	<span class="tool">
	  <xsl:value-of select="."/>
	</span>
  </xsl:template>
  <!-- template -->
  <xsl:template match="//template">
	<span class="template">
	  <xsl:value-of select="."/>
	</span>
  </xsl:template>
  <!-- templateName -->
  <xsl:template match="//templateName">
	<span class="templateName">
	  <xsl:value-of select="."/>
	</span>
  </xsl:template>
  <!-- tree -->
  <xsl:template match="//tree">
	<br/><span class="tree">
	  <xsl:apply-templates/>
	</span><br/>
  </xsl:template>
  <!-- u -->
  <xsl:template match="//u">
	<u>
	  <xsl:value-of select="."/>
	</u>
  </xsl:template>
  <!-- ul -->
  <xsl:template match="//ul">
	<ul style="margin-top: .025in">
	  <xsl:apply-templates/>
	</ul>
  </xsl:template>
</xsl:stylesheet>
