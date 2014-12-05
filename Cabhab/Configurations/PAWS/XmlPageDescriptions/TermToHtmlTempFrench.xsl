<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
	<xsl:template match="technicalTerms">
		<html>
			<body>
				<table>
					<tr>
						<th align="left">English</th>
						<th valign="top" align="left">French                    </th>
						<th>Definition</th>
					</tr>
				<xsl:apply-templates/>
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="technicalTerm">
		<tr>
			<td valign="top">
				<xsl:apply-templates select="termInLang/term"/>
			</td>
			<td valign="top">
			
			</td>
			<td>
				<xsl:apply-templates select="termInLang/termDefinition"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
