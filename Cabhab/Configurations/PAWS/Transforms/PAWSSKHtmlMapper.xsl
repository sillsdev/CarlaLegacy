<?xml version="1.0" encoding="UTF-8"?>
<!--
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<!--
================================================================
Convert XML Page description to HTML and JScript code
  Input:    xml file conforming to PAWSSKHtmlMapper.dtd
  Output: HTML within embedded JScript
================================================================
Revision History is at the end of this file.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Preamble
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
	<xsl:param name="prmInstallPath"/>
	<xsl:param name="prmLangAbbr"/>
	<xsl:param name="prmRtlScript"/>
	<xsl:param name="prmStylesheet"/>
	<xsl:param name="prmWorkingPath"/>
	<xsl:variable name="Section">
		<xsl:value-of select="//form/@section"/>
	</xsl:variable>
	<!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Main template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
	<xsl:template match="/">
		<xsl:comment>Cabhab generated html page</xsl:comment>
		<xsl:comment>PageCount="<xsl:value-of select="page/@count"/>"</xsl:comment>
		<html>
			<head>
				<!-- generated automatically? <meta http-equiv="Content-Type" content="text/html; "/> -->
				<title>
					<xsl:value-of select="/page/title"/>
				</title>
				<style type="text/css">
					<xsl:value-of select="$prmStylesheet"/>
					<xsl:text>
BODY {
  background-image: url(</xsl:text>
					<xsl:value-of select="$prmInstallPath"/>
					<xsl:text>Styles/p12c08.gif);
}
</xsl:text>
				</style>
				<xsl:call-template name="JScript"/>
			</head>
			<body onload="Initialize()">
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
		<script language="jscript"  id="clientEventHandlersJS">
  // variables used throughout functions below
var attr;
	// would like to use enums, but apparently they are not supported yet
var HeadPosInitial = 1;
var HeadPosFinal = 2;

