//**************************************************************************
// File: "TreeTran\TransferRuleCollection.cs".
//
// This file defines the TransferRuleCollection class, which implements a
// collection of TransferRule items.
//
// History:
//     2006-Jul-4 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Collections;
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Implements a collection of TransferRule items.
	/// </summary>
	public class TransferRuleCollection: ReadOnlyCollectionBase
	{
		//******************************************************************
		#region [Insert() and Add() Methods]
		//******************************************************************
		/// <summary>
		/// Inserts the given rule into the collection at the specified
		/// zero-based index.
		/// </summary>
		public void Insert(int iIndex,TransferRule oRule)
		{
			//**************************************************************
			// Validate the parameters.

			Debug.Assert(iIndex >= 0);
			Debug.Assert(iIndex <= InnerList.Count);

			if (oRule == null)
			{
				string sMessage = "Invalid argument: "
					+ "TransferRuleCollection cannot insert a null item.";
				throw new Exception(sMessage);
			}
			if (InnerList.Contains(oRule))
			{
				string sMessage = "Invalid argument: "
					+ "TransferRuleCollection already contains this item.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Insert the rule into the list.

			InnerList.Insert(iIndex,oRule);
		}
		//******************************************************************
		/// <summary>
		/// Adds the given rule to the end of the collection. Returns the
		/// zero-based index of the added rule.
		/// </summary>
		public int Add(TransferRule oRule)
		{
			Debug.Assert(oRule != null);
			Debug.Assert(! InnerList.Contains(oRule));

			int iIndex = Count;
			Insert(iIndex,oRule);
			return iIndex;
		}
		#endregion
		//******************************************************************
		#region [Indexer, Contains() and IndexOf() Methods]
		//******************************************************************
		/// <summary>
		/// Gets the rule in the collection at the specified zero-based
		/// index.
		/// </summary>
		public TransferRule this[int iIndex]
		{
			get
			{
				Debug.Assert(iIndex >= 0);
				Debug.Assert(iIndex < InnerList.Count);

				return (TransferRule) InnerList[iIndex];
			}
		}
		//******************************************************************
		/// <summary>
		/// Returns true if the collection contains the given rule. Returns
		/// false otherwise.
		/// </summary>
		public bool Contains(TransferRule oRule)
		{
			Debug.Assert(oRule != null);

			return InnerList.Contains(oRule);
		}
		//******************************************************************
		/// <summary>
		/// Searches the collection for the given rule. Returns the rule's
		/// zero-based index if it was found. Returns -1 otherwise.
		/// </summary>
		public int IndexOf(TransferRule oRule)
		{
			Debug.Assert(oRule != null);

			return InnerList.IndexOf(oRule);
		}
		#endregion
		//******************************************************************
		#region [Remove(), RemoveAt() and Clear() Methods]
		//******************************************************************
		/// <summary>
		/// Removes the given rule from the collection.
		/// </summary>
		public void Remove(TransferRule oRule)
		{
			Debug.Assert(oRule != null);
			Debug.Assert(InnerList.Contains(oRule));

			InnerList.Remove(oRule);
		}
		//******************************************************************
		/// <summary>
		/// Removes the rule at the specified zero-based index in the
		/// collection.
		/// </summary>
		public void RemoveAt(int iIndex)
		{
			Debug.Assert(iIndex >= 0);
			Debug.Assert(iIndex < InnerList.Count);

			Remove(this[iIndex]);
		}
		//******************************************************************
		/// <summary>
		/// Removes all rules from the collection.
		/// </summary>
		public void Clear()
		{
			while (Count > 0)
			{
				RemoveAt(0);
			}
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
