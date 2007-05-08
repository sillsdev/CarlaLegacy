namespace ExamplesFromANA
{
	partial class DisplayXMLForm
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DisplayXMLForm));
			this.richTextBoxDisplayXML = new System.Windows.Forms.RichTextBox();
			this.buttonClose = new System.Windows.Forms.Button();
			this.SuspendLayout();
			//
			// richTextBoxDisplayXML
			//
			this.richTextBoxDisplayXML.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
						| System.Windows.Forms.AnchorStyles.Left)
						| System.Windows.Forms.AnchorStyles.Right)));
			this.richTextBoxDisplayXML.Font = new System.Drawing.Font("Arial Unicode MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.richTextBoxDisplayXML.Location = new System.Drawing.Point(12, 12);
			this.richTextBoxDisplayXML.Name = "richTextBoxDisplayXML";
			this.richTextBoxDisplayXML.ReadOnly = true;
			this.richTextBoxDisplayXML.Size = new System.Drawing.Size(606, 539);
			this.richTextBoxDisplayXML.TabIndex = 0;
			this.richTextBoxDisplayXML.Text = "";
			//
			// buttonClose
			//
			this.buttonClose.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
			this.buttonClose.Location = new System.Drawing.Point(278, 557);
			this.buttonClose.Name = "buttonClose";
			this.buttonClose.Size = new System.Drawing.Size(75, 23);
			this.buttonClose.TabIndex = 1;
			this.buttonClose.Text = "Close";
			this.buttonClose.UseVisualStyleBackColor = true;
			this.buttonClose.Click += new System.EventHandler(this.buttonClose_Click);
			//
			// DisplayXMLForm
			//
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(630, 592);
			this.Controls.Add(this.buttonClose);
			this.Controls.Add(this.richTextBoxDisplayXML);
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.Name = "DisplayXMLForm";
			this.Text = "Word Analysis Details";
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.RichTextBox richTextBoxDisplayXML;
		private System.Windows.Forms.Button buttonClose;
	}
}