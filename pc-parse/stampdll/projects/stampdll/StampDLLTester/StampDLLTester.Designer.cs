namespace StampDLLTester
{
	partial class StampDLLTesterApp
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
			this.ExportButtonOne = new System.Windows.Forms.Button();
			this.ExportButtonTwo = new System.Windows.Forms.Button();
			this.ExportButtonThree = new System.Windows.Forms.Button();
			this.Exit = new System.Windows.Forms.Button();
			this.SuspendLayout();
			//
			// ExportButtonOne
			//
			this.ExportButtonOne.Location = new System.Drawing.Point(51, 42);
			this.ExportButtonOne.Name = "ExportButtonOne";
			this.ExportButtonOne.Size = new System.Drawing.Size(137, 52);
			this.ExportButtonOne.TabIndex = 0;
			this.ExportButtonOne.Text = "ExportPointOne";
			this.ExportButtonOne.UseVisualStyleBackColor = true;
			this.ExportButtonOne.Click += new System.EventHandler(this.ExportButtonOne_Click);
			//
			// ExportButtonTwo
			//
			this.ExportButtonTwo.Location = new System.Drawing.Point(51, 122);
			this.ExportButtonTwo.Name = "ExportButtonTwo";
			this.ExportButtonTwo.Size = new System.Drawing.Size(137, 52);
			this.ExportButtonTwo.TabIndex = 1;
			this.ExportButtonTwo.Text = "ExportPointTwo";
			this.ExportButtonTwo.UseVisualStyleBackColor = true;
			this.ExportButtonTwo.Click += new System.EventHandler(this.ExportButtonTwo_Click);
			//
			// ExportButtonThree
			//
			this.ExportButtonThree.Location = new System.Drawing.Point(51, 207);
			this.ExportButtonThree.Name = "ExportButtonThree";
			this.ExportButtonThree.Size = new System.Drawing.Size(137, 52);
			this.ExportButtonThree.TabIndex = 2;
			this.ExportButtonThree.Text = "ExportPointThree";
			this.ExportButtonThree.UseVisualStyleBackColor = true;
			this.ExportButtonThree.Click += new System.EventHandler(this.ExportButtonThree_Click);
			//
			// Exit
			//
			this.Exit.Location = new System.Drawing.Point(51, 295);
			this.Exit.Name = "Exit";
			this.Exit.Size = new System.Drawing.Size(136, 46);
			this.Exit.TabIndex = 3;
			this.Exit.Text = "Exit";
			this.Exit.UseVisualStyleBackColor = true;
			this.Exit.Click += new System.EventHandler(this.Exit_Click);
			//
			// LearnDLLTestApp
			//
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(462, 422);
			this.Controls.Add(this.Exit);
			this.Controls.Add(this.ExportButtonThree);
			this.Controls.Add(this.ExportButtonTwo);
			this.Controls.Add(this.ExportButtonOne);
			this.Name = "LearnDLLTestApp";
			this.Text = "LearnDLLTestApp";
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.Button ExportButtonOne;
		private System.Windows.Forms.Button ExportButtonTwo;
		private System.Windows.Forms.Button ExportButtonThree;
		private System.Windows.Forms.Button Exit;


	}
}
