(* ************************************************************
 KEYNOTE: MOZILLA PUBLIC LICENSE STATEMENT.
 -----------------------------------------------------------
 The contents of this file are subject to the Mozilla Public
 License Version 1.1 (the "License"); you may not use this file
 except in compliance with the License. You may obtain a copy of
 the License at http://www.mozilla.org/MPL/

 Software distributed under the License is distributed on an "AS
 IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 implied. See the License for the specific language governing
 rights and limitations under the License.

 The Original Code is KeyNote 1.0.

 The Initial Developer of the Original Code is Marek Jedlinski
 <marekjed@pobox.com> (Poland).
 Portions created by Marek Jedlinski are
 Copyright (C) 2000, 2001. All Rights Reserved.
 -----------------------------------------------------------
 Contributor(s):
 -----------------------------------------------------------
 History:
 -----------------------------------------------------------
 Released: 30 June 2001
 -----------------------------------------------------------
 URLs:

 - for OpenSource development:
 http://keynote.sourceforge.net

 - original author's software site:
 http://www.lodz.pdi.net/~eristic/free/index.html
 http://go.to/generalfrenetics

 Email addresses (at least one should be valid)
 <eristic@lodz.pdi.net>
 <cicho@polbox.com>
 <cicho@tenbit.pl>

************************************************************ *)

unit kn_Const;

interface
uses Windows, ShellAPI, Graphics, Messages;

const
  LANGUAGE_DEFAULT = 'English (Internal)';
  LANGUAGE_DIR = 'Lang\';

{ Experimental stuff for RichEdit v.3 }
const
  EM_GETZOOM = WM_USER+224;
  EM_SETZOOM = WM_USER+225;
  EM_SETTYPOGRAPHYOPTIONS	= WM_USER + 202;
  TO_ADVANCEDTYPOGRAPHY = 1;

const
  // various global declarations
  _IS_OLD_KEYNOTE_FILE_FORMAT  : boolean = false;
  _USE_OLD_KEYNOTE_FILE_FORMAT : boolean = false;
  _TEST_KEYNOTE_FILE_VERSION   : boolean = true;
  _ALLOW_VCL_UPDATES           : boolean = false;
  _ALLOW_TREE_FONT_COLOR       : boolean = true;
  _OTHER_INSTANCE_HANDLE       : hwnd = 0;
  _SAVE_RESTORE_CARETPOS       : boolean = false;
  _DEFAULT_KEY_REPLAY_DELAY    : integer = 250; // miliseconds!!
  _LISTBOX_ALT_COLOR           : TColor = clInfoBk;

const
  _PLUGIN_FOLDER     = 'plugins\';
  _MACRO_FOLDER      = 'macros\';
  _TEMPLATE_FOLDER   = 'templates\';

const
  // help file topics
  _HLP_KNTFILES      = 70;
  // _HELP_DRAGDROP     = ??;

const
  TOKEN_NEWLINE = '\n';
  TOKEN_TAB     = '\t';

const
  _REMOVABLE_MEDIA_VNODES_DENY  = 0;
  _REMOVABLE_MEDIA_VNODES_WARN  = 1;
  _REMOVABLE_MEDIA_VNODES_ALLOW = 2;

const
  NFHDR_ID           = 'GFKNT'; // KeyNote file header ID
  NFHDR_ID_OLD       = 'GFKNX'; // KeyNote token text file header ID
  NFHDR_ID_ENCRYPTED = 'GFKNE'; // encrypted KeyNote file header ID
  NFILEVERSION_MAJOR = '2';     // and version numbers
  // NFILEVERSION_MAJOR = '1';     // non-tree version ID, obsolete
  NFILEVERSION_MINOR = '0';     //
  NENCFILEVER_MAJOR  = '1';     // and version numbers
  NENCFILEVER_MINOR  = '0';     //

const
  FLAGS_STRING_LENGTH  = 24; // can store up to 24 booleans
  DEFAULT_FLAGS_STRING = '000000000000000000000000';
  TREENOTE_FLAG_BASE   = 12; // chars 1-12 are for both types of notes; chars 13-24 are only used by tree-type notes

type
  TFlagsString = string[FLAGS_STRING_LENGTH];