var SpecPosInitial = 1;
var SpecPosInternal = 2;
var SpecPosFinal = 3;
var SpecPosUnknown = 4;

  function Initialize()
{
<xsl:apply-templates select="//textBox | //groupName | //catMap | //featureItem" mode="load"/>
window.external.SetLeftOffAt("<xsl:value-of select="$prmWorkingPath"/>
			<xsl:value-of select="//page/@id"/>.htm");
Refresh()
}
function GetSpecifierPos()
{
	window.external.GetAnswerValue("//typology/@wordOrder");
	attr = window.external.OutValue;
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
	window.external.GetAnswerValue("//typology/@wordOrder");
	attr = window.external.OutValue;
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
<xsl:apply-templates select="//textBox | //groupName | //catMap | //featureItem" mode="save"/>
}
function ButtonNext()
{
	saveData();
	window.external.GetAnswerValue("/paws/@outputGrammar");
	attr = window.external.OutValue;
	if (attr == "False")
	window.navigate ("<xsl:variable name="sGoToNoGrammar" select="normalize-space(//button[@value='Next']/@gotoNoGrammar)"/>
			<xsl:variable name="sGoTo" select="normalize-space(//button[@value='Next']/@goto)"/>
			<xsl:choose>
			<xsl:when test="string-length($sGoToNoGrammar) &gt; 0">
				<xsl:value-of select="$sGoToNoGrammar"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$sGoTo"/>
			</xsl:otherwise>
		</xsl:choose>");
	 else
		window.navigate ("<xsl:value-of select="$sGoTo"/>");
}
function ButtonBack()
{
	saveData();
	window.external.GetAnswerValue("/paws/@outputGrammar");
	attr = window.external.OutValue;
	if (attr == "False")
	window.navigate ("<xsl:variable name="sBackGoToNoGrammar" select="normalize-space(//button[@value='Back']/@gotoNoGrammar)"/>
			<xsl:variable name="sBackGoTo" select="normalize-space(//button[@value='Back']/@goto)"/><xsl:choose>
		<xsl:when test="string-length($sBackGoToNoGrammar) &gt; 0">
			<xsl:value-of select="$sBackGoToNoGrammar"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$sBackGoTo"/>
		</xsl:otherwise>
	</xsl:choose>");
			else
			window.navigate ("<xsl:value-of select="$sBackGoTo"/>");
}
function ReturnContents()
{
	saveData();
	window.navigate ("<xsl:value-of select="$prmInstallPath"/>HTMs/Contents.htm");
}
function Refresh()
{
var valArray = new Array();
<xsl:for-each select="//showWhen">
				<xsl:variable name="showID" select="@id"/>
				<xsl:variable name="showable" select="//*[@show=$showID]"/>
				<xsl:for-each select="./*">
					<xsl:if test="name()='whenValue'">
						<xsl:choose>
							<xsl:when test="@attr">
	window.external.GetAnswerValue("//<xsl:value-of select="@element"/>/@<xsl:value-of select="@attr"/>");
											  </xsl:when>
							<xsl:otherwise>
	window.external.GetAnswerValue("//<xsl:value-of select="@element"/>");
	  </xsl:otherwise>
						</xsl:choose>
		valArray[<xsl:value-of select="position()"/>] = window.external.OutValue;
					</xsl:if>
				</xsl:for-each>
if (<xsl:for-each select="./*">
					<xsl:choose>
						<xsl:when test="name(.)='whenRadio'">
							<xsl:value-of select="@button"/>.checked</xsl:when>
						<xsl:when test="name()='whenValue'">(valArray[<xsl:value-of select="position()"/>] == "<xsl:value-of select="@value"/>")</xsl:when>
						<xsl:when test="name()='and'"> &amp;&amp; </xsl:when>
						<xsl:when test="name()='or'"> || </xsl:when>
						<xsl:when test="name()='not'"> !</xsl:when>
						<xsl:when test="name()='openParen'"> ( </xsl:when>
						<xsl:when test="name()='closeParen'"> ) </xsl:when>
					</xsl:choose>
				</xsl:for-each>)
  {
<xsl:for-each select="$showable">
					<xsl:choose>
						<xsl:when test="name()='radio'">
							<xsl:value-of select="@id"/>_tr.style.display = "";
</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@id"/>.style.display = "";
</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>  }
else
  {
<xsl:for-each select="$showable">
					<xsl:choose>
						<xsl:when test="name()='radio'">
							<xsl:value-of select="@id"/>_tr.style.display = "none";
</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@id"/>.style.display = "none";
</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>  }
	  </xsl:for-each>
window.external.GetAnswerValue("/paws/@outputGrammar");
attr = window.external.OutValue;
if (attr == "False")
{
			<xsl:for-each select="//instruction[ancestor::form and string-length(normalize-space(@id)) &gt; 0]">
				<xsl:value-of select="@id"/>
				<xsl:text>.style.display = "none";
</xsl:text>
			</xsl:for-each>
}
}
		</script>
	</xsl:template>
	<!--
  - - - - - - - -
  textBox element load
  - - - - - - - -
  -->
	<xsl:template match="//textBox | //catMap" mode="load">
		<xsl:text>window.external.GetAnswerValue("//</xsl:text>
		<xsl:choose>
			<xsl:when test="@section">
				<xsl:value-of select="@section"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$Section"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="./@dataItem"/>");
<xsl:value-of select="@id"/>.value = window.external.OutValue;
</xsl:template>
	<!--
  - - - - - - - -
  textBox element save
  - - - - - - - -
  -->
	<xsl:template match="//textBox | //catMap" mode="save">
		<xsl:text>window.external.SetAnswerValue("//</xsl:text>
		<xsl:choose>
			<xsl:when test="@section">
				<xsl:value-of select="@section"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$Section"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="./@dataItem"/>", <xsl:value-of select="@id"/>.value);
</xsl:template>
	<!--
  - - - - - - - -
  featureItem load
   - - - - - - - -
  -->
	<xsl:template match="//featureItem" mode="load">
	window.external.GetAnswerValue("//<xsl:value-of select="$Section"/>/<xsl:value-of select="@dataValue"/>/@checked");
	attr = window.external.OutValue;
	if (attr == "yes")
		  <xsl:value-of select="@name"/>.checked = true;
	else
			  <xsl:value-of select="@name"/>.checked = false;
  </xsl:template>
	<!--
  - - - - - - - -
  featureItem save
   - - - - - - - -
  -->
	<xsl:template match="//featureItem" mode="save">
	//TODO: figure what to do if any of these are missing!
	sTemp = "no" // use default if all else fails...
	if (<xsl:value-of select="@name"/>.checked)
	  sTemp = "yes";
	window.external.SetAnswerValue("//<xsl:value-of select="$Section"/>/<xsl:value-of select="./@dataValue"/>/@checked", sTemp);
</xsl:template>
	<!--
  - - - - - - - -
  groupName load
   - - - - - - - -
  -->
	<xsl:template match="//groupName" mode="load">
	window.external.GetAnswerValue("//<xsl:value-of select="$Section"/>/@<xsl:value-of select="./@dataItem"/>");
	attr = window.external.OutValue;
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
	//TODO: figure what to do if any of these are missing!
	sTemp = "<xsl:value-of select="@default"/>" // use default if all else fails...
	<xsl:for-each select="../radio">if (<xsl:value-of select="@id"/>.checked)
	sTemp = "<xsl:value-of select="@dataValue"/>";
	</xsl:for-each>
	window.external.SetAnswerValue("//<xsl:value-of select="$Section"/>/@<xsl:value-of select="./@dataItem"/>", sTemp);
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
	<!--
   a
	-->
	<xsl:template match="//a">
		<a href="{@href}">
			<xsl:if test="@target">
				<xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</a>
	</xsl:template>
	<!--
   br
	-->
	<xsl:template match="//br">
		<br/>
	</xsl:template>
	<!--
   button
	-->
	<xsl:template match="//button">
		<xsl:element name="input">
			<xsl:attribute name="type">button</xsl:attribute>
			<xsl:attribute name="value"><xsl:if test="@value='Back'">&lt;&#x20;</xsl:if><xsl:value-of select="@value"/><xsl:if test="@value='Next'">&#x20;&gt;</xsl:if></xsl:attribute>
			<xsl:attribute name="name">B<xsl:value-of select="@value"/></xsl:attribute>
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:attribute name="onclick">Button<xsl:value-of select="@value"/>()</xsl:attribute>
			<xsl:attribute name="style">width: 78px; height: 24px</xsl:attribute>
		</xsl:element>
		<xsl:if test="position()=1">
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		</xsl:if>
	</xsl:template>
	<!--
   buttons
	-->
	<xsl:template match="//buttons">
		<xsl:apply-templates/>
		<scan>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
			<a onclick="ReturnContents()">
				<xsl:attribute name="href"><xsl:value-of select="$prmInstallPath"/>HTMs/Contents.htm</xsl:attribute>
				<xsl:text>Return to Contents</xsl:text>
			</a>
		</scan>
	</xsl:template>
	<!--
   category
	-->
	<xsl:template match="//category">
		<span class="category">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<!--
   catMap
	-->
	<xsl:template match="//catMap">
		<br/>
  Morphological category to be changed to <span class="category">
			<xsl:value-of select="."/>
		</span> is:&#x20;&#x20;<input type="text" size="30" style="position:relative;top=3px">
			<xsl:attribute name="name"><xsl:value-of select="./@id"/></xsl:attribute>
		</input>
	</xsl:template>
	<!--
   codeInfo
	-->
	<xsl:template match="//codeInfo">
		<xsl:comment>
			<xsl:value-of select="."/>
		</xsl:comment>&#xa;
</xsl:template>
	<!--
   contents
	-->
	<xsl:template match="//contents">
		<span class="contents">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<!--
   div
	-->
	<xsl:template match="//div">
		<xsl:element name="div">
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!--
   EnglishExample
	-->
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
	<!--
   example
	-->
	<xsl:template match="//example">
		<span class="example">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<!--
   exItem
	-->
	<xsl:template match="//exItem">
		<tr>
			<td valign="top">
				<xsl:if test="not(@label)">
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</xsl:if>
				<xsl:if test="@label">
					<xsl:value-of select="@label"/>
				</xsl:if>
			</td>
			<td>
				<xsl:apply-templates/>
			</td>
		</tr>
	</xsl:template>
	<!--
   feature
	-->
	<xsl:template match="//feature">
		<span class="feature">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<!--
   featureChart
	-->
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
	<!--
   featureExplanation
	-->
	<xsl:template match="//featureExplanation">
		<xsl:if test="not(ancestor::featureChart/@explanations='no')">
			<td valign="top">
				<xsl:value-of select="."/>
			</td>
		</xsl:if>
	</xsl:template>
	<!--
   featureItem
	-->
	<xsl:template match="//featureItem">
		<td valign="top">
			<input type="checkbox">
				<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
				<xsl:attribute name="value"><xsl:value-of select="@dataValue"/></xsl:attribute>
				<span class="feature">
					<xsl:value-of select="."/>
				</span>
			</input>
		</td>
	</xsl:template>
	<!--
   featureRow
	-->
	<xsl:template match="//featureRow">
		<tr>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	<!--
   featureType
	-->
	<xsl:template match="//featureType">
		<xsl:if test="ancestor::featureChart/@types='yes'">
			<td valign="top">
			<xsl:if test="@rowspan">
			<xsl:attribute name="rowspan">
			<xsl:value-of select="@rowspan"/>
			</xsl:attribute>
			</xsl:if>
				<xsl:value-of select="."/>
			</td>
		</xsl:if>
	</xsl:template>
	<!--
   file
	-->
	<xsl:template match="//file">
		<xsl:element name="span">
			<xsl:attribute name="class">file</xsl:attribute>
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:value-of select="$prmLangAbbr"/>
			<xsl:value-of select="substring-after(.,'xxx')"/>
		</xsl:element>
	</xsl:template>
	<!--
   font or fileInfo or directoryInfo
	-->
	<xsl:template match="//font | //fileInfo | //directoryInfo">
		<xsl:apply-templates select="prompt"/>
		<xsl:choose>
			<xsl:when test="name()='font'">
		<xsl:call-template name="DoButtonedTextArea">
			<xsl:with-param name="sButtonString" select="' Change Font '"/>
			<xsl:with-param name="sCol" select="'40'"/>
		</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
					<xsl:call-template name="DoButtonedTextArea">
			<xsl:with-param name="sButtonString" select="' Browse '"/>
			<xsl:with-param name="sCol" select="'60'"/>
		</xsl:call-template>
</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
   form
	-->
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
	<!--
   groupName
	-->
	<xsl:template match="//groupName"/>
	<!-- just eat it here; used in radio -->
	<!--
   instruction
	-->
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
	<!--
   help
	-->
	<xsl:template match="//help">
		<xsl:element name="a">
			<xsl:attribute name="href"><xsl:value-of select="$prmInstallPath"/><xsl:value-of select="@href"/></xsl:attribute>
			<xsl:value-of select="."/>
		</xsl:element>
	</xsl:template>
	<!--
   i
	-->
	<xsl:template match="//i">
		<i>
			<xsl:apply-templates/>
		</i>
	</xsl:template>
	<!--
   introduction
	-->
	<xsl:template match="//introduction">
		<xsl:if test="position()>2">
			<br/>
		</xsl:if>
		<div class="introduction">
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>
			<p>
				<xsl:apply-templates/>
			</p>
		</div>
		<!--
	- top level case -
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
	- within a form case -
	- won't work now... 2002.04.01-
	<xsl:if test="name(..)='form'">
	  <p class="introduction">
		<xsl:apply-templates/>
	  </p>
	</xsl:if>
	-->
	</xsl:template>
	<!--
   li
	-->
	<xsl:template match="//li">
		<xsl:element name="li">
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!--
   ol
	-->
	<xsl:template match="//ol">
		<ol style="margin-top: .025in">
			<xsl:apply-templates/>
		</ol>
	</xsl:template>
	<!--
   p
	-->
	<xsl:template match="//p">
		<xsl:element name="p">
			<xsl:if test="@style">
				<xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!--
   prompt
	-->
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
			<!--      <xsl:value-of select="."/> -->
			<xsl:choose>
				<xsl:when test="@id">
					<p style="margin-left: 0.125in">
						<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:if test="name(preceding-sibling::node()[1])='textBox'">
				<br/>
				<br/>
			</xsl:if>
						<xsl:apply-templates/>
						<br/>
					</p>
				</xsl:when>
				<xsl:otherwise>
			<xsl:if test="name(preceding-sibling::node()[1])='textBox'">
				<br/>
				<br/>
			</xsl:if>
					<p style="margin-left: 0.125in">
						<xsl:apply-templates/>
						<br/>
					</p>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!--
   radio
	-->
	<xsl:template match="//radio">
		<tr>
			<xsl:if test="@id and @show">
				<xsl:attribute name="id"><xsl:value-of select="@id"/>_tr</xsl:attribute>
			</xsl:if>
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
				<xsl:attribute name="id"><xsl:value-of select="@id"/>RPrompt</xsl:attribute>
				<xsl:attribute name="onclick"><xsl:value-of select="../groupName"/>(<xsl:value-of select="@id"/>)</xsl:attribute>
				<xsl:attribute name="value"><xsl:value-of select="@dataValue"/></xsl:attribute>
				<xsl:attribute name="onmouseover">this.style.cursor='default'</xsl:attribute>
				<xsl:apply-templates/>
			</xsl:element>
		</tr>
	</xsl:template>
	<!--
   radioGroup
	-->
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
				<td>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</td>
				<td>
					<xsl:element name="table">
						<xsl:attribute name="border">0</xsl:attribute>
						<xsl:apply-templates/>
					</xsl:element>
				</td>
			</xsl:element>
		</xsl:if>
	</xsl:template>
	<!--
   ruleInfo
	-->
	<xsl:template match="//ruleInfo">
		<xsl:comment>
			<xsl:value-of select="."/>
		</xsl:comment>&#xa;
</xsl:template>
	<!--
   section
	-->
	<xsl:template match="//section">section <xsl:element name="span">
			<xsl:attribute name="class">section</xsl:attribute>
			<xsl:value-of select="./@number"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="."/>
		</xsl:element>
	</xsl:template>
	<!--
   span
	-->
	<xsl:template match="//span">
		<xsl:element name="span">
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!--
  sub
   -->
	<xsl:template match="//sub">
		<sub>
			<xsl:value-of select="."/>
		</sub>
	</xsl:template>
	<!--
   textBox
	-->
	<xsl:template match="//textBox">&#xa;
<xsl:element name="textarea">
			<xsl:attribute name="class">vernacular</xsl:attribute>
			<xsl:attribute name="style">margin-left: 0.5in</xsl:attribute>
			<xsl:if test="$prmRtlScript='True'">
				<xsl:attribute name="style">direction: rtl</xsl:attribute>
			</xsl:if>
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
	<!--
   title
	-->
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
	<!--
   tool
	-->
	<xsl:template match="//tool">
		<span class="tool">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<!--
   template
	-->
	<xsl:template match="//template">
		<span class="template">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<!--
   templateName
	-->
	<xsl:template match="//templateName">
		<span class="templateName">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<!--
   tree
	-->
	<xsl:template match="//tree">
		<br/>
		<xsl:choose>
			<xsl:when test="@img">
				<img>
					<xsl:attribute name="src"><xsl:value-of select="$prmInstallPath"/><xsl:value-of select="@img"/></xsl:attribute>
				</img>
			</xsl:when>
			<xsl:otherwise>
				<span class="tree">
					<xsl:apply-templates/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
		<br/>
	</xsl:template>
	<!--
   u
	-->
	<xsl:template match="//u">
		<u>
			<xsl:value-of select="."/>
		</u>
	</xsl:template>
	<!--
   ul
	-->
	<xsl:template match="//ul">
		<ul style="margin-top: .025in">
			<xsl:apply-templates/>
		</ul>
	</xsl:template>
	<!--
   DoButtonedTextArea
	-->
	<xsl:template name="DoButtonedTextArea">
		<xsl:param name="sButtonString"/>
		<xsl:param name="sCol"/>

	&#xa;
<xsl:element name="textarea">
			<xsl:attribute name="style">margin-left: 0.5in</xsl:attribute>
			<xsl:attribute name="wrap">off</xsl:attribute>
			<xsl:attribute name="rows">1</xsl:attribute>
			<xsl:attribute name="cols"><xsl:value-of select="$sCol"/></xsl:attribute>
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:if test="@contenteditable">
				<xsl:attribute name="contenteditable"><xsl:value-of select="@contenteditable"/></xsl:attribute>
			</xsl:if>
		</xsl:element>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
		<xsl:element name="input">
			<xsl:attribute name="type">button</xsl:attribute>
			<xsl:attribute name="value"><xsl:value-of select="$sButtonString"/></xsl:attribute>
			<xsl:attribute name="name">B<xsl:value-of select="@id"/></xsl:attribute>
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<xsl:attribute name="onclick">Button<xsl:value-of select="@id"/>()</xsl:attribute>
			<xsl:attribute name="style">width: 85px; height: 24px</xsl:attribute>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
<!--
================================================================
Revision History
- - - - - - - - - - - - - - - - - - -
28-Oct-2004   Andy Black  Add parameter for right-to-left script and set style for textboxes.
09-Aug-2002  Andy Black  Fix bug: textBox and catMap save did not allow for section attr
08-Aug-2002  Andy Black  Add div element; "beautify" some comments
09-Jul-2002   Andy Black  Add checkbox within featureItem element
28-Jun-2002  Andy Black  Allow section attribute for textbox element
26-Jun-2002  Andy Black  Change radio prompt name to end with RPrompt
10-Jun-2002  Andy Black  Added indent to default prompt
05-Jun-2002  Andy Black  Added img to tree
2001               Andy Black  Began working on Initial Draft
================================================================
 -->
