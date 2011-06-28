using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;
using MSXML2;

namespace SIL.Cabhab
{
	public class XMLUtilities
	{

		/// <summary>
		/// Apply an XSLT transform on a file to produce a resulting file
		/// </summary>
		/// <param name="sTransformName">full path name of the XSLT transform</param>
		/// <param name="sInputPath">full path of the input file</param>
		/// <param name="sOutputName">full path of the resulting output file</param>
		public static void TransformFileToFile(string sTransformName, string sInputPath, string sOutputName)
		{
			TransformFileToFile(sTransformName, null, sInputPath, sOutputName);
		}

		/// <summary>
		/// Apply an XSLT transform on a file to produce a resulting file
		/// </summary>
		/// <param name="sTransformName">full path name of the XSLT transform</param>
		/// <param name="parameterList">list of parameters to pass to the transform</param>
		/// <param name="sInputPath">full path of the input file</param>
		/// <param name="sOutputName">full path of the resulting output file</param>
		public static void TransformFileToFile(string sTransformName, XSLParameter[] parameterList, string sInputPath, string sOutputName)
		{
#if UsingDotNetTransforms
#if DEBUG
			DateTime start = DateTime.Now;
			Debug.WriteLine("\tStarting at: " + start.TimeOfDay.ToString());
#endif
			TextWriter writer = null;
			try
			{
				// set up transform
				XslTransform transformer = new XslTransform();
				transformer.Load(sTransformName);

				// add any parameters
				XsltArgumentList args;
				AddParameters(out args, parameterList);

				// setup output file
				writer = File.CreateText(sOutputName);

				// load input file
#if DEBUG
				DateTime beforeDom = DateTime.Now;
				Debug.WriteLine("\t\tBefore loading DOM, time is: " + beforeDom.TimeOfDay.ToString());
#endif
				XPathDocument inputDOM = new XPathDocument(sInputPath);
#if DEBUG
				DateTime afterDom = DateTime.Now;
				Debug.WriteLine("\t\tAfter  loading DOM, time is: " + afterDom.TimeOfDay.ToString());
				System.TimeSpan diffDom = afterDom.Subtract(beforeDom);
				Debug.WriteLine("\t\tDom load took " + diffDom.ToString());
#endif
				// Apply transform
				transformer.Transform(inputDOM, args, writer, null);
#if DEBUG
				DateTime afterXSLT = DateTime.Now;
				Debug.WriteLine("\t\tAfter    transform, time is: " + afterXSLT.TimeOfDay.ToString());
				System.TimeSpan diffXSLT = afterXSLT.Subtract(afterDom);
				Debug.WriteLine("\t\tTransform took " + diffXSLT.ToString());
#endif
			}
			finally
			{
				if (writer != null)
					writer.Close();
			}
#if DEBUG
			DateTime end = DateTime.Now;
			Debug.WriteLine("\tEnding at: " + end.TimeOfDay.ToString());
			System.TimeSpan diff = end.Subtract(start);
			Debug.WriteLine("\tProcess took: " + diff.ToString() + " " + sOutputName);
#endif
#else // not UsingDotNetTransforms
			//.Net framework XML transform is still slower than something like MSXML2
			// (this is so especially for transforms using xsl:key).
			try
			{
				//bool fShowOutput = false;
				//if (sTransformName.Contains("PAWSSKHtmlMapper.xsl"))
				//    fShowOutput = true;
				//MessageBox.Show("in transform file");
				MSXML2.XSLTemplate40Class xslt = new MSXML2.XSLTemplate40Class();
				MSXML2.FreeThreadedDOMDocument40Class xslDoc = new
					MSXML2.FreeThreadedDOMDocument40Class();
				MSXML2.DOMDocument40Class xmlDoc = new MSXML2.DOMDocument40Class();
				MSXML2.IXSLProcessor xslProc;

				xslDoc.async = false;
				//if (fShowOutput)
				//MessageBox.Show("before load transform: " + sTransformName);
				xslDoc.load(sTransformName);
				xslt.stylesheet = xslDoc;
				xmlDoc.async = false;
				//if (fShowOutput)
				  //  MessageBox.Show("before load input path: " + sInputPath);
				xmlDoc.load(sInputPath);
				xslProc = xslt.createProcessor();
				xslProc.input = xmlDoc;
				//MessageBox.Show("before add parameters");
				AddParameters(parameterList, xslProc);
				//if (fShowOutput)
					//MessageBox.Show("before transform file");
				xslProc.transform();
				//if (fShowOutput)
				   // MessageBox.Show("before write output to |" + sOutputName + "|");
				StreamWriter sr = File.CreateText(sOutputName);
				sr.Write(xslProc.output);
				sr.Close();
				//if (fShowOutput)
					//MessageBox.Show("after write output to |" + sOutputName + "|");
			}
			catch (Exception exc)
			{
				MessageBox.Show("Exception caught in transform files: " + exc.Message + "inner: " + exc.InnerException.Message);
			}
#endif // UsingDotNetTransforms
		}
#if UsingDotNetTransforms
		static private void AddParameters(out XsltArgumentList args, XSLParameter[] parameterList)
		{
			args = new XsltArgumentList();
			if (parameterList != null)
			{
				foreach(XSLParameter rParam in parameterList)
				{
					// Following is a specially recognized parameter name
					if (rParam.Name == "prmSDateTime")
					{
						args.AddParam(rParam.Name, "", GetCurrentDateTime());
					}
					else
						args.AddParam(rParam.Name, "", rParam.Value);
				}
			}
		}
#else
		/// <summary>
		/// Add parameters to a transform
		/// </summary>
		/// <param name="parameterList"></param>
		/// <param name="xslProc"></param>
		private static void AddParameters(XSLParameter[] parameterList, MSXML2.IXSLProcessor xslProc)
		{
			if (parameterList != null)
			{
				foreach (XSLParameter rParam in parameterList)
				{
					// Following is a specially recognized parameter name
					if (rParam.Name == "prmSDateTime")
					{
						xslProc.addParameter(rParam.Name, GetCurrentDateTime(), "");
					}
					else
						xslProc.addParameter(rParam.Name, rParam.Value, "");
				}
			}
		}
#endif
		private static string GetCurrentDateTime()
		{
			DateTime now;
			now = DateTime.Now;
			//CultureInfo ci = Thread.CurrentThread.CurrentCulture;
			//Thread.CurrentThread.CurrentCulture = new CultureInfo("es", false);

			string sResult = (now.ToLongDateString() + " " + now.ToLongTimeString());

			//Thread.CurrentThread.CurrentCulture = ci;
			return sResult;
		}
		public static string getXmlElementAttribute(XmlDocument doc, string strXPath)
		{
			XmlNode xmlNode;
			try
			{
				xmlNode = doc.SelectSingleNode(strXPath);
				if (xmlNode != null)
					return xmlNode.Value;
				else
					return "";
			}
			catch (Exception exc)
			{
				string s = exc.Source; // Make compiler happy
				return "";
			}
		}
		public static string getXmlElementContent(XmlDocument doc, string strXPath)
		{
			XmlNode xmlNode;
			try
			{
				xmlNode = doc.SelectSingleNode(strXPath).FirstChild;
				if (xmlNode != null)
					return xmlNode.Value;
				else
					return "";
			}
			catch (Exception exc)
			{
				string s = exc.Source; // Make compiler happy
				return "";
			}
		}
		public static void setXmlElementAttribute(XmlDocument doc, string strXPathElement, string strAttribute, string strValue)
		{
			XmlNode xmlNode;
#if !UseString
			StringBuilder sb = new StringBuilder(strXPathElement);
			sb.Append("/@");
			sb.Append(strAttribute);
			string strXPath = sb.ToString();
#else
			string strXPath = strXPathElement + "/@" + strAttribute;
#endif
			try
			{
				xmlNode = doc.SelectSingleNode(strXPath);
				if (xmlNode == null)
				{
					XmlAttribute xmlAttr = doc.CreateAttribute(strAttribute);
					xmlAttr.Value = strValue;
					xmlNode = doc.SelectSingleNode(strXPathElement);
					xmlNode.Attributes.Append(xmlAttr);
				}
				else
					xmlNode.Value = strValue;
			}
			catch (Exception exc)
			{
				MessageBox.Show("setXmlElementAttribute: " + exc);
			}
		}
		public static void setXmlElementContent(XmlDocument doc, string strXPath, string strContent)
		{
			XmlNode xmlNode;
			try
			{
				xmlNode = doc.SelectSingleNode(strXPath).FirstChild;
				if (xmlNode == null)
				{
					XmlText xmlText = doc.CreateTextNode(strContent);
					xmlNode = doc.SelectSingleNode(strXPath);
					xmlNode.AppendChild(xmlText);
				}
				else
					xmlNode.Value = strContent;
			}
			catch (Exception exc)
			{
				MessageBox.Show("setXmlElementContent: " + exc);
			}
			}

		/// <summary>
		/// A class that represents a parameter of an XSL stylesheet.
		/// </summary>
		public class XSLParameter
		{
			/// <summary>
			/// Parameter name.
			/// </summary>
			private string m_name;

			/// <summary>
			/// Parameter value.
			/// </summary>
			private string m_value;

			public XSLParameter(string sName, string sValue)
			{
				m_name = sName;
				m_value = sValue;
			}

			public string Name
			{
				get { return m_name; }
				set { m_name = value; }
			}

			public string Value
			{
				get { return m_value; }
				set { m_value = value; }
			}
		}
	}
}
