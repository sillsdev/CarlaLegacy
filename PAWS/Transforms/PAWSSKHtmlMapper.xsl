<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:param name="prmLangAbbr"/>
  <xsl:variable name="Section">
	<xsl:value-of select="//form/@section"/>
  </xsl:variable>
  <!-- main template -->
  <xsl:template match="/">
	<html>
	  <head>
		<!-- generated automatically? <meta http-equiv="Content-Type" content="text/html; "/> -->
		<title>
		  <xsl:value-of select="/page/title"/>
		</title>
		<link rel="stylesheet">
		  <xsl:attribute name="href"><xsl:text>../styles/</xsl:text><xsl:value-of select="$prmLangAbbr"/><xsl:text>PAWSStarterKit.css</xsl:text></xsl:attribute>
		</link>
		<xsl:call-template name="JScript"/>
	  </head>
	  <body onload="Initialize()">
		<div class="userData" id="answerDiv"/>
		<xsl:apply-templates/>
	  </body>
	</html>
  </xsl:template>
  <!--
  - - - - - - - -
  JScript
  - - - - - - - -
  -->
  <xsl:template name="JScript">
	<style>.userData {behavior: url(#default#userdata);}
  </style>
	<script language="jscript">
  // variables used throughout functions below
var div;
var PawsSKAnswers;
var attr;
var elem;
var example;
var strUserDataStore;
	// would like to use enums, but apparently they are not supported yet
var HeadPosInitial = 1;
var HeadPosFinal = 2;

var SpecPosInitial = 1;
var SpecPosInternal = 2;
var SpecPosFinal = 3;
var SpecPosUnknown = 4;

  function Initialize()
{
   // Load answers from the UserData store named "<xsl:value-of select="$prmLangAbbr"/>PawsSKAnswers"
   // The store is associated with an empty &lt;DIV id="answerDiv"&gt;
   div = document.all("answerDiv");
   strUserDataStore = "<xsl:value-of select="$prmLangAbbr"/>PawsSKAnswers";
   div.load(strUserDataStore);
   PawsSKAnswers = new ActiveXObject("MicroSoft.XMLDOM");
   PawsSKAnswers.async = false;
   PawsSKAnswers = div.XMLDocument;
<xsl:apply-templates select="//textBox | //groupName | //catMap" mode="load"/>
example = PawsSKAnswers.selectSingleNode("//leftOffAt");
example.text = "<xsl:value-of select="//page/@id"/>.htm";

  div.save(strUserDataStore);
Refresh()
}
function GetSpecifierPos()
{
	elem = PawsSKAnswers.selectSingleNode("//typology");
	attr = elem.getAttribute("wordOrder");
	if (attr == "SVO" || attr == "SOV")
		return SpecPosInitial;
	else
	  {
		if (attr == "VSO" || attr == "OSV")
			return SpecPosInternal;
		  else
			return SpecPosFinal;
	  }
}
function GetHeadPos()
{
	elem = PawsSKAnswers.selectSingleNode("//typology");
	attr = elem.getAttribute("wordOrder");
	if (attr == "SVO" || attr == "VSO" || attr == "VOS")
	   return HeadPosInitial;
	else
	   return HeadPosFinal;
}

function GetPositionBasedOnSpecifier(sAttr)
{
	var eSpecPos;
	if (sAttr == "unknown")
	  {
		// set default
		eSpecPos = GetSpecifierPos();
		if (eSpecPos == SpecPosInitial || eSpecPos == SpecPosInternal)
			return "before";
		else
			return  "after";
	  }
	else
		return sAttr;
}
function GetPositionBasedOnHead(sAttr, bSame)
{
	var eHeadPo;
	if (sAttr == "unknown")
	  {
		// set default
		eHeadPos = GetHeadPos();
		if (eHeadPos == HeadPosInitial)
		  {
			if (bSame)
				return "before";
			else
				return "after";
		  }
		else
		  {
			if (bSame)
				return "after";
			else
				return "before";
		  }
	  }
	else
		return sAttr;
}
<xsl:apply-templates select="//groupName" mode="checked"/>
function saveData()
{
var sTemp;
<xsl:apply-templates select="//textBox | //groupName | //catMap" mode="save"/>
  div.save(strUserDataStore);
}
function ButtonNext()
{
	saveData();
	window.navigate ("<xsl:value-of select="//button[@value='Next']/@goto"/>");
}
function ButtonBack()
{
	saveData();
	window.navigate ("<xsl:value-of select="//button[@value='Back']/@goto"/>");
}
function ReturnContents()
{
	saveData();
	window.navigate ("Contents.htm");
}
function Refresh()
{
var valArray = new Array();
<xsl:for-each select="//showWhen">
		<xsl:variable name="showID" select="@id"/>
		<xsl:variable name="showable" select="//*[@show=$showID]"/>
		<xsl:for-each select="./*">
		  <xsl:if test="name()='whenValue'">
	elem = PawsSKAnswers.selectSingleNode("//<xsl:value-of select="@element"/>");<xsl:choose>
			  <xsl:when test="@attr">
		valArray[<xsl:value-of select="position()"/>] = elem.getAttribute("<xsl:value-of select="@attr"/>");</xsl:when>
			  <xsl:otherwise>
		valArray[<xsl:value-of select="position()"/>] = elem.text;
	  </xsl:otherwise>
			</xsl:choose>
		  </xsl:if>
		</xsl:for-each>
if (<xsl:for-each select="./*">
		  <xsl:choose>
			<xsl:when test="name(.)='whenRadio'">
			  <xsl:value-of select="@button"/>.checked</xsl:when>
			<xsl:when test="name()='whenValue'">valArray[<xsl:value-of select="position()"/>] == "<xsl:value-of select="@value"/>"</xsl:when>
			<xsl:when test="name()='and'"> &amp;&amp; </xsl:when>
			<xsl:when test="name()='or'"> || </xsl:when>
			<xsl:when test="name()='not'"> !</xsl:when>
			<xsl:when test="name()='openParen'"> ( </xsl:when>
			<xsl:when test="name()='closeParen'"> ) </xsl:when>
		  </xsl:choose>
		</xsl:for-each>)
  {
<xsl:for-each select="$showable">
		  <xsl:value-of select="@id"/>.style.display = "";
</xsl:for-each>  }
else
  {
<xsl:for-each select="$showable">
		  <xsl:value-of select="@id"/>.style.display = "none";
</xsl:for-each>  }
	  </xsl:for-each>
}
  </script>
  </xsl:template>
  <!--
  - - - - - - - -
  textBox element load
  - - - - - - - -
  -->
  <xsl:template match="//textBox | //catMap" mode="load">
example = PawsSKAnswers.selectSingleNode("//<xsl:value-of select="$Section"/>/<xsl:value-of select="./@dataItem"/>");
<xsl:value-of select="@id"/>.value = example.text;
</xsl:template>
  <!--
  - - - - - - - -
  textBox element save
  - - - - - - - -
  -->
  <xsl:template match="//textBox | //catMap" mode="save">
example = PawsSKAnswers.selectSingleNode("//<xsl:value-of select="$Section"/>/<xsl:value-of select="./@dataItem"/>");
//TODO: figure what to do if any of these are missing!
example.text = <xsl:value-of select="@id"/>.value;
</xsl:template>
  <!--
  - - - - - - - -
  groupName load
   - - - - - - - -
  -->
  <xsl:template match="//groupName" mode="load">
	elem = PawsSKAnswers.selectSingleNode("//<xsl:value-of select="$Section"/>");
	attr = elem.getAttribute("<xsl:value-of select="./@dataItem"/>")
<xsl:choose>
	  <xsl:when test="@position='no'">
		<xsl:for-each select="../radio">
		  <xsl:choose>
			<xsl:when test="position()=1">if (attr == "<xsl:value-of select="@dataValue"/>")
		</xsl:when>
			<xsl:when test="position()>1 and position() != last()">else if (attr == "<xsl:value-of select="@dataValue"/>")
</xsl:when>
			<xsl:otherwise>else
			</xsl:otherwise>
		  </xsl:choose>
		  <xsl:value-of select="@id"/>.checked = true;
	</xsl:for-each>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:choose>
		  <xsl:when test="@position='yesHead'">sPos = GetPositionBasedOnHead(attr, true);
	</xsl:when>
		  <xsl:when test="@position='yesHeadDiff'">sPos = GetPositionBasedOnHead(attr, false);
	</xsl:when>
		  <xsl:otherwise>sPos = GetPositionBasedOnSpecifier(attr);
</xsl:otherwise>
		</xsl:choose>
		<xsl:for-each select="../radio">
		  <xsl:choose>
			<xsl:when test="position()=1">if (sPos == "<xsl:value-of select="@dataValue"/>")
		</xsl:when>
			<xsl:when test="position()>1 and position() != last()">else if (sPos=="<xsl:value-of select="@dataValue"/>")
</xsl:when>
			<xsl:otherwise>else
</xsl:otherwise>
		  </xsl:choose>
		  <xsl:value-of select="@id"/>.checked = true;
	</xsl:for-each>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
  - - - - - - - -
  groupName save
   - - - - - - - -
  -->
  <xsl:template match="//groupName" mode="save">
	elem = PawsSKAnswers.selectSingleNode("//<xsl:value-of select="$Section"/>");
	attr = elem.getAttribute("<xsl:value-of select="./@dataItem"/>");
	//TODO: figure what to do if any of these are missing!
	sTemp = "<xsl:value-of select="@default"/>" // use default if all else fails...
	<xsl:for-each select="../radio">if (<xsl:value-of select="@id"/>.checked)
	sTemp = "<xsl:value-of select="@dataValue"/>";
	</xsl:for-each>elem.setAttribute("<xsl:value-of select="./@dataItem"/>", sTemp);
</xsl:template>
  <!--
  - - - - - - - -
  groupName checked
   - - - - - - - -
  -->
  <xsl:template match="//groupName" mode="checked">
function <xsl:value-of select="."/>(radio)
{
radio.checked = true;
Refresh();
}
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
	  <xsl:attribute name="value"><xsl:if test="@value='Back'">&lt;&#x20;</xsl:if><xsl:value-of select="@value"/><xsl:if test="@value='Next'">&#x20;&gt;</xsl:if></xsl:attribute>
	  <xsl:attribute name="name">B<xsl:value-of select="@value"/></xsl:attribute>
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:attribute name="onclick">Button<xsl:value-of select="@value"/>()</xsl:attribute>
	  <xsl:attribute name="style">width: 78px; height: 24px</xsl:attribute>
	</xsl:element>
	<xsl:if test="position()=1">&nbsp;</xsl:if>
  </xsl:template>
  <!-- buttons -->
  <xsl:template match="//buttons">
	<xsl:apply-templates/>
	<scan>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Contents.htm" onclick="ReturnContents()">Return to Contents</a>
	</scan>
  </xsl:template>
  <!-- category -->
  <xsl:template match="//category">
	<span class="category">
	  <xsl:value-of select="."/>
	</span>
  </xsl:template>
  <!-- catMap -->
  <xsl:template match="//catMap">
	<br/>
  Morphological category to be changed to <span class="category">
	  <xsl:value-of select="."/>
	</span> is:&#x20;&#x20;<input type="text" size="30" style="position:relative;top=3px">
	  <xsl:attribute name="name"><xsl:value-of select="./@id"/></xsl:attribute>
	</input>
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
	<xsl:if test="name(preceding-sibling::node()[1])='introduction'">
	  <br/>
	</xsl:if>
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
	<br/>
	<table border="1" style="BACKGROUND-COLOR: transparent" class="featureChart">
	  <tr>
		<xsl:if test="@types='yes'">
		  <th align="left" valign="top">Type of feature</th>
		</xsl:if>
		<th align="left" valign="top">Feature</th>
		<xsl:if test="not(@explanations='no')">
		  <th align="left" valign="top">Explanation</th>
		</xsl:if>
	  </tr>
	  <xsl:apply-templates/>
	</table>
  </xsl:template>
  <!-- featureExplanation -->
  <xsl:template match="//featureExplanation">
	<xsl:if test="not(ancestor::featureChart/@explanations='no')">
	  <td valign="top">
		<xsl:value-of select="."/>
	  </td>
	</xsl:if>
  </xsl:template>
  <!-- featureItem -->
  <xsl:template match="//featureItem">
	<td valign="top">
	  <span class="feature">
		<xsl:value-of select="."/>
	  </span>
	</td>
  </xsl:template>
  <!-- featureRow -->
  <xsl:template match="//featureRow">
	<tr>
	  <xsl:apply-templates/>
	</tr>
  </xsl:template>
  <!-- featureType -->
  <xsl:template match="//featureType">
	<xsl:if test="ancestor::featureChart/@types='yes'">
	  <td valign="top">
		<xsl:value-of select="."/>
	  </td>
	</xsl:if>
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
	<br/>
	<xsl:element name="div">
	  <xsl:attribute name="class">form</xsl:attribute>
	  <xsl:if test="@transparent='yes'">
		<xsl:attribute name="style">BACKGROUND-COLOR: transparent</xsl:attribute>
	  </xsl:if>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!-- groupName -->
  <xsl:template match="//groupName"/>
  <!-- just eat it here; used in radio -->
  <!-- instruction -->
  <xsl:template match="//instruction">
	<xsl:if test="not(@id)">
	  <br/>
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
	<i>
	  <xsl:apply-templates/>
	</i>
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
	<!-- won't work now... 2002.04.01-->
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
	  <xsl:if test="name(preceding-sibling::node()[1])='textBox'">
		<br/>
		<br/>
	  </xsl:if>
	  <!--      <xsl:value-of select="."/> -->
	  <xsl:choose>
		<xsl:when test="@id">
		  <span>
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:apply-templates/>
			<br/>
		  </span>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:apply-templates/>
		  <br/>
		</xsl:otherwise>
	  </xsl:choose>
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
		  <xsl:attribute name="onclick"><xsl:value-of select="../groupName"/>(<xsl:value-of select="@id"/>)</xsl:attribute>
		  <xsl:attribute name="value"><xsl:value-of select="@dataValue"/></xsl:attribute>
		  <xsl:if test="@checked">
			<xsl:attribute name="checked"/>
		  </xsl:if>
		</xsl:element>
	  </td>
	  <xsl:element name="td">
		<xsl:attribute name="width">99%</xsl:attribute>
		<xsl:attribute name="id"><xsl:value-of select="@id"/>Prompt</xsl:attribute>
		<xsl:attribute name="onclick"><xsl:value-of select="../groupName"/>(<xsl:value-of select="@id"/>)</xsl:attribute>
		<xsl:attribute name="value"><xsl:value-of select="@dataValue"/></xsl:attribute>
		<xsl:attribute name="onmouseover">this.style.cursor='default'</xsl:attribute>
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
	  <xsl:attribute name="class">section</xsl:attribute>
	  <xsl:value-of select="./@number"/>&nbsp;<xsl:value-of select="."/>
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
  <!--sub -->
  <xsl:template match="//sub">
	<sub>
	  <xsl:value-of select="."/>
	</sub>
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
	  <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
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
	<br/>
	<span class="tree">
	  <xsl:apply-templates/>
	</span>
	<br/>
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
