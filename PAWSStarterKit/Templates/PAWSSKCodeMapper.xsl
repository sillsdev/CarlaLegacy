<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" version="1.0" encoding="iso-8859-1" indent="yes"/>

<xsl:variable name="Section"><xsl:value-of select="//form/@section"></xsl:value-of></xsl:variable>
<xsl:template match="/">Option Explicit
Private Sub DHTMLPage_Load()
<xsl:apply-templates mode="load"/>
<xsl:if test="//radioGroup/@id">
	DisplayHidden
</xsl:if>
		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length &gt;= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" &amp; gsLangAbbr &amp; "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub
<xsl:apply-templates/>
</xsl:template>

	<!-- textBox element load and save -->
<xsl:template match="//textBox" mode="load">
<xsl:if test="not(preceding-sibling::textBox)">
	Dim elem As IXMLDOMNode</xsl:if>
	Set elem = gxmlDom.selectSingleNode("//<xsl:value-of select='$Section'/>/<xsl:value-of select='./@dataItem'/>")
	If (elem.baseName &lt;&gt; "") Then
		<xsl:value-of select="@id"/>.Value = elem.Text
	Else
		<xsl:value-of select="@id"/>.Value = ""
	End If
</xsl:template>

<xsl:template match="//textBox" mode="save">
<xsl:if test="not(preceding-sibling::textBox)">
	Dim elem As IXMLDOMNode</xsl:if>
	Set elem = gxmlDom.selectSingleNode("//<xsl:value-of select='$Section'/>/<xsl:value-of select='./@dataItem'/>")
	'TODO: figure what to do if any of these are missing!
	elem.Text = <xsl:value-of select="@id"/>.Value
</xsl:template>

	<!-- groupName load and save for attributes -->
<xsl:template match="//groupName" mode="load">
<!-- <xsl:if test="not(name(../..) = 'radioGroup')"> -->
<xsl:if test="not(name(../..) = 'radioGroup' or ../preceding-sibling::radioGroup)">
	Dim attr As IXMLDOMNode
	Dim sPos As String
</xsl:if>
	Set attr = gxmlDom.selectSingleNode("//<xsl:value-of select='$Section'/>/@<xsl:value-of select='./@dataItem'/>")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	<xsl:if test="@position='no'">
	<xsl:for-each select="../radio">
	<xsl:if test="position()=1">If (attr.Text = "<xsl:value-of select="@dataValue"/>") Then
		</xsl:if>
	<xsl:if test="position()>1 and position() != last()">ElseIf (attr.Text="<xsl:value-of select="@dataValue"/>") Then
		</xsl:if>
	<xsl:if test="position()=last()">Else
		</xsl:if>
		<xsl:value-of select="@id"/>.Checked = True
	</xsl:for-each>End If
</xsl:if>
<xsl:if test="not(@position='no')">
<xsl:if test="@position='yesHead'">sPos = gGetPositionBasedOnHead(attr.Text)
	</xsl:if>
<xsl:if test="@position='yesHeadDiff'">sPos = gGetPositionBasedOnHead(attr.Text, False)
	</xsl:if>
<xsl:if test="@position='yesSpec'">sPos = gGetPositionBasedOnSpecifier(attr.Text)
	</xsl:if>
	<xsl:for-each select="../radio">
	<xsl:if test="position()=1">If (sPos = "<xsl:value-of select="@dataValue"/>") Then
		</xsl:if>
	<xsl:if test="position()>1 and position() != last()">ElseIf (sPos="<xsl:value-of select="@dataValue"/>") Then
		</xsl:if>
	<xsl:if test="position()=last()">Else
		</xsl:if>
		<xsl:value-of select="@id"/>.Checked = True
	</xsl:for-each>End If
</xsl:if>
</xsl:template>

<xsl:template match="//groupName" mode="save">
<xsl:if test="not(name(../..) = 'radioGroup' or ../preceding-sibling::radioGroup)">
	Dim attr As IXMLDOMNode
	dim sTemp as String</xsl:if>
	Set attr = gxmlDom.selectSingleNode("//<xsl:value-of select='$Section'/>/@<xsl:value-of select='./@dataItem'/>")
	'TODO: figure what to do if any of these are missing!
	sTemp = "<xsl:value-of select="@default"/>" ' default if all else fails...
	<xsl:for-each select="../radio">if (<xsl:value-of select="@id"/>.Checked) Then sTemp = "<xsl:value-of select="@dataValue"/>"
	</xsl:for-each>attr.Text = sTemp
</xsl:template>

	<!-- each radio button has a prompt that needs to be clickable -->
<xsl:template match="//radio">
Private Function <xsl:value-of select="@id"/>_onclick() As Boolean
	<xsl:value-of select="@id"/>.Checked = True
	DisplayHidden
	<xsl:value-of select="@id"/>_onclick = True
End Function
Private Function <xsl:value-of select="@id"/>Prompt_onclick() As Boolean
	<xsl:value-of select="@id"/>_onclick
	<xsl:value-of select="@id"/>Prompt_onclick = True
