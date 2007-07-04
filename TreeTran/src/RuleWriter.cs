//**************************************************************************
// File: "TreeTran\RuleWriter.cs".
//
// This file defines the RuleWriter class, which implements an XML writer
// for tree-transfer rule data.
//
// History:
//     2005-Aug-17 David Bullock: Code complete.
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
	/// Implements an XML writer for tree-transfer rule data.
	/// </summary>
	public class RuleWriter
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the RuleWriter class, which will
		/// write XML data using the given TextWriter. The writer is then
		/// used to write the opening XML tag.
		/// </summary>
		public RuleWriter(TextWriter oTextWriter)
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
			// Write the top-level opening XML tag:
			//
			// <TreeTransferRules version="1.0">

			Writer.WriteStartElement(RuleXml.TreeTransferRulesElement);
			Writer.WriteAttributeString(RuleXml.VersionAttribute,
				RuleXml.VersionValue);
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
		/// Gets or sets the name of the rule that will be written by
		/// calling the Write() method.
		/// </summary>
		public string RuleName
		{
			set
			{
				msRuleName = value;
			}
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
		/// Gets or sets the root node of the find-pattern tree that will be
		/// written by calling the Write() method.
		/// </summary>
		public SyntaxNode FindPatternRoot
		{
			set
			{
				moFindPatternRoot = value;
			}
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
		/// Gets or sets the root node of the replace-pattern tree that will
		/// be written by calling the Write() method. (The value can be null
		/// for an empty replace-pattern tree.)
		/// </summary>
		public SyntaxNode ReplacePatternRoot
		{
			set
			{
				moReplacePatternRoot = value;
			}
			get
			{
				return moReplacePatternRoot;
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
		/// Writes the tree-transfer rule specified by the RuleName,
		/// FindPatternRoot and ReplacePatternRoot properties.
		/// </summary>
		public void Write()
		{
			//**************************************************************
			// Validate the current state.

			if (RuleName == null)
			{
				string sMessage = "RuleWriter.Write() "
					+ "called with an invalid state: "
					+ "RuleName is null.";
				throw new Exception(sMessage);
			}
			if (FindPatternRoot == null)
			{
				string sMessage = "RuleWriter.Write() "
					+ "called with an invalid state: "
					+ "FindPatternRoot is null.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Write the opening <Rule> tag:
			//
			// <Rule name="...">
			//
			// The "name" attribute represents the RuleName property.

			Writer.WriteStartElement(RuleXml.RuleElement);
			Writer.WriteAttributeString(RuleXml.NameAttribute,RuleName);

			//**************************************************************
			// Write the find-pattern tree.

			WriteNode(FindPatternRoot);

			//**************************************************************
			// Write the optional replace-pattern tree.

			if (ReplacePatternRoot != null)
			{
				WriteNode(ReplacePatternRoot);
			}

			//**************************************************************
			// Write the closing <Rule> tag:
			//
			// </Rule>

			Writer.WriteEndElement();
		}
		#endregion
		//******************************************************************
		#region [WriteNode() Method]
		//******************************************************************
		/// <summary>
		/// Recursively traverses the indicated branch (dominiated by oNode)
		/// of the find-pattern tree or replace-pattern tree, writing the
		/// nodes and their features.
		/// </summary>
		private void WriteNode(SyntaxNode oNode)
		{
			//**************************************************************
			// Write the opening <Node> tag:
			//
			// <Node>

			Writer.WriteStartElement(RuleXml.NodeElement);

			//**************************************************************
			// Write the node features.

			foreach (SyntaxFeature oFeature in oNode.Features)
			{
				//**************************************************************
				// Write the <Feature> tag:
				//
				// <Feature name="..." value="..." />
				//
				// The "name" attribute represents the feature Name.
				//
				// The "value" attribute represents the feature Value.

				Writer.WriteStartElement(RuleXml.FeatureElement);
				Writer.WriteAttributeString(RuleXml.NameAttribute,
					oFeature.Name);
				Writer.WriteAttributeString(RuleXml.ValueAttribute,
					oFeature.Value);
				Writer.WriteEndElement();
			}

			//**************************************************************
			// Write the child nodes.

			foreach (SyntaxNode oChild in oNode.ChildNodes)
			{
				WriteNode(oChild);
			}

			//**************************************************************
			// Write the closing <Node> tag:
			//
			// </Node>

			Writer.WriteEndElement();
		}
		#endregion
		//******************************************************************
		#region [Close() Method]
		//******************************************************************
		/// <summary>
		/// Writes the closing XML tag and then closes the writer and the
		/// underlying stream.
		/// </summary>
		public void Close()
		{
			Writer.WriteEndElement();
			Writer.Close();
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
