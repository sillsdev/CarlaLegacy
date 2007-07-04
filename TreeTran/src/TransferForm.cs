//**************************************************************************
// File: "TreeTran\TransferForm.cs".
//
// This file defines the TransferForm class, which implements a form that
// reads parse trees from an input file, applies a set of transfer rules,
// and writes the modified parse trees to an output file.
//
// History:
//     2006-Sep-26 David Bullock: Code complete.
//**************************************************************************
using System;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;
using TreeTranEngine;
//**************************************************************************
namespace TreeTranViewer
{
	//**********************************************************************
	/// <summary>
	/// Implements a form that reads parse trees from an input file, applies
	/// a set of transfer rules, and writes the modified parse trees to an
	/// output file.
	/// </summary>
	public class TransferForm: System.Windows.Forms.Form
	{
		//******************************************************************
		#region [Generated Code]
		//******************************************************************
		private System.Windows.Forms.Button moOKButton;
		private System.Windows.Forms.Button moCancelButton;
		private System.Windows.Forms.Label moInputFileLabel;
		private System.Windows.Forms.TextBox moInputFileTextBox;
		private System.Windows.Forms.Label moOutputFileLabel;
		private System.Windows.Forms.TextBox moOutputFileTextBox;
		private System.Windows.Forms.Label moRuleCountLabel;
		private System.Windows.Forms.TextBox moRuleCountTextBox;
		private System.Windows.Forms.Label moParseCountLabel;
		private System.Windows.Forms.TextBox moParseCountTextBox;
		private System.Windows.Forms.Timer moTimer;
		private System.ComponentModel.IContainer components;

		// <summary>
		// Clean up any resources being used.
		// </summary>
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

