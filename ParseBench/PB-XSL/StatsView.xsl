
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:msxsl = "urn:schemas-microsoft-com:xslt"
xmlns:user = "http://sil.org/mynamespace"
				version="1.0">



  <msxsl:script language="JScript" implements-prefix="user">
 <![CDATA[
  function nodeCount(nodeList)
	{
	  return nodeList.length;
	}

	var nCount=0;
	var ParsesArray = new Array(300);
	var ParsesArrayIndex = 0;
	var GoodBadNoParse = new Array(3);
	var goodNotFoundCount = 0;

   function init()
	{
		var i=0;

		for (i=0;i<300;i++)
		{
			ParsesArray[i]=0;
		}
		for (i=0;i<4;i++)
		{
			GoodBadNoParse[i]=0;
		}


		return true;

	}


	function accumulateStats (objNode)
	{
		var intParseCount = 0;
	var node_num = 0;
	var strNodeName = "";
	var i=0;
	var Attributes;
	var tmpNode;
	var goodflag=true;
	var unknownflag = true;
	var badflag = true;
	var goodNotFound = false;

	nCount = nCount+1;
			//Get # of parses



		node_num=0;
		while (objNode.item(node_num) != null)
		{
			strNodeName = objNode.item(node_num).nodeName;


			if (objNode.item(node_num).childNodes.length > 0 )
				{
					strNodeName=objNode.item(node_num).firstChild.nodeName;
					if (strNodeName = "parses")
					{


						for (i=0;i<objNode.item(node_num).firstChild.childNodes.length;i++)
						{
							//get named attribute map

							Attributes = objNode.item(node_num).firstChild.childNodes.item(i).attributes;
							if (Attributes != null)
							{
								//get the attribute we want to look at
								tmpNode = Attributes.getNamedItem("goodness")
								if (tmpNode != null)
								{
									//check its value
									if (tmpNode.nodeValue=="good")
									{
										unknownflag = false;
										badflag = false;

										//check to see if we have a good parse that is not found.
										tmpNode = Attributes.getNamedItem("found");
										if (tmpNode != null)
										{
											if (tmpNode.nodeValue == 'n')
												goodNotFound = true;
										}
									}
									if (tmpNode.nodeValue=="bad")
									{
										goodflag=false;
										unknownflag = false;
									}
									if (tmpNode.nodeValue=="?")
									{
										goodflag=false;
										badflag=false;
									}
								}
								else		//we don't have a goodness
									{goodflag=false;
									badflag=false;}
							}
							else			//we don't have an attribute list
								{goodflag=false;
								badflag=false;}
						}


						ParsesArray[objNode.item(node_num).firstChild.childNodes.length]++;
					}
				}
			else
				{
					//if this is a wfic with no children
					if ( strNodeName = "wfic")
						{ParsesArray[0]++;
						goodflag=false;
						badflag=false;}

					//else go on.
				}
			node_num++;


		if (goodflag)
			GoodBadNoParse[0]++;
		else
		{
			if (unknownflag)
				GoodBadNoParse[2]++;
			else
			{
				if (badflag)
					GoodBadNoParse[1]++;
				else
					GoodBadNoParse[3]++;

			}
		}
		}


		if (goodNotFound)
		{
			goodNotFoundCount++;
		}

		return true;
	}

	function count ()
	{
		return nCount;
	}

	function makeParsesTable()
	{
	var HTMLString ="";
	var i=0;

	for (i=0;i<300;i++)
	{
		if (ParsesArray[i] > 0 )
		{
			HTMLString = HTMLString + "<tr><td><b>" + i.toString() + "</b></td><td><b><center>" + ParsesArray[i] + "</center></b></td></tr>"
		}
		else
			HTMLString = HTMLString + "<tr><td>" + i.toString() + "</td><td>" + ParsesArray[i] + "</td></tr>"
	}




	return HTMLString;
	}

	function makeStats()
	{
	var HTMLString =""
	var i=0;
	var maxRange=0;
	var perRange=0.0;


	for (i=0; i< 300; i++)
	{
		if (maxRange < ParsesArray[i])
		{
			maxRange=ParsesArray[i];
		}
	}


	//this makes our parses graph
	HTMLString ="<TABLE Border=\"3\" cellspacing=\"1\" width=\"100%\"><tr><TD width=\"20%\"><b><center>Parses</center></b></td><td><b><center>Number of Occurences</center></b></td></tr>";
	for (i=0;i<300;i++)
	{
		if (ParsesArray[i]!=0)			//determine the graph percentage to show for each value
		{
			perRange= ParsesArray[i] / maxRange;
			perRange=(perRange*100);
			HTMLString= HTMLString + "<TR><TD width=\"20%\"><b>" + i.toString() + "</b></td><td><SPAN style=\"width: " + perRange.toString() + "%;Background-color:#ADD8E6;\" align=\"right\"> " + ParsesArray[i] + " </SPAN></td></tr>";
		}
		else
		{
				HTMLString= HTMLString + "<TR><TD><b>" + i.toString() + "</b></td><td>" + ParsesArray[i] + "</td></tr>";
		}
	}
	HTMLString = HTMLString + "</table>"

	//this makes our good/bad/unknown/mixed parses graph
	HTMLString += "<table width = \"100%\" border = \"3\" cellspacing = \"1\">"
	maxRange=0;
	for (i=0; i< 300; i++)
	{
		if (maxRange < GoodBadNoParse[i])
		{
			maxRange=GoodBadNoParse[i];
		}
	}


	for(i=0;i<4;i++)
	{

		switch(i)
		{
			case 0: HTMLString += "<TR><TD width = \"20%\"><b>All Good Parses</b></td>"; break;
			case 1: HTMLString += "<TR><TD width = \"20%\"><b>All Bad Parses</b></td>"; break;
			case 2: HTMLString += "<TR><TD width = \"20%\"><b>All Unknown Parses</b></td>"; break;
			case 3: HTMLString +="<TR><TD width = \"20%\"><b>Mixed Parses</b></td>"; break;
		}

		if (GoodBadNoParse[i]!=0)
		{
			perRange= GoodBadNoParse[i] / maxRange;
			perRange=(perRange*100);
			HTMLString= HTMLString + "<td><SPAN style=\"width: " + perRange.toString() + "%;Background-color:#ADD8E6;\" align=\"right\"> " + GoodBadNoParse[i] + " </SPAN></td></tr>";
		}
		else
		{
				HTMLString= HTMLString + "<td>" + GoodBadNoParse[i] + "</td></tr>";
		}
	}

	HTMLString += "</table>"

	HTMLString += "<table width = \"100%\" border = \"3\" cellspacing = \"1\"><tr><td width=\"20%\"><b>Good Parses Not Found</b></td><td>" + goodNotFoundCount.toString() + "</td></tr></table>";

	return HTMLString;
	}

  ]]>
  </msxsl:script>

		<xsl:template match="/" >

<script>

</script>
		<head><base id="headBase" href="filled in at runtime" />	</head>
			  <body bgcolor="#FFFFCC">


		<xsl:if test="user:init()" />
		<xsl:for-each select="wfi/wfic">
			<xsl:if test="user:accumulateStats(.)"></xsl:if>

		</xsl:for-each>


		<b>Number of Words Returned: <xsl:value-of select="user:count()" /></b><br />
		<!--table border="3" cellspacing="1">
		<tr>
			<td>
				<center><b>Parses</b></center>
			</td>
			<td>
				<center><b>Number of Words</b></center>
			</td>
		</tr>

		<xsl:value-of select="user:makeParsesTable()" disable-output-escaping="yes" />

		</table-->


		<xsl:value-of select="user:makeStats()" disable-output-escaping="yes" />

			</body>
		</xsl:template>





</xsl:stylesheet>