End Function
</xsl:template>

	<!-- the Cancel button -->
<xsl:template match="//button[@value='Cancel']">
Private Function <xsl:value-of select="@id"/>_onclick() As Boolean
	<xsl:value-of select="@id"/>_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
<xsl:if test="//radioGroup/@id">
Private Sub DisplayHidden()
	' TODO: flesh out this routine
<xsl:for-each select="//radioGroup/@id">
<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="."/>.style.display = "none"
<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="."/>.style.display = ""
</xsl:for-each>
<xsl:for-each select="//instruction/@id">
<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="."/>.style.display = "none"
<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="."/>.style.display = ""
</xsl:for-each>
<xsl:for-each select="//span/@id">
<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="."/>.style.display = "none"
<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="."/>.style.display = ""
</xsl:for-each>
<xsl:for-each select="//textBox/@id">
<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="."/>.style.display = "none"
<xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:text> </xsl:text><xsl:value-of select="."/>.style.display = ""
</xsl:for-each>
End Sub
</xsl:if>
</xsl:template>

	<!-- the OK button -->
<xsl:template match="//button[@value='OK'] |//button[@value='Yes'] |//button[@value='No']">
Private Function <xsl:value-of select="@id"/>_onclick() As Boolean
<xsl:apply-templates mode="save" select="//form"/>
	gbDirty = True  ' mark it as having changed

	<xsl:value-of select="@id"/>_onclick = True

	BaseWindow.navigate "<xsl:value-of select="@goto"/>"
End Function
</xsl:template>
<xsl:template match="//codeInfo">
		' TODO: <xsl:value-of select="."/>
</xsl:template>
<xsl:template match="//codeInfo" mode="load">
		' TODO: <xsl:value-of select="."/>
</xsl:template>
<xsl:template match="//codeInfo" mode="save">
		' TODO: <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="//instruction" mode="load"><xsl:apply-templates mode="load" select="./*/file"/></xsl:template>

<xsl:template match="//file" mode="load">		' change name of test file
	<xsl:value-of select="@id"/>.innerText = gsLangAbbr &amp; "<xsl:value-of select="@section"/>Test.txt"
</xsl:template>

<!-- **************************************************************************
	  No code needed for the remaining
	  *************************************************************************** -->
<xsl:template match="//br"/>
<xsl:template match="//br" mode="load"/>
<xsl:template match="//br" mode="save"/>
<xsl:template match="//category"/>
<xsl:template match="//category" mode="load"/>
<xsl:template match="//category" mode="save"/>
<xsl:template match="//EnglishExample"/>
<xsl:template match="//EnglishExample" mode="load"/>
<xsl:template match="//EnglishExample" mode="save"/>
<xsl:template match="//example"/>
<xsl:template match="//example" mode="load"/>
<xsl:template match="//example" mode="save"/>
<xsl:template match="//exItem"/>
<xsl:template match="//exItem" mode="load"/>
<xsl:template match="//exItem" mode="save"/>
<xsl:template match="//feature"/>
<xsl:template match="//feature" mode="load"/>
<xsl:template match="//feature" mode="save"/>
<xsl:template match="//file"/>
<!-- <xsl:template match="//file" mode="load"/> -->
<xsl:template match="//file" mode="save"/>
<xsl:template match="//groupName"/>
<xsl:template match="//instruction"/>
<xsl:template match="//instruction" mode="save"/>
<xsl:template match="//introduction"/>
<xsl:template match="//introduction" mode="load"/>
<xsl:template match="//introduction" mode="save"/>
<xsl:template match="//li"/>
<xsl:template match="//li" mode="load"/>
<xsl:template match="//li" mode="save"/>
<xsl:template match="//p"/>
<xsl:template match="//p" mode="load"/>
<xsl:template match="//p" mode="save"/>
<xsl:template match="//prompt"/>
<xsl:template match="//prompt" mode="load"/>
<xsl:template match="//prompt" mode="save"/>
<xsl:template match="//radio" mode="load"/>
<xsl:template match="//radio" mode="save"/>
<xsl:template match="//ruleInfo"/>
<xsl:template match="//ruleInfo" mode="load"/>
<xsl:template match="//ruleInfo" mode="save"/>
<xsl:template match="//span"/>
<xsl:template match="//span" mode="load"/>
<xsl:template match="//span" mode="save"/>
<xsl:template match="//title"/>
<xsl:template match="//title" mode="load"/>
<xsl:template match="//title" mode="save"/>
<xsl:template match="//tool"/>
<xsl:template match="//tool" mode="load"/>
<xsl:template match="//tool" mode="save"/>
<xsl:template match="//u"/>
<xsl:template match="//u" mode="load"/>
<xsl:template match="//u" mode="save"/>
<xsl:template match="//ul"/>
<xsl:template match="//ul" mode="load"/>
<xsl:template match="//ul" mode="save"/>

</xsl:stylesheet>
