//**************************************************************************
// File: "TreeTran\TreeTranEngineString.cs".
//
// This file defines the TreeTranEngineString class, which defines string
// constants that are used by the TreeTranEngine namespace.
//
// History:
//     2005-Aug-6 David Bullock: Code complete.
//**************************************************************************
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**************************************************************************
	/// <summary>
	/// Defines string constants that are used by the TreeTranEngine
	/// namespace.
	/// </summary>
	public class TreeTranEngineString
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// The constructor is private because this class only defines
		/// string constants.
		/// </summary>
		private TreeTranEngineString()
		{
			Debug.Fail("This class only defines string constants.");
		}
		#endregion
		//******************************************************************
		#region [SyntaxCategory Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the Name of the SyntaxFeature that represents a
		/// node's category in a syntax tree (above morpheme nodes).
		/// </summary>
		public const string SyntaxCategory = "cat";
		#endregion
		//******************************************************************
		#region [MorphemeCategory Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the Name of the SyntaxFeature that represents a
		/// morpheme node's category.
		/// </summary>
		public const string MorphemeCategory = "mcat";
		#endregion
		//******************************************************************
		#region [NodeLabel Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the Name of the SyntaxFeature that represents the
		/// label of a SyntaxNode. The label feature is used to associate
		/// a node in the replace-pattern tree with a node in the
		/// find-pattern tree: associated nodes have the same label Value.
		/// Also, an optional node in the find and replace patterns is
		/// indicated by a label Value that starts with a left parenthesis
		/// (for example: "(NP#1)").
		/// </summary>
		public const string NodeLabel = "node:label";
		#endregion
		//******************************************************************
		#region [NodeType Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the Name of the SyntaxFeature that has a Value to
		/// indicate the node type for syntax leaf nodes ("leaf"),
		/// morphology parse nodes ("mparse") and morpheme nodes ("pfx",
		/// "root" or "sfx").
		/// </summary>
		public const string NodeType = "node:type";
		#endregion
		//******************************************************************
		#region [SyntaxLeaf Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the SyntaxFeature Value used by the node-type feature
		/// to indicate a syntax leaf node.
		/// </summary>
		public const string SyntaxLeaf = "leaf";
		#endregion
		//******************************************************************
		#region [MorphologyParse Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the SyntaxFeature Value used by the node-type feature
		/// to indicate a morphology parse node.
		/// </summary>
		public const string MorphologyParse = "mparse";
		#endregion
		//******************************************************************
		#region [PrefixMorpheme, RootMorpheme and SuffixMorpheme Constants]
		//******************************************************************
		/// <summary>
		/// Specifies the SyntaxFeature Value used by the node-type feature
		/// to indicate a prefix morpheme node.
		/// </summary>
		public const string PrefixMorpheme = "pfx";
		//******************************************************************
		/// <summary>
		/// Specifies the SyntaxFeature Value used by the node-type feature
		/// to indicate a root morpheme node.
		/// </summary>
		public const string RootMorpheme = "root";
		//******************************************************************
		/// <summary>
		/// Specifies the SyntaxFeature Value used by the node-type feature
		/// to indicate a suffix morpheme node.
		/// </summary>
		public const string SuffixMorpheme = "sfx";
		#endregion
		//******************************************************************
		#region [NodePrefix Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the string prefix that is used at the beginning of
		/// feature names for internal node information (for example:
		/// "node:label") to differentiate them from other morphology,
		/// lexical and syntactic features.
		/// </summary>
		public const string NodePrefix = "node:";
		#endregion
		//******************************************************************
		#region [MorphPrefix Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the string prefix that is added to the beginning of
		/// morphology feature names (for example: "morph:w") to
		/// differentiate them from other features in nodes that can have
		/// both morphology and syntactic features.
		/// </summary>
		public const string MorphPrefix = "morph:";
		#endregion
		//******************************************************************
		#region [LexPrefix Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the string prefix that is added to the beginning of
		/// lexical feature names (for example: "lex:gloss") to
		/// differentiate them from other features in nodes that can have
		/// both lexical and syntactic features.
		/// </summary>
		public const string LexPrefix = "lex:";
		#endregion
		//******************************************************************
		#region [PlusFeature and MinusFeature Constants]
		//******************************************************************
		/// <summary>
		/// Specifies a SyntaxFeature Value used to indicate that a boolean
		/// feature is turned on (true).
		/// </summary>
		public const string PlusFeature = "+";
		//******************************************************************
		/// <summary>
		/// Specifies a SyntaxFeature Value used to indicate that a boolean
		/// feature is turned off (false).
		/// </summary>
		public const string MinusFeature = "-";
		#endregion
		//******************************************************************
		#region [DeleteFeature Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the SyntaxFeature Value that indicates a feature to
		/// delete. When a node feature with this Value appears in the
		/// replace-pattern tree, the feature with the same Name will be
		/// deleted from the corresponding node in the parse tree.
		/// </summary>
		public const string DeleteFeature = "";
		#endregion
		//******************************************************************
		#region [FeatureSeparator Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the character (" ") that is used to separate names in
		/// a string that indicates a nested feature name (for example:
		/// "head case nominative" and "head case accusative").
		/// </summary>
		public const string FeatureSeparator = " ";
		#endregion
		//******************************************************************
		#region [LeftParenthesis and RightParenthesis Constants]
		//******************************************************************
		/// <summary>
		/// Specifies the left-parenthesis character that is used at the
		/// beginning of a SyntaxNode's label to indicate the node is
		/// optional in the find and replace patterns.
		/// </summary>
		public const string LeftParenthesis = "(";
		//******************************************************************
		/// <summary>
		/// Specifies the right-parenthesis character that is optionally
		/// used at the end of a SyntaxNode's label when the node label
		/// starts with a left-parenthesis character.
		/// </summary>
		public const string RightParenthesis = ")";
		#endregion
		//******************************************************************
		#region [NotCharacter Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the logical-not character ("!") that is used at the
		/// beginning of a pattern string to invert the match (to be true if
		/// a string does NOT match the following pattern, and false
		/// otherwise).
		/// </summary>
		public const string NotCharacter = "!";
		#endregion
		//******************************************************************
		#region [EscapeCharacter Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the escape character ("\") that is used at the
		/// beginning of a pattern string to escape any special meaning
		/// represented by the following character ("for example "\!"
		/// escapes the meaning of the logical-not character and "\\"
		/// escapes the meaning of the escape character).
		/// </summary>
		public const string EscapeCharacter = "\\";
		#endregion
		//******************************************************************
		#region [UnderscoreCharacter Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the underscore character ("_") that is used to replace
		/// any feature separators (" ") in a feature name.
		/// </summary>
		public const string UnderscoreCharacter = "_";
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
