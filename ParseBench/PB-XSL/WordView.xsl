<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:msxsl = "urn:schemas-microsoft-com:xslt"
xmlns:user = "http://sil.org/mynamespace"
				version="1.0">



  <msxsl:script language="JScript" implements-prefix="user">
  </msxsl:script>


 <xsl:param name="wordID"/>

		<xsl:template match="wfic" >
	<head><base id="headBase" href="filled in at runtime" />	</head>

	<script>
		function isGood(analysis)
		{
			return false;
		}
		function setGoodness(row)
		{
			tb = row.parentNode.parentNode;  // first parent is the tbody, second is the table
			//alert("tb="+tb.outerHTML);
			//the following will trigger an event in the Visual Basic code: onchangeproperty ()

			tb.EventWordID = tb.wordID;
			tb.EventParseID = row.parseID;
		   //tb.EventGoodness = sGoodness;

		   //clear out the event
		   tb.EventWordID = "";
			tb.EventParseID = "";
			//tb.EventGoodness = "";

		//	alert("SCRIPT: "+tb.EventWordID + " "+
		   // 	tb.EventAnalysisNumber+ " "+
		   // 	tb.EventGoodness)
		}

	</script>
		<body leftMargin="0" topMargin="0">
			<xsl:element name="TABLE" >
				<xsl:attribute name="ID">ParseListTable</xsl:attribute>
				<xsl:attribute name="class">ListTable</xsl:attribute>
				<xsl:attribute name="EventWordID"></xsl:attribute>
				<xsl:attribute name="EventParseID"></xsl:attribute>
					<xsl:attribute name="wordID"><xsl:value-of select="@id" /></xsl:attribute>
				<THEAD>
					<TR class="ListTable" ID="Header">
							<th  class="ListTable" >Good?</th>
							<th  class="ListTable" >FinalCat</th>
							<th  class="ListTable" >Parse</th>
					</TR>
				</THEAD>

				<xsl:for-each select="parses/parse" >
					<xsl:sort select="@finalcat" />
					<xsl:element name="TR" >
						<xsl:attribute name="UNUSEDanalysisNumber"><xsl:value-of select="position()" /></xsl:attribute>
						<xsl:attribute name="parseID"><xsl:value-of select="@parseID" /></xsl:attribute>
						<xsl:if test="@found='n'"><xsl:attribute name="class">Missing</xsl:attribute></xsl:if>


						<td class = "ListTableCell">
							<xsl:element name="img" >
								<xsl:attribute name="onclick">setGoodness(this.parentNode.parentNode);</xsl:attribute>
								<xsl:if test="@found='n'">
									<xsl:attribute name="title">This analysis was not found during the most recent parse operation</xsl:attribute>
								</xsl:if>

								<xsl:attribute name="src">
									<xsl:if test="@goodness='good'">
										<xsl:if test="@found='n'">
											goodMissingParse.gif
										</xsl:if>
										<xsl:if test="@found='y'">
											goodParse.gif
										</xsl:if>

									</xsl:if>
									<xsl:if test="@goodness='bad'">
										badParse.gif
									</xsl:if>
									<xsl:if test="@goodness='?' or not(@goodness)">
										unknownParse.gif
									</xsl:if>
								</xsl:attribute>
								<xsl:attribute name="name"><xsl:value-of select="position()" /></xsl:attribute>

							</xsl:element>
						</td>

						<td class = "ListTableCell"> <xsl:value-of select="@finalcat" /> </td>
						<td class = "ListTableCell"><table class = "EmbeddedListTable"><tr>
							<xsl:for-each select="morph" >
								<td class="MorphemeColumn" >
									<span class="morphname">
										<xsl:if test="@type='r'"><strong><xsl:value-of select="@id" /></strong></xsl:if>
										<xsl:if test="@type!='r'">
											<xsl:value-of select="@id" />
										</xsl:if>
									</span>
									<BR/>
									<span class="allomorph">
										<xsl:if test="@type='r'"><strong><xsl:value-of select="@allo" /></strong></xsl:if>
										<xsl:if test="@type!='r'">
											<xsl:if test="@type='s' or @type='i'">-</xsl:if>
											<xsl:value-of select="@allo" />
											<xsl:if test="@type='p' or @type='i'">-</xsl:if>
										</xsl:if>
									</span>
																		<BR/>
									<span class="category">
										<xsl:value-of select="@cat" />
									</span>
								</td>
						</xsl:for-each>
					  </tr></table></td>

				</xsl:element>
				<tr><td colspan="6"><xsl:text>.</xsl:text></td></tr>
			</xsl:for-each>
		</xsl:element>
		</body>
	</xsl:template>




</xsl:stylesheet>