const // IDs for older file versions
  NFILEVERSION_MAJOR_NOTREE = '1'; // MAJOR version number for new format files that do NOT have trees
  NFILEVERSION_MAJOR_OLD    = '1'; // version numbers for old-style file format
  NFILEVERSION_MINOR_OLD    = '0'; // DO NOT CHANGE!

const
  _NF_AID = '!'; // Application ID
  _NF_DCR = 'C'; // Date Created
  _NF_CNT = '*'; // Count of notes
  _NF_FCO = '?'; // File comment
  _NF_FDE = '/'; // File description
  _NF_ACT = '$'; // Active note
  _NF_ReadOnlyOpen  = 'R'; // open file as read-only
  _NF_ShowTabIcons  = 'I'; // per-FILE setting
  _NF_ClipCapNote   = 'L'; // index of ClipCapNote
  _NF_TrayIconFile  = 'T'; // tray icon file to load
  _NF_TabIconsFile  = 'F'; // tab icons file to load
  _NF_FileFlags     = '^'; // "flags" string (24 boolean values)

const
  _NF_Icons_BuiltIn = '@';


const
  BOOLEANSTR            : array[false..true] of char = ( '0', '1' );
  DEF_INDENT_LEN        = 12;
  MIN_COMBO_LENGTH      = 15;    
  DEF_TAB_SIZE          = 4;  // default tab size
  DEF_UNDO_LIMIT        = 32; // undo levels
  TABNOTE_NAME_LENGTH   = 50; // max name length for the note title (ie Tab caption)
  TREENODE_NAME_LENGTH  = 255; // max name length for a tree node
  MAX_COMMENT_LENGTH    = 80;
  MAX_FILENAME_LENGTH   = 127;
  MAX_BOOKMARKS         = 9; // ZERO-based!
  DEFAULT_CAPACITY      = 255; // default capacity for RTF Lines property (to speed up loading)
  DEFAULT_NEW_NOTE_NAME : string = 'New note'; // default name for new notes
  DEFAULT_NEW_NODE_NAME : string = 'New node'; // default name for new tree nodes
  DEFAULT_NODE_IMGINDEX : integer = 0;
  TRRENODE_SELIDX       = 4;
  MIN_PASS_LEN          = 5; // minimum length of file access passphrase
  MAX_BACKUP_LEVEL      = 9; // max number of backup files to keep
  MAX_NAVHISTORY_COUNT  = 100; // number of navigation history locations to maintain

const
  _TokenChar            = '%';

const
  // tokens for new tree nodes
  NODEINSDATE           = '%D'; // expands to current date
  NODEINSTIME           = '%T'; // expands to current time
  NODECOUNT             = '%C'; // expands to count of nodes
  NODELEVEL             = '%L'; // expands to node's level
  NODEABSINDEX          = '%A'; // expands to node's absolute index
  NODEINDEX             = '%I'; // expands to node's index
  NODEPARENT            = '%P'; // expands to node's parent's name
  NODENOTENAME          = '%N'; // expands to name of current note
  NODEFILENAME          = '%F'; // expands to current file name

const
  // tokens for exporting to text and rtf
  EXP_NOTENAME          = 'N';
  EXP_NODENAME          = 'D';
  EXP_NODELEVEL         = 'L';
  EXP_NODEINDEX         = 'I';
  EXP_FILENAME          = 'F';
  EXP_RTF_HEADING       = _TokenChar + 'HEADING';

  _DefaultNodeHeading = '--- ' + _TokenChar + EXP_NODENAME + ' ---';
  _DefaultNoteHeading = '=== ' + _TokenChar + EXP_NOTENAME + ' ===';



const
  _Default_NoteHeadingTpl =
    '{\rtf1\ansi\ansicpg1250\deff0{\fonttbl{\f0\fnil\fcharset238{\*\fname Courier New;}Courier New CE;}}' + #13#10 +
    '{\colortbl ;\red96\green96\blue96;}' + #13#10 +
    '\viewkind4\uc1\pard\cf1\lang1033\f0\fs32\par' + #13#10 +
    '\b %HEADING\par' + #13#10 +
    '\b0\par' + #13#10 +
    '}';
  _Default_NodeHeadingTpl =
    '{\rtf1\ansi\ansicpg1250\deff0{\fonttbl{\f0\fnil\fcharset238{\*\fname Courier New;}Courier New CE;}}' + #13#10 +
    '{\colortbl ;\red96\green96\blue96;}' + #13#10 +
    '\viewkind4\uc1\pard\cf1\lang1033\f0\fs24\par' + #13#10 +
    '\ul\b %HEADING\ulnone\b0\par' + #13#10 +
    '\par' + #13#10 +
    '}';

