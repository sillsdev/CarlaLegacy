// --------------------------------------------------------------------------------------------
#region // Copyright (c) 2007, SIL International. All Rights Reserved.
// <copyright from='2003' to='2007' company='SIL International'>
//		Copyright (c) 2007, SIL International. All Rights Reserved.
//
//		Distributable under the terms of either the Common Public License or the
//		GNU Lesser General Public License, as specified in the LICENSING.txt file.
// </copyright>
#endregion
//
// File: DataMigrationTransform.cs
// Responsibility:
// Last reviewed:
//
// <remarks>
// This class is for a transform that can be applied to an answer file.
// </remarks>
// --------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using SIL.Utils;


namespace SIL.Cabhab
{
	public class DataMigrationTransform
	{
		string m_sTransformFile;
		private Transform m_transform;
		string m_sDBVersionXPath;
		#region Construction and initialization
		public DataMigrationTransform()
		{
		}
		public DataMigrationTransform(XmlNode transformConfigurationNode, string sConfigurationPath)
		{
			m_sDBVersionXPath = XmlUtils.GetManditoryAttributeValue(transformConfigurationNode, "dbVersionXPath");
			m_sTransformFile = XmlUtils.GetManditoryAttributeValue(transformConfigurationNode, "transform");
			m_sTransformFile = sConfigurationPath + "/" + m_sTransformFile;
		}

		#endregion
		public void ApplyTransform(string sSourceFile)
		{
			string sTransformFile = TransformFile;
#if UsingDotNetTransforms
			m_transform = new DotNetCompiledTransform(m_sTransformFile, "en");
#endif
#if UsingSaxonDotNetTransforms
			m_transform = new SaxonDotNetTransform(m_sTransformFile, "en");
#endif
#if UsingMSXML2Transforms
			m_transform = new MSXML2Transform(m_sTransformFile, "en");
#endif

			string sResultFile = Path.GetTempFileName();
			m_transform.TransformFileToFile(sSourceFile, sResultFile);
			File.Copy(sResultFile, sSourceFile, true);
			File.Delete(sResultFile);
		}


		#region Properties
		public string DBVersionXPath
		{
			get { return m_sDBVersionXPath; }
		}
		public string TransformFile
		{
			get	{return m_sTransformFile;}
		}
		#endregion

	}
}
