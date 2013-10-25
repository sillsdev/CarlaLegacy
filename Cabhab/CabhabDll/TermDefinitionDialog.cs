using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SIL.Cabhab
{
	public partial class TermDefinitionDialog : Form
	{
		public TermDefinitionDialog()
		{
			InitializeComponent();
		}
		/// <summary>
		/// The message to show
		/// </summary>
		public string LabelMessage
		{
			get { return m_labelMessage.Text; }
			set { m_labelMessage.Text = value; }
		}

	}
}
