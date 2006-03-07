object fMain: TfMain
  Left = 557
  Top = 445
  AutoScroll = False
  Caption = 'PackageEditor'
  ClientHeight = 374
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 132
    Top = 52
    Width = 481
    Height = 226
    Align = alClient
    Images = ilMain
    MultiLine = True
    PopupMenu = pmTabs
    TabOrder = 0
    OnChange = pcMainChange
    OnChanging = pcMainChanging
  end
  object dkTop: TTBXDock
    Left = 0
    Top = 0
    Width = 622
    Height = 52
    PopupMenu = pmToolbars
    object tbMenu: TTBXToolbar
      Left = 0
      Top = 0
      Caption = 'Main menu'
      ChevronHint = 'More Buttons|Show more buttons'
      CloseButton = False
      DefaultDock = dkTop
      DockPos = -5
      Images = ilMain
      MenuBar = True
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      object smFile: TTBXSubmenuItem
        Caption = '&File'
        object smFileNew: TTBXSubmenuItem
          Caption = '&New'
          HelpContext = 301
          Hint = 'Create new object'
          object iFileNewFunction: TTBXItem
            Tag = 1
            Caption = '&1. Function'
            HelpContext = 301
            Hint = 'Create new FUNCTION object'
            ImageIndex = 2
            OnClick = zzNewObject
          end
          object iFileNewPackage: TTBXItem
            Tag = 2
            Caption = '&2. Package'
            HelpContext = 301
            Hint = 'Create new PACKAGE object'
            ImageIndex = 3
            OnClick = zzNewObject
          end
          object iFileNewProcedure: TTBXItem
            Tag = 3
            Caption = '&3. Procedure'
            HelpContext = 301
            Hint = 'Create new PROCEDURE object'
            ImageIndex = 4
            OnClick = zzNewObject
          end
        end
        object iOpen: TTBXItem
          Action = aOpen
        end
        object iSave: TTBXItem
          Action = aSave
        end
        object iSaveAs: TTBXItem
          Action = aSaveAs
        end
        object iCloseFile: TTBXItem
          Action = aCloseFile
        end
        object iFileSep1: TTBXSeparatorItem
        end
        object iDisconnect: TTBXItem
          Action = aDisconnect
        end
        object iConnect: TTBXItem
          Action = aConnect
        end
        object iFileSep2: TTBXSeparatorItem
        end
        object iExit: TTBXItem
          Action = aExit
        end
        object iFileSep3: TTBXSeparatorItem
        end
        object iFileMRU: TTBXMRUListItem
          MRUList = tbmruMain
        end
      end
      object smEdit: TTBXSubmenuItem
        Caption = '&Edit'
        object iUndo: TTBXItem
          Action = aUndo
        end
        object iRedo: TTBXItem
          Action = aRedo
        end
        object iEditSep1: TTBXSeparatorItem
        end
        object iCut: TTBXItem
          Action = aCut
        end
        object iCopy: TTBXItem
          Action = aCopy
        end
        object iPaste: TTBXItem
          Action = aPaste
        end
        object iEditSep2: TTBXSeparatorItem
        end
        object iFind: TTBXItem
          Action = aFind
        end
        object iReplace: TTBXItem
          Action = aReplace
        end
        object iSearchAgain: TTBXItem
          Action = aSearchAgain
        end
        object iEditSep3: TTBXSeparatorItem
        end
        object iKeyMacroRecord: TTBXItem
          Action = aKeyMacroRecord
        end
        object iKeyMacroPause: TTBXItem
          Action = aKeyMacroPause
        end
        object iKeyMacroPlay: TTBXItem
          Action = aKeyMacroPlay
        end
      end
      object smView: TTBXSubmenuItem
        Caption = '&View'
        object iToggleGeneral: TTBVisibilityToggleItem
          Caption = '&General toolbar'
          Control = tbMain
          Hint = 'Toggle General toolbar'
        end
        object iToggleObjProps: TTBVisibilityToggleItem
          Caption = '&Object Properties toolbar'
          Control = tbObject
          Hint = 'Toggle Object Properties toolbar'
        end
        object iToggleMacro: TTBVisibilityToggleItem
          Caption = '&Macro toolbar'
          Control = tbMacro
          Hint = 'Toggle Macro toolbar'
        end
        object iToggleNavList: TTBVisibilityToggleItem
          Caption = '&Navigation List'
          Control = dpNav
          Hint = 'Toggle Navigation List window'
        end
        object iToggleResults: TTBVisibilityToggleItem
          Caption = '&Compilation/Execution Results'
          Control = dpResults
          Hint = 'Toggle Compilation/Execution Results toolbar'
        end
        object iToggleStatusBar: TTBVisibilityToggleItem
          Caption = '&Status bar'
          Control = sbarMain
          Hint = 'Toggle status bar'
        end
        object iVewSep: TTBXSeparatorItem
        end
        object iPreferences: TTBXItem
          Action = aPreferences
        end
      end
      object smObject: TTBXSubmenuItem
        Caption = '&Object'
        object iCompile: TTBXItem
          Action = aCompile
        end
        object iRetrieveObject: TTBXItem
          Action = aRetrieveObject
        end
        object iDropObject: TTBXItem
          Action = aDropObject
        end
        object iObjectSep1: TTBXSeparatorItem
        end
        object iRefreshStatus: TTBXItem
          Action = aRefreshStatus
          Caption = '&Refresh status'
          Hint = 'Refresh status|Refresh current object'#39's compilation status'
        end
      end
      object smHelp: TTBXSubmenuItem
        Caption = '&Help'
        object iHelpContents: TTBXItem
          Action = aHelpContents
          ImageIndex = 30
        end
        object iAbout: TTBXItem
          Action = aAbout
        end
      end
    end
    object tbMain: TTBXToolbar
      Left = 169
      Top = 0
      Caption = 'General'
      ChevronHint = 'More Buttons|Show more buttons'
      DefaultDock = dkTop
      Images = ilMain
      TabOrder = 1
      object bDisconnect: TTBXItem
        Action = aDisconnect
      end
      object bConnect: TTBXItem
        Action = aConnect
      end
      object tbsMain1: TTBXSeparatorItem
      end
      object bsmNew: TTBXSubmenuItem
        Caption = '&New object'
        Hint = 'New object|Invokes menu for creating new object'
        ImageIndex = 9
        LinkSubitems = smFileNew
        Options = [tboDropdownArrow]
      end
      object bOpen: TTBXSubmenuItem
        Action = aOpen
        DropdownCombo = True
        object iOpenMRU: TTBXMRUListItem
          MRUList = tbmruMain
        end
      end
      object bSave: TTBXItem
        Action = aSave
      end
      object bSaveAs: TTBXItem
        Action = aSaveAs
      end
      object tbsMain2: TTBXSeparatorItem
      end
      object bUndo: TTBXItem
        Action = aUndo
      end
      object bRedo: TTBXItem
        Action = aRedo
      end
      object bCut: TTBXItem
        Action = aCut
      end
      object bCopy: TTBXItem
        Action = aCopy
      end
      object bPaste: TTBXItem
        Action = aPaste
      end
      object tbsMain3: TTBXSeparatorItem
      end
      object bFind: TTBXItem
        Action = aFind
      end
      object bReplace: TTBXItem
        Action = aReplace
      end
      object tbsMain4: TTBXSeparatorItem
      end
      object bCompile: TTBXItem
        Action = aCompile
      end
      object bRefreshStatus: TTBXItem
        Action = aRefreshStatus
      end
      object TBSeparatorItem5: TTBXSeparatorItem
      end
      object bExit: TTBXItem
        Action = aExit
      end
    end
    object tbObject: TTBXToolbar
      Left = 0
      Top = 26
      Caption = 'Object'
      ChevronHint = 'More Buttons|Show more buttons'
      DefaultDock = dkTop
      DockableTo = [dpTop, dpBottom]
      DockPos = -15
      DockRow = 1
      Images = ilMain
      TabOrder = 2
      object tbsmObjType: TTBXSubmenuItem
        Caption = '(object type)'
        DisplayMode = nbdmImageAndText
        Hint = 'Object type|Select current object'#39's type (not undoable!)'
        ImageIndex = 3
        Options = [tboDropdownArrow]
        object iSetObjFunction: TTBItem
          Tag = 1
          Caption = '&Function'
          Hint = 'Function|Set current object type to function (not undoable!)'
          ImageIndex = 2
          OnClick = SetObjectTypeClick
        end
        object iSetObjPackage: TTBItem
          Tag = 2
          Caption = '&Package'
          Hint = 'Package|Set current object type to package (not undoable!)'
          ImageIndex = 3
          OnClick = SetObjectTypeClick
        end
        object iSetObjProcedure: TTBItem
          Tag = 3
          Caption = 'P&rocedure'
          Hint = 'Procedure|Set current object type to procedure (not undoable!)'
          ImageIndex = 4
          OnClick = SetObjectTypeClick
        end
      end
      object tbgiObjName: TTBGroupItem
        object eObjName: TTBXEditItem
          Caption = 'Object name'
          EditCaption = 'Object name'
          EditWidth = 250
          Hint = 'Object name|Specifies the name of the object being edited'
          OnAcceptText = eObjNameAcceptText
        end
      end
      object bRetrieveObject: TTBXItem
        Action = aRetrieveObject
      end
      object bDropObject: TTBXItem
        Action = aDropObject
      end
    end
    object tbMacro: TTBXToolbar
      Left = 404
      Top = 26
      Caption = 'Macro'
      DockPos = 403
      DockRow = 1
      Images = ilMain
      TabOrder = 3
      Visible = False
      object bKeyMacroRecord: TTBXItem
        Action = aKeyMacroRecord
      end
      object bKeyMacroPause: TTBXItem
        Action = aKeyMacroPause
      end
      object bKeyMacroPlay: TTBXItem
        Action = aKeyMacroPlay
      end
    end
  end
  object dkLeft: TTBXDock
    Left = 0
    Top = 52
    Width = 132
    Height = 226
    FixAlign = True
    PopupMenu = pmToolbars
    Position = dpLeft
    object dpNav: TTBXDockablePanel
      Left = 0
      Top = 0
      Caption = 'Navigation'
      DefaultDock = dkLeft
      PopupMenu = pmToolbars
      SupportedDocks = [dkStandardDock, dkMultiDock]
      TabOrder = 0
      object tvNav: TVirtualStringTree
        Left = 0
        Top = 0
        Width = 128
        Height = 204
        Align = alClient
        DefaultNodeHeight = 16
        Header.AutoSizeIndex = 0
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'MS Shell Dlg 2'
        Header.Font.Style = []
        Header.MainColumn = -1
        Header.Options = [hoColumnResize, hoDrag]
        HintMode = hmHint
        HotCursor = crHandPoint
        Images = ilMain
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toDisableAutoscrollOnFocus]
        TreeOptions.PaintOptions = [toHideSelection, toHotTrack, toShowButtons, toShowDropmark, toShowTreeLines, toThemeAware, toUseBlendedImages, toAlwaysHideSelection]
        TreeOptions.StringOptions = [toSaveCaptions, toShowStaticText, toAutoAcceptEditChange]
        OnBeforeItemErase = tvNavBeforeItemErase
        OnClick = tvNavClick
        OnFreeNode = tvNavFreeNode
        OnGetText = tvNavGetText
        OnPaintText = tvNavPaintText
        OnGetImageIndex = tvNavGetImageIndex
        OnGetHint = tvNavGetHint
        OnKeyAction = tvNavKeyAction
        Columns = <>
        WideDefaultText = ''
      end
    end
  end
  object dkRight: TTBXDock
    Left = 613
    Top = 52
    Width = 9
    Height = 226
    PopupMenu = pmToolbars
    Position = dpRight
  end
  object dkBottom: TTBXDock
    Left = 0
    Top = 278
    Width = 622
    Height = 74
    PopupMenu = pmToolbars
    Position = dpBottom
    object dpResults: TTBXDockablePanel
      Left = 0
      Top = 0
      Caption = 'Results'
      Color = clBtnFace
      DefaultDock = dkBottom
      DockedHeight = 70
      PopupMenu = pmToolbars
      SupportedDocks = [dkStandardDock, dkMultiDock]
      TabOrder = 0
      object tvResults: TVirtualStringTree
        Left = 0
        Top = 0
        Width = 600
        Height = 70
        Align = alClient
        DefaultNodeHeight = 16
        Header.AutoSizeIndex = 2
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'MS Shell Dlg 2'
        Header.Font.Style = []
        Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoShowSortGlyphs]
        HotCursor = crHandPoint
        Images = ilMain
        ScrollBarOptions.ScrollBars = ssVertical
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSpanColumns, toAutoTristateTracking, toAutoDeleteMovedNodes, toDisableAutoscrollOnFocus]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toVariableNodeHeight]
        TreeOptions.PaintOptions = [toHideSelection, toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toAlwaysHideSelection]
        TreeOptions.SelectionOptions = [toFullRowSelect]
        OnClick = tvResultsClick
        OnGetText = tvResultsGetText
        OnPaintText = tvResultsPaintText
        OnGetImageIndex = tvResultsGetImageIndex
        OnInitNode = tvResultsInitNode
        OnMeasureItem = tvResultsMeasureItem
        Columns = <
          item
            Position = 0
            Width = 120
          end
          item
            Position = 1
            Width = 70
          end
          item
            Position = 2
            Width = 406
          end>
        WideDefaultText = ''
      end
    end
  end
  object sbarMain: TTBXStatusBar
    Left = 0
    Top = 352
    Width = 622
    FixAlign = True
    Images = ilMain
    Panels = <
      item
        Caption = '(connected)'
        Hint = 'Connection status (double-click to change)'
        ImageIndex = 20
        MaxSize = 250
        Size = 150
        StretchPriority = 1
        Tag = 0
        TextTruncation = twEndEllipsis
      end
      item
        Alignment = taCenter
        Caption = 'Line: 000000 / Col: 0000'
        Hint = 'Caret position in the current editor'
        Size = 130
        Tag = 0
      end
      item
        Size = 500
        StretchPriority = 1
        Tag = 0
        TextTruncation = twEndEllipsis
      end>
    PopupMenu = pmToolbars
    UseSystemFont = False
    OnPanelDblClick = sbarMainPanelDblClick
  end
  object alMain: TActionList
    Images = ilMain
    Left = 216
    Top = 84
    object aOpen: TAction
      Category = 'File'
      Caption = '&Open...'
      HelpContext = 302
      Hint = 'Open|Open existing object script'
      ImageIndex = 10
      ShortCut = 16463
      OnExecute = aaOpen
    end
    object aSave: TAction
      Category = 'File'
      Caption = '&Save'
      HelpContext = 303
      Hint = 'Save|Save designed object script'
      ImageIndex = 11
      ShortCut = 16467
      OnExecute = aaSave
    end
    object aSaveAs: TAction
      Category = 'File'
      Caption = 'Save &As...'
      HelpContext = 304
      Hint = 'Save as|Save designed object script as'
      ImageIndex = 12
      ShortCut = 123
      OnExecute = aaSaveAs
    end
    object aCloseFile: TAction
      Category = 'File'
      Caption = 'Close'
      HelpContext = 305
      Hint = 'Close|Close current file'
      ImageIndex = 13
      ShortCut = 16499
      SecondaryShortCuts.Strings = (
        'Ctrl+W')
      OnExecute = aaCloseFile
    end
    object aDisconnect: TAction
      Category = 'File'
      Caption = 'D&isconnec&t from server'
      HelpContext = 306
      Hint = 'Disconnect|Break current connection with server'
      ImageIndex = 21
      OnExecute = aaDisconnect
    end
    object aConnect: TAction
      Category = 'File'
      Caption = 'Connec&t to server...'
      HelpContext = 307
      Hint = 'Connect|Establish connection with server'
      ImageIndex = 20
      OnExecute = aaConnect
    end
    object aRetrieveObject: TAction
      Category = 'Object'
      Caption = '&Retrieve object...'
      HelpContext = 308
      Hint = 'Retrieve object...|Retrieve object script text from server'
      ImageIndex = 22
      ShortCut = 16466
      OnExecute = aaRetrieveObject
    end
    object aDropObject: TAction
      Category = 'Object'
      Caption = '&Drop object'
      HelpContext = 309
      Hint = 'Drop object|Drop current object from server'
      ImageIndex = 14
      ShortCut = 41006
      OnExecute = aaDropObject
    end
    object aExit: TAction
      Category = 'File'
      Caption = 'E&xit'
      HelpContext = 310
      Hint = 'Exit|Exit from PackageEditor'
      ImageIndex = 23
      OnExecute = aaExit
    end
    object aUndo: TAction
      Category = 'Edit'
      Caption = '&Undo'
      HelpContext = 503
      Hint = 'Undo|Undo last change'
      ImageIndex = 18
      ShortCut = 16474
      OnExecute = aaUndo
    end
    object aRedo: TAction
      Category = 'Edit'
      Caption = '&Redo'
      HelpContext = 402
      Hint = 'Redo|Redo undone change'
      ImageIndex = 19
      ShortCut = 40968
      OnExecute = aaRedo
    end
    object aCut: TAction
      Category = 'Edit'
      Caption = 'Cu&t'
      HelpContext = 403
      Hint = 'Cut|Cut selected text to clipboard'
      ImageIndex = 15
      ShortCut = 16472
      OnExecute = aaCut
    end
    object aCopy: TAction
      Category = 'Edit'
      Caption = '&Copy'
      HelpContext = 308
      Hint = 'Copy|Copy selected text to clipboard'
      ImageIndex = 16
      ShortCut = 16451
      OnExecute = aaCopy
    end
    object aPaste: TAction
      Category = 'Edit'
      Caption = '&Paste'
      HelpContext = 405
      Hint = 'Paste|Paste text from clipboard'
      ImageIndex = 17
      ShortCut = 16470
      OnExecute = aaPaste
    end
    object aCompile: TAction
      Category = 'Object'
      Caption = '&Compile object'
      HelpContext = 601
      Hint = 'Compile|Compile current object'
      ImageIndex = 27
      ShortCut = 120
      OnExecute = aaCompile
    end
    object aAbout: TAction
      Category = 'Help'
      Caption = '&About PackageEditor...'
      HelpContext = 702
      Hint = 'About|Copyright and version information on PackageEditor'
      ImageIndex = 29
      ShortCut = 16496
      OnExecute = aaAbout
    end
    object aFind: TAction
      Category = 'Edit'
      Caption = '&Find...'
      HelpContext = 406
      Hint = 'Find|Searches the text for specified string'
      ImageIndex = 24
      ShortCut = 16454
      OnExecute = aaFind
    end
    object aReplace: TAction
      Category = 'Edit'
      Caption = '&Replace...'
      HelpContext = 407
      Hint = 
        'Replace|Searches the text for search string and replaces it with' +
        ' another'
      ImageIndex = 25
      ShortCut = 16456
      OnExecute = aaReplace
    end
    object aSearchAgain: TAction
      Category = 'Edit'
      Caption = 'Search &again'
      Hint = 'Search again|Repeat last search'
      ImageIndex = 26
      ShortCut = 114
      OnExecute = aaSearchAgain
    end
    object aPreferences: TAction
      Category = 'View'
      Caption = 'Pro&gram preferences...'
      HelpContext = 504
      Hint = 'Preferences|View/modify program settings'
      ImageIndex = 28
      ShortCut = 115
      OnExecute = aaPreferences
    end
    object aRefreshStatus: TAction
      Category = 'Object'
      Caption = '&Refresh results'
      HelpContext = 505
      Hint = 'Refresh compilation status|Refresh compilation results'
      ImageIndex = 31
      ShortCut = 116
      OnExecute = aaRefreshStatus
    end
    object aHelpContents: TAction
      Category = 'Help'
      Caption = '&Contents'
      HelpContext = 701
      Hint = 'Help|Display help contents'
      ImageIndex = 29
      ShortCut = 112
      OnExecute = aaHelpContents
    end
    object aKeyMacroRecord: TAction
      Category = 'Edit'
      Caption = 'Record/Stop recording keyboard &macro'
      Hint = 
        'Record/Stop recording keyboard macro|Start or Stop recording of ' +
        'keystrokes in the current editor'
      ImageIndex = 32
      ShortCut = 24658
      OnExecute = aaKeyMacroRecord
    end
    object aKeyMacroPause: TAction
      Category = 'Edit'
      Caption = 'Pa&use keyboard macro recording'
      Hint = 'Pause keyboard macro recording'
      ImageIndex = 33
      ShortCut = 24661
      OnExecute = aaKeyMacroPause
    end
    object aKeyMacroPlay: TAction
      Category = 'Edit'
      Caption = 'Pla&y keyboard macro'
      Hint = 
        'Play keyboard macro|Replay recorded keystrokes in the current ed' +
        'itor'
      ImageIndex = 34
      ShortCut = 24656
      OnExecute = aaKeyMacroPlay
    end
  end
  object shSQL: TSynSQLSyn
    DefaultFilter = 'SQL Files (*.sql)|*.sql'
    CommentAttri.Foreground = clFuchsia
    CommentAttri.Style = []
    DataTypeAttri.Foreground = 16744576
    DefaultPackageAttri.Foreground = clBlue
    ExceptionAttri.Foreground = clRed
    FunctionAttri.Foreground = 10329344
    NumberAttri.Foreground = clGreen
    NumberAttri.Style = [fsBold]
    StringAttri.Foreground = clRed
    StringAttri.Style = [fsBold]
    SymbolAttri.Foreground = clBlue
    SymbolAttri.Style = [fsBold]
    SQLDialect = sqlOracle
    Left = 168
    Top = 84
  end
  object osMain: TOraSession
    ConnectPrompt = False
    Left = 216
    Top = 216
  end
  object qMain: TOraQuery
    Session = osMain
    ReadOnly = True
    UniDirectional = True
    Left = 260
    Top = 216
  end
  object ilMain: TTBImageList
    ImagesBitmap.Data = {
      36690000424D3669000000000000360000002800000030020000100000000100
      18000000000000690000E30B0000E30B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFC48871A94C2DAD4D32B5513AB8533DB051399C4D35E4AF9FC8AB9FFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFB58484B58484B58484B58484B58484B5
      8484B58484B58484B58484B58484B58484B58484B58484FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFAD5A5AAD5252A54A4AAD9494C6CEC6CE
      CEC6CECEC6C6CEC6C6CEC6B59C9C9C42429C4242A55252FF00FFFF00FFFF00FF
      AD5A5AAD5252A54A4AAD9494C6CEC6CECEC6CECEC6C6CEC6C6CEC6B59C9C9C42
      429C4242A55252FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB6A8F32B03DE
      2B03DE9180DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF9180DD3516C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFB58C8C8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A
      5A8C5A5A8C5A5AFF00FFFF00FFFF00FFFF00FF1B88CC1B88CC8E5D598E5D598E
      5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8D5251
      8A515087515084504F804F4E7D4F4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF8D52518A515087515084504F804F4E7D4F4EFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF7556537556537556537556537556537556
      53755653755653755653FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C
      6363424242FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A637B
      BD9494FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF4A637BBD9494FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0475000678
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0BA1F10D75BCFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F490B9E5C3A
      B06942C9A08EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF9C9C9C8C847B8C847B8C847B8C847B8C847BA59C94FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFADADADADADADFF00FFFF00FFFF00FFFF00FFADADADADAD
      ADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFA88682755653755653755653755653755653755653755653755653A886
      82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5451BDC5132F45F4BFB6855FC
      715BE86F4ECE5F34F3614DDA54399C5939FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      C6A59CFFEFD6F7E7C6F7DEBDF7DEB5F7D6ADF7D6A5EFCE9CEFCE94EFCE94EFCE
      94F7D69CB58484FF00FFFF00FF29ADD618A5C618A5C618A5C6FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD7B73
      CE6363CE6B6BB55A5A9C8484BDA5A5E7CECEFFF7F7FFFFF7F7F7F7CEB5B59429
      299C3131C65A5AAD5A5AFF00FFBD7B73CE6363CE6B6BB55A5A9C8484BDA5A5E7
      CECEFFF7F7FFFFF7F7F7F7CEB5B59429299C3131C65A5AAD5A5AFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB6A9F3310AE0310AE02900DC5B40D7FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF6047CF6047CF2E08D8FF00FFFF00FF
      FF00FFFF00FFFF00FFAD39008C2900FF00FFFF00FFFF00FFA542008C2900FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58C8CFFF7E7F7
      EFDEF7EFDEF7EFDEF7EFDEF7EFDEF7EFDEF7E7CE8C5A5AFF00FFFF00FFFF00FF
      1B88CC74C7E967C5EBBAB7AAFBE7D3F8EEDCF6EDD7F4E9D3F4E9D0F4E7D0F4E6
      CFF6E7CE8E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF965453E8AEA8E8AEA8E8AEA8E8AEA8E8AEA8804F4E7D
      4F4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF965453E8AEA8
      E8AEA8E8AEA8E8AEA8E8AEA8804F4E7D4F4EFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF75
      565399FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF755653FF00FFFF00FF
      FF00FFFF00FF8C63639C6363BD6363BD6B6B424242FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF6B9CC6188CE74A7BA5C69494FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B9CC6188CE7
      4A7BA5C69494FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF06780017C400077D00FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF1490E60D75BCFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFAD4E0ACB8B61D8A27CB06942B06942B06942C9A08EFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFB8531BB64D14B54A10FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADADADE7CEC6EFDED6F7E7D6F7
      E7D6EFDED6EFDED69F978F8C847BA59C94FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFADADADA8A8A8989898989898A8A8A8FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF072ACA0625B0ADADADFF
      00FFFF00FFFF00FF072ACA0625B0ADADADFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFDAB9B6DAB9B6DAB9B6DAB9B6DAB9B6DA
      B9B6DAB9B6DAB9B6DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA886827556534DBDF14DBDF14D
      BDF14DBDF14DBDF14DBDF1755653A88682FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFD14D29F35F4AFD6F5AFD7C63F47B5CDD9363E1A572F26C51FC6654CA5B
      33FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF119405119005108D061089060F8506FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFC6A59CFFEFD6F7E7CEF7DEC6F7DEBDF7
      D6B5F7D6A5EFCE9CEFCE9CEFCE94EFCE94EFCE9CB58484FF00FFFF00FF29ADD6
      9CDEEF84EFFF4AC6E721ADD618A5C618A5C618A5C618A5C6FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFBD7B73CE6363CE6363B55A5A9C7B7B9C4242B5
      7373E7DEDEFFF7F7FFFFFFD6B5B59431319C3131BD5A5AAD5A5AFF00FFBD7B73
      CE6363CE6363B55A5A9C7B7B9C4242B57373E7DEDEFFF7F7FFFFFFD6B5B59431
      319C3131BD5A5AAD5A5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF937FED
      2B03DF2B03DF2901DA9180DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3715
      CE3715CE3712D9AA9FDFFF00FFFF00FFFF00FFFF00FFC65A00A54200A542008C
      2900FF00FFA54200AD3900AD39008C2900FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFB58C8CF7EFDEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6EFDE
      CEEFDECE8C5A5AFF00FFFF00FF1B88CC8CE1F67FEFFF72EEFFBAB7AAF3DCCFF3
      DDC5F3D5B6F2D4B5F0D3B2F0D1ADEED4B6EBDAC28E5D59FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF008400FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF008400FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF995453E8AEA8
      E8AEA8E8AEA8E8AEA8E8AEA884504F804F4E7D4F4EFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF995453E8AEA8E8AEA8E8AEA8E8AEA8E8AEA884504F80
      4F4E7D4F4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF75565399FFFFDAB9B6DAB9B6DAB9B6DAB9
      B699FFFF99FFFF755653FF00FFFF00FF8C63639C6363C66B6BD66B6BD66B6BC6
      6B6B4242429C63639C63639C63639C63639C63639C6363FF00FF4AB5FF52B5FF
      218CEF4A7BA5C69494FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF4AB5FF52B5FF218CEF4A7BA5C69494FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF405A7F
      B4857CFF00FFFF00FFFF00FFFF00FF026F00037200047500067800077A0017C9
      0018CF000A8200FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1395E714
      90E60D75BCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB5520CD9A581
      FEE5C7FCDCBBF6CEA8E8B288B06942B06942AF724DC9A08EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCD865FB54A10B54A10D6
      9979D69979FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      CEC6BDF7E7D6F7F7F7E7E7E7CEB5A5D6AD94DEC6BDEFF7F7F7EFEFEFDED69F97
      8FA59C94FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
      4A00004A00004A00005A00004A00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADADAD0B6E0D09
      6C0B076A09056806848484949494ADADADFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF072EDA0627B8FF00FFFF00FFFF00FFFF00FF072EDA0627B8FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFE8AEA8FF00FFFF00FFFF00FFFF00FFE8
      AEA8FF00FFFF00FFFF00FFE8AEA8FF00FFFF00FFFF00FFFF00FFFF00FF00567E
      00567E00567E00567E0077AE00567E00567E00567E00567EDAB9B6DAB9B6FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAB9B6DAB9B6DA
      B9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF7556534DBDF14DBDF14DBDF14DBDF14DBDF14DBDF1755653FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDB6C4FFC6A56FD7D64FA8C6CDE
      7F51FBD3A0FBD5A2E36946FD735CD86541FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFDAB9B6DAB9B6FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF12A004129D0430902D30902D30
      902D30902D2486210F85060F8207FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      C6ADA5FFEFE7F7E7D6F7E7CEF7DEC6F7DEBDF7D6B5F7D6ADEFCE9CEFCE9CEFCE
      94EFCE9CB58484FF00FFFF00FF29ADD652BDE79CFFFF94FFFF73DEF773DEF773
      DEF773DEF74AC6E721ADD618A5C6FF00FFFF00FFFF00FFFF00FFFF00FFBD7B73
      CE6363CE6363B55A5AAD84849C39399C3939CEBDBDEFEFEFFFFFFFE7C6C69429
      29943131BD5A5AAD5A5AFF00FFBD7B73CE6363CE6363B55A5AAD84849C39399C
      3939CEBDBDEFEFEFFFFFFFE7C6C6942929943131BD5A5AAD5A5AFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF7258E92900DF2900DF4323D69180DDFF
      00FFFF00FFFF00FFFF00FF4727DA4727DA3B17D7A89CE0FF00FFFF00FFFF00FF
      FF00FFFF00FFAD3900FF00FFFF00FF8C2900FF00FFAD3900FF00FFFF00FF8C29
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58C8CFFF7E7FF
      D6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5EFDECE8C5A5AFF00FFFF00FF1B88CC
      8AE0F67AE7FF6BE6FFBAB7AAF6E1D5F7DCC0F7D0ABF7D0ABF7D0ABF6CEA5F2D3
      B1EBDCC58E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF008400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF008400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF9B5453E8AEA8E8AEA8E8AEA8E8AEA8E8AEA887515084
      504F804F4EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B5453E8AEA8
      E8AEA8E8AEA8E8AEA8E8AEA887515084504F804F4EFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF75
      565399FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF755653FF00FFFF00FF
      9C6363D66B6BD66B6BD66B6BCE6B6BC66B6B424242C67B7BDE8C8CF79494F7A5
      A5F7A5A59C6363FF00FFFF00FF52B5FF52B5FF1884E74A7BA5C69494FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B5FF
      52B5FF188CE74A7BA5C69494FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF4290D5217EE04A6A9BB4857CFF00FFFF00FFFF00FF03
      720015B50016BD0017C40017C90018CF0018D40019DA000C8700FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF1399E833BEFF1490E60D75BCFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB85510E0B293FFE6CCFFE1C3FDDDBCFCDAB6FFD9B2FC
      C991F1B06BBB6934FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFB54A10B54A10C97A50FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFE7D6CEF7E7DEF7FFFFCE9C84B54A10BD6339D6
      AD9CC65A21BD5221D6AD9CF7FFFFF7DED69F978FA59C94FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF185A21426329315A18295A100873100873102152
      10FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9653529153528E52518B525187
      515084504F81504F7D4F4E7A4E4D774E4DFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF9052518B5150FF00FFFF00FF7C4E4D774E4DFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF935251FF00FF8A
      5150FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF1073150E71121D9E1B1E981E1F93211F8E230568060366049494
      94FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADADADADADADFF
      00FFFF00FFFF00FFFF00FFADADADADADADFF00FFFF00FFFF00FFFF00FFE8AEA8
      BA1B0AE8AEA8FF00FFFF00FFE8AEA8BA1B0AE8AEA8FF00FFE8AEA8BA1B0AE8AE
      A8FF00FFFF00FFFF00FFFF00FF00567E00A4F000A4F000A4F00077AE00A4F000
      A4F000A4F000A4F000567EDAB9B6DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF108C00108C00108C00DAB9B6DAB9B6FF00FFDAB9B6DAB9B6DAB9
      B6DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF755653FFFFFF4DBDF14D
      BDF14DBDF14DBDF1FFFFFF755653FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFDB6C4FEF6E53FB8468EA825BE8A97DF5C397FECB99E47B53FC7C62C877
      4CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDA
      B9B6DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF12A3033C9A39429F3F429F3F429F3F3C9A393695332A8B270F8506FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFC6ADA5FFF7E7F7E7D6F7E7CEF7E7C6F7
      DEC6F7DEB5F7D6B5F7D6ADEFCE9CEFCE9CEFCE94B58484FF00FFFF00FF29ADD6
      52BDE7ADFFFF8CF7FF8CEFFF8CEFFF8CEFFF73DEF773DEF773DEF74AC6EF18A5
      C6FF00FFFF00FFFF00FFFF00FFBD7B73CE6363CE6363B55A5AB58C8C9C4A4A94
      3131A59C9CD6D6D6FFFFFFE7C6C6942929943131BD5A5AAD5A5AFF00FFBD7B73
      CE6363CE6363B55A5AB58C8C9C4A4A943131A59C9CD6D6D6FFFFFFE7C6C69429
      29943131BD5A5AAD5A5AFF00FFFF00FFFF00FFFF00FFFF00FF1515AA1313A5FF
      00FFFF00FFFF00FF06068C000080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF7B63EB2900DF2900DF2B06D29180DDFF00FFFF00FF300AD7300AD72A03
      D8A294E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAD39008C2900FF00FF8C
      2900FF00FFAD3900FF00FFC65A008C2900FF00FFFF00FFFF00FFFF00FFB58C8C
      8C5A5A8C5A5A8C5A5AB58C8CFFF7EFF7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7
      CEEFDECE9C6B63FF00FFFF00FF1B88CC97E2F68BEDFF7DEBFFBAB7AAF7E5DCF7
      DEC6F7D3B1F7D4B1F6D3B0F4D0ABF2D5B6EEDECA8E5D59FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00A521008400FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00840000A521FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E5453FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8A515087515084504FFF00FF067800047500FF00
      FFFF00FFFF00FFFF00FF9E5453FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A515087
      515084504FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF75565375565375565375565399FFFF99FFFF99FFFFDAB9B6DAB9
      B6DAB9B699FFFF755653FF00FFFF00FF9C6363D66B6BD66B6BD67373D67373CE
      6B73424242009400009400009400009400F7A5A59C6363FF00FFFF00FFFF00FF
      52B5FF4AB5FF188CE74A7BA5BD9494FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF4AB5FF4AB5FF188CE74A7BA5BD9494FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF349EFC
      227DDE476797B4857CFF00FFFF00FF047500067800077A00077D00087F0018D4
      0019DA000C8700FF00FFFF00FFFF00FFFF00FFFF00FF10A1EB119FEA129BE90A
      AFF333BEFF1490E60D75BCFF00FFFF00FFFF00FFFF00FFFF00FFB95814E3BA9D
      FFE9D3FEE5CAB9CEC5CCD1BEFEDAB5FFBF6EFAB864C1743DFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB64D14B54A10B7
      5017FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEFDED6
      F7FFFFC67B5ABD4A10C65218C6A594FFFFFFDE9473BD4A10B54A10CE9C84F7FF
      FFEFDED68C847BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF18631018BD4A006B08737342FF00FFFF00FFFF00FFFF00FF
      FF00FF9954529653525B38783735BC3735BC3735BC3735BC5139846C46627A4E
      4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF955352905251FF
      00FFFF00FF814F4E7C4E4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF965352FF00FF8F52518A5150FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1275171CA7161DA3191D
      9E1B1E981E1F93211F8E23056806848484A8A8A8FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0A34EF0628C1949494FF00FFFF00FFFF00FF0A34EF0628C19494
      94FF00FFFF00FFFF00FFFF00FFFF00FFE8AEA8BA1B0AE8AEA8E8AEA8BA1B0AE8
      AEA8E8AEA8FF00FFE8AEA8E8AEA8BA1B0AE8AEA8FF00FFFF00FFFF00FF00567E
      00A4F000A4F000A4F00077AE00A4F000A4F000A4F000A4F03FC2FF0077AEDAB9
      B6DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FF108C0019D40019D400108C0010
      8C00DAB9B619D40019D40019D40019D400DAB9B6FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF755653FFFFFFFFFFFF4DBDF14DBDF1FFFFFFFFFFFF755653FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDB6C4FC9634175374A4D
      3B764F3E76A06E79D8693FB36935FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF13A903429F3F4EA94B54AE5154AE5154
      AE514EA94B429F3F3C9A392A8B270F8506FF00FFFF00FFFF00FFFF00FFFF00FF
      CEB5ADFFFFF7FFEFE7F7E7D6F7E7D6F7E7CEF7DEC6F7DEBDF7D6B5F7D6ADEFCE
      9CEFCE9CB58484FF00FFFF00FF29ADD629ADD6ADDEEF94F7FF94F7FF8CEFFF8C
      EFFF8CEFFF8CEFFF73DEF773DEF74AC6EF18A5C6FF00FFFF00FFFF00FFBD7B73
      CE6363CE6363BD5A5AC6948CC69494B58484AD8C8CBDA5A5E7C6C6DEADADA539
      39A53939C65A5AAD5A5AFF00FFBD7B73CE6363CE6363BD5A5AC6948CC69494B5
      8484AD8C8CBDA5A5E7C6C6DEADADA53939A53939C65A5AAD5A5AFF00FFFF00FF
      FF00FFFF00FFFF00FF2929D12424C81313A5FF00FF1313A60D0D9906068CFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6446E72900DF2900DF44
      25D28972EB4726DA4726DA2A03D88A78E0FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFC65A00AD3900AD3900AD3900A59484AD3900AD3900AD39008C29
      00FF00FFFF00FFFF00FFFF00FFB58C8CFFF7E7F7EFDEF7EFDEB58C8CFFF7EFF7
      E7CEF7DEC6F7DEC6F7DEC6F7DEC6F7E7D6EFDECE9C6B6BFF00FFFF00FF1B88CC
      A1E5F69AEFFF8CEEFFBAB7AAF8EAE2F8E7D4F8DDC2F7DDC1F7DABFF6D8BBF2DC
      C2EFE1D08E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF009400FF
      00FFFF00FFFF00FF00AD21008400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00840000AD21FF00FFFF00FFFF00FF009400FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFA055549E54539B5453995453965453915352CC8C6B8A
      5150875150077D0017C400067800FF00FFFF00FFFF00FFFF00FFA055549E5453
      9B5453995453965453915352CC8F6F8A51504374FFABB3FFFF00FFFF00FFFF00
      FFABB3FF4374FFFF00FFFF00FFFF00FF75565375565369BEE569BEE569BEE575
      565399FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF755653FF00FFFF00FF
      9C6363D67373D67373DE7373DE7373D673734242420094000094000094000094
      00F7A5A59C6363FF00FFFF00FFFF00FFFF00FF52B5FF4AB5FF2184DE5A6B73FF
      00FFAD7B73B1827AB4857CB3827AFF00FFFF00FFFF00FFFF00FFFF00FF008400
      00A52152B5FF4AB5FF2184DE5A6B73FF00FFAD7B73B1827AB4857CB3827AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF349FFC1B7BE23B638FB4857CFF00FFFF
      00FFFF00FFFF00FFFF00FF0A820019DA000C8700FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0FA4EC66D1FF59CCFF4CC8FF40C3FF33BEFF1490E61171BBFF00
      FFFF00FFFF00FFFF00FFB95813EBCAB3FFECD9D0DBD0188CB58BC0C6FCD9B0EE
      B35DE8C294BE7440FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFC97A50B54A10B54A10FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFF7E7E7F7F7F7D6AD94BD4A10CE6331CE6329CE6B39DE
      8C6BCE6329CE6331C65A29B54A10DEC6BDF7EFE79F978FA59C94FF00FFFF00FF
      FF00FF004A00004A00FF00FFFF00FFFF00FFFF00FFFF00FF639C5A18AD3918AD
      39527331FF00FFFF00FFFF00FFFF00FFFF00FF9C54539954521B24C25E61DD5E
      61DD5E61DD5E61DD3735BC5139847D4F4EFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF995352955352FF00FFFF00FF86504F814F4EFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A5453FF00FF93
      52518F52518A5150FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF15781B1BB1101CAB14FFFFFFFFFFFF1D9E1B1E981E1F93211F8E230568
      06989898FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0A35F20628C1848484A8
      A8A8FF00FFFF00FF0A35F20628C1848484A8A8A8FF00FFFF00FFFF00FFFF00FF
      E8AEA8BA1B0AE8AEA8E8AEA8BA1B0AE8AEA84374FFE8AEA84374FFE8AEA8BA1B
      0AE8AEA8FF00FFFF00FFFF00FF00567E00A4F000A4F000A4F00077AE00A4F000
      A4F000A4F000A4F03FC2FF0077AE00567EDAB9B6DAB9B6FF00FFFF00FFFF00FF
      108C0019D40019D40019D400108C00108C00DAB9B6108C0019D40019D40019D4
      00DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA88682FFFFFFFFFFFF4D
      BDF1FFFFFFFFFFFFFFFFFFA88682FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF41414109090A02092C0E2C8F0F2E94071C81403050668665FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDA
      B9B6DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      14AC0254AE515FB75D65BC6365BC6365BC635FB75D54AE51429F3F3695331089
      06FF00FFFF00FFFF00FFFF00FFFF00FFD6B5ADFFFFFFFFF7EFFFEFE7F7E7D6F7
      E7CEF7E7C6F7DEC6F7DEBDF7D6ADF7D6A5F7D6A5B58484FF00FFFF00FF29ADD6
      73DEF729ADD69CFFFF8CF7FF8CF7FF8CF7FF8CEFFF8CEFFF8CEFFF73DEF773DE
      F718A5C6FF00FFFF00FFFF00FFBD7B73CE6363CE6363CE6363CE6363CE6363CE
      6363CE6363C65A5AC65A5ACE6363CE6363CE6363CE6B6BAD525AFF00FFBD7B73
      CE6363CE6363CE6363CE6363CE6363CE6363CE6363C65A5AC65A5ACE6363CE63
      63CE6363CE6B6BAD525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2929D124
      24C82020BF1A1AB31313A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF846DEC2C04DD2C04DD8972EB2B06D22A03D8A294E4FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC65A00A542009C
      4A188C634AAD3900A542008C2900FF00FFFF00FFFF00FFFF00FFFF00FFB58C8C
      F7EFDEF7DECEF7DEC6B58C8CFFFFF7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6
      A5EFE7D6A57B73FF00FFFF00FF1B88CCADE6F6ACF2FF9CF0FFBAB7AAFBF0EBFB
      E1C5FBD0A9FAD1AAF8D0A9F8CEA4F6D8B8F4E9DA8E5D59FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF009C21009C21FF00FFFF00FF00940000AD21008400FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00840000AD21009400FF
      00FFFF00FF009C21009C21FF00FFFF00FFFF00FFFF00FFFF00FFA35654E8AEA8
      E8AEA8E8AEA8E8AEA8E8AEA8915352CC8C6B0A820018CF0017C900077A000678
      00047500037200026F00A35654E8AEA8E8AEA8E8AEA8E8AEA8E8AEA8915352CC
      8F6FABB3FF4374FFABB3FFFF00FFABB3FF4374FFABB3FFFF00FF755653755653
      99FFFF69BEE5755653755653ABB3FFABB3FFABB3FFABB3FFDAB9B6DAB9B6DAB9
      B699FFFF99FFFF755653FF00FFFF00FF9C6363E77B7BE77B7BE77B7BE78484D6
      7373424242009400008400008400008400F7A5A59C6363FF00FFFF00FFFF00FF
      FF00FFFF00FF52BDFFB5D6EFA5948CB59C8CF7E7CEFFFFD6FFFFD6FFFFD6B78C
      80B3847CFF00FFFF00FFFF00FF00840000AD21FF00FF52BDFFB5D6EF009400B5
      9C8CF7E7CEFFFFD6FFFFD6FFFFD6B78C80B3847CFF00FFFF00FFFF00FFFF00FF
      FF00FF3D98FE2B7DD46B4C74B4857CB28D7FBB9A8BBB898AFF00FF0B85000C87
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA4EC66D1FF59
      CCFF129BE91399E81395E71076C0FF00FFFF00FFFF00FFFF00FFBA5A15EED5C1
      CCE0DD188CB5ADCFD0188CB5DDCAAC5F7573B99564D68A43956A3FC9BBAEFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB54A10B5
      4A10D08B66FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7EFE7F7F7F7
      C66331C65A29CE6B31CE5A21CE8C6BF7E7DECE6B39C65A21CE6331C65218C67B
      52F7FFFFDECEC68C847BFF00FFFF00FF004A00186B18005A08396321FF00FFFF
      00FF004A00004A00006B0829C65229CE5A087310004A00004A00FF00FFFF00FF
      FF00FF9F55530007A75E61DD5E61DD5E61DD5E61DD5E61DD5E61DD3735BC8150
      4FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D5453995352FF
      00FFFF00FF8B515086504FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA05554FF00FF9653529352518F52518A5150FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF177A1D1AB50E1BB110FFFFFFFF
      FFFFFFFFFF1D9E1B1E981E1F9321076A09989898FF00FFFF00FFFF00FFFF00FF
      FF00FF1344FF0A35F60629C205219E989898FF00FF1344FF0A35F60629C20521
      9E989898FF00FFFF00FFFF00FFFF00FFE8AEA8BA1B0AE8AEA8E8AEA8BA1B0AE8
      AEA8E8AEA84374FFE8AEA8E8AEA8BA1B0AE8AEA8FF00FFFF00FFFF00FF00567E
      00A4F000A4F000A4F00077AE00A4F000A4F000A4F000A4F03FC2FF0077AE3FC2
      FF00567EDAB9B6FF00FFFF00FFBBF7B319D40019D40019D400108C00108C0010
      8C00108C00108C00108C0019D40019D400DAB9B6FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA88682DAB9B6FFFFFF4DBDF1DAB9B6A88682FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4747470D0D0D0A142A12368C16
      42A81744AA1641A7112A7D6E6F74FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFDAB9B6DAB9B6FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF14AF025FB75D6BC16977CB7577CB7577
      CB756BC1695FB75D4EA94B3C9A39108D06FF00FFFF00FFFF00FFFF00FFFF00FF
      D6BDB5FFFFFFFFF7F7FFF7EFFFEFDEF7E7D6F7E7CEF7E7C6F7DEC6F7DEBDF7D6
      B5F7D6ADB58484FF00FFFF00FF29ADD694F7FF29ADD6ADDEEFA5EFF7A5EFF7A5
      F7FF8CEFFF8CEFFF8CEFFF73DEF700730818A5C6FF00FFFF00FFFF00FFBD7B73
      B55252B55A5AC68484D6A5A5D6ADADD6ADA5D6ADADD6A5A5D6A5A5D6ADA5D6AD
      ADD69C9CCE6363AD5252FF00FFBD7B73B55252B55A5AC68484D6A5A5D6ADADD6
      ADA5D6ADADD6A5A5D6A5A5D6ADA5D6ADADD69C9CCE6363AD5252FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF2929D12424C81313A5FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF593CDA59
      3CDA2900DF2A03D88A78E0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF8C736BE7DED6635242FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFB58C8CFFF7E7FFD6A5FFD6A5B58C8CFFFFF7FF
      E7D6FFE7D6F7E7D6F7E7CEFFE7D6FFF7E7EFDEDEA57B73FF00FFFF00FF1B88CC
      B7E9F6BCF4FFACF3FFBAB7AAFEF4F0FEF4EBFAEBDDFAEADAF8E7D7F8E9D8F7EB
      DDE1DAD38E5D59FF00FFFF00FFFF00FFFF00FFFF00FF0084004ACE73008C2100
      8C2100940000BD21008400009400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00940000840000BD21009400008C21008C214ACE73008400FF00
      FFFF00FFFF00FFFF00FFA65655E8AEA8E8AEA8E8AEA8E8AEA8E8AEA89654530C
      870019DA0018D40018CF0017C90017C40016BD0015B500037200A65655E8AEA8
      E8AEA8E8AEA8E8AEA8E8AEA89654539153528D5251ABB3FF4374FFABB3FF4374
      FFABB3FFFF00FFFF00FF755653DEFAF975565375565369BEE5ABB3FF636ED963
      6ED9636ED9636ED9ABB3FF99FFFF99FFFF99FFFF755653FF00FFFF00FFFF00FF
      9C6363F7848CEF8484EF9494FFDEDEDE8C8C4242420084000084000063000063
      00F7A5A59C6363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEB5B5BB8E84FF
      EFC6FFFFD6FFFFD6FFFFD6FFFFDEFFFFEFF7F7EFAE7E77FF00FFFF00FF008400
      00AD21009400FF00FFCEB5B5009C21009C21FFFFD6FFFFD6FFFFD6FFFFDEFFFF
      EFF7F7EFAE7E77FF00FFFF00FFFF00FFFF00FFFF00FF3D98FEB78E7CD6BF9BF7
      F3CBFFFFD6FAF7D3D3BDB3B4857CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0FA7ED78D7FF66D1FF59CCFF129BE90F7EC6FF00FFFF00
      FFFF00FFFF00FFFF00FFB95914F3E1D3B1D8DFB9D8DAFAECD9188CB5D4D9C9D8
      C7ACDEAC77F4CA9EF4C391D39557B98451CEBCABFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFB54A10B54A10B8531BFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFF7EFE7EFDED6C65A21CE6331CE6331CE5A21C6846BFF
      FFFFEFAD94C64A10CE6331CE6329C65A29F7EFEFEFDED68C847BFF00FFFF00FF
      00520821B54221B542106318528C39FF00FF528C39218C4210942942EF7331E7
      6B108421396321FF00FFFF00FFFF00FFFF00FFA2565400069F5E61DD5E61DD5E
      61DD5E61DD5E61DD5E61DD3735BC84504FFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA355549D5453FF00FFFF00FF9052518B5150FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA35554FF00FF9A
      54539653529352518F52518A5150FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF197C1F19B90B1AB50EFFFFFF1CAB14FFFFFFFFFFFF1D9E1B1E981E096C
      0BA8A8A8FF00FFFF00FFFF00FFFF00FFFF00FF1547FF0C39FD062AC60522A098
      9898FF00FF1547FF0C39FD062AC60522A0989898FF00FFFF00FFFF00FFFF00FF
      E8AEA8BA1B0AE8AEA8E8AEA8BA1B0AE8AEA8E8AEA84374FFE8AEA8E8AEA8BA1B
      0AE8AEA8FF00FFFF00FFFF00FF00567E00A4F000A4F000A4F00077AE00A4F000
      A4F000A4F000A4F03FC2FF0077AE3FC2FF00567EDAB9B6FF00FFFF00FFFF00FF
      BBF7B319D400BBF7B3108C00108C00108C00108C0019D40019D40019D40019D4
      00DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA886824D
      BDF1DAB9B6A88682FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      6161611313131717171435751B54BA1D5AC01D5BC11C56BC1243A4474F65FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFDAB9B6DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      14B20265BC6377CB7583D58189DA8783D58177CB7565BC6354AE51429F3F1190
      05FF00FFFF00FFFF00FFFF00FFFF00FFD6BDB5FFFFFFFFFFFFFFF7F7FFF7EFFF
      EFE7F7E7D6F7E7CEF7DEC6F7DEBDF7DEB5F7DEB5B58484FF00FFFF00FF29ADD6
      9CFFFF73DEF729ADD618A5C618A5C618A5C6ADDEEF8CF7FF84EFFF0073085AE7
      8C00730818A5C6FF00FFFF00FFBD7B73AD524AE7CECEF7F7F7F7F7EFF7F7F7F7
      F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7DEBDBDC65A5AAD525AFF00FFBD7B73
      AD524AE7CECEF7F7F7F7F7EFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
      F7DEBDBDC65A5AAD525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1F1FBC2E
      2EDA2929D12424C81313A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF9180DD2B03DC2B03DC310CD83009DF2B06D29180DDFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C736BE7
      DED69C847BD6CEBD635242FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58C8C
      FFF7EFF7DEC6F7DEC6B58C8CFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7EFDEDED6C6
      C6BDADADB58473FF00FFFF00FF1B88CCC0EAF6D0FAFFBFF7FFBAB7AAFEF6F2FF
      FFFFFEFFFEFBF8F7FAFAF7EBE0D9C7ADA3B59A8B8E5D59FF00FFFF00FFFF00FF
      FF00FFFF00FF21A54273F7A54AD67331C65A21C631009C00008400FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF008400009C0021
      C63131C65A4AD67373F7A521A542FF00FFFF00FFFF00FFFF00FFA95755E8AEA8
      E8AEA8E8AEA8E8AEA8E8AEA89954539654530C870019DA0018D400087F00077D
      00077A00067800047500A95755E8AEA8E8AEA8E8AEA8E8AEA8E8AEA899545396
      5453915352FF00FFABB3FF4374FFABB3FFFF00FFFF00FFFF00FF755653755653
      99FFFF69BEE5755653755653ABB3FFABB3FF636ED9636ED9ABB3FF99FFFF99FF
      FF755653FF00FFFF00FFFF00FFFF00FF9C6363F7848CEF8484F79C9CFFFFFFDE
      8C8C424242FFCEADF7B584F7B584F7B584F7A5A59C6363FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFB5837BF7DEB5F7D6A5FFF7CEFFFFD6FFFFDEFFFFEFFFFF
      F7FFFFFFB58B80FF00FFFF00FF00940000840000BD21009400008C21008C214A
      CE73008400FFFFD6FFFFDEFFFFEFFFFFF7FFFFFFB58B80FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFC0977EFBE5ABFEFBCBFFFFD4FFFFEDFBF9F6CCB3ACFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0CB3F10DB1F00DAEEF0EAAEE83DBFF78
      D7FF66D1FF59CCFF129BE9117BC5FF00FFFF00FFFF00FFFF00FFBC5E1AF4E6DD
      FEF6EEFEF3E7FEF0E0188CB58EC5CEFDE5CBF3D0ABBE7034D9AB7DF2C79CE5B9
      8AA090865D64A5A8AAC8FF00FFFF00FFFF00FFFF00FFFF00FFB54A10B54A10B5
      4A10B54A10FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7EFE7F7DECE
      CE5A21CE6331CE6331CE6329C65221CEB5A5FFFFFFE79C7BC65218CE6329C65A
      29F7EFEFEFDED68C847BFF00FF004A0010842131E76B42EF73109429218C4252
      8C39FF00FF52944210631821B54221B542186B29FF00FFFF00FFFF00FFFF00FF
      FF00FFA556550005975E61DD5E61DD5E61DD5E61DD5E61DD5E61DD3735BC8751
      50FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA75655A35554FF
      00FFFF00FF955352905251FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA75655FF00FFA055549A5453965352935251FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1A7D2119BD0919B90BFFFFFF1B
      B1101CAB14FFFFFFFFFFFF1D9E1B0B6E0DADADADFF00FFFF00FFFF00FFFF00FF
      FF00FF174AFF0C39FF072BCB0522A2989898FF00FF174AFF0C39FF072BCB0522
      A2989898FF00FFFF00FFFF00FFE8AEA8BA1B0ABA1B0ABA1B0AE8AEA8BA1B0AE8
      AEA84374FFE8AEA84374FFE8AEA8BA1B0AE8AEA8FF00FFFF00FFFF00FF00567E
      8DDBFF8DDBFF8DDBFF0077AE8DDBFF8DDBFF8DDBFF8DDBFF3FC2FF0077AE3FC2
      FF00567EDAB9B6FF00FFFF00FFFF00FFFF00FFBBF7B3FF00FFBBF7B3108C0010
      8C0019D40019D40019D400BBF7B319D400BBF7B3FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA88682DAB9B64DBDF14DBDF1DAB9B6A88682FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF4343431F1F1F2425251B488D236AD024
      6FD52570D6246CD21C5CBE2F446BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAB9B6DAB9B6FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF15B70165BC6377CB7589DA879BE99989
      DA8777CB7565BC6354AE51429F3F119405FF00FFFF00FFFF00FFFF00FFFF00FF
      DEBDB5FFFFFFFFFFFFFFFFFFFFF7F7FFEFE7FFEFDEF7E7D6F7E7CEF7DEC6F7DE
      C6F7D6B5B58484FF00FFFF00FF29ADD69CFFFF94F7FF73DEF773DEF773DEF76B
      DEF729ADD6ADDEEF00730852D67B42D66B31C64A007308FF00FFFF00FFBD7B73
      B5524AEFD6D6FFF7F7F7EFEFF7EFEFF7EFEFF7EFEFF7EFEFF7EFEFF7EFEFF7F7
      F7DEBDBDC65A5AAD525AFF00FFBD7B73B5524AEFD6D6FFF7F7F7EFEFF7EFEF43
      74FF4374FFF7EFEFF7EFEFF7EFEFF7F7F7DEBDBDC65A5AAD525AFF00FFFF00FF
      FF00FFFF00FFFF00FF2424C73A3AF21F1FBCFF00FF2929D12424C81313A5FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9180DD4727DA4727DA31
      0CD89180DD3A15E13A15E14323D69180DDFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9C847BE7DED6635242D6CEBD8C736BFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFB58C8CFFF7EFF7E7CEF7DEC6B58C8CFFFFFFFF
      FFFFFFFFFFFFFFF7FFFFF7B58C8CB58C8CB58C8CB58C8CFF00FFFF00FF1B88CC
      C7EBF6E2FCFFD0FAFFBAB7AAFFF8F6FFFFFFFFFFFFFFFFFFFFFFFFD4BBB5D792
      55F47A41FF00FFFF00FFFF00FFFF00FFFF00FF00840063E7946BEF9C4AD67300
      8400008400008400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF0084000084000084004AD6736BEF9C63E7940084
      00FF00FFFF00FFFF00FFAD5856FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B545399
      54539654530C870019DA000A8200FF00FFFF00FFFF00FFFF00FFAD5856FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF9B5453995453965453ABB3FF4374FFABB3FF4374
      FFABB3FFFF00FFFF00FF755653DEFAF975565375565369BEE569BEE5ABB3FF63
      6ED9636ED9636ED9ABB3FF755653755653FF00FFFF00FFFF00FFFF00FFFF00FF
      9C6363F78C8CF78C8CF78C8CF78C8CDE7B84424242FFCEADFFD6BDFFD6BDFFD6
      BDF7A5A59C6363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD9184FFE7ADF7
      CE94FFF7CEFFFFDEFFFFE7FFFFF7FFFFF7FFFFEFF7EFD6B18179FF00FFFF00FF
      008400009C0021C63131C65A4AD67373F7A521A542FFFFDEFFFFE7FFFFF7FFFF
      F7FFFFEFF7EFD6B18179FF00FFFF00FFFF00FFFF00FFB4857CF1CA8EF3CD93FD
      F8C9FFFFD9FFFFF4FFFFF0EEE5CABD7F91FF00FFFF00FFFF00FFFF00FFFF00FF
      0BB6F1AFEBFFA4E7FF99E3FF8EDFFF83DBFF78D7FF66D1FF59CCFF129BE90C85
      C8FF00FFFF00FFFF00FFBE6221F6ECE6FFF9F5FFF6EEFFF3E7E0E6DE188CB5EF
      E4D1F7DBBFB26631FF00FFD9B490D9B4909694AD2553CD4B57A8FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFCD865FBA551FD49775FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFF7EFE7F7EFE7DE6B31D66B31CE6329C65A21C65218BD
      4A10DECEC6FFFFFFD67342CE5A21CE6B39FFF7F7EFDED68C847B004A00004A00
      08731029CE5A29C652006B08004A00004A00FF00FFFF00FF528C39005A08186B
      184A7B31FF00FFFF00FFFF00FFFF00FFFF00FFA857552917815E61DD5E61DD5E
      61DD5E61DD5E61DD5E61DD2A29B78B5251FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFAB5755A75655FF00FFFF00FF995352955352FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAB5756FF00FFA3
      5554A055549A5453FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF1A7D2119BD0919B90B1AB50E1BB1101CAB141CA7160E7112ADAD
      ADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C4FFF0E3CFF072CD10523A798
      9898FF00FF1C4FFF0E3CFF072CD10523A7989898FF00FFFF00FFFF00FFFF00FF
      E8AEA8BA1B0AE8AEA8E8AEA8BA1B0AE8AEA8E8AEA8FF00FFE8AEA8E8AEA8BA1B
      0AE8AEA8FF00FFFF00FFFF00FFFF00FF00567E8DDBFF8DDBFF8DDBFF0077AE8D
      DBFF8DDBFF8DDBFF8DDBFF0077AE3FC2FF00567EDAB9B6FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFBBF7B3108C0019D40019D40019D400BBF7B3FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA886824DBDF14DBDF14D
      BDF14DBDF14DBDF14DBDF1A88682FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      4A4A4A2A2A2A323232214B822B81E72E8CF22F8FF52C88EE2370D32A4873FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAB9B6DAB9B6FF00FFFF
      00FFFF00FFDAB9B6DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF15B70177CB7583D58189DA8783D58177CB7565BC6354AE51129D04FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFDEC6B5FFFFFFFFFFFFFFFFFFFFFFFFFF
      F7F7FFEFE7FFEFDEFFEFDEFFEFD6E7DEC6C6BDADB58484FF00FFFF00FF29ADD6
      9CFFFF94F7FF94F7FF94F7FF94F7FF73DEF773DEF729ADD618A5C6108C2131C6
      4A109C2118A5C6FF00FFFF00FFBD7B73B5524AEFD6D6EFEFEFD6D6D6D6D6D6D6
      D6D6D6D6D6D6D6D6D6D6D6D6D6D6EFEFEFDEBDBDC65A5AAD525AFF00FFBD7B73
      B5524AEFD6D6EFEFEFD6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6EFEF
      EFDEBDBDC65A5AAD525AFF00FFFF00FFFF00FFFF00FFFF00FF2525CA2424C7FF
      00FFFF00FFFF00FF2929D11515AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF9180DD300AD7300AD72D07D99180DDFF00FFFF00FF502FE4502FE42D08
      D29180DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C736BE7DED663
      5242FF00FF7B7B73D6CEBD635242FF00FFFF00FFFF00FFFF00FFFF00FFB58C8C
      FFFFF7FFD6A5FFD6A5B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58C8CEFB5
      6BC68C7BFF00FFFF00FFFF00FF1B88CCCFEDF6F6FFFFE2FEFFBAB7AAFBEBE2FB
      F2EDFBF0EBFAEFEBFAF0EDDAB4A7B79A6F1B88CCFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00840042C65A31C64A008400FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF00840031C64A42C65A008400FF00FFFF00FFFF00FFFF00FFB05857AD5856
      A95755A65655A35654A05554D2A28C9B5453995453FF00FF0C87000B8500FF00
      FFFF00FFFF00FFFF00FFB05857AD5856A95755A65655A35654A05554D3A48F9B
      5453ABB3FF4374FFABB3FFFF00FFABB3FF4374FFABB3FFFF00FF755653755653
      99FFFF69BEE5755653ABB3FF636ED9636ED9ABB3FF636ED9ABB3FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF9C6363F78C8CF79494F79494F78C8CE7
      8484424242FFCEADFFD6BDFFD6BDFFD6BDF7A5A59C6363FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFC09486FFDEADEFBD84F7E7B5FFFFD6FFFFDEFFFFE7FFFF
      E7FFFFDEF7F7D6B1847AFF00FFFF00FFFF00FF0084000084000084004AD6736B
      EF9C63E794008400FFFFDEFFFFE7FFFFE7FFFFDEF7F7D6B1847AFF00FFFF00FF
      FF00FFFF00FFB67E81FAD491EDB379F9E8B5FDFDD1FFFFD9FFFFD9F5EFCBB894
      85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0BB6F1AFEBFFA4E7FF99E3FF8E
      DFFF0FA7ED0FA4EC10A1EB119FEAFF00FFFF00FFFF00FFFF00FFBF6627F8F1ED
      FFFDFBFFF9F5FFF6EEFEF4E763BAD4B8D4D3F7DFC6B76A32FF00FFFF00FFFF00
      FFFF00FFA9ACDAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7E7E7FFFFFF
      F79C6BE76329CE8C6BEFE7DED67B52BD3100D69C7BFFFFFFDE8C63CE5218E79C
      73FFFFFFDEC6BDADADADFF00FFFF00FF004A0018AD3918AD39295A18FF00FFFF
      00FFFF00FFFF00FFFF00FF639442639C4AFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFAB5856A857550507965E61DD5E61DD5E61DD5E61DD121BBF5B38788E52
      51FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB05856AB5755FF
      00FFFF00FF9D5453995352FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFAF5857FF00FFA75655A35554FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C7F231A7D2119BD0919
      B90B1AB50E1BB110127517107315FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF2054FF1343FF072FDD0626B4A8A8A8FF00FF2054FF1343FF072FDD0626
      B4A8A8A8FF00FFFF00FFFF00FFFF00FFFF00FFE8AEA8BA1B0AE8AEA8E8AEA8BA
      1B0AE8AEA8FF00FFE8AEA8BA1B0AE8AEA8FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0077AE0077AE0077AE0077AE0077AE0077AE0077AE0077AE0077AE3FC2
      FF00567EDAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBBF7B319D40019
      D40019D400BBF7B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF755653FFFFFF4DBDF14DBDF14DBDF14DBDF1FFFFFF755653FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF6161613030303F3F3F28374A2673D12D
      85EE3392F73396FC2781E138567AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFDAB9B6DAB9B6FF00FFDAB9B6DAB9B6FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF15BA0115B70177CB7577CB7577
      CB756BC1695FB75D12A30312A004FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      E7C6B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EFFFF7EFF7E7D6C6A594B594
      8CB58C84B58484FF00FFFF00FF29ADD6C6FFFF94FFFF9CFFFFD6FFFFD6FFFF8C
      EFFF94EFFF73DEF773DEF708841018AD29088410FF00FFFF00FFFF00FFBD7B73
      B5524AEFD6D6EFEFEFDED6D6DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED6D6EFEF
      EFDEBDBDC65A5AAD525AFF00FFBD7B73B5524AEFD6D6EFEFEFDED6D6DEDEDE43
      74FF4374FFDEDEDEDEDEDEDED6D6EFEFEFDEBDBDC65A5AAD525AFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF9180DD4727DA4727DA2B04DA8F7DE3FF
      00FFFF00FFFF00FFFF00FF9180DD2A03DA2A03DA5B41D6FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF9C847B9C847BFF00FFFF00FFFF00FF7B7B738C736BFF00
      FFFF00FFFF00FFFF00FFFF00FFB58C8CFFFFF7FFE7D6FFE7D6B58C8CB58C8CB5
      8C8CB58C8CB58C8CB58C8CB58C8CBD8484FF00FFFF00FFFF00FFFF00FF1B88CC
      D0EBF6FFFFFFF2FFFFBAB7AABAB7AABAB7AABAB7AABAB7AABAB7AABAB7AA6BB4
      CF1B88CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF21A53121A53100
      8400008400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF00840000840021A53121A531FF00FFFF00
      FFFF00FFFF00FFFF00FFB35957E8AEA8E8AEA8E8AEA8E8AEA8E8AEA8A05554D2
      A28C9B5453FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB35957E8AEA8
      E8AEA8E8AEA8E8AEA8E8AEA8A05554D3A48F4374FFABB3FFFF00FFFF00FFFF00
      FFABB3FF4374FFFF00FF755653DEFAF9755653755653ABB3FF636ED9636ED9AB
      B3FF755653ABB3FF755653FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      9C6363F78C8CFF9494FF9494F79494E78C8C424242FFCEADFFD6BDFFD6BDFFD6
      BDF7A5A59C6363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD9186FFE7B5EF
      BD84F7CE94FFEFC6FFFFDEFFFFDEFFFFDEFFFFDEF7EFD6B1827AFF00FFFF00FF
      FF00FFFF00FFFF00FF00840031C64A42C65A008400FFEFC6FFFFDEFFFFDEFFFF
      DEFFFFDEF7EFD6B1827AFF00FFFF00FFFF00FFFF00FFB4857CEDD09DF2C891F1
      CA91F8E6B3FCF6C6FEFBCBE0D1B1BD7F91FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0AB9F2BAEFFFAFEBFFA4E7FF99E3FF8EDFFF0FA7ED0A96D3FF00FFFF00
      FFFF00FFFF00FFFF00FFBE662DF8F2EFFFFEFEFFFDFCFFF9F5FFF6EEC5E0E199
      CDD8F4DAC2AC652EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B84EF00109C6B84EFFF00FFFF00
      FFFF00FFFF00FFFF00FFF7EFE7F7EFEFFFEFDEFF8C4ADE845AEFFFFFFFFFFFE7
      BDA5F7FFFFEFFFFFE77339E77339FFEFEFF7E7DEA59C94FF00FFFF00FFFF00FF
      004A00006B0818BD4A004A00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB05957AB5856A8575529178100
      059700069F0007A7995452965352915352FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFB45957B05856FF00FFFF00FFA355549D5453FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB25857FF00FFAB
      5756FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF1A7D21197C1F177A1D15781BFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2C62FF1B4EFF0A35F6072BCBFF
      00FFFF00FF2C62FF1B4EFF0A35F6072BCBFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFE8AEA8FF00FFFF00FFE8AEA8FF00FFFF00FFFF00FFE8AEA8FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00567E8DDBFF8DDBFF8D
      DBFF0077AE8DDBFF8DDBFF8DDBFF8DDBFF00567EDAB9B6FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFBBF7B319D400BBF7B3FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF755653FFFFFFFFFFFF4D
      BDF14DBDF1FFFFFFFFFFFF755653FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF3A3A3A4848484B4B4B464E6226375F11338D1B4DB6133D7838567AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAB9B6DA
      B9B6DAB9B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF15B70114B20214AF0214AC0213A903FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFE7C6B5FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF7E7CECEBD8C73EFB573EFA54AC6846BFF00FFFF00FF21ADD6
      9CDEEFC6FFFFC6FFFF9CDEEF18ADD618A5C618A5C618A5C618A5C6088C1008A5
      18FF00FFFF00FFFF00FFFF00FFBD7B73B5524AEFD6D6F7F7EFE7DEDEE7DEDEE7
      DEDEE7DEDEE7DEDEE7DEDEE7DEDEEFEFEFDEBDBDC65A5AAD525AFF00FFBD7B73
      B5524AEFD6D6F7F7EFE7DEDEE7DEDEE7DEDEE7DEDE4374FFE7DEDEE7DEDEEFEF
      EFDEBDBDC65A5AAD525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9180DD
      2E09D62E09D62901DD9180DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9180
      DD3B16E13B16E17B63EBFF00FFFF00FFFF00FFFF00FF8C736BE7DED6635242FF
      00FFFF00FFFF00FF7B7B73D6CEBD635242FF00FFFF00FFFF00FFFF00FFB58C8C
      FFFFFFFFFFFFFFFFFFFFFFF7FFFFF7EFDEDED6C6C6BDADADB58473FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF1B88CCD3EDF7F4F2F09CB7BC93B4BC91B4BB90
      B4BB8FB4BB8BB1B89FC4CAD5FCFE6FCEF21B88CCFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB55A58E8AEA8
      E8AEA8E8AEA8E8AEA8E8AEA8A35654A055549E5453FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB55A58E8AEA8E8AEA8E8AEA8E8AEA8E8AEA8A35654A0
      55549E5453FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF755653755653
      DEFAF9DEFAF9ABB3FF636ED9ABB3FFDEFAF9DEFAF9755653755653FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF9C6363F78C8CFF9494FF9C9CFF9494E7
      8C8C424242FFCEADFFD6BDFFD6BDFFD6BDF7A5A59C6363FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFC69C94FFEFC6FFEFC6F7D6A5F7CE9CF7E7B5FFF7CEFFF7
      D6FFFFD6B78C80FF00FFFF00FFFF00FFFF00FFFF00FF00840000840021A53121
      A531F7D6A5F7CE9CF7E7B5FFF7CEFFF7D6FFFFD6B78C80FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFBD9D8AF2E7D2F5D19FF1BC7FF7D499F2DFABBD9C87FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0AB9F2BAEFFFAFEBFFA4
      E7FF99E3FF8EDFFF0FA7ED0A96D3FF00FFFF00FFFF00FFFF00FFBE5D0FC98457
      D7A786E5C6B2EEDBD0F7EDE7F9F3ECF9F5EBF5DEC9AC672DFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF00109C00109C00109CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEFDED6
      FFFFFFFFEFCEFFB573EFAD84EFE7DEEFF7F7EFE7DEF7A57BFF8C4AFFDECEFFFF
      FFEFDED6CECEC6FF00FFFF00FFFF00FFFF00FF004A00087310087310004A0018
      52084A6329396321FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFB35957B05957AB5856A85755A55655A256549F55539C54539954529653
      52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF2054FF0F3DFFFF00FFFF00FFFF00FFFF00FF2054FF0F3DFFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00567E00567E00567E00567E0077AE00567E00567E0056
      7E00567EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF755653FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF755653FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6161614B4B4B616161878787A1
      A1A16B6B6B36363637383AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      EFCEBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7D6CEC6947BFFC6
      73CE9473FF00FFFF00FFFF00FFFF00FF31B5DE29ADD618A5C618A5C6FF00FFFF
      00FFFF00FFFF00FF088C1008A518088410FF00FFFF00FFFF00FFFF00FFBD7B73
      B5524AEFD6D6EFEFEFD6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6EFEF
      EFDEBDBDC65A5AAD525AFF00FFBD7B73B5524AEFD6D6EFEFEFD6D6D64374FFD6
      D6D6D6D6D64374FFD6D6D6D6D6D6EFEFEFDEBDBDC65A5AAD525AFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF9180DD3814D73814D72900DF482CC9FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF9180DD9D8DE99D8DE9FF00FFFF00FF
      FF00FFFF00FF7B7B73635242FF00FFFF00FFFF00FFFF00FFFF00FF7B7B738C73
      6BFF00FFFF00FFFF00FFFF00FFB58C8CFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7B5
      8C8CB58C8CB58C8CB58C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B88CC
      DCF6FFD5BCB1A98C80C1B0AAC1B0A9C1B0A9C1B0A9C0ACA4A68779DEE1DA78D0
      F41B88CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB85A58FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA65655A3
      5654A05554FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB85A58FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFA65655A35654A05554FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF755653DEFAF9DEFAF9DEFAF9DEFAF9ABB3FFDEFAF9DE
      FAF9DEFAF9DEFAF9755653FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      9C63639C6363E79C9CFF9494FF9C9CEF8C94424242FFCEADFFD6BDFFD6BDFFD6
      BDF7A5A59C6363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEC6ADFF
      FFFFFFF7EFF7CE94EFBD84F7CE9CFFE7B5FFF7C6B08177FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFDEC6ADFFFFFFFFF7EFF7CE94EFBD84F7CE9CFFE7
      B5FFF7C6B08177FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4857CB5918ADF
      C49DEBCE94E1BD90B48B77B4857CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0ABCF3C5F3FFBAEFFFAFEBFFA4E7FF99E3FF8EDFFF0FA7ED0A96
      D3FF00FFFF00FFFF00FFC9640AC35C02C15A01C05B07C1631AC26D2DCB8450D3
      9C77D9A683AC6428FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B84EF00109C6B84EFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFF7EFEFEFDED6FFFFFFFFFFFFFFF7C6FFDEADFF
      CE94FFCE94FFD6ADFFF7F7FFFFFFEFDED6CECEC6FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF004A00005A00004A00004A00004A00FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA88682755653A88682DEFAF9DE
      FAF9DEFAF9DEFAF9A88682755653A88682FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF6161615A5A5A8A8A8A9090907A7A7A404040FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFE7C6B5FFF7F7FFF7EFFFF7EFFFF7EFFF
      F7EFFFF7EFFFF7EFE7CECEC6947BCE9C84FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF007308087B08088C10088C10087B08FF00
      FFFF00FFFF00FFFF00FFFF00FFBD7B73B5524AE7D6CEFFF7F7F7EFEFF7EFEFF7
      EFEFF7EFEFF7EFEFF7EFEFF7EFEFFFF7F7DEBDBDC65A5AAD525AFF00FFBD7B73
      B5524AE7D6CEFFF7F7F7EFEFF7EFEF4374FF4374FFF7EFEFF7EFEFF7EFEFFFF7
      F7DEBDBDC65A5AAD525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3813DF3813DF
      2900DF4E30D49180DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF635242FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF7B7B73FF00FFFF00FFFF00FFFF00FFB58C8C
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58C8CEFB56BC68C7BFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF1B88CCA0C5D87E8788D9CCC6F8F7F6F7
      F6F4F7F6F4C2B5AD6A868F73C1E01B88CCFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB85A58
      E8AEA8E8AEA8E8AEA8E8AEA8E8AEA8A65655A35654FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFB85A58E8AEA8E8AEA8E8AEA8E8AEA8E8AEA8A6
      5655A35654FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF755653
      DAB9B6DEFAF9DEFAF9DEFAF9DEFAF9DEFAF9DAB9B6755653FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C6363B57373D68484DE
      8C8C4242429C63639C63639C63639C63639C63639C6363FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFD6BDBDF7EFD6FFEFC6FFE7ADFFE7B5C69C
      89B3847AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6
      BDBDF7EFD6FFEFC6FFE7ADFFE7B5C69C89B3847AFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFB4857CA87F72AA6E79FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0ABCF3C5F3FFBA
      EFFFAFEBFFA4E7FF99E3FF8EDFFF0FA7ED0A96D3FF00FFFF00FFFF00FFD9B490
      E2A159DA8C3FCF7721CA690DC76208C55D03C35C03A75F1EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      F7EFEFEFDED6F7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE7DEEFDED6DEDE
      DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFA88682755653755653755653755653755653755653755653755653A886
      82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4D58
      5858686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      E7C6B5EFCEB5EFCEB5EFCEB5EFCEB5E7C6B5E7C6B5EFCEB5D6BDB5BD847BFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      AD524ACEB5B5D6D6D6CECECECECECECECECECECECECECECECECECECECECED6D6
      D6CEADADA54A4AFF00FFFF00FFFF00FFAD524ACEB5B5D6D6D6CECECECECECECE
      CECECECECECECECECECECECECECED6D6D6CEADADA54A4AFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF4F2EE44F2EE49180DDFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFB58C8CB58C8CB58C8CB58C8CB58C8CB58C8CB5
      8C8CBD8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF1B88CC1B88CC88786F88786F88786F88786F88786F1B88CC1B88CCFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFB85A58B55A58B35957B05857AD5856A9
      5755FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      B85A58B55A58B35957B05857AD5856A95755FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF75565375565375565375565375
      5653FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9C63639C6363424242FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFB88C7EB88C81BD9184BD9184FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB88C7EB88C81BD9184BD9184FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF09BFF40ABCF30AB9F20BB6F10CB3F10DB1F00DAEEF0EAA
      EE0A9CDAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD9B490E5
      BB8BCD9248A87943FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7EFE7F7F7EFF7EFEFF7EFEFF7
      EFEFF7EFEFF7EFEFF7EFEFF7EFE7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Left = 216
    Top = 128
  end
  object tbmruMain: TTBXMRUList
    HidePathExtension = False
    MaxItems = 15
    OnClick = tbmruMainClick
    Prefix = 'MRU'
    Left = 216
    Top = 172
  end
  object tbpmEditor: TTBXPopupMenu
    Images = ilMain
    LinkSubitems = smEdit
    Left = 168
    Top = 128
  end
  object pmToolbars: TTBXPopupMenu
    Images = ilMain
    LinkSubitems = smView
    Left = 168
    Top = 172
  end
  object pmTabs: TTBXPopupMenu
    Images = ilMain
    Left = 168
    Top = 220
    object ipmTabCloseFile: TTBXItem
      Action = aCloseFile
    end
    object ipmTabSep1: TTBXSeparatorItem
    end
    object ipmTabRetrieveObject: TTBXItem
      Action = aRetrieveObject
    end
    object ipmTabDropObject: TTBXItem
      Action = aDropObject
    end
    object ipmTabSep2: TTBXSeparatorItem
    end
    object tbgiTabObjName: TTBGroupItem
      LinkSubitems = tbgiObjName
    end
  end
  object smrMain: TSynMacroRecorder
    RecordShortCut = 24658
    PlaybackShortCut = 24656
    OnStateChange = smrMainStateChange
    Left = 260
    Top = 172
  end
  object tbxsMain: TTBXSwitcher
    Theme = 'Default'
    Left = 260
    Top = 128
  end
  object seSearch: TSynEditSearch
    Left = 260
    Top = 84
  end
  object seRegexSearch: TSynEditRegexSearch
    Left = 312
    Top = 84
  end
end
