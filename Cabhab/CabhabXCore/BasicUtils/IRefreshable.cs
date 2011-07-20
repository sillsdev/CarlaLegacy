namespace SIL.Utils
{
	/// <summary>
	/// An interface which objects (currently implmenentations of ISilDataAccess)
	/// may implement if they desire to to update something when the user refreshes the display.
	/// </summary>
	public interface IRefreshable
	{
		/// <summary>
		/// Update whatever needs it.
		/// </summary>
		void Refresh();
	}
}