const
  _VIRTUAL_NODE_ERROR_CHAR = '?';
  _ZOOM_STEP = 10;
  _ZOOM_MIN = 5;

const
  // tokens for clipboard capture separator line
  CLIPDIVCHAR           = '^';  // replaced with 1 blank line
  CLIPDATECHAR          = NODEINSDATE; // inserts date
  CLIPTIMECHAR          = NODEINSTIME; // inserts time

const
  // tokens for the MailOptions.FirstLine string
  // (placed as first line of the email sent from keyNote)
  // These tokens may also be used in the Subject line of the email
  MAILFILENAME          = '%F'; // expands to name of attached file (not: KeyNote file, because that is irrelevant)
  MAILNOTENAME          = '%N'; // expands to name of current note
  MAILKEYNOTEVERSION    = '%V'; // expands to KeyNote plug
  MAILNOTECOUNT         = '%C'; // expands to number of notes being sent

const
  _NF_TabNote         = '%';    // end-of-record (new TTabNote begins)
  _NF_EOF             = '%%';   // end-of-file (last line in file)
  _NF_RTF             = '%:';   // end of note header; RTF data follows
  _NF_TreeNote        = '%+';   // TTreeNote begins
  _NF_TRN             = '%-';   // Tree node begins (many tree nodes within a single note)
  _NF_COMMENT         = '#';    // comment, but this is really used for file header information
  _NF_WARNING         = _NF_COMMENT + ' This is an automatically generated file. Do not edit.';
  _NF_PLAINTEXTLEADER = ';';

const
  _SHORTDATEFMT  = 'dd-MM-yyyy'; // all these are only internal defaults
  _LONGDATEFMT   = 'd MMMM yyyy';
  _LONGTIMEFMT   = 'HH:mm:ss';
  _DATESEPARATOR = '-';
  _TIMESEPARATOR = ':';
  _CRLF          = #13#10;

const
  // function key customization
  _KEY_FUNC_DELIMITER = '|';
  _KEY_FUNC_MACRO     = 'M';
  _KEY_FUNC_PLUGIN    = 'P';
  _KEY_FUNC_STYLE     = 'S';
  _KEY_FUNC_FONT      = 'F';
  _KEY_FUNC_TEMPLATE  = 'T';


const
  _NODE_COLOR_COUNT = 8; // times 2, dark and bright shades
  _NODE_COLORS_DARK : array[0.._NODE_COLOR_COUNT] of TColor = (
    clDefault, // 0
    clBlack,   // 1
    clMaroon,  // 2
    clGreen,   // 3
    clOlive,   // 4
    clNavy,    // 5
    clPurple,  // 6
    clTeal,    // 7
    clGray     // 8
  );

  _NODE_COLORS_LIGHT : array[0.._NODE_COLOR_COUNT] of TColor = (
    clDefault, // 9 (unused!)
    clSilver,  // 10
    clRed,     // 11
    clLime,    // 12
    clYellow,  // 13
    clBlue,    // 14
    clFuchsia, // 15
    clAqua,    // 16
    clWhite    // 17
  );

                
const
  // Dart Notes specific defines
  _DART_STOP  = #7;
  _DART_ID    = 'Notes';
  _DART_VER   = '1670';
  _DART_VEROK = '871';

const
  // indices for tree node icons
  ICON_FOLDER          = 0;
  ICON_BOOK            = 2;
  ICON_NOTE            = 4;
  ICON_VIRTUAL         = 6;
  {
  ICON_VIRTUALTEXT     = 6; // same as ICON_VIRTUAL
  ICON_VIRTUALRTF      = 8;
  ICON_VIRTUALHTML     = 10;
  }
  ICON_VIRTUALIELOCAL  = 8;  { not implemented }
  ICON_VIRTUALIEREMOTE = 10; { not implemented }

