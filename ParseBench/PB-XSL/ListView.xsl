<?xml version="1.0" ?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl = "urn:schemas-microsoft-com:xslt"
	xmlns:user = "http://sil.org/mynamespace"
	version="1.0">


	<!-- these scripts are used by the xsl styleSheet while it is generating the HTML -->
  <msxsl:script language="JScript" implements-prefix="user">
	<![CDATA[
	function numParses(nodeList)
	{
		return nodeList.length;
	}

	// this function allows us to select a range of words to includ in the table
	// this is important when the words selected by the filter would be in the thousands.
	var nCount=0;

	function doInclude(nFirstToShow, nLastToShow)
	{
		nCount++;
		if(nCount >= nFirstToShow && nCount <= nLastToShow)
			return true;
		else
			return false;
	}
	]]>

  </msxsl:script>

	<xsl:param name="firstToShow">2</xsl:param>
   <xsl:param name="lastToShow">5</xsl:param>


		<xsl:template match="/" >

	<!-- these scripts are used by the HTML page that is produced by this styleSheet -->
	<script>
		<![CDATA[
		var selectedRow=null;
		function selectRow(r)
		{
			tb = r.parentNode.parentNode;
			if(selectedRow != null)
				selectedRow.className="";
			selectedRow = r;
			r.className="selectedRow";	//this hilight the row
			tb.selectedID = r.wordID; // first parent is the tbody, second is the table
			tb.selectedWordPos = r.wordPos;
			tb.eventType="RowSelect";	//this must be next to last
			tb.eventType="";	//this must be last
		}

		function headerClick(header, sSortField)
		{
			//alert(header.sortField);
			tb = header.parentNode.parentNode.parentNode;
			tb.sortField1 = header.sortField
			tb.eventType="HeaderClick";//this must be next to last
			tb.eventType="";//this must be last
		}
	]]>

	</script>

		   <body>
				<TABLE ID="WordListTable" class="ListTable" align="left" eventType="" selectedID="" sortField1="@form">
						<THEAD>
						<TR class="ListTable" ID="Header">
								<th  class="ListTable" sortField="@form" onclick="headerClick(this)">WORD</th>
								<th  class="ListTable" sortField="@freq" onclick="headerClick(this)">Freq</th>
								<th  class="ListTable"  sortField="user:numParses(parses/parse)" onclick="headerClick(this)">Parses</th>
								<th  class="ListTable"  sortField="user:numParses(parses/parse[@goodness='good'])" onclick="headerClick(this)">Good</th>
								<th  class="ListTable"  sortField="user:numParses(parses/parse[@goodness='bad'])" onclick="headerClick(this)">Bad</th>
						</TR>
						</THEAD>


			<xsl:for-each select="wfi/wfic" >
				<xsl:sort data-type="number" select="@freq" order="descending"/>
				<xsl:if test="user:doInclude(1, 5)"> <xsl:comment> These is filled in at runtime</xsl:comment>
				<xsl:element name="TR" >
					<xsl:attribute name="onclick">selectRow(this)</xsl:attribute>
					<xsl:attribute name="form"><xsl:value-of select="@form" /></xsl:attribute>
					<xsl:attribute name="wordID"><xsl:value-of select="@id" /></xsl:attribute>
					<xsl:attribute name="wordPos"><xsl:value-of select="@pos" /></xsl:attribute>


									<TD>
										<span class="wordform">
											<xsl:value-of select="@form" />
										</span>
									</TD>
									<TD>
										<xsl:value-of select="@freq" />
									</TD>
									<TD>
											<xsl:value-of select="user:numParses(parses/parse)" />
									</TD>
									<TD>
											<xsl:value-of select="user:numParses(parses/parse[@goodness='good'])" />
									</TD>
									<TD>
											<xsl:value-of select="user:numParses(parses/parse[@goodness='bad'])" />
									</TD>

				</xsl:element>
				</xsl:if>
			</xsl:for-each>

			</TABLE>
			</body>
		</xsl:template>



</xsl:stylesheet>
