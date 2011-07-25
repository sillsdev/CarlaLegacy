using System;
using System.Collections.Generic;
using System.Text;

namespace SIL.Cabhab
{
	internal abstract class Transform
	{
		protected string m_sCultureToUse;

		public string CultureToUse
		{
			get { return m_sCultureToUse; }
			set
			{
				string sCultureToUse;
				switch (value)
				{
					case "es":
						sCultureToUse = "es-MX";
						break;
					case "fr":
						sCultureToUse = "fr-FR";
						break;
					default:
						sCultureToUse = "en-US";
						break;
				}
				m_sCultureToUse = sCultureToUse;
			}
		}

		protected Transform(string sTargetLanguageCode)
		{
			CultureToUse = sTargetLanguageCode;
		}

		public abstract void TransformFileToFile(string sInputPath, string sOutputName);
		public abstract void TransformFileToFile(XMLUtilities.XSLParameter[] parameterList, string sInputPath, string sOutputName);


	}
}
