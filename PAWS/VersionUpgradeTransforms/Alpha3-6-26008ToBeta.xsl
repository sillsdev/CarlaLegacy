<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from Alpha version 0.3.6.26008 to Beta version 4.1
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* |  node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<!--
font
-->
	<xsl:template match="//font">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="rtl">False</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<!--
	qp
	-->
	<xsl:template match="//qp">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="npDegreePosType">proclitic</xsl:attribute>
			<xsl:attribute name="npDegreeNegType">proclitic</xsl:attribute>
			<xsl:attribute name="npDegreeNegCooccur">no</xsl:attribute>
			<xsl:attribute name="npDegreeNegPos">unknown</xsl:attribute>
			<xsl:attribute name="npDegreeNegEither">unrestricted</xsl:attribute>
			<xsl:attribute name="determiner">yes</xsl:attribute>
			<xsl:attribute name="determinerPos">unknown</xsl:attribute>
			<xsl:attribute name="determinerEither">unrestricted</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="qp/@cardinalHeadPos">
		<xsl:attribute name="cardinalHead"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
	<xsl:template match="qp/all">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
		<xsl:element name="almost"/>
	</xsl:template>
	<xsl:template match="qp/only">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
		<xsl:element name="not"/>
	</xsl:template>
	<xsl:template match="qp/just"/>
	<xsl:template match="qp/example">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
		<xsl:element name="negExample"/>
		<xsl:element name="negCooccurExample"/>
		<xsl:element name="determinerExample"/>
		<xsl:element name="determinerNPExample"/>
		<xsl:element name="determinerNegExample"/>
		<xsl:element name="determinerNegNPExample"/>
	</xsl:template>
	<!--
	advp
	-->
	<xsl:template match="//advp">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="negTemporalType">word</xsl:attribute>
			<xsl:attribute name="negLocativeType">word</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="advp/temporalExample">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
		<xsl:element name="negTemporalExample"/>
		<xsl:element name="negTemporalAffixExample"/>
	</xsl:template>
	<xsl:template match="advp/locativeExample">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
		<xsl:element name="negLocativeExample"/>
		<xsl:element name="negLocativeAffixExample"/>
	</xsl:template>
	<!--
	pron
	-->
	<xsl:template match="//pron">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="negIndef">no</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<!--
	ip
	-->
	<xsl:template match="//ip">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:attribute name="negAux">noVerb</xsl:attribute>
			<xsl:attribute name="negAuxRequiresAux">no</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="ip/@copularAffix">
		<xsl:attribute name="copularAffix"><xsl:choose><xsl:when test=".='yes'">yesEither</xsl:when><xsl:otherwise>no</xsl:otherwise></xsl:choose></xsl:attribute>
	</xsl:template>
	<xsl:template match="ip/auxExample">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
		<xsl:element name="negAuxExample"/>
		<xsl:element name="negAuxAffixExample"/>
		<xsl:element name="negVerbExample"/>
	</xsl:template>
	<!--
	relcl
	-->
	<xsl:template match="relcl/@type">
		<xsl:choose>
			<xsl:when test=".='none'">
				<xsl:attribute name="exist">no</xsl:attribute>
				<xsl:attribute name="clausePos">unknown</xsl:attribute>
				<xsl:attribute name="type">IP</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="exist">yes</xsl:attribute>
				<xsl:attribute name="clausePos">unknown</xsl:attribute>
				<xsl:attribute name="type"><xsl:value-of select="."/></xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--
	neg
	-->
	<xsl:template match="//neg">
		<xsl:element name="neg">
			<xsl:attribute name="checkedOff">no</xsl:attribute>
			<xsl:attribute name="subjVerbRequired">no</xsl:attribute>
			<xsl:attribute name="advVerbRequired">no</xsl:attribute>
			<xsl:attribute name="auxVerbRequired">no</xsl:attribute>
			<xsl:attribute name="type">changing</xsl:attribute>
			<xsl:attribute name="polarityItems">no</xsl:attribute>
			<xsl:attribute name="objVerbRequired">other</xsl:attribute>
			<xsl:attribute name="negFront">no</xsl:attribute>
			<xsl:element name="degreeSubjExample"/>
			<xsl:element name="determinerSubjExample"/>
			<xsl:element name="pronounSubjExample"/>
			<xsl:element name="advTemporalExample"/>
			<xsl:element name="advLocativeExample"/>
			<xsl:element name="auxExample"/>
			<xsl:element name="auxAffixExample"/>
			<xsl:element name="verbAffixExample"/>
			<xsl:element name="npiPronounExample"/>
			<xsl:element name="npiDeterminerExample"/>
			<xsl:element name="npiTemporalExample"/>
			<xsl:element name="npiLocativeExample"/>
			<xsl:element name="objectExample"/>
			<xsl:element name="indirectObjectExample"/>
			<xsl:element name="subjectObjectExample"/>
		</xsl:element>
	</xsl:template>
	<!--
	coord
	-->
	<xsl:template match="//coord">
		<xsl:element name="coord">
			<xsl:attribute name="checkedOff">no</xsl:attribute>
			<xsl:element name="and"/>
			<xsl:element name="or"/>
			<xsl:element name="but"/>
			<xsl:element name="andOr"/>
			<xsl:element name="with"/>
			<xsl:element name="other"/>
			<xsl:element name="either"/>
			<xsl:element name="neither"/>
			<xsl:element name="nor"/>
			<xsl:element name="sentExample"/>
			<xsl:element name="vpExample"/>
			<xsl:element name="dpExample"/>
			<xsl:element name="adjExample"/>
			<xsl:element name="conjunctionCategory"/>
		</xsl:element>
	</xsl:template>
	<!--
	focus
	-->
	<xsl:template match="//focus">
		<xsl:element name="focus">
			<xsl:attribute name="checkedOff">no</xsl:attribute>
			<xsl:attribute name="topic">no</xsl:attribute>
			<xsl:attribute name="topicPos">unknown</xsl:attribute>
			<xsl:attribute name="topicMarker">no</xsl:attribute>
			<xsl:attribute name="topicMarkerPos">unknown</xsl:attribute>
			<xsl:attribute name="topicMarkerRequired">no</xsl:attribute>
			<xsl:attribute name="topicMarkerEither">no</xsl:attribute>
			<xsl:attribute name="focus">no</xsl:attribute>
			<xsl:attribute name="focusPos">unknown</xsl:attribute>
			<xsl:attribute name="focusMarker">no</xsl:attribute>
			<xsl:attribute name="focusMarkerPos">unknown</xsl:attribute>
			<xsl:attribute name="focusMarkerRequired">no</xsl:attribute>
			<xsl:attribute name="focusMarkerEither">no</xsl:attribute>
			<xsl:element name="topicExample"/>
			<xsl:element name="topicMarkerExample"/>
			<xsl:element name="focusExample"/>
			<xsl:element name="focusMarkerExample"/>
		</xsl:element>
	</xsl:template>
	<!--
	excl
	-->
	<xsl:template match="//excl">
		<xsl:element name="excl">
			<xsl:attribute name="checkedOff">no</xsl:attribute>
			<xsl:attribute name="exclM">no</xsl:attribute>
			<xsl:attribute name="exclMPos">unknown</xsl:attribute>
			<xsl:attribute name="exclMEither">no</xsl:attribute>
			<xsl:element name="greetExample"/>
			<xsl:element name="intjExample"/>
			<xsl:element name="yesExample"/>
			<xsl:element name="noExample"/>
			<xsl:element name="exclExample"/>
			<xsl:element name="exclMExample"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
