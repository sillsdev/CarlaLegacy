//**************************************************************************
// File: "TreeTran\ParseReader.cs".
//
// This file defines the ParseReader class, which implements an XML reader
// for XAMPLE parse-tree data.
//
// History:
//     2007-Feb-16 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
using System.IO;
using System.Xml;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Implements an XML reader for XAMPLE parse-tree data.
	/// </summary>
	public class ParseReader
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// The underlying text reader that was passed to the constructor.
		/// </summary>
		private TextReader moTextReader = null;
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the ParseReader class, which will
		/// read XML data using the given TextReader.
		/// </summary>
		public ParseReader(TextReader oTextReader)
		{
			Debug.Assert(oTextReader != null);

			//**************************************************************
			// Save the underlying text reader so it can be closed.

			moTextReader = oTextReader;

			//**************************************************************
			// Create an XmlTextReader from the given TextReader.

			XmlTextReader oXmlTextReader = new XmlTextReader(oTextReader);
			oXmlTextReader.Normalization = false;
			oXmlTextReader.XmlResolver = null;

			//**************************************************************
			// Set the Reader property.

			moReader = oXmlTextReader;
		}
		#endregion
		//******************************************************************
		#region [ParseTreeRoot Property]
		//******************************************************************
		/// <summary>
		/// The ParseTreeRoot property value.
		/// </summary>
		private SyntaxNode moParseTreeRoot = null;
		//******************************************************************
		/// <summary>
		/// Gets the root node of the parse tree that was read by calling
		/// the Read() method.
		/// </summary>
		public SyntaxNode ParseTreeRoot
		{
			get
			{
				return moParseTreeRoot;
			}
		}
		#endregion
		//******************************************************************
		#region [ParseName Property]
		//******************************************************************
		/// <summary>
		/// Gets a string to display as a summary for the parse tree that
		/// was read by calling the Read() method.
		/// </summary>
		public string ParseName
		{
			get
			{
				//**********************************************************
				// For each node in MorphologyNodes, concatenate the text of
				// each word ("w" feature) to create the ParseName string.

				string sParseName = "";
				foreach (SyntaxNode oNode in MorphologyNodes)
				{
					string sString = oNode.Features[ParseXml.WElement];
					if (sString != "")
					{
						if (sParseName == "")
						{
							sParseName = sString;
						}
						else
						{
							sParseName = sParseName + " " + sString;
						}
					}
				}
				return sParseName;
			}
		}
		#endregion
		//******************************************************************
		#region [MorphologyNodes Property]
		//******************************************************************
		/// <summary>
		/// The MorphologyNodes property value.
		/// </summary>
		private SyntaxNodeCollection moMorphologyNodes = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection of morphology nodes. Each of these nodes
		/// represents the morphology parse (or parses) associated with one
		/// leaf node in the current syntax tree. The morphology nodes are
		/// read first and collected. Then the syntax tree is read and the
		/// morphology information is copied to the associated leaf nodes.
		/// </summary>
		private SyntaxNodeCollection MorphologyNodes
		{
			get
			{
				//**********************************************************
				// Create the collection if it does not already exist.

				if (moMorphologyNodes == null)
				{
					moMorphologyNodes = new SyntaxNodeCollection(null);
				}

				//**********************************************************
				// Return the collection.

				return moMorphologyNodes;
			}
		}
		#endregion
		//******************************************************************
		#region [Reader Property]
		//******************************************************************
		/// <summary>
		/// The Reader property value.
		/// </summary>
		private XmlTextReader moReader = null;
		//******************************************************************
		/// <summary>
		/// Gets the XmlTextReader from which the XML data will be read.
		/// </summary>
		private XmlTextReader Reader
		{
			get
			{
				return moReader;
			}
		}
		#endregion
		//******************************************************************
		#region [Read() Method]
		//******************************************************************
		/// <summary>
		/// Reads the next parse tree and sets the ParseTreeRoot property.
		/// Returns true if the next parse tree was read successfully.
		/// Returns false if there are no more parse trees to read.
		/// </summary>
		public bool Read()
		{
			//**************************************************************
			// Set the ParseTreeRoot property to null.

			moParseTreeRoot = null;

			//**************************************************************
			// Read multiple <anaRec> records, collecting morphology
			// information in the MorphologyNodes collection for each word
			// in a sentence. The <anaRec> for the last word in a sentence
			// contains one or more syntactic parse trees for the sentence.
			// Set ParseTreeRoot and return true for each parse tree.
			//
			// <XAmpleANA>
			//     <anaRec> --- Add new node to MorphologyNodes collection.
			//         <w> --- Call ReadMorphology().
			//         <mparse> --- Call ReadMorphology().
			//         <fmt> --- Call ReadMorphology().
			//         <n> --- Call ReadMorphology().
			//         <Analysis>
			//             <Parse> --- Call ReadSyntax() and return true.
			//         </Analysis> --- Clear MorphologyNodes collection.
			//     </anaRec>
			// </XAmpleANA> --- Return false.

			while (Reader.Read())
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <XAmpleANA> tag at depth 0:
				//
				// <XAmpleANA>
				//     <anaRec>...</anaRec>
				// </XAmpleANA>

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 0)
					&& (Reader.Name == ParseXml.XAmpleAnaElement))
				{
					bHandled = true;
				}
				if ((Reader.NodeType == XmlNodeType.EndElement)
					&& (Reader.Depth == 0)
					&& (Reader.Name == ParseXml.XAmpleAnaElement))
				{
					bHandled = true;
				}

				//**********************************************************
				// Handle the <anaRec> tag at depth 1:
				//
				// <anaRec id="...">
				//     <w>...</w>
				//     <mparse>...</mparse>
				//     <fmt>...</fmt>
				//     <n>...</n>
				//     <Analysis>...</Analysis>
				// </anaRec>
				//
				// When a new <anaRec> tag starts, create a new node and add
				// it to the MorphologyNodes collection.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 1)
					&& (Reader.Name == ParseXml.AnaRecElement))
				{
					SyntaxNode oNode = new SyntaxNode();
					MorphologyNodes.Add(oNode);
					bHandled = true;
				}
				if ((Reader.NodeType == XmlNodeType.EndElement)
					&& (Reader.Depth == 1)
					&& (Reader.Name == ParseXml.AnaRecElement))
				{
					bHandled = true;
				}

				//**********************************************************
				// Handle the <w> tag at depth 2:
				//
				// <w id="..." cap="...">...</w>
				//
				// Call ReadMorphology() to add information to the current
				// morphology node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 2)
					&& (Reader.Name == ParseXml.WElement))
				{
					ReadMorphology();
					bHandled = true;
				}

				//**********************************************************
				// Handle each <mparse> tag at depth 2:
				//
				// <mparse id="...">
				//     <a>...</a>
				//     <cat>...</cat>
				//     <wp>...</wp>
				// </mparse>
				//
				// Call ReadMorphology() to add information to the current
				// morphology node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 2)
					&& (Reader.Name == ParseXml.MparseElement))
				{
					ReadMorphology();
					bHandled = true;
				}

				//**********************************************************
				// Handle the optional <fmt> tag at depth 2:
				//
				// <fmt id="...">...</fmt>
				//
				// Call ReadMorphology() to add information to the current
				// morphology node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 2)
					&& (Reader.Name == ParseXml.FmtElement))
				{
					ReadMorphology();
					bHandled = true;
				}

				//**********************************************************
				// Handle the optional <n> tag at depth 2:
				//
				// <n id="...">...</n>
				//
				// Call ReadMorphology() to add information to the current
				// morphology node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 2)
					&& (Reader.Name == ParseXml.NElement))
				{
					ReadMorphology();
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Analysis> tag at depth 2:
				//
				// <Analysis count="..." fail="...">
				//     <Parse>...</Parse>
				// </Analysis>
				//
				// An <Analysis> tag only appears in the <anaRec> for the
				// last word of a sentence and contains the syntactic parse
				// trees for the sentence.
				//
				// When the <Analysis> tag closes, clear the MorphologyNodes
				// collection, because the next <anaRec> will be the first
				// word of a new sentence.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 2)
					&& (Reader.Name == ParseXml.AnalysisElement))
				{
					bHandled = true;
				}
				if ((Reader.NodeType == XmlNodeType.EndElement)
					&& (Reader.Depth == 2)
					&& (Reader.Name == ParseXml.AnalysisElement))
				{
					MorphologyNodes.Clear();
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Parse> tag at depth 3:
				//
				// <Parse>
				//     <Node>...</Node>
				// </Parse>
				//
				// Call ReadSyntax() to read the parse tree and set the
				// ParseTreeRoot property. Then return true.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 3)
					&& (Reader.Name == ParseXml.ParseElement))
				{
					ReadSyntax();
					return true;
				}

				//**********************************************************
				// If the XML element was not recognized, skip all the
				// children of this tag.

				if (! bHandled)
				{
					SkipUnexpectedTag("Read()");
				}
			}

			//**************************************************************
			// Return false when there are no more parse trees to read.

			return false;
		}
		#endregion
		//******************************************************************
		#region [ReadMorphology() Method]
		//******************************************************************
		/// <summary>
		/// Reads the children of the current morphology tag (which must be
		/// "w" or "mparse" or "fmt" or "n"). This morphology information is
		/// added to the current node in the MorphologyNodes collection.
		/// </summary>
		private void ReadMorphology()
		{
			Debug.Assert(MorphologyNodes.Count > 0);
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);
			Debug.Assert(Reader.Depth == 2);
			Debug.Assert((Reader.Name == ParseXml.WElement)
				|| (Reader.Name == ParseXml.MparseElement)
				|| (Reader.Name == ParseXml.FmtElement)
				|| (Reader.Name == ParseXml.NElement));

			//**************************************************************
			// Get the current node: the node most recently added to the
			// MorphologyNodes collection.

			SyntaxNode oCurrent
				= MorphologyNodes[MorphologyNodes.Count - 1];

			//**************************************************************
			// Handle the <w> tag at depth 2:
			//
			// <w id="..." cap="...">...</w>
			//
			// The optional "cap" attribute is capitalization information.
			// Use this to set the "cap" feature.
			//
			// The tag contains the text of the word. Use this to set the
			// "w" feature.

			if (Reader.Name == ParseXml.WElement)
			{
				string sCapName = ParseXml.CapAttribute;
				string sCapValue = Reader.GetAttribute(sCapName);
				string sName = ParseXml.WElement;
				string sValue = ReadText();
				oCurrent.Features[sName] = sValue;
				if ((sCapValue != null) && (sCapValue != ""))
				{
					oCurrent.Features[sCapName] = sCapValue;
				}
				return;
			}

			//**************************************************************
			// Handle the <mparse> tag at depth 2:
			//
			// <mparse id="...">
			//     <a>...</a>
			//     <cat>...</cat>
			//     <wp>...</wp>
			// </mparse>
			//
			// Call ReadMorphologyParse() and add the morphology-parse node
			// as a child of the current node.

			if (Reader.Name == ParseXml.MparseElement)
			{
				SyntaxNode oNode = ReadMorphologyParse();
				oCurrent.ChildNodes.Add(oNode);
				return;
			}

			//**************************************************************
			// Handle the optional <fmt> tag at depth 2:
			//
			// <fmt id="...">...</fmt>
			//
			// The tag contains the text of formatting information that
			// precedes a word. Use this to set the "fmt" feature.

			if (Reader.Name == ParseXml.FmtElement)
			{
				string sName = ParseXml.FmtElement;
				string sValue = ReadText();
				oCurrent.Features[sName] = sValue;
				return;
			}

			//**************************************************************
			// Handle the optional <n> tag at depth 2:
			//
			// <n id="...">...</n>
			//
			// The tag contains the text of character information that
			// follows a word. Use this to set the "n" feature.

			if (Reader.Name == ParseXml.NElement)
			{
				string sName = ParseXml.NElement;
				string sValue = ReadText();
				oCurrent.Features[sName] = sValue;
				return;
			}
		}
		//******************************************************************
		/// <summary>
		/// Reads all the children of the current morphology-parse tag
		/// ("mparse"). Returns a new SyntaxNode representing the
		/// information from this morphology parse.
		/// </summary>
		private SyntaxNode ReadMorphologyParse()
		{
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);
			Debug.Assert(Reader.Depth == 2);
			Debug.Assert(Reader.Name == ParseXml.MparseElement);

			//**************************************************************
			// Create a new node for the morphology parse.

			SyntaxNode oNode = new SyntaxNode();

			//**************************************************************
			// Set the node-type feature to "mparse".

			Debug.Assert(TreeTranEngineString.MorphologyParse
				== ParseXml.MparseElement.ToLower());

			oNode.Features[TreeTranEngineString.NodeType]
				= TreeTranEngineString.MorphologyParse;

			//**************************************************************
			// Read and process all children of the <mparse> tag.
			//
			// <mparse>
			//     <a>
			//         <pfx> --- Call ReadMorphologyParseMorpheme().
			//         <root> --- Call ReadMorphologyParseMorpheme().
			//         <sfx> --- Call ReadMorphologyParseMorpheme().
			//     </a>
			//     <cat> --- Call ReadText().
			//     <wp> --- Skip all children of this tag.
			// </mparse>

			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > 2)
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <a> tag at depth 3:
				//
				// <a id="...">
				//     <pfx>...</pfx>
				//     <root>...</root>
				//     <sfx>...</sfx>
				// </a>

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 3)
					&& (Reader.Name == ParseXml.AElement))
				{
					bHandled = true;
				}
				if ((Reader.NodeType == XmlNodeType.EndElement)
					&& (Reader.Depth == 3)
					&& (Reader.Name == ParseXml.AElement))
				{
					bHandled = true;
				}

				//**********************************************************
				// Handle each <pfx> tag at depth 4:
				//
				// <pfx id="..." cap="...">
				//     <m>...</m>
				//     <u>...</u>
				//     <d>...</d>
				//     <mcat>...</mcat>
				//     <p>...</p>
				//     <fd>...</fd>
				// </pfx>
				//
				// Call ReadMorphologyParseMorpheme() and add the morpheme
				// node as a child of the morphology parse.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 4)
					&& (Reader.Name == ParseXml.PfxElement))
				{
					SyntaxNode oChild = ReadMorphologyParseMorpheme();
					oNode.ChildNodes.Add(oChild);
					bHandled = true;
				}

				//**********************************************************
				// Handle each <root> tag at depth 4:
				//
				// <root id="..." cap="...">
				//     <m>...</m>
				//     <u>...</u>
				//     <d>...</d>
				//     <mcat>...</mcat>
				//     <p>...</p>
				//     <fd>...</fd>
				// </root>
				//
				// Call ReadMorphologyParseMorpheme() and add the morpheme
				// node as a child of the morphology parse.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 4)
					&& (Reader.Name == ParseXml.RootElement))
				{
					SyntaxNode oChild = ReadMorphologyParseMorpheme();
					oNode.ChildNodes.Add(oChild);
					bHandled = true;
				}

				//**********************************************************
				// Handle each <sfx> tag at depth 4:
				//
				// <sfx id="..." cap="...">
				//     <m>...</m>
				//     <u>...</u>
				//     <d>...</d>
				//     <mcat>...</mcat>
				//     <p>...</p>
				//     <fd>...</fd>
				// </sfx>
				//
				// Call ReadMorphologyParseMorpheme() and add the morpheme
				// node as a child of the morphology parse.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 4)
					&& (Reader.Name == ParseXml.SfxElement))
				{
					SyntaxNode oChild = ReadMorphologyParseMorpheme();
					oNode.ChildNodes.Add(oChild);
					bHandled = true;
				}

				//**********************************************************
				// Handle the optional <cat> tag at depth 3:
				//
				// <cat id="...">...</cat>
				//
				// The tag contains the text description of the category for
				// the morphology parse. Use this to set the "cat" feature.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 3)
					&& (Reader.Name == ParseXml.CatElement))
				{
					string sName = ParseXml.CatElement;
					string sValue = ReadText();
					oNode.Features[sName] = sValue;
					bHandled = true;
				}

				//**********************************************************
				// Handle the optional <wp> tag at depth 3:
				//
				// <wp id="...">
				//     <Analysis>...</Analysis>
				// </wp>
				//
				// Skip all children of this tag. (The tag contains
				// word-constituency structure information, a word-internal
				// parse for future use.)

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 3)
					&& (Reader.Name == ParseXml.WpElement))
				{
					SkipChildren();
					bHandled = true;
				}

				//**********************************************************
				// If the XML element was not recognized, skip all the
				// children of this tag.

				if (! bHandled)
				{
					SkipUnexpectedTag("ReadMorphologyParse()");
				}

				//**********************************************************
				// Read the next XML item.

				Reader.Read();
			}

			//**************************************************************
			// Return the new morphology parse node.

			return oNode;
		}
		//******************************************************************
		/// <summary>
		/// Reads all the children of the current morpheme tag ("pfx" or
		/// "root" or "sfx"). Returns a new SyntaxNode representing the
		/// information from this morpheme record.
		/// </summary>
		private SyntaxNode ReadMorphologyParseMorpheme()
		{
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);
			Debug.Assert(Reader.Depth == 4);
			Debug.Assert((Reader.Name == ParseXml.PfxElement)
				|| (Reader.Name == ParseXml.RootElement)
				|| (Reader.Name == ParseXml.SfxElement));

			//**************************************************************
			// Create a new node for the morpheme.

			SyntaxNode oNode = new SyntaxNode();

			//**************************************************************
			// Handle the <pfx> or <root> or <sfx> tag:
			//
			// <pfx id="..." cap="...">...</pfx>
			//
			// <root id="..." cap="...">...</root>
			//
			// <sfx id="..." cap="...">...</sfx>
			//
			// Use the element name ("pfx" or "root" or "sfx") to determine
			// the "node:type" feature.
			//
			// The optional "cap" attribute is capitalization information.
			// Use this to set the "cap" feature.

			Debug.Assert(TreeTranEngineString.PrefixMorpheme
				== ParseXml.PfxElement.ToLower());
			Debug.Assert(TreeTranEngineString.RootMorpheme
				== ParseXml.RootElement.ToLower());
			Debug.Assert(TreeTranEngineString.SuffixMorpheme
				== ParseXml.SfxElement.ToLower());

			string sName = TreeTranEngineString.NodeType;
			string sValue = TreeTranEngineString.RootMorpheme;
			if (Reader.Name == ParseXml.PfxElement)
			{
				sValue = TreeTranEngineString.PrefixMorpheme;
			}
			if (Reader.Name == ParseXml.SfxElement)
			{
				sValue = TreeTranEngineString.SuffixMorpheme;
			}
			oNode.Features[sName] = sValue;
			sName = ParseXml.CapAttribute;
			sValue = Reader.GetAttribute(sName);
			if ((sValue != null) && (sValue != ""))
			{
				oNode.Features[sName] = sValue;
			}

			//**************************************************************
			// Read and process all children of the <pfx> or <root> or <sfx>
			// tag.
			//
			// <m>...</m> --- ReadText().
			// <u>...</u> --- ReadText().
			// <d>...</d> --- ReadText().
			// <mcat>...</mcat> --- ReadText().
			// <p>...</p> --- ReadText().
			// <fd>...</fd> --- ReadText().

			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > 4)
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <m> tag at depth 5:
				//
				// <m id="...">...</m>
				//
				// The tag contains the text of the name used to identify
				// the morpheme. Use this to set the "m" feature.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 5)
					&& (Reader.Name == ParseXml.MElement))
				{
					sName = ParseXml.MElement;
					sValue = ReadText();
					oNode.Features[sName] = sValue;
					bHandled = true;
				}

				//**********************************************************
				// Handle the optional <u> tag at depth 5:
				//
				// <u id="...">...</u>
				//
				// The tag contains the text of the underlying form. Use
				// this to set the "u" feature.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 5)
					&& (Reader.Name == ParseXml.UElement))
				{
					sName = ParseXml.UElement;
					sValue = ReadText();
					oNode.Features[sName] = sValue;
					bHandled = true;
				}

				//**********************************************************
				// Handle the optional <d> tag at depth 5:
				//
				// <d id="...">...</d>
				//
				// The tag contains the text of the morpheme decomposition
				// for the surface form allomorph. Use this to set the "d"
				// feature.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 5)
					&& (Reader.Name == ParseXml.DElement))
				{
					sName = ParseXml.DElement;
					sValue = ReadText();
					oNode.Features[sName] = sValue;
					bHandled = true;
				}

				//**********************************************************
				// Handle the optional <mcat> tag at depth 5:
				//
				// <mcat id="...">...</mcat>
				//
				// The tag contains the text of the morpheme category. Use
				// this to set the "mcat" feature.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 5)
					&& (Reader.Name == ParseXml.McatElement))
				{
					sName = ParseXml.McatElement;
					sValue = ReadText();
					oNode.Features[sName] = sValue;
					bHandled = true;
				}

				//**********************************************************
				// Handle the optional <p> tag at depth 5:
				//
				// <p id="...">...</p>
				//
				// The tag contains the text representing a set of
				// properties. Use this to set the "p" feature.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 5)
					&& (Reader.Name == ParseXml.PElement))
				{
					sName = ParseXml.PElement;
					sValue = ReadText();
					oNode.Features[sName] = sValue;
					bHandled = true;
				}

				//**********************************************************
				// Handle the optional <fd> tag at depth 5:
				//
				// <fd id="...">...</fd>
				//
				// The tag contains the text representing a set of feature
				// descriptors. Use this to set the "fd" feature.
				//
				// BUGBUG: The value of the "fd" feature is a string
				// containing a list of features separated by space
				// characters (for example: "third human -compound plural").
				// Do we need a way to find, replace, insert and delete
				// individual features in this string? (Likewise for
				// substrings in any other feature value?)

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 5)
					&& (Reader.Name == ParseXml.FdElement))
				{
					sName = ParseXml.FdElement;
					sValue = ReadText();
					oNode.Features[sName] = sValue;
					bHandled = true;
				}

				//**********************************************************
				// If the XML element was not recognized, skip all the
				// children of this tag.

				if (! bHandled)
				{
					SkipUnexpectedTag("ReadMorphologyParseMorpheme()");
				}

				//**********************************************************
				// Read the next XML item.

				Reader.Read();
			}

			//**************************************************************
			// Return the new morpheme node.

			return oNode;
		}
		#endregion
		//******************************************************************
		#region [ReadSyntax() Method]
		//******************************************************************
		/// <summary>
		/// The number of leaf nodes that have been encountered so far while
		/// recursively reading the current syntactic parse tree. This count
		/// is set to zero by the ReadSyntax() method and then incremented
		/// each time a leaf node is read by the ReadSyntaxLeaf() method.
		/// The ReadSyntaxLeaf() method uses this count to determine the
		/// corresponding item in the MorphologyNodes collection for each
		/// leaf node.
		/// </summary>
		private int miLeafCount = 0;
		//******************************************************************
		/// <summary>
		/// Reads the syntactic parse tree within the current parse tag
		/// ("Parse"), and then sets the ParseTreeRoot property to the root
		/// node of this tree.
		/// </summary>
		private void ReadSyntax()
		{
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);
			Debug.Assert(Reader.Depth == 3);
			Debug.Assert(Reader.Name == ParseXml.ParseElement);
			Debug.Assert(ParseTreeRoot == null);

			//**************************************************************
			// Read and process all children of the <Parse> tag.
			//
			// <Parse>
			//     <Node> --- Call ReadSyntaxNode().
			// </Parse>

			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > 3)
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <Node> tag at depth 4:
				//
				// <Node id="..." rule="..." cat="..." all="..." fail="...">
				//     <Fs>...</Fs>
				//     <Node>...</Node>
				//     <Leaf>...</Leaf>
				//     <Shared>...</Shared>
				// </Node>
				//
				// Call ReadSyntaxNode() to read the parse-tree nodes
				// recursively. Then set the ParseTreeRoot property to the
				// root node.
				//
				// Note that only one <Node> tag is allowed as a child of
				// the <Parse> tag, so a <Node> tag is only handled if the
				// ParseTreeRoot property is null (not yet set).

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 4)
					&& (Reader.Name == ParseXml.NodeElement)
					&& (ParseTreeRoot == null))
				{
					//******************************************************
					// Set miLeafCount to zero (used by ReadSyntaxLeaf()).
					//
					// Call ReadSyntaxNode() to recursively read the tree.
					//
					// Set the ParseTreeRoot property to the root node.

					miLeafCount = 0;
					moParseTreeRoot = ReadSyntaxNode();
					bHandled = true;
				}

				//**********************************************************
				// If the XML element was not recognized, skip all the
				// children of this tag.

				if (! bHandled)
				{
					SkipUnexpectedTag("ReadSyntax()");
				}

				//**********************************************************
				// Read the next XML item.

				Reader.Read();
			}

			//**************************************************************
			// Throw an exception if the root node is null.

			if (ParseTreeRoot == null)
			{
				string sMessage = "Invalid XML data: "
					+ "the <Parse> tag contains no parse-tree nodes.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// In the unlikely case that the root node is also the one and
			// only leaf node, the XML represents it as a <Node> tag, rather
			// than as a <Leaf> tag. Since this <Node> tag was read by
			// ReadSyntaxNode() rather than ReadSyntaxLeaf(), we still need
			// to set the root's node-type to "leaf" and copy morphology
			// information to the root node from the corresponding item in
			// the MorphologyNodes collection.

			if (ParseTreeRoot.ChildNodes.Count == 0)
			{
				Debug.Assert(miLeafCount == 0);

				miLeafCount = 1;

				//**********************************************************
				// Set the root's node-type feature to "leaf".

				ParseTreeRoot.Features[TreeTranEngineString.NodeType]
					= TreeTranEngineString.SyntaxLeaf;

				//**********************************************************
				// Copy morphology information to the root node from the
				// corresponding item in the MorphologyNodes collection.

				if (MorphologyNodes.Count > 0)
				{
					SyntaxNode oMorphology = MorphologyNodes[0];

					//******************************************************
					// Set the morphology features of the ParseTreeRoot
					// node. The "morph:" prefix is added to the beginning
					// of these morphology feature names to differentiate
					// them from the other syntactic features for this node.

					foreach (SyntaxFeature oFeature in oMorphology.Features)
					{
						string sName = TreeTranEngineString.MorphPrefix
							+ oFeature.Name;
						ParseTreeRoot.Features[sName] = oFeature.Value;
					}

					//******************************************************
					// Copy each morphology child (representing a morphology
					// parse and its morphemes), adding each as a child of
					// the ParseTreeRoot node.

					foreach (
						SyntaxNode oChildNode in oMorphology.ChildNodes)
					{
						ParseTreeRoot.ChildNodes.Add(
							oChildNode.CloneBranch());
					}
				}
			}

			//**************************************************************
			// The count of leaf nodes should be the same as the number of
			// items in the MorphologyNodes collection.

			if (miLeafCount != MorphologyNodes.Count)
			{
				Debug.WriteLineIf(VerboseDebugging,
					"ParseReader.ReadSyntax(): "
					+ "Number of morphology nodes "
					+ "(" + MorphologyNodes.Count.ToString() + ") "
					+ "differs from number of leaf nodes in parse tree "
					+ "(" + miLeafCount.ToString() + ").");
			}
		}
		//******************************************************************
		/// <summary>
		/// Recursively reads the node features and children within the
		/// current node tag ("Node"). Returns a new SyntaxNode representing
		/// this branch of the parse tree.
		/// </summary>
		private SyntaxNode ReadSyntaxNode()
		{
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);
			Debug.Assert(Reader.Name == ParseXml.NodeElement);

			//**************************************************************
			// Create a new syntax node.

			SyntaxNode oNode = new SyntaxNode();

			//**************************************************************
			// Read and process all children of the <Node> tag.
			//
			// <Node id="..." cat="..." rule="..." all="..." fail="...">
			//     <Fs> --- Call ReadFeatureSet().
			//     <Node> --- Call ReadSyntaxNode().
			//     <Leaf> --- Call ReadSyntaxLeaf().
			//     <Shared> --- Not currently supported.
			// </Node>
			//
			// The "cat" attribute is ignored (and assumed to be the same as
			// the "cat" feature).
			//
			// BUGBUG: The optional "rule" attribute is currently ignored.
			// Is it needed? If so, a feature named "node:rule" could be
			// used to store its value.
			//
			// BUGBUG: The <Shared> child tag is currently not supported.

			int iDepth = Reader.Depth;
			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > iDepth)
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <Fs> tag:
				//
				// <Fs id="..." rel="..." type="...">
				//     <F>...</F>
				// </Fs>
				//
				// Call ReadFeatureSet() to read the set of syntactic
				// features and use them to set the features of the new
				// syntax node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.FsElement))
				{
					ReadFeatureSet(oNode);
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Node> tag:
				//
				// <Node id="..." cat="..." rule="..." all="..." fail="...">
				//     <Fs>...</Fs>
				//     <Node>...</Node>
				//     <Leaf>...</Leaf>
				//     <Shared>...</Shared>
				// </Node>
				//
				// Call ReadSyntaxNode() recursively to read the child node.
				// Add the child to the ChildNodes collection of the new
				// syntax node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.NodeElement))
				{
					SyntaxNode oChild = ReadSyntaxNode();
					oNode.ChildNodes.Add(oChild);
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Leaf> tag:
				//
				// <Leaf id="..." cat="..." gloss="..." all="..."
				//         fail="...">
				//     <Fs>...</Fs>
				//     <Lexfs>...</Lexfs>
				//     <Str>...</Str>
				// </Leaf>
				//
				// Call ReadSyntaxLeaf() to read the child leaf node. Add
				// the child to the ChildNodes collection of the new syntax
				// node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.LeafElement))
				{
					SyntaxNode oChild = ReadSyntaxLeaf();
					oNode.ChildNodes.Add(oChild);
					bHandled = true;
				}

				//**********************************************************
				// If the XML element was not recognized, skip all the
				// children of this tag.

				if (! bHandled)
				{
					SkipUnexpectedTag("ReadSyntaxNode()");
				}

				//**********************************************************
				// Read the next XML item.

				Reader.Read();
			}

			//**************************************************************
			// Return the new syntax node.

			return oNode;
		}
		//******************************************************************
		/// <summary>
		/// Reads the leaf-node features within the current leaf-node tag
		/// ("Leaf"). Copies the morphology information from the
		/// corresponding item in the MorphologyNodes collection. Returns a
		/// new SyntaxNode representing this leaf node of the parse tree.
		/// </summary>
		private SyntaxNode ReadSyntaxLeaf()
		{
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);
			Debug.Assert(Reader.Name == ParseXml.LeafElement);
			Debug.Assert(miLeafCount >= 0);

			//**************************************************************
			// Create a new syntax node.

			SyntaxNode oNode = new SyntaxNode();

			//**************************************************************
			// Set the node-type feature to "leaf".

			Debug.Assert(TreeTranEngineString.SyntaxLeaf
				== ParseXml.LeafElement.ToLower());

			oNode.Features[TreeTranEngineString.NodeType]
				= TreeTranEngineString.SyntaxLeaf;

			//**************************************************************
			// Increment the count of leaf nodes and find the corresponding
			// item in the MorphologyNodes collection.

			++miLeafCount;
			SyntaxNode oMorphology = null;
			if (miLeafCount <= MorphologyNodes.Count)
			{
				oMorphology = MorphologyNodes[miLeafCount - 1];
			}

			//**************************************************************
			// Read and process all children of the <Leaf> tag.
			//
			// <Leaf id="..." cat="..." gloss="..." all="..." fail="...">
			//     <Fs> --- Call ReadFeatureSet().
			//     <Lexfs> --- Call ReadFeatureSet().
			//     <Str> --- Call ReadText().
			// </Leaf>
			//
			// The "cat" attribute is ignored (and assumed to be the same as
			// the "cat" feature).
			//
			// BUGBUG: The optional "gloss" attribute is currently ignored.
			// Is it needed? If so, a feature named "node:gloss" could be
			// used to store its value.

			int iDepth = Reader.Depth;
			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > iDepth)
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <Fs> tag:
				//
				// <Fs id="..." rel="..." type="...">
				//     <F>...</F>
				// </Fs>
				//
				// Call ReadFeatureSet() to read the set of syntactic
				// features and use them to set the features of the new
				// syntax node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.FsElement))
				{
					ReadFeatureSet(oNode);
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Lexfs> tag:
				//
				// <Lexfs id="..." rel="..." type="...">
				//     <F>...</F>
				// </Lexfs>
				//
				// Call ReadFeatureSet() to read the set of lexical features
				// and use them to set the features of the new syntax node.
				// The "lex:" prefix will be added to the beginning of the
				// lexical feature names to differentiate them from the
				// other syntactic features for this node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.LexfsElement))
				{
					ReadFeatureSet(oNode,TreeTranEngineString.LexPrefix);
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Str> tag:
				//
				// <Str id="..." rel="..." lang="...">...</Str>
				//
				// The text contained by this tag is ignored (and assumed to
				// be the same as the "morph:w" feature value).

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.StrElement))
				{
					ReadText();
					bHandled = true;
				}

				//**********************************************************
				// If the XML element was not recognized, skip all the
				// children of this tag.

				if (! bHandled)
				{
					SkipUnexpectedTag("ReadSyntaxLeaf()");
				}

				//**********************************************************
				// Read the next XML item.

				Reader.Read();
			}

			//**************************************************************
			// Copy morphology information from the corresponding item in
			// the MorphologyNodes collection.

			if (oMorphology != null)
			{
				//**********************************************************
				// Set the morphology features of the new syntax node. The
				// "morph:" prefix is added to the beginning of these
				// morphology feature names to differentiate them from the
				// other syntactic features for this node.

				foreach (SyntaxFeature oFeature in oMorphology.Features)
				{
					string sName = TreeTranEngineString.MorphPrefix
						+ oFeature.Name;
					oNode.Features[sName] = oFeature.Value;
				}

				//**********************************************************
				// Copy each morphology child (representing a morphology
				// parse and its morphemes), adding each as a child of the
				// new syntax node.

				foreach (SyntaxNode oChildNode in oMorphology.ChildNodes)
				{
					oNode.ChildNodes.Add(oChildNode.CloneBranch());
				}
			}

			//**************************************************************
			// Return the new syntax node.

			return oNode;
		}
		#endregion
		//******************************************************************
		#region [ReadFeatureSet() Method]
		//******************************************************************
		/// <summary>
		/// Reads the features within the current feature-set tag ("Fs" or
		/// "Lexfs") and uses them to set features of the given syntax node
		/// (oNode). The optional sPrefix string is inserted at the
		/// beginning of each feature name.
		/// </summary>
		private void ReadFeatureSet(SyntaxNode oNode)
		{
			ReadFeatureSet(oNode,"");
		}
		//******************************************************************
		/// <summary>
		/// Reads the features within the current feature-set tag ("Fs" or
		/// "Lexfs") and uses them to set features of the given syntax node
		/// (oNode). The optional sPrefix string is inserted at the
		/// beginning of each feature name.
		/// </summary>
		private void ReadFeatureSet(SyntaxNode oNode,string sPrefix)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(sPrefix != null);
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);
			Debug.Assert((Reader.Name == ParseXml.FsElement)
				|| (Reader.Name == ParseXml.LexfsElement));

			//**************************************************************
			// Check attributes of the <Fs> or <Lexfs> tag.
			//
			// <Fs id="..." rel="..." type="...">
			//
			// <Lexfs id="..." rel="..." type="...">
			//
			// The "rel" attribute specifies whether the given feature
			// structure equals or does not equal the actual feature
			// structure. The feature structure is skipped if a
			// relationship other than "eq" (equals) is specified by this
			// attribute.
			//
			// The optional "type" attribute is ignored (all features are
			// represented as strings).

			string sRelValue = Reader.GetAttribute(ParseXml.RelAttribute);
			if ((sRelValue != null) && (sRelValue != "")
				&& (sRelValue != ParseXml.EqValue))
			{
				SkipChildren();
				return;
			}

			//**************************************************************
			// Read and process all children of the <Fs> or <Lexfs> tag.
			//
			// <Fs id="..." rel="..." type="...">
			//     <F> --- Call ReadFeature().
			// </Fs>
			//
			// <Lexfs id="..." rel="..." type="...">
			//     <F> --- Call ReadFeature().
			// </Lexfs>

			int iDepth = Reader.Depth;
			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > iDepth)
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <F> tag:
				//
				// <F name="..." rel="..." org="..." fVal="...">
				//     <Plus />
				//     <Minus />
				//     <Any />
				//     <None />
				//     <Sym />
				//     <Nbr />
				//     <Str>...</Str>
				//     <Fs>...</Fs>
				// </F>
				//
				// Call ReadFeature() to read the feature (or nested feature
				// set) and set the feature (or features) of the given
				// syntax node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.FElement))
				{
					ReadFeature(oNode,sPrefix);
					bHandled = true;
				}

				//**********************************************************
				// If the XML element was not recognized, skip all the
				// children of this tag.

				if (! bHandled)
				{
					SkipUnexpectedTag("ReadFeatureSet()");
				}

				//**********************************************************
				// Read the next XML item.

				Reader.Read();
			}
		}
		//******************************************************************
		/// <summary>
		/// Reads a single feature (or nested feature set) within the
		/// current feature tag ("F") and sets the feature (or features) of
		/// the given syntax node (oNode). The sPrefix string is inserted at
		/// the beginning of each feature name.
		/// </summary>
		private void ReadFeature(SyntaxNode oNode,string sPrefix)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(sPrefix != null);
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);
			Debug.Assert(Reader.Name == ParseXml.FElement);

			//**************************************************************
			// Check attributes of the <F> tag.
			//
			// <F name="..." rel="..." org="..." fVal="...">
			//
			// Get the "name" attribute. If it is blank or not specified,
			// skip the feature.
			//
			// The "rel" attribute specifies whether the given feature
			// equals or does not equal the actual feature value. The
			// feature is skipped if a relationship other than "eq" (equals)
			// is specified by this attribute.
			//
			// The optional "org" attribute is ignored (all features are
			// organized as a set).
			//
			// BUGBUG: The "fVal" attribute is currently not supported. This
			// attribute is used by features (such as "head", "subject",
			// "reflexive", etc.) that refer to another item in the tree by
			// unique "id" value. Since items in the tree can be added,
			// removed and copied, we cannot count on these "id" values
			// remaining the same, so features that use the "fVal" attribute
			// are ignored.

			string sNameValue = Reader.GetAttribute(ParseXml.NameAttribute);
			if ((sNameValue == null) || (sNameValue == ""))
			{
				SkipChildren();
				return;
			}
			string sRelValue = Reader.GetAttribute(ParseXml.RelAttribute);
			if ((sRelValue != null) && (sRelValue != "")
				&& (sRelValue != ParseXml.EqValue))
			{
				SkipChildren();
				return;
			}

			//**************************************************************
			// If the "name" attribute contains any feature separators
			// (" "), replace them with underscores ("_").

			sNameValue = sNameValue.Replace(
				TreeTranEngineString.FeatureSeparator,
				TreeTranEngineString.UnderscoreCharacter);

			//**************************************************************
			// The feature name is formed by combining the sPrefix string
			// and the "name" attribute.

			string sFeatureName = sPrefix + sNameValue;

			//**************************************************************
			// Read and process all children of the <F> tag.
			//
			// <F name="..." rel="..." org="..." fVal="...">
			//     <Plus /> --- Set feature to "+".
			//     <Minus /> --- Set feature to "-".
			//     <Any /> --- Ignore this tag.
			//     <None /> --- Ignore this tag.
			//     <Sym /> --- Set feature to <Sym> "value" attribute.
			//     <Nbr /> --- Set feature to <Nbr> "value" attribute.
			//     <Str> --- Set feature to ReadText() result.
			//     <Fs> --- Call ReadFeatureSet().
			// </F>

			int iDepth = Reader.Depth;
			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > iDepth)
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <Plus> tag:
				//
				// <Plus id="..." />
				//
				// Set the feature of the given syntax node to "+".

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.PlusElement))
				{
					string sFeatureValue
						= TreeTranEngineString.PlusFeature;
					oNode.Features[sFeatureName] = sFeatureValue;
					if (! Reader.IsEmptyElement)
					{
						SkipChildren();
					}
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Minus> tag:
				//
				// <Minus id="..." />
				//
				// Set the feature of the given syntax node to "-".

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.MinusElement))
				{
					string sFeatureValue
						= TreeTranEngineString.MinusFeature;
					oNode.Features[sFeatureName] = sFeatureValue;
					if (! Reader.IsEmptyElement)
					{
						SkipChildren();
					}
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Any> tag:
				//
				// <Any id="..." />
				//
				// Ignore this tag.
				//
				// BUGBUG: Do we need to assign some value for this feature?

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.AnyElement))
				{
					if (! Reader.IsEmptyElement)
					{
						SkipChildren();
					}
					bHandled = true;
				}

				//**********************************************************
				// Handle the <None> tag:
				//
				// <None id="..." />
				//
				// Ignore this tag.
				//
				// BUGBUG: Do we need to assign some value for this feature?

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.NoneElement))
				{
					if (! Reader.IsEmptyElement)
					{
						SkipChildren();
					}
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Sym> tag:
				//
				// <Sym id="..." rel="..." value="..." />
				//
				// The "rel" attribute specifies whether the given value
				// equals or does not equal the actual value. The feature is
				// not set if a relationship other than "eq" (equals) is
				// specified by this attribute.
				//
				// Get the "value" attribute and use this to set the feature
				// of the given syntax node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.SymElement))
				{
					sRelValue = Reader.GetAttribute(ParseXml.RelAttribute);
					string sFeatureValue
						= Reader.GetAttribute(ParseXml.ValueAttribute);
					if ((sRelValue == null) || (sRelValue == "")
						|| (sRelValue == ParseXml.EqValue))
					{
						if (sFeatureValue != null)
						{
							oNode.Features[sFeatureName] = sFeatureValue;
						}
					}
					if (! Reader.IsEmptyElement)
					{
						SkipChildren();
					}
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Nbr> tag:
				//
				// <Nbr id="..." rel="..." value="..." />
				//
				// The "rel" attribute specifies whether the given value
				// equals or does not equal the actual value. The feature is
				// not set if a relationship other than "eq" (equals) is
				// specified by this attribute.
				//
				// Get the "value" attribute and use this to set the feature
				// of the given syntax node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.NbrElement))
				{
					sRelValue = Reader.GetAttribute(ParseXml.RelAttribute);
					string sFeatureValue
						= Reader.GetAttribute(ParseXml.ValueAttribute);
					if ((sRelValue == null) || (sRelValue == "")
						|| (sRelValue == ParseXml.EqValue))
					{
						if (sFeatureValue != null)
						{
							oNode.Features[sFeatureName] = sFeatureValue;
						}
					}
					if (! Reader.IsEmptyElement)
					{
						SkipChildren();
					}
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Str> tag:
				//
				// <Str id="..." rel="..." lang="...">...</Str>
				//
				// The "rel" attribute specifies whether the given value
				// equals or does not equal the actual value. The feature is
				// not set if a relationship other than "eq" (equals) is
				// specified by this attribute.
				//
				// The optional "lang" attribute is ignored (the string is
				// assumed to be in the current language).
				//
				// Call ReadText() to read the feature value. Use this to
				// set the feature of the given syntax node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.StrElement))
				{
					sRelValue = Reader.GetAttribute(ParseXml.RelAttribute);
					string sFeatureValue = ReadText();
					if ((sRelValue == null) || (sRelValue == "")
						|| (sRelValue == ParseXml.EqValue))
					{
						oNode.Features[sFeatureName] = sFeatureValue;
					}
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Fs> tag:
				//
				// <Fs id="..." rel="..." type="...">
				//     <F>...</F>
				// </Fs>
				//
				// Call ReadFeatureSet() to read the nested set of syntactic
				// features and use them to set the features of the given
				// syntax node. The feature name followed by a feature
				// separator (" ") will be used as a prefix for all the
				// nested feature names.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == ParseXml.FsElement))
				{
					string sNestedPrefix = sFeatureName
						+ TreeTranEngineString.FeatureSeparator;
					ReadFeatureSet(oNode,sNestedPrefix);
					bHandled = true;
				}

				//**********************************************************
				// If the XML element was not recognized, skip all the
				// children of this tag.

				if (! bHandled)
				{
					SkipUnexpectedTag("ReadFeature()");
				}

				//**********************************************************
				// Read the next XML item.

				Reader.Read();
			}
		}
		#endregion
		//******************************************************************
		#region [ReadText() Method]
		//******************************************************************
		/// <summary>
		/// Reads the text string between the current opening tag and the
		/// corresponding closing tag (leaving the reader positioned on the
		/// closing tag). Returns the text string.
		/// </summary>
		private string ReadText()
		{
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);

			//**************************************************************
			// Read the text string (or strings) between the current opening
			// tag and the corresponding closing tag.

			string sText = "";
			int iDepth = Reader.Depth;
			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > iDepth)
			{
				if (Reader.NodeType == XmlNodeType.Text)
				{
					string sValue = Reader.Value;
					if (sValue != null)
					{
						sText = sText + sValue;
					}
				}
				if (Reader.NodeType == XmlNodeType.Element)
				{
					Debug.WriteLineIf(VerboseDebugging,
						"ParseReader.ReadText(): "
						+ "Unexpected tag <" + Reader.Name + "> "
						+ "at depth " + Reader.Depth.ToString() + ".");
				}
				if (Reader.NodeType == XmlNodeType.EndElement)
				{
					Debug.WriteLineIf(VerboseDebugging,
						"ParseReader.ReadText(): "
						+ "Unexpected tag </" + Reader.Name + "> "
						+ "at depth " + Reader.Depth.ToString() + ".");
				}
				Reader.Read();
			}

			//**************************************************************
			// Return the text string.

			return sText;
		}
		#endregion
		//******************************************************************
		#region [SkipChildren() Method]
		//******************************************************************
		/// <summary>
		/// Reads everything between the current opening tag and the
		/// corresponding closing tag (leaving the reader positioned on the
		/// closing tag).
		/// </summary>
		private void SkipChildren()
		{
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);

			int iDepth = Reader.Depth;
			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > iDepth)
			{
				Reader.Read();
			}
		}
		#endregion
		//******************************************************************
		#region [SkipUnexpectedTag() Method]
		//******************************************************************
		/// <summary>
		/// Writes a diagnostic message about the current tag, saying the
		/// tag was unexpected in the given method (sMethodName). The
		/// diagnostic message is only written if VerboseDebugging is true.
		/// If the current tag is an opening tag, all children of the tag
		/// are skipped.
		/// </summary>
		private void SkipUnexpectedTag(string sMethodName)
		{
			Debug.Assert(sMethodName != null);
			Debug.Assert(sMethodName != "");

			//**************************************************************
			// Write a diagnostic message about the unexpected tag.

			if (Reader.NodeType == XmlNodeType.Element)
			{
				Debug.WriteLineIf(VerboseDebugging,
					"ParseReader." + sMethodName + ": "
					+ "Unexpected tag <" + Reader.Name + "> "
					+ "at depth " + Reader.Depth.ToString() + ".");
			}
			if (Reader.NodeType == XmlNodeType.EndElement)
			{
				Debug.WriteLineIf(VerboseDebugging,
					"ParseReader." + sMethodName + ": "
					+ "Unexpected tag </" + Reader.Name + "> "
					+ "at depth " + Reader.Depth.ToString() + ".");
			}

			//**************************************************************
			// Skip all children of the unexpected tag.

			if (Reader.NodeType == XmlNodeType.Element)
			{
				SkipChildren();
			}
		}
		#endregion
		//******************************************************************
		#region [Static VerboseDebugging Property]
		//******************************************************************
		/// <summary>
		/// The VerboseDebugging property value.
		/// </summary>
		private static bool mbVerboseDebugging = false;
		//******************************************************************
		/// <summary>
		/// Returns true if verbose debugging is desired for instances of
		/// this class, and false otherwise.
		/// </summary>
		private static bool VerboseDebugging
		{
			get
			{
				return mbVerboseDebugging;
			}
		}
		#endregion
		//******************************************************************
		#region [Close() Method]
		//******************************************************************
		/// <summary>
		/// Closes the reader and the underlying stream.
		/// </summary>
		public void Close()
		{
			Reader.Close();
			moTextReader.Close();
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
