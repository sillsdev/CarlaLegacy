//**************************************************************************
// File: "TreeTran\SyntaxFeature.cs".
//
// This file defines the SyntaxFeature class, which represents a SyntaxNode
// feature as a name-value pair.
//
// History:
//     2005-Jun-1 David Bullock: Code complete.
//**************************************************************************
using System.Diagnostics;
//**************************************************************************
namespace TreeTranEngine
{
	//**********************************************************************
	/// <summary>
	/// Represents a SyntaxNode feature as a name-value pair.
	/// </summary>
	public class SyntaxFeature
	{
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// Initializes a new instance of the SyntaxFeature class, setting
		/// the feature name to the given sName string and the feature value
		/// to the given sValue string.
		/// </summary>
		public SyntaxFeature(string sName,string sValue)
		{
			Debug.Assert(sName != null);
			Debug.Assert(sValue != null);

			msName = sName;
			msValue = sValue;
		}
		#endregion
		//******************************************************************
		#region [Name Property]
		//******************************************************************
		/// <summary>
		/// The Name property value.
		/// </summary>
		private string msName = "";
		//******************************************************************
		/// <summary>
		/// Gets the feature name.
		/// </summary>
		public string Name
		{
			get
			{
				return msName;
			}
		}
		#endregion
		//******************************************************************
		#region [Value Property]
		//******************************************************************
		/// <summary>
		/// The Value property value.
		/// </summary>
		private string msValue = "";
		//******************************************************************
		/// <summary>
		/// Gets the feature value.
		/// </summary>
		public string Value
		{
			get
			{
				return msValue;
			}
		}
		#endregion
		//******************************************************************
		#region [ToString() Method]
		//******************************************************************
		/// <summary>
		/// Returns a string representing the feature name and value.
		/// </summary>
		public override string ToString()
		{
			string sNameString = "null";
			if (Name != null)
			{
				sNameString = Name;
			}
			string sValueString = "null";
			if (Value != null)
			{
				sValueString = "\"" + Value + "\"";
			}
			return sNameString + "=" + sValueString;
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