type
  TVirtualMode = (
    vmNone, vmText, vmRTF, vmHTML, vmIELocal, vmIERemote
  );


const
  // menu item tags for dynamically associated commands
  ITEM_STYLE_APPLY = 90;
  ITEM_STYLE_RENAME = 91;
  ITEM_STYLE_DELETE = 92;
  ITEM_STYLE_REDEFINE = 93;
  ITEM_STYLE_DESCRIBE = 94;

  ITEM_TAG_TRIMLEFT  = 1;
  ITEM_TAG_TRIMRIGHT = 2;
  ITEM_TAG_TRIMBOTH  = 3;


type
  // supported save/load formats
  TNoteFileFormat = (
    nffKeyNote, nffEncrypted, nffDartNotes
  );

const
  FILE_FORMAT_NAMES : array[TNoteFileFormat] of string = (
    'Keynote native',
    'Keynote encrypted',
    'Dart Notes'
  );

type
  TNoteType = (
    ntRTF, // standard RichEdit control
    ntTree // tree panel plus richedit control (tree-type note)
  );
  TNoteNameStr = string[TABNOTE_NAME_LENGTH];

const
  TABNOTE_KIND_NAMES : array[TNoteType] of string = (
    'Standard Rich text editor',
    'Multi-level tree'
  );

  TABNOTE_KIND_IDS : array[TNoteType] of string = (
    'RTF',
    'TRN'
  );

type
  TNavDirection = (
    navUp, navDown, navLeft, navRight
  );

type
  TSearchMode = (
    smPhrase, smAll, smAny
  );

type
  TPasteNodeNameMode = (
    pnnClipboard, pnnDate, pnnTime, pnnDateTime, pnnSelection
  );

const
  SEARCH_MODES : array[TSearchMode] of string = (
    'Exact phrase', 'All the words', 'Any of the words'
  );

type
  TTreeSelection = (
    tsNode, tsSubtree, tsCheckedNodes, tsFullTree
  );

const
  TREE_SELECTION_NAMES : array[TTreeSelection] of string = (
    'Current node', 'Current node and subtree', 'Checked nodes', 'Full tree'
  );

type
  TExportFmt = (
    xfPlainText, xfRTF, xfHTML,
    xfTreePad
  );

const
  EXPORT_FORMAT_NAMES : array[TExportFmt] of string = (
    'Plain text',
    'Rich text (RTF)',
    'HTML',
    'TreePad'
  );

type
  TExportSource = (
    expCurrentNote, expAllNotes, expSelectedNotes
  );

type
  TNodeIconKind = (
    niNone, niStandard, niCustom 
  );

const
  NODE_ICON_KINDS : array[TNodeIconKind] of string = (
    'None', 'Standard icons', 'Custom icons'
  );

{
const
  KNT_URL_PREFIX = 'knt://'; NOT USED
}

type
  TLinkType = (
    lnkURL, lnkEmail, lnkFile, lnkKNT
  );
  // IMPORTANT: lnkKNT MUST be LAST in the sequence, i.e.
  // must be equal to "high( TLinkType )"
  // kn_Hyperlink.pas relies on it while creating the form controls

const
  LINK_TYPES : array[TLinkType] of string = (
    'Internet address',
    'Email address',
    'File or folder',
    'KeyNote location'
  );


const
  KNTLOCATION_MARK_OLD = '?'; // old style links to KNT locations: use note and node names
  KNTLOCATION_MARK_NEW = '*'; // new style links to KNT locations: use note and node IDs

type
  TKNTURL = (
    // urlKNT, UNUSED custom knt:// URL scheme which we use for internal keynote links (only used with version 3 of riched20.dll)
    urlFile, urlHTTP, urlHTTPS, urlFTP, urlMailto,
    urlTelnet, urlNews, urlNNTP, urlGopher, urlWais, urlProspero
  );

const
  KNT_URLS : array[TKNTURL] of string = (
    {'knt:', } 'file:', 'http:', 'https:', 'ftp:', 'mailto:',
    'telnet:', 'news:', 'nntp:', 'gopher:', 'wais:', 'prospero:'
  );

