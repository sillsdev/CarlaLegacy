using System;
using System.Collections.Generic;
using System.Text;

namespace SIL.Cabhab
{
	internal abstract class Transform
	{
		protected Transform()
		{
		}

		public abstract void TransformFileToFile(string sInputPath, string sOutputName);
		public abstract void TransformFileToFile(XMLUtilities.XSLParameter[] parameterList, string sInputPath, string sOutputName);
	}
}
