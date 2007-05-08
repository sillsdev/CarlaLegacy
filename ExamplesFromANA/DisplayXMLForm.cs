using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ExamplesFromANA
{
	public partial class DisplayXMLForm : Form
	{
		public DisplayXMLForm(string strXML)
		{
			InitializeComponent();

			richTextBoxDisplayXML.Text = strXML;
		}

		private void buttonClose_Click(object sender, EventArgs e)
		{
			this.Close();
		}
	}
}