//**************************************************************************
// File: "TreeTran\ParseWriter.cs".
//
// This file defines the ParseWriter class, which implements an XML writer
// for XAMPLE parse-tree data.
//
// History:
//     2007-Feb-16 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Collections.Specialized;
using System.Diagnostics;
using System.IO;
using System.Xml;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Implements an XML writer for XAMPLE parse-tree data.
	/// </summary>
	public class ParseWriter
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the ParseWriter class, which will
		/// write XML data using the given TextWriter. The writer is then
		/// used to write the top-level opening XML tag.
		/// </summary>
		public ParseWriter(TextWriter oTextWriter)
		{
			Debug.Assert(oTextWriter != null);

			//**************************************************************
			// Create an XmlTextWriter from the given TextWriter.

			XmlTextWriter oXmlTextWriter = new XmlTextWriter(oTextWriter);
			oXmlTextWriter.Formatting = Formatting.Indented;
			oXmlTextWriter.Indentation = 1;
			oXmlTextWriter.IndentChar = '\t';

			//**************************************************************
			// Set the Writer property.

			moWriter = oXmlTextWriter;

			//**************************************************************
			// Write the XML declaration and version.

			Writer.WriteStartDocument();

			//**************************************************************
			// Write the DOCTYPE declaration:
			//
			// <!DOCTYPE XAmpleANA SYSTEM "xample.dtd">

			Writer.WriteDocType(ParseXml.XAmpleAnaElement,null,
				ParseXml.DtdFile,null);

			//**************************************************************
			// Write the top-level opening XML tag:
			//
			// <XAmpleANA>

			Writer.WriteStartElement(ParseXml.XAmpleAnaElement);
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
		/// Gets or sets the root node of the parse tree that will be
		/// written by calling the Write() method.
		/// </summary>
		public SyntaxNode ParseTreeRoot
		{
			set
			{
				moParseTreeRoot = value;
			}
			get
			{
				return moParseTreeRoot;
			}
		}
		#endregion
		//******************************************************************
		#region [Writer Property]
		//******************************************************************
		/// <summary>
		/// The Writer property value.
		/// </summary>
		private XmlTextWriter moWriter = null;
		//******************************************************************
		/// <summary>
		/// Gets the XmlTextWriter to which the XML data will be written.
		/// </summary>
		private XmlTextWriter Writer
		{
			get
			{
				return moWriter;
			}
		}
		#endregion
		//******************************************************************
		#region [Write() Method]
		//******************************************************************
		/// <summary>
		/// Writes the parse tree specified by the ParseTreeRoot property.
		/// </summary>
		public void Write()
		{
			//**************************************************************
			// Validate the current state.

			if (ParseTreeRoot == null)
			{
				string sMessage = "ParseWriter.Write() "
					+ "called with an invalid state: "
					+ "ParseTreeRoot is null.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Write the parse tree.

			WriteMorphology(ParseTreeRoot);
		}
		#endregion
		//******************************************************************
		#region [WriteMorphology() Method]
		//******************************************************************
		/// <summary>
		/// Recursively traverses the indicated branch of the parse tree
		/// (dominiated by oNode) down to the syntax leaf nodes. For each
		/// leaf node, WriteMorphologyNode() is called to write the
		/// morphology record for the word. The last morphology record
		/// includes the syntactic parse tree for the sentence as well.
		/// </summary>
		private void WriteMorphology(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			//**************************************************************
			// If this is a syntax leaf node, call WriteMorphologyNode() to
			// write the morphology record for the word.
			//
			// Otherwise, recursively traverse each child branch, looking
			// for the syntax leaf nodes.

			if (IsSyntaxLeaf(oNode))
			{
				WriteMorphologyNode(oNode);
			}
			else
			{
				foreach (SyntaxNode oChild in oNode.ChildNodes)
				{
					WriteMorphology(oChild);
				}
			}
		}
		//******************************************************************
		/// <summary>
		/// Writes the "anaRec" tag containing the morphology record for the
		/// word represented by the given leaf node. If this is the last
		/// leaf node in the parse tree, WriteSyntax() is called to write
		/// the syntactic parse tree for the sentence as well.
		/// </summary>
		private void WriteMorphologyNode(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(IsSyntaxLeaf(oNode));

			//**************************************************************
			// Write the opening <anaRec> tag:
			//
			// <anaRec id="...">
			//
			// The "id" attribute must be unique.

			Writer.WriteStartElement(ParseXml.AnaRecElement);
			Writer.WriteAttributeString(ParseXml.IDAttribute,GenerateID());

			//**************************************************************
			// Write the <w> tag:
			//
			// <w id="..." cap="...">...</w>
			//
			// The "id" attribute must be unique.
			//
			// The "cap" attribute is optional capitalization information
			// (from the "morph:cap" feature).
			//
			// The tag contains the text of the word (from the "morph:w"
			// feature).

			string sName = "";
			string sValue = "";

			Writer.WriteStartElement(ParseXml.WElement);
			Writer.WriteAttributeString(ParseXml.IDAttribute,GenerateID());
			sName = TreeTranEngineString.MorphPrefix
				+ ParseXml.CapAttribute;
			if (oNode.Features.Contains(sName))
			{
				sValue = oNode.Features[sName];
				Writer.WriteAttributeString(ParseXml.CapAttribute,sValue);
			}
			sName = TreeTranEngineString.MorphPrefix + ParseXml.WElement;
			sValue = oNode.Features[sName];
			Writer.WriteString(sValue);
			Writer.WriteEndElement();

			//**************************************************************
			// Write an <mparse> record for the morphology parse represented
			// by each child node.

			if (oNode.ChildNodes.Count == 0)
			{
				Debug.WriteLineIf(VerboseDebugging,
					"ParseWriter.WriteMorphologyNode(): "
					+ "Leaf node (" + oNode.ToString() + ") "
					+ "has no morphology parses to write.");
			}
			foreach (SyntaxNode oChild in oNode.ChildNodes)
			{
				WriteMorphologyParse(oChild);
			}

			//**************************************************************
			// Write the optional <fmt> tag:
			//
			// <fmt id="...">...</fmt>
			//
			// The "id" attribute must be unique.
			//
			// The tag contains the text of formatting information that
			// precedes the word (from the "morph:fmt" feature).

			sName = TreeTranEngineString.MorphPrefix + ParseXml.FmtElement;
			if (oNode.Features.Contains(sName))
			{
				sValue = oNode.Features[sName];
				Writer.WriteStartElement(ParseXml.FmtElement);
				Writer.WriteAttributeString(ParseXml.IDAttribute,
					GenerateID());
				Writer.WriteString(sValue);
				Writer.WriteEndElement();
			}

			//**************************************************************
			// Write the optional <n> tag:
			//
			// <n id="...">...</n>
			//
			// The "id" attribute must be unique.
			//
			// The tag contains the text of character information that
			// follows the word (from the "morph:n" feature).

			sName = TreeTranEngineString.MorphPrefix + ParseXml.NElement;
			if (oNode.Features.Contains(sName))
			{
				sValue = oNode.Features[sName];
				Writer.WriteStartElement(ParseXml.NElement);
				Writer.WriteAttributeString(ParseXml.IDAttribute,
					GenerateID());
				Writer.WriteString(sValue);
				Writer.WriteEndElement();
			}

			//**************************************************************
			// If this <anaRec> represents the last word of the sentence,
			// call WriteSyntax() to write the <Analysis> tag containing the
			// syntactic parse tree for the sentence (starting from the
			// ParseTreeRoot node).

			if (IsLastSyntaxLeaf(oNode))
			{
				WriteSyntax();
			}

			//**************************************************************
			// Write the closing <anaRec> tag:
			//
			// </anaRec>

			Writer.WriteEndElement();
		}
		//******************************************************************
		/// <summary>
		/// Writes the "mparse" tag containing the morphology-parse record
		/// specified by features and children of the given node.
		/// </summary>
		private void WriteMorphologyParse(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			//**************************************************************
			// Write the opening <mparse> tag:
			//
			// <mparse id="...">
			//
			// The "id" attribute must be unique.

			Writer.WriteStartElement(ParseXml.MparseElement);
			Writer.WriteAttributeString(ParseXml.IDAttribute,GenerateID());

			//**************************************************************
			// Write the opening <a> tag:
			//
			// <a id="...">
			//
			// The "id" attribute must be unique.

			Writer.WriteStartElement(ParseXml.AElement);
			Writer.WriteAttributeString(ParseXml.IDAttribute,GenerateID());

			//**************************************************************
			// Write a <pfx> record for each prefix morpheme: each child
			// node where the "node:type" feature value is "pfx".

			foreach (SyntaxNode oChild in oNode.ChildNodes)
			{
				string sNodeType
					= oChild.Features[TreeTranEngineString.NodeType];
				if (sNodeType == TreeTranEngineString.PrefixMorpheme)
				{
					WriteMorphologyParseMorpheme(oChild);
				}
			}

			//**************************************************************
			// Write a <root> record for each root morpheme: each child node
			// where the "node:type" feature value is "root" (or any value
			// other than "pfx" or "sfx"). There must be at least one root
			// morpheme.

			int iRootCount = 0;
			foreach (SyntaxNode oChild in oNode.ChildNodes)
			{
				string sNodeType
					= oChild.Features[TreeTranEngineString.NodeType];
				if ((sNodeType != TreeTranEngineString.PrefixMorpheme)
					&& (sNodeType != TreeTranEngineString.SuffixMorpheme))
				{
					WriteMorphologyParseMorpheme(oChild);
					++iRootCount;
				}
			}
			if (iRootCount == 0)
			{
				//**********************************************************
				// Write a blank <root> record if no other child node is a
				// root morpheme.

				Debug.WriteLineIf(VerboseDebugging,
					"ParseWriter.WriteMorphologyParse(): "
					+ "Morphology parse (" + oNode.ToString() + ") "
					+ "has no root morpheme to write.");

				WriteMorphologyParseMorpheme(new SyntaxNode());
			}

			//**************************************************************
			// Write a <sfx> record for each suffix morpheme: each child
			// node where the "node:type" feature value is "sfx".

			foreach (SyntaxNode oChild in oNode.ChildNodes)
			{
				string sNodeType
					= oChild.Features[TreeTranEngineString.NodeType];
				if (sNodeType == TreeTranEngineString.SuffixMorpheme)
				{
					WriteMorphologyParseMorpheme(oChild);
				}
			}

			//**************************************************************
			// Write the closing <a> tag:
			//
			// </a>

			Writer.WriteEndElement();

			//**************************************************************
			// Write the optional <cat> tag:
			//
			// <cat id="...">...</cat>
			//
			// The "id" attribute must be unique.
			//
			// The tag contains the text description of the category for
			// the morphology parse (from the "cat" feature).

			if (oNode.Features.Contains(ParseXml.CatElement))
			{
				Writer.WriteStartElement(ParseXml.CatElement);
				Writer.WriteAttributeString(ParseXml.IDAttribute,
					GenerateID());
				string sValue = oNode.Features[ParseXml.CatElement];
				Writer.WriteString(sValue);
				Writer.WriteEndElement();
			}

			//**************************************************************
			// Write the closing <mparse> tag:
			//
			// </mparse>

			Writer.WriteEndElement();
		}
		//******************************************************************
		/// <summary>
		/// Writes the morpheme record specified by features of the given
		/// node. The opening tag of the record is determined by the node's
		/// "node:type" feature value: "pfx" or "root" (default) or "sfx".
		/// </summary>
		private void WriteMorphologyParseMorpheme(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			//**************************************************************
			// Write the opening <pfx> or <root> or <sfx> tag:
			//
			// <pfx id="..." cap="...">
			//
			// <root id="..." cap="...">
			//
			// <sfx id="..." cap="...">
			//
			// The tag is determined by the "node:type" feature value:
			// either "pfx" or "root" (default) or "sfx".
			//
			// The "id" attribute must be unique.
			//
			// The "cap" attribute is optional capitalization information
			// (from the "cap" feature).

			string sNodeType
				= oNode.Features[TreeTranEngineString.NodeType];
			string sValue = ParseXml.RootElement;
			if (sNodeType == TreeTranEngineString.PrefixMorpheme)
			{
				sValue = ParseXml.PfxElement;
			}
			if (sNodeType == TreeTranEngineString.SuffixMorpheme)
			{
				sValue = ParseXml.SfxElement;
			}
			Writer.WriteStartElement(sValue);
			Writer.WriteAttributeString(ParseXml.IDAttribute,GenerateID());
			if (oNode.Features.Contains(ParseXml.CapAttribute))
			{
				sValue = oNode.Features[ParseXml.CapAttribute];
				Writer.WriteAttributeString(ParseXml.CapAttribute,sValue);
			}

			//**************************************************************
			// Write the <m> tag:
			//
			// <m id="...">...</m>
			//
			// The "id" attribute must be unique.
			//
			// The tag contains the text of the name used to identify the
			// morpheme (from the "m" feature).

			Writer.WriteStartElement(ParseXml.MElement);
			Writer.WriteAttributeString(ParseXml.IDAttribute,GenerateID());
			sValue = oNode.Features[ParseXml.MElement];
			Writer.WriteString(sValue);
			Writer.WriteEndElement();

			//**************************************************************
			// Write the optional <u> tag:
			//
			// <u id="...">...</u>
			//
			// The "id" attribute must be unique.
			//
			// The tag contains the text of the underlying form (from the
			// "u" feature).

			if (oNode.Features.Contains(ParseXml.UElement))
			{
				Writer.WriteStartElement(ParseXml.UElement);
				Writer.WriteAttributeString(ParseXml.IDAttribute,
					GenerateID());
				sValue = oNode.Features[ParseXml.UElement];
				Writer.WriteString(sValue);
				Writer.WriteEndElement();
			}

			//**************************************************************
			// Write the optional <d> tag:
			//
			// <d id="...">...</d>
			//
			// The "id" attribute must be unique.
			//
			// The tag contains the text of the morpheme decomposition
			// for the surface form allomorph (from the "d" feature).

			if (oNode.Features.Contains(ParseXml.DElement))
			{
				Writer.WriteStartElement(ParseXml.DElement);
				Writer.WriteAttributeString(ParseXml.IDAttribute,
					GenerateID());
				sValue = oNode.Features[ParseXml.DElement];
				Writer.WriteString(sValue);
				Writer.WriteEndElement();
			}

			//**************************************************************
			// Write the optional <mcat> tag:
			//
			// <mcat id="...">...</mcat>
			//
			// The "id" attribute must be unique.
			//
			// The tag contains the text of the morpheme category (from the
			// "mcat" feature).

			if (oNode.Features.Contains(ParseXml.McatElement))
			{
				Writer.WriteStartElement(ParseXml.McatElement);
				Writer.WriteAttributeString(ParseXml.IDAttribute,
					GenerateID());
				sValue = oNode.Features[ParseXml.McatElement];
				Writer.WriteString(sValue);
				Writer.WriteEndElement();
			}

			//**************************************************************
			// Write the optional <p> tag:
			//
			// <p id="...">...</p>
			//
			// The "id" attribute must be unique.
			//
			// The tag contains the text representing a set of properties
			// (from the "p" feature).

			if (oNode.Features.Contains(ParseXml.PElement))
			{
				Writer.WriteStartElement(ParseXml.PElement);
				Writer.WriteAttributeString(ParseXml.IDAttribute,
					GenerateID());
				sValue = oNode.Features[ParseXml.PElement];
				Writer.WriteString(sValue);
				Writer.WriteEndElement();
			}

			//**************************************************************
			// Write the optional <fd> tag:
			//
			// <fd id="...">...</fd>
			//
			// The "id" attribute must be unique.
			//
			// The tag contains the text representing a set of feature
			// descriptors (from the "fd" feature).

			if (oNode.Features.Contains(ParseXml.FdElement))
			{
				Writer.WriteStartElement(ParseXml.FdElement);
				Writer.WriteAttributeString(ParseXml.IDAttribute,
					GenerateID());
				sValue = oNode.Features[ParseXml.FdElement];
				Writer.WriteString(sValue);
				Writer.WriteEndElement();
			}

			//**************************************************************
			// Write the closing <pfx> or <root> or <sfx> tag:
			//
			// </pfx>
			//
			// </root>
			//
			// </sfx>

			Writer.WriteEndElement();
		}
		#endregion
		//******************************************************************
		#region [WriteSyntax() Method]
		//******************************************************************
		/// <summary>
		/// Writes the "Analysis" and "Parse" tags containing the syntactic
		/// parse tree for the sentence (starting from the ParseTreeRoot
		/// node).
		/// </summary>
		private void WriteSyntax()
		{
			//**************************************************************
			// Write the opening <Analysis> tag:
			//
			// <Analysis count="..." fail="...">
			//
			// The "count" attribute is "1". (The tree-transfer process can
			// make different structural changes to alternative parse trees,
			// resulting in different sets of words and word orders for each
			// of these trees. Therefore, a separate set of <anaRec> records
			// is written for each parse tree.)
			//
			// The optional "fail" attribute is not written.

			Writer.WriteStartElement(ParseXml.AnalysisElement);
			Writer.WriteAttributeString(ParseXml.CountAttribute,"1");

			//**************************************************************
			// Write the opening <Parse> tag:
			//
			// <Parse>

			Writer.WriteStartElement(ParseXml.ParseElement);

			//**************************************************************
			// Call WriteSyntaxNode() to recursively write the nodes and
			// features in the syntactic parse tree (starting from the
			// ParseTreeRoot node).

			WriteSyntaxNode(ParseTreeRoot);

			//**************************************************************
			// Write the closing <Parse> tag:
			//
			// </Parse>

			Writer.WriteEndElement();

			//**************************************************************
			// Write the closing <Analysis> tag:
			//
			// </Analysis>

			Writer.WriteEndElement();
		}
		//******************************************************************
		/// <summary>
		/// Recursively traverses the indicated branch of the parse tree
		/// (dominiated by oNode) down to the syntax leaf nodes, writing the
		/// nodes and their features.
		/// </summary>
		private void WriteSyntaxNode(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			//**************************************************************
			// Write the opening <Node> tag:
			//
			// <Node id="..." cat="..." rule="..." all="..." fail="...">
			//
			// The "id" attribute must be unique.
			//
			// The "cat" attribute indicates the syntactic category of the
			// node (from the oNode.Category property).
			//
			// BUGBUG: The optional "rule" attribute is currently ignored.
			// Is it needed? If so, a feature named "node:rule" could be
			// used to store its value.
			//
			// The optional "all" attribute is not written.
			//
			// The optional "fail" attribute is not written.

			Writer.WriteStartElement(ParseXml.NodeElement);
			Writer.WriteAttributeString(ParseXml.IDAttribute,GenerateID());
			Writer.WriteAttributeString(ParseXml.CatAttribute,
				oNode.Category);

			//**************************************************************
			// Write the node's syntactic features.
			//
			// Note: Within a <Node> tag, only a syntactic feature set <Fs>
			// can be written. Within a <Leaf> tag, both a syntactic feature
			// set <Fs> and a lexical feature set <Lexfs> can be written.

			WriteFeatureSet(oNode);

			//**************************************************************
			// Write the child nodes.
			//
			// Note: Since the <Parse> tag must have a child that is a
			// <Node> tag, WriteSyntaxNode() is always called to write the
			// root node of the parse tree. In the unlikely case that the
			// root node is also a syntax leaf node, WriteSyntaxNode() is
			// called anyway and a <Node> tag is written instead of a <Leaf>
			// tag. Therefore, we must check if we have a syntax leaf node,
			// because the children of a syntax leaf node should not be
			// written here (since they represent morphology parses).

			if (IsSyntaxLeaf(oNode))
			{
				Debug.Assert(oNode == ParseTreeRoot);
				Debug.WriteLineIf(VerboseDebugging,
					"ParseWriter.WriteSyntaxNode(): "
					+ "The root node (" + oNode.ToString() + ") "
					+ "is also a syntax leaf node, "
					+ "so its lexical features will not be written.");
			}
			else
			{
				//**********************************************************
				// Write the child nodes.

				foreach (SyntaxNode oChild in oNode.ChildNodes)
				{
					//******************************************************
					// If the child node is a syntax leaf, call
					// WriteSyntaxLeaf() to write the <Leaf> record.
					//
					// Otherwise, call WriteSyntaxNode() recursively to
					// write the child <Node> record and its children.

					if (IsSyntaxLeaf(oChild))
					{
						WriteSyntaxLeaf(oChild);
					}
					else
					{
						WriteSyntaxNode(oChild);
					}
				}
			}

			//**************************************************************
			// Write the closing <Node> tag:
			//
			// </Node>

			Writer.WriteEndElement();
		}
		//******************************************************************
		/// <summary>
		/// Writes the indicated syntax leaf node (oNode) and its features.
		/// </summary>
		private void WriteSyntaxLeaf(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(IsSyntaxLeaf(oNode));

			//**************************************************************
			// Write the opening <Leaf> tag:
			//
			// <Leaf id="..." cat="..." gloss="..." all="..." fail="...">
			//
			// The "id" attribute must be unique.
			//
			// The "cat" attribute indicates the syntactic category of the
			// node (from the oNode.Category property).
			//
			// BUGBUG: The optional "gloss" attribute is currently ignored.
			// Is it needed? If so, a feature named "node:gloss" could be
			// used to store its value.
			//
			// The optional "all" attribute is not written.
			//
			// The optional "fail" attribute is not written.

			Writer.WriteStartElement(ParseXml.LeafElement);
			Writer.WriteAttributeString(ParseXml.IDAttribute,GenerateID());
			Writer.WriteAttributeString(ParseXml.CatAttribute,
				oNode.Category);

			//**************************************************************
			// Write the leaf node's syntactic features.

			WriteFeatureSet(oNode);

			//**************************************************************
			// Write the leaf node's lexical features.

			WriteLexicalFeatureSet(oNode);

			//**************************************************************
			// Write the <Str> tag:
			//
			// <Str id="..." rel="..." lang="...">...</Str>
			//
			// The optional "id" attribute is not written.
			//
			// The "rel" attribute "eq" specifies that the string is equal
			// to the given value. Since "eq" is the default value, we do
			// not need to write the "rel" attribute.
			//
			// The optional "lang" attribute is not written.
			//
			// The tag contains the text of the leaf string (from the
			// "morph:w" feature).

			Writer.WriteStartElement(ParseXml.StrElement);
			string sName = TreeTranEngineString.MorphPrefix
				+ ParseXml.WElement;
			string sValue = oNode.Features[sName];
			Writer.WriteString(sValue);
			Writer.WriteEndElement();

			//**************************************************************
			// Write the closing <Leaf> tag:
			//
			// </Leaf>

			Writer.WriteEndElement();
		}
		#endregion
		//******************************************************************
		#region [WriteFeatureSet() and WriteLexicalFeatureSet() Methods]
		//******************************************************************
		/// <summary>
		/// Writes a feature-set ("Fs") tag, containing the syntactic
		/// features of the given node (oNode).
		/// </summary>
		private void WriteFeatureSet(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			//**************************************************************
			// Copy features from the oNode.Features collection, but exclude
			// all (1) internal node features (which have names starting
			// with "node:"), (2) morphology features (which have names
			// starting with "morph:") and (3) lexical features (which have
			// names starting with "lex:").

			Debug.Assert(TreeTranEngineString.NodeLabel
				.StartsWith(TreeTranEngineString.NodePrefix));
			Debug.Assert(TreeTranEngineString.NodeType
				.StartsWith(TreeTranEngineString.NodePrefix));

			SyntaxNode oCopy = new SyntaxNode();
			foreach (SyntaxFeature oFeature in oNode.Features)
			{
				string sName = oFeature.Name;
				string sValue = oFeature.Value;
				if ((! sName.StartsWith(
					TreeTranEngineString.NodePrefix))
					&& (! sName.StartsWith(
					TreeTranEngineString.MorphPrefix))
					&& (! sName.StartsWith(
					TreeTranEngineString.LexPrefix)))
				{
					if ((sName.StartsWith(
						TreeTranEngineString.FeatureSeparator))
						|| (sName.EndsWith(
						TreeTranEngineString.FeatureSeparator)))
					{
						//**************************************************
						// Feature names cannot start with or end with a
						// feature separator.

						Debug.WriteLineIf(VerboseDebugging,
							"ParseWriter.WriteFeatureSet(): "
							+ "A feature name is invalid "
							+ "because it starts or ends with a separator "
							+ "(" + oFeature.ToString() + "), "
							+ "so it will not be written.");
					}
					else
					{
						oCopy.Features[sName] = sValue;
					}
				}
			}

			//**************************************************************
			// Write the opening <Fs> tag:
			//
			// <Fs id="..." rel="..." type="...">
			//
			// The optional "id" attribute is not written.
			//
			// The "rel" attribute "eq" specifies that the feature structure
			// is equal to the given structure. Since "eq" is the default
			// value, we do not need to write the "rel" attribute.
			//
			// The optional "type" attribute is not written.

			Writer.WriteStartElement(ParseXml.FsElement);

			//**************************************************************
			// The collection of features may be empty.

			if (oCopy.Features.Count == 0)
			{
				Debug.WriteLineIf(VerboseDebugging,
					"ParseWriter.WriteFeatureSet(): "
					+ "No features to write within <Fs> tag.");
			}

			//**************************************************************
			// Get the left substring (up to a feature separator) for each
			// feature name. Using this substring, call WriteFeature() to
			// write the indicated features and remove them from the copied
			// features collection. Do this until the copied features
			// collection is empty.

			SyntaxFeature oFirstFeature = FirstFeature(oCopy);
			while (oFirstFeature != null)
			{
				string sLeft = LeftString(oFirstFeature.Name,
					TreeTranEngineString.FeatureSeparator);
				WriteFeature(oCopy,sLeft);
				oFirstFeature = FirstFeature(oCopy);
			}

			//**************************************************************
			// Write the closing <Fs> tag:
			//
			// </Fs>

			Writer.WriteEndElement();
		}
		//******************************************************************
		/// <summary>
		/// Writes a lexical-feature-set ("Lexfs") tag, containing the
		/// lexical features of the given node (oNode).
		/// </summary>
		private void WriteLexicalFeatureSet(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(IsSyntaxLeaf(oNode));

			//**************************************************************
			// Copy only lexical features (which have names starting with
			// "lex:") from the oNode.Features collection.

			SyntaxNode oCopy = new SyntaxNode();
			foreach (SyntaxFeature oFeature in oNode.Features)
			{
				string sName = oFeature.Name;
				string sValue = oFeature.Value;
				if (sName.StartsWith(TreeTranEngineString.LexPrefix))
				{
					//******************************************************
					// Strip off the "lex:" prefix from the beginning of the
					// lexical-feature name.

					int iIndex = TreeTranEngineString.LexPrefix.Length;
					sName = sName.Substring(iIndex);

					//******************************************************
					// Copy the lexical-feature (if the name is valid).

					if ((sName.StartsWith(
						TreeTranEngineString.FeatureSeparator))
						|| (sName.EndsWith(
						TreeTranEngineString.FeatureSeparator)))
					{
						//**************************************************
						// Feature names cannot start with or end with a
						// feature separator.

						Debug.WriteLineIf(VerboseDebugging,
							"ParseWriter.WriteLexicalFeatureSet(): "
							+ "A feature name is invalid "
							+ "because it starts or ends with a separator "
							+ "(" + oFeature.ToString() + "), "
							+ "so it will not be written.");
					}
					else
					{
						oCopy.Features[sName] = sValue;
					}
				}
			}

			//**************************************************************
			// Write the opening <Lexfs> tag:
			//
			// <Lexfs id="..." rel="..." type="...">
			//
			// The optional "id" attribute is not written.
			//
			// The "rel" attribute "eq" specifies that the feature structure
			// is equal to the given structure. Since "eq" is the default
			// value, we do not need to write the "rel" attribute.
			//
			// The optional "type" attribute is not written.

			Writer.WriteStartElement(ParseXml.LexfsElement);

			//**************************************************************
			// The collection of features may be empty.

			if (oCopy.Features.Count == 0)
			{
				Debug.WriteLineIf(VerboseDebugging,
					"ParseWriter.WriteLexicalFeatureSet(): "
					+ "No features to write within <Lexfs> tag.");
			}

			//**************************************************************
			// Get the left substring (up to a feature separator) for each
			// feature name. Using this substring, call WriteFeature() to
			// write the indicated features and remove them from the copied
			// features collection. Do this until the copied features
			// collection is empty.

			SyntaxFeature oFirstFeature = FirstFeature(oCopy);
			while (oFirstFeature != null)
			{
				string sLeft = LeftString(oFirstFeature.Name,
					TreeTranEngineString.FeatureSeparator);
				WriteFeature(oCopy,sLeft);
				oFirstFeature = FirstFeature(oCopy);
			}

			//**************************************************************
			// Write the closing <Lexfs> tag:
			//
			// </Lexfs>

			Writer.WriteEndElement();
		}
		//******************************************************************
		/// <summary>
		/// Writes a feature ("F") tag, containing features from the given
		/// node (oNode) that are indicated by the given name (sName). If
		/// the oNode.Features collection contains a feature with the given
		/// name, the feature's value is written as a string. Otherwise a
		/// nested feature set is written for all feature names starting
		/// with the given name followed by a feature separator. Finally,
		/// all features indicated by the given name are removed from the
		/// oNode.Features collection.
		/// </summary>
		private void WriteFeature(SyntaxNode oNode,string sName)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(sName != null);
			Debug.Assert(sName != "");
			Debug.Assert(sName.IndexOf(
				TreeTranEngineString.FeatureSeparator) < 0);

			//**************************************************************
			// Write the opening <F> tag:
			//
			// <F name="..." rel="..." org="..." fVal="...">
			//
			// The "name" attribute is the name of the feature.
			//
			// The "rel" attribute "eq" specifies that the feature is equal
			// to the given value. Since "eq" is the default value, we do
			// not need to write the "rel" attribute.
			//
			// The optional "org" attribute is not written.
			//
			// BUGBUG: The optional "fVal" attribute is not written because
			// it is currently not supported.

			Writer.WriteStartElement(ParseXml.FElement);
			Writer.WriteAttributeString(ParseXml.NameAttribute,sName);

			//**************************************************************
			// If the oNode.Features collection contains a feature with the
			// given name (sName), write the feature's value as a string:
			//
			// <Str id="..." rel="..." lang="...">...</Str>
			//
			// Otherwise, write the feature's value as a nested feature set
			// for all feature names starting with the given sName followed
			// by a feature separator:
			//
			// <Fs type="..." rel="..." id="...">
			//     <F>...</F>
			// </Fs>

			if (oNode.Features.Contains(sName))
			{
				//**********************************************************
				// Write the <Str> tag:
				//
				// <Str id="..." rel="..." lang="...">...</Str>
				//
				// The optional "id" attribute is not written.
				//
				// The "rel" attribute "eq" specifies that the feature is
				// equal to the given value. Since "eq" is the default
				// value, we do not need to write the "rel" attribute.
				//
				// The optional "lang" attribute is not written.
				//
				// The tag contains the text of the feature value.

				Writer.WriteStartElement(ParseXml.StrElement);
				string sValue = oNode.Features[sName];
				Writer.WriteString(sValue);
				Writer.WriteEndElement();
			}
			else
			{
				//**********************************************************
				// Write a nested feature set.
				//
				// Find features in the oNode.Features collection where the
				// feature name starts with the given sName followed by a
				// feature separator. Make a copy of these features, but
				// remove the sName and separator from the beginning of the
				// feature names.
				//
				// For example, if sName is "person" and oNode.Features
				// contains:
				//
				//     oNode.Features["number singular"] = "+"
				//     oNode.Features["number plural"] = "-"
				//     oNode.Features["person first"] = "-"
				//     oNode.Features["person second"] = "-"
				//     oNode.Features["person third"] = "+"
				//
				// then the following features will be copied:
				//
				//     oCopy.Features["first"] = "-"
				//     oCopy.Features["second"] = "-"
				//     oCopy.Features["third"] = "+"
				//
				// Call WriteFeatureSet() to write the copied features as a
				// nested feature set.

				SyntaxNode oCopy = new SyntaxNode();
				foreach (SyntaxFeature oFeature in oNode.Features)
				{
					string sLeft = LeftString(oFeature.Name,
						TreeTranEngineString.FeatureSeparator);
					string sRight = RightString(oFeature.Name,
						TreeTranEngineString.FeatureSeparator);
					if (sLeft == sName)
					{
						Debug.Assert(sRight != "");

						oCopy.Features[sRight] = oFeature.Value;
					}
				}
				WriteFeatureSet(oCopy);
			}

			//**************************************************************
			// Write the closing <F> tag:
			//
			// </F>

			Writer.WriteEndElement();

			//**************************************************************
			// Check if the oNode.Features collection contains BOTH a
			// feature named sName AND a feature name that starts with sName
			// followed by a feature separator. (Only one or the other can
			// be written.)

			if (VerboseDebugging)
			{
				if (oNode.Features.Contains(sName))
				{
					string sValue = oNode.Features[sName];
					foreach (SyntaxFeature oFeature in oNode.Features)
					{
						string sLeft = LeftString(oFeature.Name,
							TreeTranEngineString.FeatureSeparator);
						if ((sLeft == sName) && (oFeature.Name != sName))
						{
							Debug.WriteLine("ParseWriter.WriteFeature(): "
								+ "A nested feature "
								+ "(" + oFeature.ToString() + ") "
								+ "will not be written because "
								+ "a feature named \"" + sName + "\" "
								+ "also exists (with value: "
								+ "\"" + sValue + "\").");
						}
					}
				}
			}

			//**************************************************************
			// Remove features from the oNode.Features collection if the
			// feature name (1) equals the given sName or (2) starts with
			// the given sName followed by a feature separator.
			//
			// First collect the names of features to remove. Then remove
			// these names from the oNode.Features collection.

			StringCollection oNamesToRemove = new StringCollection();
			foreach (SyntaxFeature oFeature in oNode.Features)
			{
				string sLeft = LeftString(
					oFeature.Name,TreeTranEngineString.FeatureSeparator);
				if (sLeft == sName)
				{
					oNamesToRemove.Add(oFeature.Name);
				}
			}
			foreach (string sNameToRemove in oNamesToRemove)
			{
				oNode.Features.Remove(sNameToRemove);
			}
		}
		//******************************************************************
		/// <summary>
		/// Returns the first SyntaxFeature from the Features collection of
		/// the given SyntaxNode (oNode). Returns null if the Feature
		/// collection is empty.
		/// </summary>
		private SyntaxFeature FirstFeature(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			foreach (SyntaxFeature oFeature in oNode.Features)
			{
				return oFeature;
			}
			return null;
		}
		//******************************************************************
		/// <summary>
		/// Returns the left substring from the beginning of the given
		/// string (sString) up to the indicated separator (sSeparator). If
		/// the separator is not found in the string, the entire string is
		/// returned.
		/// </summary>
		private string LeftString(string sString,string sSeparator)
		{
			Debug.Assert(sString != null);
			Debug.Assert(sSeparator != null);
			Debug.Assert(sSeparator != "");

			int iIndex = sString.IndexOf(sSeparator);
			if (iIndex < 0)
			{
				return sString;
			}
			return sString.Substring(0,iIndex);
		}
		//******************************************************************
		/// <summary>
		/// Returns the right substring from after the the indicated
		/// separator (sSeparator) up to the end of the given string
		/// (sString). If the separator is not found in the string, an empty
		/// string ("") is returned.
		/// </summary>
		private string RightString(string sString,string sSeparator)
		{
			Debug.Assert(sString != null);
			Debug.Assert(sSeparator != null);
			Debug.Assert(sSeparator != "");

			int iIndex = sString.IndexOf(sSeparator);
			if (iIndex < 0)
			{
				return "";
			}
			return sString.Substring(iIndex + sSeparator.Length);
		}
		#endregion
		//******************************************************************
		#region [IsSyntaxLeaf() and IsLastSyntaxLeaf() Methods]
		//******************************************************************
		/// <summary>
		/// Returns true if the given node (oNode) is considered a syntax
		/// leaf for the purpose of a top-down traversal of the parse tree:
		/// either (1) if the oNode.IsSyntaxLeaf property is true, or (2)
		/// if the oNode has no children (this is so a morphology record
		/// will be written for each leaf node in the syntax parse tree,
		/// even if the transfer rules have unintentionally deleted
		/// morphology information from a branch of the tree). Otherwise,
		/// false is returned.
		/// </summary>
		private bool IsSyntaxLeaf(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);

			if (oNode.IsSyntaxLeaf)
			{
				return true;
			}
			if (oNode.ChildNodes.Count == 0)
			{
				return true;
			}
			return false;
		}
		//******************************************************************
		/// <summary>
		/// Returns true if the given node (oNode) is the last syntax leaf
		/// in a top-down left-to-right traversal of the parse tree, using
		/// IsSyntaxLeaf() to determine leaf nodes in the tree. Otherwise,
		/// false is returned.
		/// </summary>
		private bool IsLastSyntaxLeaf(SyntaxNode oNode)
		{
			Debug.Assert(oNode != null);
			Debug.Assert(ParseTreeRoot != null);

			//**************************************************************
			// Find the last syntax leaf in the parse tree.

			SyntaxNode oLastSyntaxLeaf = ParseTreeRoot;
			while (! IsSyntaxLeaf(oLastSyntaxLeaf))
			{
				oLastSyntaxLeaf = oLastSyntaxLeaf.LastChild;
			}

			//**************************************************************
			// Return true if the given oNode is the last syntax leaf.

			if (oNode == oLastSyntaxLeaf)
			{
				return true;
			}
			return false;
		}
		#endregion
		//******************************************************************
		#region [GenerateID() Method]
		//******************************************************************
		/// <summary>
		/// Integer counter that is incremented each time the GenerateID()
		/// method is called. GenerateID() uses this counter to generate
		/// unique ID values.
		/// </summary>
		private int miGeneratedID = 0;
		//******************************************************************
		/// <summary>
		/// Returns a unique string ID each time this method is called.
		/// </summary>
		private string GenerateID()
		{
			++miGeneratedID;
			return miGeneratedID.ToString();
		}
		#endregion
		//******************************************************************
		#region [Close() Method]
		//******************************************************************
		/// <summary>
		/// Writes the top-level closing XML tag and then closes the writer
		/// and the underlying stream.
		/// </summary>
		public void Close()
		{
			Writer.WriteEndElement();
			Writer.Close();
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
	}
}
//**************************************************************************
