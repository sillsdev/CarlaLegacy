using System.Windows.Forms.Design;
using System.Windows.Forms;
using System.IO;
//using System.Windows.Forms.Design.FolderNameEditor;

// from  Nathan Alden [@hotmail.com]
// Modifed by H. Andrew Black 19-Apr-2002
/// <summary>
/// Acts as an encapsulation of the FolderNameEditor class
/// </summary>

internal class DirectoryBrowser : System.Windows.Forms.Design.FolderNameEditor
{
	private FolderBrowser folderBrowser = new FolderBrowser();
	private string m_strDescription;

	/// <summary>
	/// Gets a value that represents the folder the user chose.
	/// </summary>
	public string DirectoryPath
	{

		get
		{
			return folderBrowser.DirectoryPath;
		}
	}
	/// <summary>
	/// Initializes the dialog.
	/// </summary>
	/// <param name="folderBrowser">A FolderBrowser object.</param>
	protected override void InitializeDialog(FolderNameEditor.FolderBrowser
		folderBrowser)
	{
		folderBrowser.Description = m_strDescription;
		folderBrowser.StartLocation = FolderBrowserFolder.MyComputer;
		folderBrowser.Style = FolderBrowserStyles.ShowTextBox;
	}
	/// <summary>
	/// Displays the dialog.
	/// </summary>
	/// <param name="strDescription">The description displayed with the dialog.</param>
	/// <returns>A DialogResult value representing whether the user chose OK or Cancel.</returns>
	public DialogResult ShowDialog(string strDescription)
	{
		this.m_strDescription = strDescription;
		InitializeDialog(folderBrowser);
		return folderBrowser.ShowDialog();
	}
}