type
  // supported enbcryption algorithms.
  // KeyNote uses DCPCrypt library by David Barton
  // http://www.devarchive.com/DCPcrypt.html
  // (do a web search for "DCPCrypt" if this link goes 404)
  TCryptMethod = (
    tcmBlowfish, tcmIdea
  );

const
  CRYPT_METHOD_NAMES : array[TCryptMethod] of string = (
    'Blowfish', 'Idea'
  );

const
  ID_STR_LENGTH = 5; // GFKNT, GFKNX, GFKNE, Notes

type
  // In encrypted files, this is saved in cleartext
  TNoteFileVersion = packed record
    ID : array[1..ID_STR_LENGTH] of char;
    Major, Minor : char;
  end;

type
  // In encrypted files, this is saved in cleartext
  TEncryptedFileInfo = packed record
    Method : TCryptMethod;
    DataSize : integer;
    NoteCount : integer;
  end;

type
  TCommentStr = string[MAX_COMMENT_LENGTH];

type
  TNodeInsertMode = (
    tnTop,
    tnInsertBefore,
    tnAddLast,
    tnAddChild,
    tnAddAfter
  );

type
  TTreeExpandMode = (
    txmFullCollapse, // show tree fully collapsed
    txmActiveNode, // expand only the node that was last active
    txmTopLevelOnly, // expand only top level nodes
    txmExact, // show nodes expanded or collapsed exactly as saved
    txmFullExpand // show tree fully expanded
  );

const
  TREE_EXPAND_MODES : array[TTreeExpandMode] of string = (
    'Show tree fully collapsed',
    'Expand only last active node',
    'Expand only top level nodes',
    'Restore expanded state of all nodes',
    'Show tree fully expanded'
  );

type
  TClipNodeNaming = (
    clnDefault, clnClipboard, clnDateTime
  );

const
  CLIP_NODE_NAMINGS : array[TClipNodeNaming] of string = (
    'Default node name',
    'Use clipboard text',
    'Use current date and time'
  );



const
  // TREEPAD export/import constants
  _TREEPAD_HEADER_TXT = '<Treepad version 2.7>';
  _TREEPAD_HEADER_RTF = '<Treepad version 3.1>';
  _TREEPAD_MAGIC      = '5P9i0s8y19Z';
  _TREEPAD_NODE       = '<node>';
  _TREEPAD_ENDNODE    = '<end node> ' + _TREEPAD_MAGIC;
  _TREEPAD_TXTNODE    = 'dt=text';
  _TREEPAD_RTFNODE    = 'dt=RTF';

type
  TFocusMemory = ( focNil, focRTF, focTree );

type
  TDropFileAction = (
    factUnknown,
    factOpen,
    factExecute, // macros and plugins only
    factMerge,
    factImport,
    factHyperlink,
    factImportAsNode,
    factMakeVirtualNode
    {$IFDEF WITH_IE}
    ,
    factMakeVirtualIENode
    {$ENDIF}

  );
  TDropFileActions = array[TDropFileAction] of boolean;

const
  FactStrings : array[TDropFileAction] of string = (
    '',
    'Open file in KeyNote',
    'Execute (macro or plugin)',
    'Merge notes into current file',
    'Import as a new note',
    'Create hyperlink to file',
    'Import as tree nodes',
    'Import as virtual tree nodes'
    {$IFDEF WITH_IE}
    ,
    'Import as Internet Explorer virtual node'
    {$ENDIF}

  );


type
  THTMLImportMethod = (
    htmlSource, htmlWindowsNative, htmlOffice, htmlIE
  );

const
  HTMLImportMethods : array[THTMLImportMethod] of string = (
    'No conversion (import HTML source)',
    'Convert using Windows native converters',
    'Convert using MS Office converters',
    'Convert using Internet Explorer'
  );

type
  TDartNotesHdr = packed record
    BlockLen : integer;
    ID : array[1..ID_STR_LENGTH] of char;
    TabCount : integer; // NOT IN DART NOTES FILE HEADER!
    Ver : integer;
    MinVer1 : integer;
    MinVer2 : integer;
    LastTabIdx : integer;
  end;

type
  TNoteChromeIniStr = record
    Section,
    BGColor,
    BGHiColor,
    FontCharset,
    FontColor,
    FontHiColor,
    FontHiStyle,
    FontName,
    FontSize,
    FontStyle : string;
  end;

