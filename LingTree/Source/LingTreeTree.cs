using System;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using System.Xml.Serialization;

namespace LingTree
{
	/// <summary>
	/// Summary description for LingTreeTree.
	/// </summary>
	[Serializable]
	public class LingTreeTree : Object
	{
		const int kMaxLevels = 100;
		string m_strVersion;
		string m_strDescription;	// parenthesized form of the tree
		LingTreeNode m_Root;	// root node of the tree
		int m_iVerticalGap;		// extra gap between levels
		int m_iHorizontalGap;	// extra gap between terminal nodes
		int m_iInitialXCoord;	// initial, leftmost X coordinate
		int m_iInitialYCoord;	// initial, topmost Y coordinate
		int m_iHorizontalOffset;	// current XCoord of last terminal node processed
		int m_iXSize;		// total width of tree
		int m_iYSize;		// total height of tree
		int m_iGlossBottomYCoord;	// lowest Gloss Y Coord (for "flat" view)
		int m_iLexBottomYCoord;	// lowest Lex   Y Coord (for "flat" view)
		int m_iLexBottomYUpperMid;	// lowest Lex   Y upper mid (for "flat" view)
		int m_iLexGlossGapAdjustment;// extra gap adjustment between lex and gloss
		int[] m_aiMaxLevelHeights; // array of levels, used for storing maximum height of a level
		bool m_bTrySmoothing;
		bool m_bTryPixelOffset;
		bool m_bShowFlatView;
		Font m_GlossFont;
		Font m_LexFont;
		Font m_NTFont;
		Color m_GlossColor;
		Color m_LexColor;
		Color m_NTColor;
		Color m_BackgroundColor;
		Color m_LinesColor;
		string m_strGlossFontFace;
		float m_fGlossFontSize;
		FontStyle m_GlossFontStyle;
		string m_strLexFontFace;
		float m_fLexFontSize;
		FontStyle m_LexFontStyle;
		string m_strNTFontFace;
		float m_fNTFontSize;
		FontStyle m_NTFontStyle;
		int m_iGlossColorArgb;
		int m_iLexColorArgb;
		int m_iNTColorArgb;
		int m_iBackgroundColorArgb;
		int m_iLinesColorArgb;
		int[] m_aiCustomColors = new int[16];
		double m_dLineWidth;

