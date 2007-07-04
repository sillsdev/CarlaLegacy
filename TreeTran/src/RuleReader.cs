//**************************************************************************
// File: "TreeTran\RuleReader.cs".
//
// This file defines the RuleReader class, which implements an XML reader
// for tree-transfer rule data.
//
// History:
//     2006-Jul-17 David Bullock: Code complete.
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
	/// Implements an XML reader for tree-transfer rule data.
	/// </summary>
	public class RuleReader
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
		/// Initializes a new instance of the RuleReader class, which will
		/// read XML data using the given TextReader.
		/// </summary>
		public RuleReader(TextReader oTextReader)
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
		#region [RuleName Property]
		//******************************************************************
		/// <summary>
		/// The RuleName property value.
		/// </summary>
		private string msRuleName = "";
		//******************************************************************
		/// <summary>
		/// Gets the name of the rule that was read by calling the Read()
		/// method.
		/// </summary>
		public string RuleName
		{
			get
			{
				return msRuleName;
			}
		}
		#endregion
		//******************************************************************
		#region [FindPatternRoot Property]
		//******************************************************************
		/// <summary>
		/// The FindPatternRoot property value.
		/// </summary>
		private SyntaxNode moFindPatternRoot = null;
		//******************************************************************
		/// <summary>
		/// Gets the root node of the find-pattern tree that was read by
		/// calling the Read() method.
		/// </summary>
		public SyntaxNode FindPatternRoot
		{
			get
			{
				return moFindPatternRoot;
			}
		}
		#endregion
		//******************************************************************
		#region [ReplacePatternRoot Property]
		//******************************************************************
		/// <summary>
		/// The ReplacePatternRoot property value.
		/// </summary>
		private SyntaxNode moReplacePatternRoot = null;
		//******************************************************************
		/// <summary>
		/// Gets the root node of the replace-pattern tree that was read by
		/// calling the Read() method. (The value can be null for an empty
		/// replace-pattern tree.)
		/// </summary>
		public SyntaxNode ReplacePatternRoot
		{
			get
			{
				return moReplacePatternRoot;
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
		/// Reads the next tree-transfer rule and sets the RuleName,
		/// FindPatternRoot and ReplacePatternRoot properties. Returns true
		/// if the next rule was read successfully. Returns false if there
		/// are no more rules to read.
		/// </summary>
		public bool Read()
		{
			//**************************************************************
			// Set the RuleName property to an empty string (""). Set the
			// FindPatternRoot and ReplacePatternRoot properties to null.

			msRuleName = "";
			moFindPatternRoot = null;
			moReplacePatternRoot = null;

			//**************************************************************
			// Read the next tree-transfer rule.
			//
			// <TreeTransferRules> --- Check the version.
			//     <Rule> --- Set the RuleName property.
			//         <Node> --- Call ReadNode(). Set FindPatternRoot.
			//         <Node> --- Call ReadNode(). Set ReplacePatternRoot.
			//     </Rule> --- Return true.
			// </TreeTransferRules> --- Return false.

			while (Reader.Read())
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <TreeTransferRules> tag at depth 0:
				//
				// <TreeTransferRules version="...">
				//     <Rule>...</Rule>
				// </TreeTransferRules>
				//
				// The "version" attribute must match the expected version.
				// Otherwise, throw an exception.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 0)
					&& (Reader.Name == RuleXml.TreeTransferRulesElement))
				{
					string sVersion
						= Reader.GetAttribute(RuleXml.VersionAttribute);
					if (sVersion == null)
					{
						sVersion = "";
					}
					if (sVersion != RuleXml.VersionValue)
					{
						string sMessage = "Invalid XML data: "
							+ "The version specified by the "
							+ "tree-transfer-rules data "
							+ "(" + sVersion + ") "
							+ "does not match the expected version "
							+ "(" + RuleXml.VersionValue + ").";
						throw new Exception(sMessage);
					}
					bHandled = true;
				}
				if ((Reader.NodeType == XmlNodeType.EndElement)
					&& (Reader.Depth == 0)
					&& (Reader.Name == RuleXml.TreeTransferRulesElement))
				{
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Rule> tag at depth 1:
				//
				// <Rule name="...">
				//     <Node>...</Node>
				// </Rule>
				//
				// Use the "name" attribute to set the RuleName property.
				//
				// When we reach the closing <Rule> tag, check that we read
				// a valid tree-transfer rule: FindPatternRoot must not be
				// null (but ReplacePatternRoot is optional and can be
				// null). Return true if FindPatternRoot is not null.
				// Otherwise, throw an exception.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 1)
					&& (Reader.Name == RuleXml.RuleElement))
				{
					string sName
						= Reader.GetAttribute(RuleXml.NameAttribute);
					if (sName == null)
					{
						sName = "";
					}
					msRuleName = sName;
					bHandled = true;
				}
				if ((Reader.NodeType == XmlNodeType.EndElement)
					&& (Reader.Depth == 1)
					&& (Reader.Name == RuleXml.RuleElement))
				{
					if (FindPatternRoot == null)
					{
						string sMessage = "Invalid XML data: "
							+ "the <Rule> tag does not contain "
							+ "a <Node> tag.";
						throw new Exception(sMessage);
					}
					return true;
				}

				//**********************************************************
				// Handle the <Node> tag at depth 2:
				//
				// <Node>
				//     <Feature />
				//     <Node>...</Node>
				// </Node>
				//
				// The <Rule> tag can contain one or two <Node> children:
				// the first contains the find-pattern tree and the second
				// contains the (optional) replace-pattern tree.
				//
				// If FindPatternRoot is null, call ReadNode() to read the
				// find-pattern tree. Set FindPatternRoot to the root of
				// this tree.
				//
				// Otherwise, if ReplacePatternRoot is null, call ReadNode()
				// to read the replace-pattern tree. Set ReplacePatternRoot
				// to the root of this tree.
				//
				// Otherwise, throw an exception, because a <Rule> tag
				// should not contain more than two <Node> children.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == 2)
					&& (Reader.Name == RuleXml.NodeElement))
				{
					if (FindPatternRoot == null)
					{
						moFindPatternRoot = ReadNode();
					}
					else
					{
						if (ReplacePatternRoot == null)
						{
							moReplacePatternRoot = ReadNode();
						}
						else
						{
							string sMessage = "Invalid XML data: "
								+ "the <Rule> tag contains more than "
								+ "two <Node> tags.";
							throw new Exception(sMessage);
						}
					}
					bHandled = true;
				}

				//**********************************************************
				// If the XML element was not recognized, throw an
				// exception.

				if (! bHandled)
				{
					if (Reader.NodeType == XmlNodeType.Element)
					{
						string sMessage = "Invalid XML data: "
							+ "unexpected tag <" + Reader.Name + "> "
							+ "at depth " + Reader.Depth.ToString() + ".";
						throw new Exception(sMessage);
					}
					if (Reader.NodeType == XmlNodeType.EndElement)
					{
						string sMessage = "Invalid XML data: "
							+ "unexpected tag </" + Reader.Name + "> "
							+ "at depth " + Reader.Depth.ToString() + ".";
						throw new Exception(sMessage);
					}
				}
			}

			//**************************************************************
			// Return false when there are no more rules to read.

			return false;
		}
		#endregion
		//******************************************************************
		#region [ReadNode() Method]
		//******************************************************************
		/// <summary>
		/// Recursively reads the node features and children within the
		/// current node tag ("Node"). Returns a new SyntaxNode representing
		/// this branch of the find-pattern tree or replace-pattern tree.
		/// </summary>
		private SyntaxNode ReadNode()
		{
			Debug.Assert(Reader.NodeType == XmlNodeType.Element);
			Debug.Assert(Reader.Name == RuleXml.NodeElement);

			//**************************************************************
			// Create a new syntax node.

			SyntaxNode oNode = new SyntaxNode();

			//**************************************************************
			// Read and process all children of the <Node> tag.
			//
			// <Node>
			//     <Feature> --- Read the feature name and value.
			//     <Node> --- Call ReadNode() to read the child node.
			// </Node>

			int iDepth = Reader.Depth;
			if (! Reader.IsEmptyElement)
			{
				Reader.Read();
			}
			while (Reader.Depth > iDepth)
			{
				bool bHandled = false;

				//**********************************************************
				// Handle the <Feature> tag:
				//
				// <Feature name="..." value="..." />
				//
				// Use the "name" and "value" attributes to set a feature of
				// the new syntax node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Depth == (iDepth + 1))
					&& (Reader.Name == RuleXml.FeatureElement))
				{
					string sName
						= Reader.GetAttribute(RuleXml.NameAttribute);
					if (sName == null)
					{
						sName = "";
					}
					string sValue
						= Reader.GetAttribute(RuleXml.ValueAttribute);
					if (sValue == null)
					{
						sValue = "";
					}
					oNode.Features[sName] = sValue;
					bHandled = true;
				}
				if ((Reader.NodeType == XmlNodeType.EndElement)
					&& (Reader.Depth == (iDepth + 1))
					&& (Reader.Name == RuleXml.FeatureElement))
				{
					bHandled = true;
				}

				//**********************************************************
				// Handle the <Node> tag:
				//
				// <Node>
				//     <Feature />
				//     <Node>...</Node>
				// </Node>
				//
				// Call ReadNode() recursively to read the child node. Add
				// the child to the ChildNodes collection of the new syntax
				// node.

				if ((Reader.NodeType == XmlNodeType.Element)
					&& (Reader.Name == RuleXml.NodeElement))
				{
					SyntaxNode oChild = ReadNode();
					oNode.ChildNodes.Add(oChild);
					bHandled = true;
				}

				//**********************************************************
				// If the XML element was not recognized, throw an
				// exception.

				if (! bHandled)
				{
					if (Reader.NodeType == XmlNodeType.Element)
					{
						string sMessage = "Invalid XML data: "
							+ "unexpected tag <" + Reader.Name + "> "
							+ "at depth " + Reader.Depth.ToString() + ".";
						throw new Exception(sMessage);
					}
					if (Reader.NodeType == XmlNodeType.EndElement)
					{
						string sMessage = "Invalid XML data: "
							+ "unexpected tag </" + Reader.Name + "> "
							+ "at depth " + Reader.Depth.ToString() + ".";
						throw new Exception(sMessage);
					}
				}

				//**********************************************************
				// Read the next XML item.

				Reader.Read();
			}

			//**************************************************************
			// Return the new syntax node.

			return oNode;
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