const
  NoteChromeIniStr : TNoteChromeIniStr = (
    Section : 'NoteChrome';
    BGColor : 'BGColor';
    BGHiColor : 'BGHiColor';
    FontCharset : 'FontCharset';
    FontColor : 'FontColor';
    FontHiColor : 'FontHiColor';
    FontHiStyle : 'FontHiStyle';
    FontName : 'FontName';
    FontSize : 'FontSize';
    FontStyle : 'FontStyle'
  );

const
  // common tokens for all notes
  _AutoIndent = 'AI';
  _BookMarks = 'BM';
  _CHBGColor = 'BG';
  _CHBGHiColor = 'BH';
  _CHFontCHarset = 'CH';
  _CHFontColor = 'FC';
  _CHFontHiColor = 'FH';
  _CHFontHiStyle = 'SH';
  _CHFontName = 'FN';
  _CHFontSize = 'FS';
  _CHFontStyle = 'ST';
  _CHLanguage = 'LN';
  _DateCreated = 'DC';
  _ImageIndex = 'II';
  _Info = 'NI';
  _LineCount = 'LC';
  _Lines = 'LI';
  _NoteKind = 'NK';
  _NoteName = 'NN';
  _NoteID = 'ID';
  _PosX = 'CX';
  _POSY = 'CY';
  _TabIndex = 'TI';
  _TabSize = 'TS';
  _Flags = 'FL';
  _NodeFlags = 'NF';

  (* UNUSED, replaced by _Flags: *)
  _ReadOnly = 'RO';
  _WordWrap = 'WW';
  _URLDetect = 'UD';
  _Visible = 'NV';
  _UseTabChar = 'UT';

  _AutoNumberNodes = 'AN';
  _ShowCheckBoxes = 'SC';
  _ShowIcons = 'SI';


const
  // special TTreeNote tokens
  _NodeName = 'ND';
  _NodeID = 'DI';
  _NodeLevel = 'LV';
  _SelectedNode = 'SN';
  _TreeWidth = 'TW';
  _VirtualFN = 'VF';
  _RelativeVirtualFN = 'RV';
  _NodeRTFBGColor = 'BC';
  _DefaultNodeName = 'EN';
  _NodeSelStart = 'SS';
  _NodeColor = 'HC';
  _NodeBGColor = 'HB';
  _NodeFontFace = 'FF';
  _CHTRBGColor = 'TB';
  _CHTRFontCharset = 'TH';
  _CHTRFontColor = 'TC';
  _CHTRFontName = 'TN';
  _CHTRFontSize = 'TZ';
  _CHTRFontStyle = 'TY';
  _NodeImageIndex = 'IX';
  _NodeAlarm = 'NA';        // [dpv]

const
  // special FlagsStr constant characters
  _FlagHasNodeColor = 'N';
  _FlagHasNodeBGColor = 'B';
  _FlagHasNodeColorBoth = 'A';
  _FlagHasNodeColorNone = '0';


const
  alph13 = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz';
  alph13UP = 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ';

{$IFDEF WITH_IE}
type
  TIECommand = (
    ieNone, ieNavigate, ieStop, ieRefresh,
    ieGoHome, ieGoBack, ieGoNext, ieGoBlank
  );
{$ENDIF}

(*
t - ShortTieFormat
tt - LongTimeFormat

c - ShortDateFormat + LongTimeFormat

ddddd - ShortDateFormat
dddddd - LongDateFormat


=====================


*)


type
  TSymbolCode = record
    Code : byte;
    Name : string;
  end;

const
  SYMBOL_NAME_LIST : array[1..10] of string = (
    'Euro',
    'Copyright',
    'Registered trademark',
    'Trademark',
    'Paragraph',
    'Degree',
    'Plus/minus',
    'Dots',
    'French parenthesis (left)',
    'French parenthesis (right)'
  );
  SYMBOL_CODE_LIST : array[1..10] of char = (
    #128, // Euro
    #169, // copy
    #174, // reg
    #153, // tm
    #167, // para
    #176, // deg
    #177, // plusminus
    #133, // dots
    #171, // left french brace
    #187 // right french brace
  );

implementation

end.


