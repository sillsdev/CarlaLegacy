using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows.Forms;
using Saxon.Api;

namespace SIL.Cabhab
{
	internal class SaxonDotNetTransform : Transform
	{
		Processor m_processor;
		XsltCompiler m_compiler;
		XsltTransformer m_transformer;
		public SaxonDotNetTransform(string sTransformName)
		{
			// Create a Processor instance.
			m_processor = new Processor();
			m_compiler = m_processor.NewXsltCompiler();

			// Load transform from file
			var uri = new Uri(sTransformName);
			var errorList = new List<StaticError>();
			m_compiler.ErrorList = errorList;
			var t = m_compiler.Compile(uri);
			m_transformer = t.Load();

		}

		public override void TransformFileToFile(string sInputPath, string sOutputName)
		{
			TransformFileToFile(null, sInputPath, sOutputName);
		}

		public override void TransformFileToFile(XMLUtilities.XSLParameter[] parameterList, string sInputPath, string sOutputName)
		{

			try
			{

				// Add any parameters
				AddParameters(parameterList, m_transformer);

				// apply transform
				var inputUri = new Uri(sInputPath);
				var sr = new StreamReader(sInputPath, Encoding.UTF8);
				XdmNode inputNode = m_processor.NewDocumentBuilder().Build(inputUri);
				sr.Close();
				m_transformer.InitialContextNode = inputNode;

				var ser = new Serializer();
				ser.SetOutputFile(sOutputName);

				m_transformer.Run(ser);
				ser.Close();
			}
			catch (Exception e)
			{
				MessageBox.Show(e.InnerException.ToString());
			}

		}
		/// <summary>
		/// Add parameters to a transform
		/// </summary>
		/// <param name="parameterList"></param>
		/// <param name="xslProc"></param>
		private static void AddParameters(XMLUtilities.XSLParameter[] parameterList, XsltTransformer transformer)
		{
			if (parameterList != null)
			{
				foreach (XMLUtilities.XSLParameter rParam in parameterList)
				{
					var parameterName = new QName(rParam.Name);

					// Following is a specially recognized parameter name
					if (rParam.Name == "prmSDateTime")
					{
						var parameterValue = new XdmAtomicValue((new QName(XMLUtilities.GetCurrentDateTime())));
						transformer.SetParameter(parameterName, parameterValue);
					}
					else
					{
						var parameterValue = new XdmAtomicValue((new QName(rParam.Value)));
						transformer.SetParameter(parameterName, parameterValue);
					}
				}
			}
		}

	}
}
