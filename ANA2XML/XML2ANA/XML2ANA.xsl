<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
	<!-- -->
	<xsl:param name="prmDecompSepChar" select="'-'"/>
	<xsl:template match="//anaRec">
		<xsl:variable name="iCount" select="count(mparse)"/>
		<xsl:if test="position()!=1">
			<xsl:text>&#xa;&#xa;</xsl:text>
		</xsl:if>
		<!-- a field -->
		<xsl:call-template name="DoField">
			<xsl:with-param name="sSFM" select="'\a '"/>
			<xsl:with-param name="iCount" select="$iCount"/>
			<xsl:with-param name="sType" select="'m'"/>
		</xsl:call-template>
		<!-- d field -->
		<xsl:if test="mparse[descendant::d]">
			<xsl:call-template name="DoField">
				<xsl:with-param name="sSFM" select="'
\d '"/>
				<xsl:with-param name="iCount" select="$iCount"/>
				<xsl:with-param name="sType" select="'d'"/>
			</xsl:call-template>
		</xsl:if>
		<!-- cat field -->
		<xsl:if test="mparse/cat">
			<xsl:call-template name="DoField">
				<xsl:with-param name="sSFM" select="'
\cat '"/>
				<xsl:with-param name="iCount" select="$iCount"/>
				<xsl:with-param name="sType" select="'mcat'"/>
			</xsl:call-template>
		</xsl:if>
		<!-- p field -->
		<xsl:if test="mparse[descendant::p]">
			<xsl:call-template name="DoField">
				<xsl:with-param name="sSFM" select="'
\p '"/>
				<xsl:with-param name="iCount" select="$iCount"/>
				<xsl:with-param name="sType" select="'p'"/>
			</xsl:call-template>
		</xsl:if>
		<!-- fd field -->
		<xsl:if test="mparse[descendant::fd]">
			<xsl:call-template name="DoField">
				<xsl:with-param name="sSFM" select="'
\fd '"/>
				<xsl:with-param name="iCount" select="$iCount"/>
				<xsl:with-param name="sType" select="'fd'"/>
			</xsl:call-template>
		</xsl:if>
		<!-- u field -->
		<xsl:if test="mparse[descendant::u]">
			<xsl:call-template name="DoField">
				<xsl:with-param name="sSFM" select="'
\u '"/>
				<xsl:with-param name="iCount" select="$iCount"/>
				<xsl:with-param name="sType" select="'u'"/>
			</xsl:call-template>
		</xsl:if>
		<!-- w field -->
		<xsl:if test="w">
			<xsl:text>
\w </xsl:text>
			<xsl:value-of select="w"/>
		</xsl:if>
		<!-- fmt field -->
		<xsl:if test="fmt">
			<xsl:text>
\f </xsl:text>
			<!--
			==========================================================
			N.B. NEED TO DEAL with tabs, backslahses and maybe newlines
			==========================================================
			-->
			<xsl:value-of select="fmt"/>
		</xsl:if>
		<!-- c field -->
		<xsl:if test="w/@cap">
			<xsl:text>
\c </xsl:text>
			<xsl:value-of select="w/@cap"/>
		</xsl:if>
		<!-- n field -->
		<xsl:if test="n and string-length(n) !=0">
			<xsl:text>
\n </xsl:text>
			<!--
			==========================================================
			N.B. NEED TO DEAL with tabs, backslahses and maybe newlines
			==========================================================
			-->
			<xsl:value-of select="n"/>
		</xsl:if>
	</xsl:template>
	<!--
	DoField
	   sType = 'm', 'u', 'd', 'mcat', 'fd' or 'p'
	   -->
	<xsl:template name="DoField">
		<xsl:param name="sSFM"/>
		<xsl:param name="iCount"/>
		<xsl:param name="sType"/>
		<xsl:value-of select="$sSFM"/>
		<xsl:if test="$iCount != 1">
			<xsl:text>%</xsl:text>
			<xsl:value-of select="$iCount"/>
			<xsl:text>%</xsl:text>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$iCount = 0">
				<xsl:text>%0%</xsl:text>
				<xsl:value-of select="w"/>
				<xsl:text>%</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="mparse">
					<xsl:if test="$sType='mcat'">
						<xsl:value-of select="cat"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:for-each select="a/*">
						<xsl:choose>
							<xsl:when test="name()='pfx'">
								<xsl:choose>
									<xsl:when test="$sType='m'">
										<xsl:value-of select="m"/>
										<xsl:text>&#x20;</xsl:text>
									</xsl:when>
									<xsl:when test="$sType='d'">
										<xsl:value-of select="d"/>
										<xsl:value-of select="$prmDecompSepChar"/>
									</xsl:when>
									<xsl:when test="$sType='mcat'">
										<xsl:value-of select="mcat"/>
										<xsl:text>=</xsl:text>
									</xsl:when>
									<xsl:when test="$sType='fd'">
										<xsl:value-of select="fd"/>
										<xsl:text>=</xsl:text>
									</xsl:when>
									<xsl:when test="$sType='u'">
										<xsl:value-of select="u"/>
										<xsl:text>=</xsl:text>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="name()='sfx'">
								<xsl:choose>
									<xsl:when test="$sType='m'">
										<xsl:text>&#x20;</xsl:text>
										<xsl:value-of select="m"/>
									</xsl:when>
									<xsl:when test="$sType='d'">
										<xsl:value-of select="$prmDecompSepChar"/>
										<xsl:value-of select="d"/>
									</xsl:when>
									<xsl:when test="$sType='mcat'">
										<xsl:text>=</xsl:text>
										<xsl:value-of select="mcat"/>
									</xsl:when>
									<xsl:when test="$sType='fd'">
										<xsl:text>=</xsl:text>
										<xsl:value-of select="fd"/>
									</xsl:when>
									<xsl:when test="$sType='u'">
										<xsl:text>=</xsl:text>
										<xsl:value-of select="u"/>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="name()='root'">
								<xsl:choose>
									<xsl:when test="$sType='m'">
										<xsl:if test="position()=1 or preceding-sibling::*[1][name()='pfx']">
											<!-- what about interfixes? -->
											<xsl:text>&lt;</xsl:text>
										</xsl:if>
										<xsl:value-of select="mcat"/>
										<xsl:text>&#x20;</xsl:text>
										<xsl:value-of select="m"/>
										<xsl:if test="position()=last() or following-sibling::*[1][name()='sfx']">
											<xsl:text> &gt;</xsl:text>
										</xsl:if>
									</xsl:when>
									<xsl:when test="$sType='d'">
										<xsl:if test="preceding-sibling::*[1][name()='root']">
											<xsl:value-of select="$prmDecompSepChar"/>
										</xsl:if>
										<xsl:value-of select="d"/>
									</xsl:when>
									<xsl:when test="$sType='mcat'">
										<xsl:if test="preceding-sibling::*[1][name()='root']">
											<xsl:text>=</xsl:text>
										</xsl:if>
										<xsl:value-of select="mcat"/>
									</xsl:when>
									<xsl:when test="$sType='fd'">
										<xsl:if test="preceding-sibling::*[1][name()='root']">
											<xsl:text>=</xsl:text>
										</xsl:if>
										<xsl:value-of select="fd"/>
									</xsl:when>
									<xsl:when test="$sType='u'">
										<xsl:if test="preceding-sibling::*[1][name()='root']">
											<xsl:text>=</xsl:text>
										</xsl:if>
										<xsl:value-of select="u"/>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
					<xsl:if test="$iCount != 1">
						<xsl:text>%</xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
