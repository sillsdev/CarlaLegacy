namespace SIL.Cabhab
{
	partial class TermDefinitionDialog
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(TermDefinitionDialog));
			this.m_labelMessage = new System.Windows.Forms.Label();
			this.m_buttonOK = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// m_labelMessage
			// 
			this.m_labelMessage.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
						| System.Windows.Forms.AnchorStyles.Left)
						| System.Windows.Forms.AnchorStyles.Right)));
			this.m_labelMessage.AutoSize = true;
			this.m_labelMessage.Location = new System.Drawing.Point(28, 12);
			this.m_labelMessage.MaximumSize = new System.Drawing.Size(400, 0);
			this.m_labelMessage.Name = "m_labelMessage";
			this.m_labelMessage.Size = new System.Drawing.Size(151, 13);
			this.m_labelMessage.TabIndex = 0;
			this.m_labelMessage.Text = "The message will appear here.";
			// 
			// m_buttonOK
			// 
			this.m_buttonOK.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.m_buttonOK.Location = new System.Drawing.Point(351, 92);
			this.m_buttonOK.Name = "m_buttonOK";
			this.m_buttonOK.Size = new System.Drawing.Size(90, 25);
			this.m_buttonOK.TabIndex = 1;
			this.m_buttonOK.Text = "OK";
			this.m_buttonOK.UseVisualStyleBackColor = true;
			// 
			// TermDefinitionDialog
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.AutoScroll = true;
			this.AutoSize = true;
			this.ClientSize = new System.Drawing.Size(451, 124);
			this.Controls.Add(this.m_buttonOK);
			this.Controls.Add(this.m_labelMessage);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "TermDefinitionDialog";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Label m_labelMessage;
		private System.Windows.Forms.Button m_buttonOK;
	}
}