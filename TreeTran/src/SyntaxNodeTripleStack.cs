//**************************************************************************
// File: "TreeTran\SyntaxNodeTripleStack.cs".
//
// This file defines the SyntaxNodeTripleStack class, which implements a
// stack of SyntaxNodeTriple items.
//
// History:
//     2005-Aug-17 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Collections;
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Implements a stack of SyntaxNodeTriple items.
	/// </summary>
	public class SyntaxNodeTripleStack: ReadOnlyCollectionBase
	{
		//******************************************************************
		#region [Indexer Property]
		//******************************************************************
		/// <summary>
		/// Gets the stack item at the specified index.
		/// </summary>
		public SyntaxNodeTriple this[int iIndex]
		{
			get
			{
				Debug.Assert(iIndex >= 0);
				Debug.Assert(iIndex < InnerList.Count);

				return (SyntaxNodeTriple) InnerList[iIndex];
			}
		}
		#endregion
		//******************************************************************
		#region [Clear() Method]
		//******************************************************************
		/// <summary>
		/// Removes all items from the stack.
		/// </summary>
		public void Clear()
		{
			InnerList.Clear();
		}
		#endregion
		//******************************************************************
		#region [Peek() Method]
		//******************************************************************
		/// <summary>
		/// Returns the item at the top of the stack without removing it.
		/// </summary>
		public SyntaxNodeTriple Peek()
		{
			Debug.Assert(InnerList.Count > 0);

			return (SyntaxNodeTriple) InnerList[InnerList.Count - 1];
		}
		#endregion
		//******************************************************************
		#region [Pop() Method]
		//******************************************************************
		/// <summary>
		/// Removes and returns the item at the top of the stack.
		/// </summary>
		public SyntaxNodeTriple Pop()
		{
			Debug.Assert(InnerList.Count > 0);

			SyntaxNodeTriple oNodeTriple
				= (SyntaxNodeTriple) InnerList[InnerList.Count - 1];
			InnerList.RemoveAt(InnerList.Count - 1);
			return oNodeTriple;
		}
		#endregion
		//******************************************************************
		#region [Push() Method]
		//******************************************************************
		/// <summary>
		/// Inserts an item at the top of the stack.
		/// </summary>
		public void Push(SyntaxNodeTriple oNodeTriple)
		{
			Debug.Assert(oNodeTriple != null);

			if (oNodeTriple == null)
			{
				string sMessage = "Invalid argument: "
					+ "SyntaxNodeTripleStack cannot push a null item.";
				throw new Exception(sMessage);
			}

			InnerList.Add(oNodeTriple);
		}
		#endregion
		//******************************************************************
		#region [ToString() Method]
		//******************************************************************
		/// <summary>
		/// Returns a string representing the contents of the stack.
		/// </summary>
		public override string ToString()
		{
			string sString = "}";
			foreach (SyntaxNodeTriple oNodeTriple in this)
			{
				if (oNodeTriple == null)
				{
					sString = "()" + sString;
				}
				else
				{
					sString = oNodeTriple.ToString() + sString;
				}
			}
			sString = "{" + sString;
			return sString;
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
