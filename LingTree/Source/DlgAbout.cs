using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace LingTree
{
		/// <summary>
		/// Summary description for DlgAbout.
		/// </summary>
	public class DlgAbout : Form
	{
		private string strVersion = Application.ProductVersion;
		private PictureBox pbLogo;
		private Label label1;
		private Label label2;
		private Label label3;
		private Label label4;
		private Label label5;
		private Button button1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DlgAbout()
		{
			StartPosition = FormStartPosition.CenterParent;
			FormBorderStyle = FormBorderStyle.FixedDialog;
			ControlBox = false;
			MaximizeBox = false;
			MinimizeBox = false;
			ShowInTaskbar = false;

			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(DlgAbout));
			SuspendLayout();
			//
			// label1
			//
			label1 = new Label();
			label1.Parent = this;
			label1.Font = new Font("Microsoft Sans Serif", 9.75F, FontStyle.Bold, GraphicsUnit.Point, ((System.Byte)(0)));
			label1.Name = "label1";
			label1.Size = new Size(120, 16);
			label1.TabIndex = 5;
			label1.Text = "Linguistic Tree Tool             ";
			label1.AutoSize = true;
			label1.TextAlign = ContentAlignment.MiddleLeft;
			//
			// pbLogo
			//
			pbLogo = new PictureBox();
			pbLogo.Parent = this;
			//pbLogo.Image = ((Bitmap)(resources.GetObject("pbLogo.Image")));
			pbLogo.Image = new Bitmap(GetType(), "ProcessDescription.bmp");
			pbLogo.Location = new Point(label1.Font.Height / 2,
					label1.Font.Height / 2);
			pbLogo.Name = "pbLogo";
			pbLogo.Size = new Size(32, 32);
			pbLogo.SizeMode = PictureBoxSizeMode.AutoSize;
			pbLogo.TabIndex = 0;
			pbLogo.TabStop = false;

			label1.Location = new Point(pbLogo.Right + pbLogo.Height / 2,
				(pbLogo.Height / 2)); // + (label1.Font.Height / 2));

			int iClientWidth = label1.Right;
			//
			// label2
			//
			label2 = new Label();
			label2.Parent = this;
			label2.Location = new Point(label1.Left, label1.Bottom + label2.Font.Height + 10);
			label2.Name = "label2";
			label2.Size = new Size(iClientWidth, label2.Font.Height);
			label2.TabIndex = 6;
			label2.Text = "Version " + strVersion + " Beta";
			label2.TextAlign = ContentAlignment.MiddleLeft;
			//
			// label3
			//
			label3 = new Label();
			label3.Parent = this;
			label3.Location = new Point(label1.Left, label2.Bottom + label3.Font.Height);
			label3.Name = "label3";
			label3.Size = new Size(iClientWidth, label3.Font.Height);
			label3.TabIndex = 7;
			label3.Text = "Copyright \x00A9 2002-2005 SIL International";
			label3.TextAlign = ContentAlignment.MiddleLeft;
			//
			// label4
			//
			label4 = new Label();
			label4.Parent = this;
			label4.Location = new Point(label1.Left, label3.Bottom + label4.Font.Height);
			label4.Name = "label4";
			label4.Size = new Size(iClientWidth, label4.Font.Height);
			label4.TabIndex = 7;
			label4.Text = "Support: send email to";
			label4.TextAlign = ContentAlignment.MiddleLeft;
			//
			// label5
			//
			label5 = new Label();
			label5.Parent = this;
			label5.Location = new Point(label1.Left, label4.Bottom + 2);
			label5.Name = "label5";
			label5.Size = new Size(iClientWidth, label5.Font.Height);
			label5.TabIndex = 7;
			label5.Text = "    andy_black@sil.org";
			label5.TextAlign = ContentAlignment.MiddleLeft;
			//
			// button1
			//
			button1 = new Button();
			button1.Parent = this;
			button1.Location = new Point(iClientWidth/2 - button1.Size.Width/2,
										 label5.Bottom + 2 * button1.Font.Height);
			button1.Name = "button1";
			button1.Size = new Size(4 * button1.Font.Height,
									2 * button1.Font.Height);
			button1.TabIndex = 8;
			button1.Text = "OK";
			button1.DialogResult = DialogResult.OK;
			CancelButton = button1;
			AcceptButton = button1;
			//
			// DlgAbout
			//
			ClientSize = new Size(iClientWidth + 40, button1.Bottom + 2 * button1.Font.Height);
			button1.Location = new Point(ClientSize.Width/2 - button1.Size.Width/2,
				label5.Bottom + 3 * button1.Font.Height);
			Controls.AddRange(new Control[] {button1,
											 label3,
											 label2,
											 label1,
											 pbLogo});
			//Icon = ((Icon)(resources.GetObject("$Icon")));
			Name = "DlgAbout";
			Text = "About LingTree";
			ResumeLayout(false);
		}

		private void InitializeComponent()
		{
			//
			// DlgAbout
			//
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(416, 273);
			this.Name = "DlgAbout";

		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}
	}
}
