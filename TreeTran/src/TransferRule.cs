//**************************************************************************
// File: "TreeTran\TransferRule.cs".
//
// This file defines the TransferRule class, which represents a transfer
// rule: the rule name, the root node of the find-pattern tree and the root
// node of the replace-pattern tree.
//
// History:
//     2006-Jul-4 David Bullock: Code complete.
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Represents a transfer rule: the rule name, the root node of the
	/// find-pattern tree and the root node of the replace-pattern tree.
	/// </summary>
	public class TransferRule
	{
		//******************************************************************
		#region [RuleName Property]
		//******************************************************************
		/// <summary>
		/// The RuleName property value.
		/// </summary>
		private string msRuleName = "";
		//******************************************************************
		/// <summary>
		/// Gets or sets the name of this rule.
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
		/// Gets or sets the root node of the find-pattern tree for this
		/// rule.
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
		/// Gets or sets the root node of the replace-pattern tree for this
		/// rule.
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
	}
}
//**************************************************************************
