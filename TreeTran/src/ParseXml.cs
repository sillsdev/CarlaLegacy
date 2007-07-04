//**************************************************************************
// File: "TreeTran\ParseXml.cs".
//
// This file defines the ParseXml class, which defines XML string constants
// that are used by the ParseReader and ParseWriter classes.
//
// History:
//     2005-Jul-20 David Bullock: Code complete.
//**************************************************************************
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Defines XML string constants that are used by the ParseReader and
	/// ParseWriter classes.
	/// </summary>
	internal class ParseXml
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// The constructor is private because this class only defines
		/// string constants.
		/// </summary>
		private ParseXml()
		{
			Debug.Fail("This class only defines string constants.");
		}
		#endregion
		//******************************************************************
		#region [DtdFile Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the SYSTEM DTD file used in the DOCTYPE declaration.
		/// </summary>
		public const string DtdFile = "xample.dtd";
		#endregion
		//******************************************************************
		#region [XAmpleAnaElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the top-level XML element for XAMPLE parse-tree data.
		/// </summary>
		public const string XAmpleAnaElement = "XAmpleANA";
		#endregion
		//******************************************************************
		#region [AnaRecElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a word and
		/// its morphology parses. (Child of XAmpleAnaElement.)
		/// </summary>
		public const string AnaRecElement = "anaRec";
		#endregion
		//******************************************************************
		#region [IDAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute for the unique identifier used by
		/// several kinds of records. (Attribute of AnaRecElement, WElement,
		/// MparseElement, AElement, PfxElement, RootElement, SfxElement,
		/// MElement, UElement, DElement, McatElement, PElement, FdElement,
		/// CatElement, WpElement, FmtElement, NElement, AnalysisElement,
		/// NodeElement, LeafElement and SharedElement.)
		/// </summary>
		public const string IDAttribute = "id";
		#endregion
		//******************************************************************
		#region [WElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text of a
		/// word. (Child of AnaRecElement.)
		/// </summary>
		public const string WElement = "w";
		#endregion
		//******************************************************************
		#region [CapAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute for the capitalization information
		/// about a word. (Attribute of WElement, PfxElement, RootElement
		/// and SfxElement.)
		/// </summary>
		public const string CapAttribute = "cap";
		#endregion
		//******************************************************************
		#region [MparseElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a
		/// morphology parse for a word. (Child of AnaRecElement.)
		/// </summary>
		public const string MparseElement = "mparse";
		#endregion
		//******************************************************************
		#region [AElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for an analysis record consisting of
		/// the morphemes of a word. (Child of MparseElement.)
		/// </summary>
		public const string AElement = "a";
		#endregion
		//******************************************************************
		#region [PfxElement, RootElement and SfxElement Constants]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of information
		/// about a prefix morpheme. (Child of AElement.)
		/// </summary>
		public const string PfxElement = "pfx";
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of information
		/// about a root morpheme. (Child of AElement.)
		/// </summary>
		public const string RootElement = "root";
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of information
		/// about a suffix morpheme. (Child of AElement.)
		/// </summary>
		public const string SfxElement = "sfx";
		#endregion
		//******************************************************************
		#region [MElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text of
		/// the name used to identify a morpheme. (Child of PfxElement,
		/// RootElement and SfxElement.)
		/// </summary>
		public const string MElement = "m";
		#endregion
		//******************************************************************
		#region [UElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text of an
		/// underlying form. (Child of PfxElement, RootElement and
		/// SfxElement.)
		/// </summary>
		public const string UElement = "u";
		#endregion
		//******************************************************************
		#region [DElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text of a
		/// morpheme decomposition for the surface form allomorph. (Child of
		/// PfxElement, RootElement and SfxElement.)
		/// </summary>
		public const string DElement = "d";
		#endregion
		//******************************************************************
		#region [McatElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text of a
		/// morpheme category. (Child of PfxElement, RootElement and
		/// SfxElement.)
		/// </summary>
		public const string McatElement = "mcat";
		#endregion
		//******************************************************************
		#region [PElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text
		/// representing a set of properties. (Child of PfxElement,
		/// RootElement and SfxElement.)
		/// </summary>
		public const string PElement = "p";
		#endregion
		//******************************************************************
		#region [FdElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text
		/// representing a set of feature descriptors. (Child of PfxElement,
		/// RootElement and SfxElement.)
		/// </summary>
		public const string FdElement = "fd";
		#endregion
		//******************************************************************
		#region [CatElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text
		/// description of a morphology-parse category. (Child of
		/// MparseElement.)
		/// </summary>
		public const string CatElement = "cat";
		#endregion
		//******************************************************************
		#region [WpElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of
		/// word-constituency structure information. (Child of
		/// MparseElement.)
		/// </summary>
		public const string WpElement = "wp";
		#endregion
		//******************************************************************
		#region [FmtElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text of
		/// formatting information that precedes a word. (Child of
		/// AnaRecElement.)
		/// </summary>
		public const string FmtElement = "fmt";
		#endregion
		//******************************************************************
		#region [NElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text of
		/// character information that follows a word. (Child of
		/// AnaRecElement.)
		/// </summary>
		public const string NElement = "n";
		#endregion
		//******************************************************************
		#region [AnalysisElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of all the
		/// syntactic parse trees for a sentence. (Child of the
		/// AnaRecElement for the last word of a sentence.)
		/// </summary>
		public const string AnalysisElement = "Analysis";
		#endregion
		//******************************************************************
		#region [CountAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the number of syntactic
		/// parse trees associated with a sentence. (Attribute of
		/// AnalysisElement.)
		/// </summary>
		public const string CountAttribute = "count";
		#endregion
		//******************************************************************
		#region [ParseElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a syntactic
		/// parse tree for a sentence. (Child of AnalysisElement.)
		/// </summary>
		public const string ParseElement = "Parse";
		#endregion
		//******************************************************************
		#region [NodeElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a node
		/// (with its features and children) in a syntactic parse tree.
		/// (Child of ParseElement and NodeElement.)
		/// </summary>
		public const string NodeElement = "Node";
		#endregion
		//******************************************************************
		#region [LeafElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a leaf node
		/// (with its features) in a syntactic parse tree. (Child of
		/// NodeElement.)
		/// </summary>
		public const string LeafElement = "Leaf";
		#endregion
		//******************************************************************
		#region [CatAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the syntactic category of
		/// a node in a syntactic parse tree. (Attribute of NodeElement and
		/// LeafElement.)
		/// </summary>
		public const string CatAttribute = "cat";
		#endregion
		//******************************************************************
		#region [RuleAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the rule name associated
		/// with a node in a syntactic parse tree. (Attribute of
		/// NodeElement.)
		/// </summary>
		public const string RuleAttribute = "rule";
		#endregion
		//******************************************************************
		#region [GlossAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the gloss for a leaf node
		/// in a syntactic parse tree. (Attribute of LeafElement.)
		/// </summary>
		public const string GlossAttribute = "gloss";
		#endregion
		//******************************************************************
		#region [FsElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a set of
		/// syntactic features. (Child of NodeElement, LeafElement and
		/// FElement.)
		/// </summary>
		public const string FsElement = "Fs";
		#endregion
		//******************************************************************
		#region [LexfsElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a set of
		/// lexical features. (Child of LeafElement.)
		/// </summary>
		public const string LexfsElement = "Lexfs";
		#endregion
		//******************************************************************
		#region [FElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a feature
		/// name and value. (Child of FsElement and LexfsElement.)
		/// </summary>
		public const string FElement = "F";
		#endregion
		//******************************************************************
		#region [NameAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the name of a feature.
		/// (Attribute of FElement.)
		/// </summary>
		public const string NameAttribute = "name";
		#endregion
		//******************************************************************
		#region [RelAttribute and EqValue Constants]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the relation (equal,
		/// not equal, subsumes, does not subsume, greater than, less than,
		/// greater than or equal, less than or equal) that exists between
		/// a feature and the given value. (Attribute of FsElement,
		/// LexfsElement, FElement, StrElement, SymElement and NbrElement.)
		/// </summary>
		public const string RelAttribute = "rel";
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute value indicating an "equal" relation
		/// between a feature and the given value. (Value of RelAttribute.)
		/// </summary>
		public const string EqValue = "eq";
		#endregion
		//******************************************************************
		#region [PlusElement and MinusElement Constants]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record indicating a value of
		/// "plus" (true) for a feature. (Child of FElement.)
		/// </summary>
		public const string PlusElement = "Plus";
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record indicating a value of
		/// "minus" (false) for a feature. (Child of FElement.)
		/// </summary>
		public const string MinusElement = "Minus";
		#endregion
		//******************************************************************
		#region [AnyElement and NoneElement Constants]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record indicating a value of
		/// "any" for a feature. (Child of FElement.)
		/// </summary>
		public const string AnyElement = "Any";
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record indicating a value of
		/// "none" for a feature. (Child of FElement.)
		/// </summary>
		public const string NoneElement = "None";
		#endregion
		//******************************************************************
		#region [StrElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record containing the text of a
		/// string value. (Child of LeafElement and FElement.)
		/// </summary>
		public const string StrElement = "Str";
		#endregion
		//******************************************************************
		#region [SymElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record indicating a symbolic
		/// value for a feature. (Child of FElement.)
		/// </summary>
		public const string SymElement = "Sym";
		#endregion
		//******************************************************************
		#region [NbrElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record indicating a numeric
		/// value for a feature. (Child of FElement.)
		/// </summary>
		public const string NbrElement = "Nbr";
		#endregion
		//******************************************************************
		#region [ValueAttribute Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML attribute indicating the value of a feature.
		/// (Attribute of SymElement and NbrElement.)
		/// </summary>
		public const string ValueAttribute = "value";
		#endregion
		//******************************************************************
		#region [SharedElement Constant]
		//******************************************************************
		/// <summary>
		/// Specifies the XML element for a record consisting of a
		/// shared-branch reference in a syntactic parse tree. (Child of
		/// NodeElement.)
		/// </summary>
		public const string SharedElement = "Shared";
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