		public LingTreeTree(int iInitialXCoord,
			int iInitialYCoord,
			int iHorizontalGap,
			int iVerticalGap,
			int iLexGlossGapAdjustment,
			Font fntGlossFont,
			Font fntLexFont,
			Font fntNTFont,
			Color clrGlossColor,
			Color clrLexColor,
			Color clrNTColor,
			Color clrLines)
	{
			m_aiMaxLevelHeights = new int[kMaxLevels];
			InitialXCoord = iInitialXCoord;
			InitialYCoord = iInitialYCoord;
			HorizontalGap = iHorizontalGap;
			VerticalGap = iVerticalGap;
			LexGlossGapAdjustment = iLexGlossGapAdjustment;
			GlossFont = fntGlossFont;
			LexFont = fntLexFont;
			NTFont = fntNTFont;
			GlossColor = clrGlossColor;
			LexColor = clrLexColor;
			NTColor = clrNTColor;
			LinesColor = clrLines;
			m_Root = null;
			m_strVersion = Application.ProductVersion;
		}
		public LingTreeTree()
			: this(100, 100, 300, 300, 0, new Font("Courier New", 12),
				new Font("Courier New", 12), new Font("Courier New", 12),
			Color.Black, Color.Black, Color.Black, Color.Black)
		{
		}
		///////////////////////////////////////////////////////////////////////////////
		// NAME
		//    BeginASubTree
		// ARGUMENTS
		//    pMother  - pointer to mother node of new sub-tree
		//    iLevel - level (or depth) within the tree
		//    iIndex - index number of node in the tree
		// DESCRIPTION
		//    Create a new node which is the root of a subtree during the parsing of a tree description
		// RETURN VALUE
		//    Pointer to newly created node
		//
		LingTreeNode BeginASubTree(LingTreeNode Mother,
			int iLevel, int iIndex)
		{
			LingTreeNode Node = new LingTreeNode(iLevel, iIndex, null,
				LingTreeNode.NodeType.NonTerminal, Mother, null, null);
			if (Mother != null)
			{
				LingTreeNode Sister = Mother.Daughter;
				if (Sister == null)
					Mother.Daughter = Node; // new node is the daughter
				else
				{				// there's a daughter already
					while (Sister.Sister != null)
						Sister = Sister.Sister;	// skip to rightmost sister
					Sister.Sister = Node;
				}
			}
			return Node;
		}
		///////////////////////////////////////////////////////////////////////////////
		// NAME
		//    CalculateCoordinates
		// ARGUMENTS
		//    grfx     - pointer to Device Context
		// DESCRIPTION
		//    Caluclate the coordinates for the entire tree
		// RETURN VALUE
		//    none
		//
		public void CalculateCoordinates (Graphics grfx)
		{
			if (m_Root == null)
			{
				return;
			}
			XSize = 0;  // initialize
			YSize = 0;
			LexBottomYCoord = 0;
			LexBottomYUpperMid = 0;
			GlossBottomYCoord = 0;
			for (int i = 0; i < kMaxLevels; i++)
				SetMaxLevelHeight(i, 0);
			// Calculate height for each level
			m_Root.CalculateMaxHeight(this, grfx);
			// Calculate vertical position for root and all daughters
			m_Root.CalculateYCoordinate(InitialYCoord, this, grfx);
			// Calculate horizontal position for root and all daughters
#if DoTrace
			Console.WriteLine("Beginning calculations");
#endif
			m_iHorizontalOffset = InitialXCoord;
			m_Root.CalculateXCoordinate(this, grfx, 0);
		}
		public void Draw(Graphics grfx, Color color)
		{
			if (m_Root == null)
			{
				return;
			}
			m_Root.Draw(this, grfx, color, LineWidth);
		}
		///////////////////////////////////////////////////////////////////////////////
		// NAME
		//    EndASubTree
		// ARGUMENTS
		//    pNode - node which is ending
		// DESCRIPTION
		//    Finish processing a node during the parsing of a tree description
		// RETURN VALUE
		//
		//
		LingTreeNode EndASubTree(LingTreeNode Node)
		{
			// cleanup content
			if (Node.Content == null)
				Node.Content = "";
			else
				Node.Content = Node.Content.Trim();
			return Node.Mother;
		}
///////////////////////////////////////////////////////////////////////////////
// NAME
//    GiveUnmatchedClosingParenMsg
// ARGUMENTS
//    pszIllFormed - Illformed tree message portion
//    sDescription - CString containing the message
//    iPos         - position within the CString where error was detected
// DESCRIPTION
//    Display error message of unmatched parens
// RETURN VALUE
//    none
//
		void GiveUnmatchedClosingParenMsg(string strIllFormed,
			string strDescription,
			int iPos)
		{
			string strMsg = strIllFormed;
			int iPos2 = Math.Max(0,iPos-1);
			strMsg += "Unmatched closing parenthesis:\n ";
			strMsg += strDescription.Substring(0, iPos2);
			strMsg += " <ERROR DETECTED HERE> ";
			strMsg += strDescription.Substring(iPos2);
			MessageBox.Show(strMsg, "Parse error!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
		}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    ParseTreeDescription
// ARGUMENTS
//    none
// DESCRIPTION
//    create tree nodes based on the tree description
// RETURN VALUE
//    none
//
		public bool ParseTreeDescription()
		{
			const string strIllFormed = "Ill-formed tree description!\n";
			LingTreeNode Node = null;
			int iLevel = 0;		// level (or depth) of a node within the tree
			int iIndex = 1;		// unique index for nodes in the tree
			bool bSeenFirstOpenParen = false;

			if (m_Root != null)
			{
				m_Root = null;		// remove any existing tree
			}
			m_strDescription = m_strDescription.Trim();
			for (int i = 0; i < m_strDescription.Length; i++)
			{
				switch (m_strDescription[i])
				{
					case '(':
						if (bSeenFirstOpenParen && (iLevel == 0))
						{   // Ill-formed tree: final close has been reached, yet there is more
							string strMsg = strIllFormed ;
							int iPos2 = Math.Max(0,i);
							strMsg += "End of well-formed tree already reached. Start of a new tree discovered:\n ";
							strMsg += m_strDescription.Substring(0, iPos2);
							strMsg += " <ERROR DETECTED HERE> ";
							strMsg += m_strDescription.Substring(iPos2);
							strMsg += "\nRest of the description will be ignored";
							MessageBox.Show(strMsg, "Extra tree information!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
						}
						Node = BeginASubTree(Node, iLevel++, iIndex++);
						if (m_Root == null)
							m_Root = Node;
						bSeenFirstOpenParen = true;
						break;
					case ')':
						if (Node == null)
						{
							GiveUnmatchedClosingParenMsg(strIllFormed, m_strDescription, i);
							return false;
						}
						Node = EndASubTree(Node);
						iLevel--;		// decrement level
						break;
					case '\\':
						if (Node == null)
						{
							GiveUnmatchedClosingParenMsg(strIllFormed, m_strDescription, i);
							return false;
						}
						if (m_strDescription[i+1] == ')' || // check for quoted parens
							m_strDescription[i+1] == '(')
							Node.Content = Node.Content + m_strDescription[++i];
#if Orig
						else if (m_strDescription[i+1] == 'L' &&
							m_strDescription[i+2] == ' ')
						{
							Node.Type = LingTreeNode.NodeType.Lex;
							i += 2;
						}
						else if (m_strDescription[i+1] == 'G' &&
							m_strDescription[i+2] == ' ')
						{
							Node.Type = LingTreeNode.NodeType.Gloss;
							i += 2;
						}
						else if (m_strDescription[i+1] == 'T' &&
							m_strDescription[i+2] == ' ')
						{
							Node.Triangle = true;
							i += 2;
						}
#else
						else if (m_strDescription[i+1] == 'L')
						{
							Node.Type = LingTreeNode.NodeType.Lex;
							i++;
						}
						else if (m_strDescription[i+1] == 'G')
						{
							Node.Type = LingTreeNode.NodeType.Gloss;
							i++;
						}
						else if (m_strDescription[i+1] == 'T')
						{
							Node.Triangle = true;
							i++;
						}
						else if (m_strDescription[i+1] == 'O')
						{
							Node.OmitLine = true;
							i++;
						}
#endif
						break;
					default:
						if (Node == null)
						{
							GiveUnmatchedClosingParenMsg(strIllFormed, m_strDescription, i);
							return false;
						}
						Node.Content = Node.Content + m_strDescription[i];
						break;
				}
			}
			if (iLevel == 0)
				return true;
			else
			{
				string strMsg = strIllFormed;
				strMsg += iLevel;
				strMsg += " unmatched opening parenthes";
				if (iLevel == 1)
					strMsg += "i";
				else
					strMsg += "e";
				strMsg += "s discovered at the end of the description.";
				MessageBox.Show(strMsg, "Parse error!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);                return false;
			}
		}

		/// <summary>
		/// Gets/sets Version.
		/// </summary>
		public string Version
		{
			get
			{
				return m_strVersion;
			}
			set
			{
				m_strVersion = value;
			}
		}
		/// <summary>
		/// Gets/sets Description.
		/// </summary>
		public string Description
		{
			get
			{
				return m_strDescription;
			}
			set
			{
				m_strDescription = value;
			}
		}
		/// <summary>
		/// Gets/set Root.
		/// </summary>
		[XmlIgnore]
		public LingTreeNode Root
		{
			get
			{
				return m_Root;
			}
			set
			{
				m_Root = value;
			}
		}
		/// <summary>
		/// Gets/sets VerticalGap.
		/// </summary>
		public int VerticalGap
		{
			get
			{
				return m_iVerticalGap;
			}
			set
			{
				m_iVerticalGap = value;
			}
		}
		/// <summary>
		/// Gets/sets HorizontalGap.
		/// </summary>
		public int HorizontalGap
		{
			get
			{
				return m_iHorizontalGap;
			}
			set
			{
				m_iHorizontalGap = value;
			}
		}
		/// <summary>
		/// Gets/sets InitialXCoord.
		/// </summary>
		public int InitialXCoord
		{
			get
			{
				return m_iInitialXCoord;
			}
			set
			{
				m_iInitialXCoord = value;
			}
		}
		/// <summary>
		/// Gets/sets InitialYCoord.
		/// </summary>
		public int InitialYCoord
		{
			get
			{
				return m_iInitialYCoord;
			}
			set
			{
				m_iInitialYCoord = value;
			}
		}
		/// <summary>
		/// Gets/sets HorizontalOffset.
		/// </summary>
		public int HorizontalOffset
		{
			get
			{
				return m_iHorizontalOffset;
			}
			set
			{
				m_iHorizontalOffset = value;
			}
		}
		/// <summary>
		/// Gets/sets XSize.
		/// </summary>
		[XmlIgnore]
		public int XSize
		{
			get
			{
				return m_iXSize;
			}
			set
			{
				m_iXSize = value;
			}
		}
		/// <summary>
		/// Gets/sets YSize.
		/// </summary>
		[XmlIgnore]
		public int YSize
		{
			get
			{
				return m_iYSize;
			}
			set
			{
				m_iYSize = value;
			}
		}
		/// <summary>
		/// Gets/sets GlossBottomYCoord.
		/// </summary>
		[XmlIgnore]
		public int GlossBottomYCoord
		{
			get
			{
				return m_iGlossBottomYCoord;
			}
			set
			{
				m_iGlossBottomYCoord = value;
			}
		}
		/// <summary>
		/// Gets/sets LexBottomYCoord.
		/// </summary>
		[XmlIgnore]
		public int LexBottomYCoord
		{
			get
			{
				return m_iLexBottomYCoord;
			}
			set
			{
				m_iLexBottomYCoord = value;
			}
		}
		/// <summary>
		/// Gets/sets LexBottomYUpperMid.
		/// </summary>
		[XmlIgnore]
		public int LexBottomYUpperMid
		{
			get
			{
				return m_iLexBottomYUpperMid;
			}
			set
			{
				m_iLexBottomYUpperMid = value;
			}
		}
		/// <summary>
		/// Gets/sets LexGlossGapAdjustment.
		/// </summary>
		public int LexGlossGapAdjustment
		{
			get
			{
				return m_iLexGlossGapAdjustment;
			}
			set
			{
				m_iLexGlossGapAdjustment = value;
			}
		}
		/// <summary>
		/// Gets/sets TrySmoothing.
		/// </summary>
		public bool TrySmoothing
		{
			get
			{
				return m_bTrySmoothing;
			}
			set
			{
				m_bTrySmoothing = value;
			}
		}
		/// <summary>
		/// Gets/sets TryPixelOffset.
		/// </summary>
		public bool TryPixelOffset
		{
			get
			{
				return m_bTryPixelOffset;
			}
			set
			{
				m_bTryPixelOffset = value;
			}
		}
		/// <summary>
		/// Gets/sets ShowFlatView.
		/// </summary>
		public bool ShowFlatView
		{
			get
			{
				return m_bShowFlatView;
			}
			set
			{
				m_bShowFlatView = value;
			}
		}
		/// <summary>
		/// Gets/sets Gloss Font.
		/// </summary>
		[XmlIgnore]
		public Font GlossFont
		{
			get
			{
				return m_GlossFont;
			}
			set
			{
				m_GlossFont = value;
				GlossFontFace = m_GlossFont.Name;
				GlossFontSize = m_GlossFont.Size;
				GlossFontStyle = m_GlossFont.Style;
			}
		}
		/// <summary>
		/// Gets/sets Gloss Font Face. (Do not use this; use GlossFont instead.)
		/// </summary>
		/// For XML Serialization
		public string GlossFontFace
		{
			get
			{
				return m_strGlossFontFace;
			}
			set
			{
				m_strGlossFontFace = value;
			}
		}
		/// <summary>
		/// Gets/sets Gloss Font Size. (Do not use this; use GlossFont instead.)
		/// </summary>
		/// For XML Serialization
		public float GlossFontSize
		{
			get
			{
				return m_fGlossFontSize;
			}
			set
			{
				m_fGlossFontSize = value;
			}
		}
		/// <summary>
		/// Gets/sets Gloss Font Style (Do not use this; use GlossFont instead.)
		/// </summary>
		/// For XML Serialization
		public FontStyle GlossFontStyle
		{
			get
			{
				return m_GlossFontStyle;
			}
			set
			{
				m_GlossFontStyle = value;
			}
		}
		/// <summary>
		/// Gets/sets Lexical Item Font.
		/// </summary>
		[XmlIgnore]
		public Font LexFont
		{
			get
			{
				return m_LexFont;
			}
			set
			{
				m_LexFont = value;
				LexFontFace = m_LexFont.Name;
				LexFontSize = m_LexFont.Size;
				LexFontStyle = m_LexFont.Style;
			}
		}
		/// <summary>
		/// Gets/sets Lex Font Face. (Do not use this; use LexFont instead.)
		/// </summary>
		/// For XML Serialization
		public string LexFontFace
		{
			get
			{
				return m_strLexFontFace;
			}
			set
			{
				m_strLexFontFace = value;
			}
		}
		/// <summary>
		/// Gets/sets Lex Font Size. (Do not use this; use LexFont instead.)
		/// </summary>
		/// For XML Serialization
		public float LexFontSize
		{
			get
			{
				return m_fLexFontSize;
			}
			set
			{
				m_fLexFontSize = value;
			}
		}
		/// <summary>
		/// Gets/sets Lex Font Style (Do not use this; use LexFont instead.)
		/// </summary>
		/// For XML Serialization
		public FontStyle LexFontStyle
		{
			get
			{
				return m_LexFontStyle;
			}
			set
			{
				m_LexFontStyle = value;
			}
		}
		/// <summary>
		/// Gets/sets NonTerminal Font.
		/// </summary>
		[XmlIgnore]
		public Font NTFont
		{
			get
			{
				return m_NTFont;
			}
			set
			{
				m_NTFont = value;
				NTFontFace = m_NTFont.Name;
				NTFontSize = m_NTFont.Size;
				NTFontStyle = m_NTFont.Style;
			}
		}
		/// <summary>
		/// Gets/sets NT Font Face. (Do not use this; use NTFont instead.)
		/// </summary>
		/// For XML Serialization
		public string NTFontFace
		{
			get
			{
				return m_strNTFontFace;
			}
			set
			{
				m_strNTFontFace = value;
			}
		}
		/// <summary>
		/// Gets/sets NT Font Size. (Do not use this; use NTFont instead.)
		/// </summary>
		/// For XML Serialization
		public float NTFontSize
		{
			get
			{
				return m_fNTFontSize;
			}
			set
			{
				m_fNTFontSize = value;
			}
		}
		/// <summary>
		/// Gets/sets NT Font Style (Do not use this; use NTFont instead.)
		/// </summary>
		/// For XML Serialization
		public FontStyle NTFontStyle
		{
			get
			{
				return m_NTFontStyle;
			}
			set
			{
				m_NTFontStyle = value;
			}
		}
		/// <summary>
		/// Gets/sets Gloss Color.
		/// </summary>
		[XmlIgnore]
		public Color GlossColor
		{
			get
			{
				return m_GlossColor;
			}
			set
			{
				m_GlossColor = value;
				m_iGlossColorArgb = m_GlossColor.ToArgb();
			}
		}
		/// <summary>
		/// Gets/sets Gloss Color ARGB value.  (Do not use this; use GlossColor instead.)
		/// </summary>
		/// For XML Serialization
		public int GlossColorArgb
		{
			get
			{
				return m_iGlossColorArgb;
			}
			set
			{
				m_iGlossColorArgb = value;
				m_GlossColor = Color.FromArgb(m_iGlossColorArgb);
			}
		}
		/// <summary>
		/// Gets/sets Lexical Item Color.
		/// </summary>
		[XmlIgnore]
		public Color LexColor
		{
			get
			{
				return m_LexColor;
			}
			set
			{
				m_LexColor = value;
				m_iLexColorArgb = m_LexColor.ToArgb();
			}
		}
		/// <summary>
		/// Gets/sets Lex Color ARGB value.  (Do not use this; use LexColor instead.)
		/// </summary>
		/// For XML Serialization
		public int LexColorArgb
		{
			get
			{
				return m_iLexColorArgb;
			}
			set
			{
				m_iLexColorArgb = value;
				m_LexColor = Color.FromArgb(m_iLexColorArgb);
			}
		}
		/// <summary>
		/// Gets/sets NonTerminal Color.
		/// </summary>
		[XmlIgnore]
		public Color NTColor
		{
			get
			{
				return m_NTColor;
			}
			set
			{
				m_NTColor = value;
				m_iNTColorArgb = m_NTColor.ToArgb();
			}
		}
		/// <summary>
		/// Gets/sets NT Color ARGB value.  (Do not use this; use NTColor instead.)
		/// </summary>
		/// For XML Serialization
		public int NTColorArgb
		{
			get
			{
				return m_iNTColorArgb;
			}
			set
			{
				m_iNTColorArgb = value;
				m_NTColor = Color.FromArgb(m_iNTColorArgb);
			}
		}
		/// <summary>
		/// Gets/sets Color of lines in trees.
		/// </summary>
		[XmlIgnore]
		public Color LinesColor
		{
			get
			{
				return m_LinesColor;
			}
			set
			{
				m_LinesColor = value;
				m_iLinesColorArgb = m_LinesColor.ToArgb();
			}
		}
		/// <summary>
		/// Gets/sets Lines Color ARGB value.  (Do not use this; use LinesColor instead.)
		/// </summary>
		/// For XML Serialization
		public int LinesColorArgb
		{
			get
			{
				return m_iLinesColorArgb;
			}
			set
			{
				m_iLinesColorArgb = value;
				m_LinesColor = Color.FromArgb(m_iLinesColorArgb);
			}
		}
		/// <summary>
		/// Gets/sets Color of Background in trees.
		/// </summary>
		[XmlIgnore]
		public Color BackgroundColor
		{
			get
			{
				return m_BackgroundColor;
			}
			set
			{
				m_BackgroundColor = value;
				m_iBackgroundColorArgb = m_BackgroundColor.ToArgb();
			}
		}
		/// <summary>
		/// Gets/sets Background Color ARGB value.  (Do not use this; use BackgroundColor instead.)
		/// </summary>
		/// For XML Serialization
		public int BackgroundColorArgb
		{
			get
			{
				return m_iBackgroundColorArgb;
			}
			set
			{
				m_iBackgroundColorArgb = value;
				m_BackgroundColor = Color.FromArgb(m_iBackgroundColorArgb);
			}
		}
		/// <summary>
		/// Gets/sets Line width.
		/// </summary>
		public double LineWidth
		{
			get
			{
				return m_dLineWidth;
			}
			set
			{
				m_dLineWidth = value;
			}
		}
		/// <summary>
		/// Gets/sets custom colors.
		/// </summary>
		public int[] CustomColors
		{
			get
			{
				return m_aiCustomColors;
			}
			set
			{
				m_aiCustomColors = value;
			}
		}
		public int GetMaxLevelHeight(int iLevel)
		{
			return m_aiMaxLevelHeights[iLevel];
		}
		public void SetMaxLevelHeight(int iLevel, int iHeight)
		{
			m_aiMaxLevelHeights[iLevel] = iHeight;
		}
		public void setFontsFromXml()
		{
			NTFont = new Font(m_strNTFontFace, m_fNTFontSize, m_NTFontStyle);
			NTColor = Color.FromArgb(NTColorArgb);
			GlossFont = new Font(m_strGlossFontFace, m_fGlossFontSize, m_GlossFontStyle);
			GlossColor = Color.FromArgb(GlossColorArgb);
			LexFont = new Font(m_strLexFontFace, m_fLexFontSize, m_LexFontStyle);
			LexColor = Color.FromArgb(LexColorArgb);
			this.LinesColor= Color.FromArgb(LinesColorArgb);

		}
	}
}