		#region Windows Form Designer generated code
		// <summary>
		// Required method for Designer support - do not modify
		// the contents of this method with the code editor.
		// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(TransferForm));
			this.moOKButton = new System.Windows.Forms.Button();
			this.moCancelButton = new System.Windows.Forms.Button();
			this.moInputFileLabel = new System.Windows.Forms.Label();
			this.moInputFileTextBox = new System.Windows.Forms.TextBox();
			this.moOutputFileLabel = new System.Windows.Forms.Label();
			this.moOutputFileTextBox = new System.Windows.Forms.TextBox();
			this.moRuleCountLabel = new System.Windows.Forms.Label();
			this.moRuleCountTextBox = new System.Windows.Forms.TextBox();
			this.moParseCountLabel = new System.Windows.Forms.Label();
			this.moParseCountTextBox = new System.Windows.Forms.TextBox();
			this.moTimer = new System.Windows.Forms.Timer(this.components);
			this.SuspendLayout();
			//
			// moOKButton
			//
			this.moOKButton.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			this.moOKButton.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.moOKButton.Enabled = false;
			this.moOKButton.Location = new System.Drawing.Point(352, 96);
			this.moOKButton.Name = "moOKButton";
			this.moOKButton.Size = new System.Drawing.Size(72, 23);
			this.moOKButton.TabIndex = 1;
			this.moOKButton.Text = "OK";
			//
			// moCancelButton
			//
			this.moCancelButton.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			this.moCancelButton.Location = new System.Drawing.Point(432, 96);
			this.moCancelButton.Name = "moCancelButton";
			this.moCancelButton.Size = new System.Drawing.Size(72, 23);
			this.moCancelButton.TabIndex = 2;
			this.moCancelButton.Text = "Cancel";
			this.moCancelButton.Click += new System.EventHandler(this.moCancelButton_Click);
			//
			// moInputFileLabel
			//
			this.moInputFileLabel.Location = new System.Drawing.Point(8, 8);
			this.moInputFileLabel.Name = "moInputFileLabel";
			this.moInputFileLabel.Size = new System.Drawing.Size(72, 23);
			this.moInputFileLabel.TabIndex = 3;
			this.moInputFileLabel.Text = "Input File:";
			//
			// moInputFileTextBox
			//
			this.moInputFileTextBox.Anchor = ((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
				| System.Windows.Forms.AnchorStyles.Right);
			this.moInputFileTextBox.BackColor = System.Drawing.SystemColors.Control;
			this.moInputFileTextBox.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.moInputFileTextBox.ForeColor = System.Drawing.SystemColors.ControlText;
			this.moInputFileTextBox.Location = new System.Drawing.Point(80, 8);
			this.moInputFileTextBox.Name = "moInputFileTextBox";
			this.moInputFileTextBox.ReadOnly = true;
			this.moInputFileTextBox.Size = new System.Drawing.Size(426, 13);
			this.moInputFileTextBox.TabIndex = 4;
			this.moInputFileTextBox.Text = "(input file)";
			//
			// moOutputFileLabel
			//
			this.moOutputFileLabel.Location = new System.Drawing.Point(8, 32);
			this.moOutputFileLabel.Name = "moOutputFileLabel";
			this.moOutputFileLabel.Size = new System.Drawing.Size(72, 23);
			this.moOutputFileLabel.TabIndex = 5;
			this.moOutputFileLabel.Text = "Output File:";
			//
			// moOutputFileTextBox
			//
			this.moOutputFileTextBox.Anchor = ((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
				| System.Windows.Forms.AnchorStyles.Right);
			this.moOutputFileTextBox.BackColor = System.Drawing.SystemColors.Control;
			this.moOutputFileTextBox.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.moOutputFileTextBox.ForeColor = System.Drawing.SystemColors.ControlText;
			this.moOutputFileTextBox.Location = new System.Drawing.Point(80, 32);
			this.moOutputFileTextBox.Name = "moOutputFileTextBox";
			this.moOutputFileTextBox.ReadOnly = true;
			this.moOutputFileTextBox.Size = new System.Drawing.Size(426, 13);
			this.moOutputFileTextBox.TabIndex = 6;
			this.moOutputFileTextBox.Text = "(output file)";
			//
			// moRuleCountLabel
			//
			this.moRuleCountLabel.Location = new System.Drawing.Point(8, 56);
			this.moRuleCountLabel.Name = "moRuleCountLabel";
			this.moRuleCountLabel.Size = new System.Drawing.Size(168, 23);
			this.moRuleCountLabel.TabIndex = 7;
			this.moRuleCountLabel.Text = "Number of Transfer Rules:";
			//
			// moRuleCountTextBox
			//
			this.moRuleCountTextBox.BackColor = System.Drawing.SystemColors.Control;
			this.moRuleCountTextBox.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.moRuleCountTextBox.ForeColor = System.Drawing.SystemColors.ControlText;
			this.moRuleCountTextBox.Location = new System.Drawing.Point(176, 56);
			this.moRuleCountTextBox.Name = "moRuleCountTextBox";
			this.moRuleCountTextBox.ReadOnly = true;
			this.moRuleCountTextBox.Size = new System.Drawing.Size(104, 13);
			this.moRuleCountTextBox.TabIndex = 8;
			this.moRuleCountTextBox.Text = "0";
			//
			// moParseCountLabel
			//
			this.moParseCountLabel.Location = new System.Drawing.Point(8, 80);
			this.moParseCountLabel.Name = "moParseCountLabel";
			this.moParseCountLabel.Size = new System.Drawing.Size(168, 23);
			this.moParseCountLabel.TabIndex = 9;
			this.moParseCountLabel.Text = "Number of Parses Processed:";
			//
			// moParseCountTextBox
			//
			this.moParseCountTextBox.BackColor = System.Drawing.SystemColors.Control;
			this.moParseCountTextBox.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.moParseCountTextBox.ForeColor = System.Drawing.SystemColors.ControlText;
			this.moParseCountTextBox.Location = new System.Drawing.Point(176, 80);
			this.moParseCountTextBox.Name = "moParseCountTextBox";
			this.moParseCountTextBox.ReadOnly = true;
			this.moParseCountTextBox.Size = new System.Drawing.Size(104, 13);
			this.moParseCountTextBox.TabIndex = 0;
			this.moParseCountTextBox.Text = "0";
			//
			// moTimer
			//
			this.moTimer.Tick += new System.EventHandler(this.moTimer_Tick);
			//
			// TransferForm
			//
			this.AcceptButton = this.moOKButton;
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(514, 128);
			this.ControlBox = false;
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.moCancelButton,
																		  this.moOKButton,
																		  this.moParseCountTextBox,
																		  this.moRuleCountTextBox,
																		  this.moOutputFileTextBox,
																		  this.moInputFileTextBox,
																		  this.moParseCountLabel,
																		  this.moRuleCountLabel,
																		  this.moOutputFileLabel,
																		  this.moInputFileLabel});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.KeyPreview = true;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "TransferForm";
			this.ShowInTaskbar = false;
			this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Processing Parse File...";
			this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.TransferForm_KeyDown);
			this.Load += new System.EventHandler(this.TransferForm_Load);
			this.ResumeLayout(false);

		}
		#endregion
		#endregion
		//******************************************************************
		#region [Constructor]
		//******************************************************************
		/// <summary>
		/// The constructor is private. You can display the form by calling
		/// one of the static public methods: ProcessParseFile() or
		/// ProcessParseFileAndClose().
		/// </summary>
		private TransferForm()
		{
			//**************************************************************
			// As required to support code generated by the Form Designer,
			// make InitializeComponent() the first call in the constructor.

			InitializeComponent();
		}
		#endregion
		//******************************************************************
		#region [Static ProcessParseFile() Method]
		//******************************************************************
		/// <summary>
		/// Uses the given transfer rules (oTransferRules) to process the
		/// parse trees in the indicated input file (sInputFileName). The
		/// modified parse trees are written to the indicate output file
		/// (sOutputFileName). A modal dialog displays status information as
		/// the file is processed. DialogResult.OK is returned if the
		/// process completed successfully. DialogResult.Cancel is returned
		/// if the process was canceled or if an error occurred.
		/// </summary>
		static public DialogResult ProcessParseFile(
			TransferRuleCollection oTransferRules,string sInputFileName,
			string sOutputFileName)
		{
			//**************************************************************
			// Validate the parameters.

			if (oTransferRules == null)
			{
				string sMessage = "Invalid argument: "
					+ "TransferForm.ProcessParseFile() requires "
					+ "a TransferRules collection that is not null.";
				throw new Exception(sMessage);
			}
			if (oTransferRules.Count == 0)
			{
				string sMessage = "Invalid argument: "
					+ "TransferForm.ProcessParseFile() requires "
					+ "a TransferRules collection that is not empty.";
				throw new Exception(sMessage);
			}
			if ((sInputFileName == null) || (sInputFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "TransferForm.ProcessParseFile() requires "
					+ "an input-file name that is not null or blank.";
				throw new Exception(sMessage);
			}
			if ((sOutputFileName == null) || (sOutputFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "TransferForm.ProcessParseFile() requires "
					+ "an output-file name that is not null or blank.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Create an instance of the form.

			TransferForm oForm = new TransferForm();

			//**************************************************************
			// Set the form's TransferRules, InputFileName, OutputFileName
			// and CloseWhenFinished property values.

			oForm.moTransferRules = oTransferRules;
			oForm.msInputFileName = sInputFileName;
			oForm.msOutputFileName = sOutputFileName;
			oForm.mbCloseWhenFinished = false;

			//**************************************************************
			// Show the form as a modal dialog. The form's Load event starts
			// a timer, and the timer's Tick event handler performs the
			// actual tree-transfer processing.

			DialogResult iResult = oForm.ShowDialog();

			//**************************************************************
			// Return the dialog result when the form is closed.

			oForm.Close();
			return iResult;
		}
		#endregion
		//******************************************************************
		#region [Static ProcessParseFileAndClose() Method]
		//******************************************************************
		/// <summary>
		/// Uses the given transfer rules (oTransferRules) to process the
		/// parse trees in the indicated input file (sInputFileName). The
		/// modified parse trees are written to the indicate output file
		/// (sOutputFileName). A modal dialog displays status information as
		/// the file is processed. The dialog is automatically closed when
		/// the processing is finished. DialogResult.OK is returned if the
		/// process completed successfully. DialogResult.Cancel is returned
		/// if the process was canceled or if an error occurred.
		/// </summary>
		static public DialogResult ProcessParseFileAndClose(
			TransferRuleCollection oTransferRules,string sInputFileName,
			string sOutputFileName)
		{
			//**************************************************************
			// Validate the parameters.

			if (oTransferRules == null)
			{
				string sMessage = "Invalid argument: "
					+ "TransferForm.ProcessParseFileAndClose() requires "
					+ "a TransferRules collection that is not null.";
				throw new Exception(sMessage);
			}
			if (oTransferRules.Count == 0)
			{
				string sMessage = "Invalid argument: "
					+ "TransferForm.ProcessParseFileAndClose() requires "
					+ "a TransferRules collection that is not empty.";
				throw new Exception(sMessage);
			}
			if ((sInputFileName == null) || (sInputFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "TransferForm.ProcessParseFileAndClose() requires "
					+ "an input-file name that is not null or blank.";
				throw new Exception(sMessage);
			}
			if ((sOutputFileName == null) || (sOutputFileName == ""))
			{
				string sMessage = "Invalid argument: "
					+ "TransferForm.ProcessParseFileAndClose() requires "
					+ "an output-file name that is not null or blank.";
				throw new Exception(sMessage);
			}

			//**************************************************************
			// Create an instance of the form.

			TransferForm oForm = new TransferForm();

			//**************************************************************
			// Set the form's TransferRules, InputFileName, OutputFileName
			// and CloseWhenFinished property values.

			oForm.moTransferRules = oTransferRules;
			oForm.msInputFileName = sInputFileName;
			oForm.msOutputFileName = sOutputFileName;
			oForm.mbCloseWhenFinished = true;

			//**************************************************************
			// Show the form as a modal dialog. The form's Load event starts
			// a timer, and the timer's Tick event handler performs the
			// actual tree-transfer processing.

			DialogResult iResult = oForm.ShowDialog();

			//**************************************************************
			// Return the dialog result when the form is closed.

			oForm.Close();
			return iResult;
		}
		#endregion
		//******************************************************************
		#region [TransferRules Property]
		//******************************************************************
		/// <summary>
		/// The TransferRules property value.
		/// </summary>
		private TransferRuleCollection moTransferRules = null;
		//******************************************************************
		/// <summary>
		/// Gets the collection of transfer rules.
		/// </summary>
		private TransferRuleCollection TransferRules
		{
			get
			{
				if (moTransferRules == null)
				{
					moTransferRules = new TransferRuleCollection();
				}
				return moTransferRules;
			}
		}
		#endregion
		//******************************************************************
		#region [InputFileName Property]
		//******************************************************************
		/// <summary>
		/// The InputFileName property value.
		/// </summary>
		private string msInputFileName = "";
		//******************************************************************
		/// <summary>
		/// Gets the name of the input file.
		/// </summary>
		private string InputFileName
		{
			get
			{
				return msInputFileName;
			}
		}
		#endregion
		//******************************************************************
		#region [OutputFileName Property]
		//******************************************************************
		/// <summary>
		/// The OutputFileName property value.
		/// </summary>
		private string msOutputFileName = "";
		//******************************************************************
		/// <summary>
		/// Gets the name of the output file.
		/// </summary>
		private string OutputFileName
		{
			get
			{
				return msOutputFileName;
			}
		}
		#endregion
		//******************************************************************
		#region [CloseWhenFinished Property]
		//******************************************************************
		/// <summary>
		/// The CloseWhenFinished property value.
		/// </summary>
		private bool mbCloseWhenFinished = false;
		//******************************************************************
		/// <summary>
		/// Gets the CloseWhenFinished property, which is true to indicate
		/// that the form should automatically close when processing is
		/// finished, and false otherwise.
		/// </summary>
		private bool CloseWhenFinished
		{
			get
			{
				return mbCloseWhenFinished;
			}
		}
		#endregion
		//******************************************************************
		#region [ProcessingWasCanceled Property]
		//******************************************************************
		/// <summary>
		/// The ProcessingWasCanceled property value.
		/// </summary>
		private bool mbProcessingWasCanceled = false;
		//******************************************************************
		/// <summary>
		/// Gets or sets the ProcessingWasCanceled property, which is true
		/// if the Cancel button was clicked to cancel processing (or if an
		/// error caused processing to terminate).
		/// </summary>
		private bool ProcessingWasCanceled
		{
			set
			{
				mbProcessingWasCanceled = value;
			}
			get
			{
				return mbProcessingWasCanceled;
			}
		}
		#endregion
		//******************************************************************

		// FORM EVENTS

		//******************************************************************
		#region [Load Event Handler]
		//******************************************************************
		/// <summary>
		/// Starts the timer, which will fire once after the form is loaded.
		/// The tree-transfer processing will be performed by the timer's
		/// tick event handler.
		/// </summary>
		private void TransferForm_Load(object oSender,EventArgs oArgs)
		{
			try
			{
				//**********************************************************
				// Start the timer, which will fire once and process the
				// parse file (in the tick event handler).

				moTimer.Interval = 100;
				moTimer.Start();
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [KeyDown Event Handler]
		//******************************************************************
		/// <summary>
		/// Sets the ProcessingWasCanceled property to true when the user
		/// presses the Escape key.
		/// </summary>
		private void TransferForm_KeyDown(object oSender,KeyEventArgs oArgs)
		{
			try
			{
				Debug.Assert(oArgs != null);

				if (oArgs.KeyData == Keys.Escape)
				{
					ProcessingWasCanceled = true;
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************

		// CONTROL EVENTS

		//******************************************************************
		#region [Timer Tick Event Handler]
		//******************************************************************
		/// <summary>
		/// The timer is fired once after the form is loaded, and this event
		/// handler performs the tree-transfer processing. It uses the
		/// collection of transfer rules to process the parse trees in the
		/// input file, and it writes the modified parse trees to the output
		/// file.
		/// </summary>
		private void moTimer_Tick(object oSender,EventArgs oArgs)
		{
			ParseReader oParseReader = null;
			ParseWriter oParseWriter = null;
			try
			{
				//**********************************************************
				// Stop the timer (so it only fires once after the form is
				// loaded).

				moTimer.Stop();

				//**********************************************************
				// Initialize the information displayed on the form.

				Text = "Processing Parse File...";

				moInputFileTextBox.Text = InputFileName;
				moOutputFileTextBox.Text = OutputFileName;
				moRuleCountTextBox.Text = TransferRules.Count.ToString();
				moParseCountTextBox.Text = "0";

				moInputFileTextBox.Select(
					moInputFileTextBox.Text.Length,0);
				moOutputFileTextBox.Select(
					moOutputFileTextBox.Text.Length,0);
				moRuleCountTextBox.Select(
					moRuleCountTextBox.Text.Length,0);
				moParseCountTextBox.Select(
					moParseCountTextBox.Text.Length,0);

				moParseCountTextBox.Focus();

				moOKButton.Enabled = false;
				moCancelButton.Enabled = true;

				//**********************************************************
				// Make sure the form is visible.

				Show();
				Application.DoEvents();

				//**********************************************************
				// Open the input and output files.

				StreamReader oStreamReader
					= new StreamReader(InputFileName);
				oParseReader = new ParseReader(oStreamReader);

				StreamWriter oStreamWriter
					= new StreamWriter(OutputFileName);
				oParseWriter = new ParseWriter(oStreamWriter);

				//**********************************************************
				// Read and process each parse tree from the input file.

				int iCount = 0;
				ProcessingWasCanceled = false;
				while ((oParseReader.Read()) && (! ProcessingWasCanceled))
				{
					//******************************************************
					// Create a TreeTransfer object and set its
					// ParseTreeRoot to the parse tree that was read from
					// the input file.

					TreeTransfer oTransfer = new TreeTransfer();
					oTransfer.ParseTreeRoot = oParseReader.ParseTreeRoot;

					//******************************************************
					// Apply each rule in the TransferRules collection.

					foreach (TransferRule oRule in TransferRules)
					{
						oTransfer.FindPatternRoot
							= oRule.FindPatternRoot;
						oTransfer.ReplacePatternRoot
							= oRule.ReplacePatternRoot;

						//**************************************************
						// Apply the rule to each matching branch.

						oTransfer.CurrentParseTreeNode = null;
						while (oTransfer.FindNextMatchingBranch())
						{
							oTransfer.ReplaceCurrentMatchingBranch();
						}
					}

					//******************************************************
					// Write the modified parse tree to the output file.

					oParseWriter.ParseTreeRoot = oTransfer.ParseTreeRoot;
					oParseWriter.Write();

					//******************************************************
					// Update the information displayed on the form.

					++iCount;
					moParseCountTextBox.Text = iCount.ToString();
					moParseCountTextBox.Select(
						moParseCountTextBox.Text.Length,0);

					//******************************************************
					// Call DoEvents() so the form can update the display
					// and check if the user clicked the Cancel button.

					Application.DoEvents();
				}

				//**********************************************************
				// Close the input and output files.

				oParseReader.Close();
				oParseReader = null;
				oParseWriter.Close();
				oParseWriter = null;

				//**********************************************************
				// Update the final information displayed on the form.

				if (ProcessingWasCanceled)
				{
					Text = "Processing Parse File... Canceled";
				}
				else
				{
					Text = "Processing Parse File... Finished";
				}

				moOKButton.Enabled = true;
				moCancelButton.Enabled = false;
				moOKButton.Focus();

				//**********************************************************
				// If the Cancel button was clicked, set DialogResult to
				// DialogResult.Cancel, which will close the form.
				//
				// If the Cancel button was not clicked, but the
				// CloseWhenFinished property is true, set DialogResult to
				// DialogResult.OK, which will close the form.

				if (ProcessingWasCanceled)
				{
					DialogResult = DialogResult.Cancel;
				}
				else
				{
					if (CloseWhenFinished)
					{
						DialogResult = DialogResult.OK;
					}
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
				ProcessingWasCanceled = true;
			}
			try
			{
				//**********************************************************
				// Make sure the output file is closed (even if an exception
				// was thrown).

				if (oParseWriter != null)
				{
					oParseWriter.Close();
					oParseWriter = null;
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
				ProcessingWasCanceled = true;
			}
			try
			{
				//**********************************************************
				// Make sure the OK button is enabled (even if an exception
				// was thrown).

				moOKButton.Enabled = true;
				moCancelButton.Enabled = false;
				moOKButton.Focus();
			}
			catch (Exception oException)
			{
				ShowException(oException);
				ProcessingWasCanceled = true;
			}
			try
			{
				//**********************************************************
				// If the Cancel button was clicked (or an exception was
				// thrown), make sure DialogResult is set to
				// DialogResult.Cancel, which will close the form.

				if (ProcessingWasCanceled)
				{
					DialogResult = DialogResult.Cancel;
				}
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************
		#region [CancelButton Click Event Handler]
		//******************************************************************
		/// <summary>
		/// Sets the ProcessingWasCanceled property to true when the user
		/// clicks the Cancel button.
		/// </summary>
		private void moCancelButton_Click(object oSender,EventArgs oArgs)
		{
			try
			{
				ProcessingWasCanceled = true;
			}
			catch (Exception oException)
			{
				ShowException(oException);
			}
		}
		#endregion
		//******************************************************************

		// ERROR HANDLING

		//******************************************************************
		#region [Static ShowException() and LogException() Methods]
		//******************************************************************
		/// <summary>
		/// Shows the user the message from the given exception object.
		/// </summary>
		private static void ShowException(Exception oException)
		{
			try
			{
				LogException(oException);
				MessageBox.Show(oException.Message,"Error");
			}
			catch
			{
				Debug.Fail("ShowException() failed.");
			}
		}
		//******************************************************************
		/// <summary>
		/// Logs the message from the given exception object.
		/// </summary>
		private static void LogException(Exception oException)
		{
			try
			{
				Debug.WriteLine("Error: " + oException.Message);
				Debug.WriteLine(oException.StackTrace);
			}
			catch
			{
				Debug.Fail("LogException() failed.");
			}
		}
		#endregion
		//******************************************************************
	}
}
//**************************************************************************
