//**************************************************************************
// File: "TreeTran\RuleXml.cs".
//
// This file defines the RuleXml class, which defines XML string constants
// that are used by the RuleReader and RuleWriter classes.
//
// History:
//     2007-Feb-15 David Bullock: Code complete.
//**************************************************************************
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Defines XML string constants that are used by the RuleReader and
	/// RuleWriter classes.
	/// </summary>
	internal class RuleXml
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// The constructor is private because this class only defines
		/// string constants.
		/// </summary>
		private RuleXml()
		{
			Debug.Fail("This class only defines string constants.");
		}
		#endregion
		//******************************************************************
		#region [TreeTransferRulesElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the top-level XML element for tree-transfer-rules
		/// data.
		/// </summary>
		public const string TreeTransferRulesElement = "TreeTransferRules";
		#endregion
		//******************************************************************
		#region [VersionAttribute and VersionValue Constants]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the version of the
		/// tree-transfer-rules data format. (Attribute of
		/// TreeTransferRulesElement.)
		/// </summary>
		public const string VersionAttribute = "version";
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute value indicating the version of the
		/// tree-transfer-rules data format. (Value of VersionAttribute.)
		/// </summary>
		public const string VersionValue = "1.0";
		#endregion
		//******************************************************************
		#region [RuleElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a tree-transfer-rule record
		/// consisting of a find-pattern tree and (optionally) a
		/// replace-pattern tree. (Child of TreeTransferRulesElement.)
		/// </summary>
		public const string RuleElement = "Rule";
		#endregion
		//******************************************************************
		#region [NodeElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a node
		/// (with its features and children) in a find-pattern tree or in
		/// a replace-pattern tree. (Child of RuleElement and NodeElement.)
		/// </summary>
		public const string NodeElement = "Node";
		#endregion
		//******************************************************************
		#region [FeatureElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a feature
		/// name and value. (Child of NodeElement.)
		/// </summary>
		public const string FeatureElement = "Feature";
		#endregion
		//******************************************************************
		#region [NameAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the name of a rule or
		/// feature. (Attribute of RuleElement and FeatureElement.)
		/// </summary>
		public const string NameAttribute = "name";
		#endregion
		//******************************************************************
		#region [ValueAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the value of a feature.
		/// (Attribute of FeatureElement.)
		/// </summary>
		public const string ValueAttribute = "value";
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
