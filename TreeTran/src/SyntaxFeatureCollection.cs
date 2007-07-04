//**************************************************************************
// File: "TreeTran\SyntaxFeatureCollection.cs".
//
// This file defines the SyntaxFeatureCollection class, which implements a
// collection of SyntaxFeature items.
//
// History:
//     2007-Feb-15 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Collections;
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Implements a collection of SyntaxFeature items.
	/// </summary>
	public class SyntaxFeatureCollection: ReadOnlyCollectionBase
	{
		//******************************************************************
		#region [Indexer Method]
		//******************************************************************
		/// <summary>
		/// Gets or sets the value for the feature with the specified name.
		/// Setting a feature adds or replaces a SyntaxFeature in the
		/// collection, using the specified name and value. Getting a
		/// feature searches the collection and returns either the value
		/// of the SyntaxFeature with the specified name or an empty string
		/// ("") if the name was not found.
		/// </summary>
		public string this[string sName]
		{
			set
			{
				string sValue = value;

				//**********************************************************
				// Validate the feature name and value.

				if (sName == null)
				{
					string sMessage = "Invalid argument: "
						+ "SyntaxFeature.Name cannot be null.";
					throw new Exception(sMessage);
				}

				if (sValue == null)
				{
					string sMessage = "Invalid argument: "
						+ "SyntaxFeature.Value cannot be null.";
					throw new Exception(sMessage);
				}

				//**********************************************************
				// Check if a SyntaxFeature with the specified name already
				// exists in the collection.
				//
				// If so, remove it from the collection. Then create a new
				// SyntaxFeature and insert it into the collection at the
				// same index where the existing SyntaxFeature was found.
				//
				// Otherwise, create a new SyntaxFeature and add it to the
				// end of the collection.

				SyntaxFeature oExistingFeature = Find(sName);
				if (oExistingFeature != null)
				{
					//******************************************************
					// Remove the existing SyntaxFeature and replace it with
					// a new SyntaxFeature at the same index.

					int iIndex = InnerList.IndexOf(oExistingFeature);
					InnerList.Remove(oExistingFeature);

					Debug.Assert(! Contains(sName));

					SyntaxFeature oNewFeature
						= new SyntaxFeature(sName,sValue);
					InnerList.Insert(iIndex,oNewFeature);
				}
				else
				{
					//******************************************************
					// Add a new SyntaxFeature to the end of the collection.

					SyntaxFeature oNewFeature
						= new SyntaxFeature(sName,sValue);
					InnerList.Add(oNewFeature);
				}
			}
			get
			{
				Debug.Assert(sName != null);

				SyntaxFeature oFeature = Find(sName);
				if (oFeature != null)
				{
					return oFeature.Value;
				}
				return "";
			}
		}
		#endregion
		//******************************************************************
		#region [Contains() Method]
		//******************************************************************
		/// <summary>
		/// Searches the collection for a feature with the given name.
		/// Returns true if found. Returns false otherwise.
		/// </summary>
		public bool Contains(string sName)
		{
			Debug.Assert(sName != null);

			if (Find(sName) != null)
			{
				return true;
			}
			return false;
		}
		#endregion
		//******************************************************************
		#region [Remove() Method]
		//******************************************************************
		/// <summary>
		/// Searches the collection for a feature with the given name and
		/// removes the matching SyntaxFeature if found.
		/// </summary>
		public void Remove(string sName)
		{
			Debug.Assert(sName != null);

			SyntaxFeature oFeature = Find(sName);
			if (oFeature != null)
			{
				InnerList.Remove(oFeature);
			}

			Debug.Assert(! Contains(sName));
		}
		#endregion
		//******************************************************************
		#region [Clear() Method]
		//******************************************************************
		/// <summary>
		/// Removes all SyntaxFeature items from the collection.
		/// </summary>
		public void Clear()
		{
			InnerList.Clear();
		}
		#endregion
		//******************************************************************
		#region [Find() Method]
		//******************************************************************
		/// <summary>
		/// Searches the collection for a feature with the given name.
		/// Returns the matching SyntaxFeature if found. Returns null
		/// otherwise.
		/// </summary>
		private SyntaxFeature Find(string sName)
		{
			Debug.Assert(sName != null);

			foreach (SyntaxFeature oFeature in InnerList)
			{
				if (oFeature.Name == sName)
				{
					return oFeature;
				}
			}
			return null;
		}
		#endregion
		//******************************************************************
		#region [ToString() Method]
		//******************************************************************
		/// <summary>
		/// Returns a string representing the contents of the collection.
		/// </summary>
		public override string ToString()
		{
			string sString = "{";
			int iCount = 0;
			foreach (SyntaxFeature oFeature in this)
			{
				++iCount;
				if (iCount > 1)
				{
					sString = sString + ",";
				}
				if (oFeature == null)
				{
					sString = sString + "null";
				}
				else
				{
					sString = sString + oFeature.ToString();
				}
			}
			sString = sString + "}";
			return sString;
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
