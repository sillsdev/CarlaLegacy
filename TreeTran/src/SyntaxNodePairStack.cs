//**************************************************************************
// File: "TreeTran\SyntaxNodePairStack.cs".
//
// This file defines the SyntaxNodePairStack class, which implements a stack
// of SyntaxNodePair items.
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
	/// Implements a stack of SyntaxNodePair items.
	/// </summary>
	public class SyntaxNodePairStack: ReadOnlyCollectionBase
	{
		//******************************************************************
		#region [Indexer Property]
		//******************************************************************
		/// <summary>
		/// Gets the stack item at the specified index.
		/// </summary>
		public SyntaxNodePair this[int iIndex]
		{
			get
			{
				Debug.Assert(iIndex >= 0);
				Debug.Assert(iIndex < InnerList.Count);

				return (SyntaxNodePair) InnerList[iIndex];
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
		public SyntaxNodePair Peek()
		{
			Debug.Assert(InnerList.Count > 0);

			return (SyntaxNodePair) InnerList[InnerList.Count - 1];
		}
		#endregion
		//******************************************************************
		#region [Pop() Method]
		//******************************************************************
		/// <summary>
		/// Removes and returns the item at the top of the stack.
		/// </summary>
		public SyntaxNodePair Pop()
		{
			Debug.Assert(InnerList.Count > 0);

			SyntaxNodePair oNodePair
				= (SyntaxNodePair) InnerList[InnerList.Count - 1];
			InnerList.RemoveAt(InnerList.Count - 1);
			return oNodePair;
		}
		#endregion
		//******************************************************************
		#region [Push() Method]
		//******************************************************************
		/// <summary>
		/// Inserts an item at the top of the stack.
		/// </summary>
		public void Push(SyntaxNodePair oNodePair)
		{
			Debug.Assert(oNodePair != null);

			if (oNodePair == null)
			{
				string sMessage = "Invalid argument: "
					+ "SyntaxNodePairStack cannot push a null item.";
				throw new Exception(sMessage);
			}

			InnerList.Add(oNodePair);
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
			foreach (SyntaxNodePair oNodePair in this)
			{
				if (oNodePair == null)
				{
					sString = "()" + sString;
				}
				else
				{
					sString = oNodePair.ToString() + sString;
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
