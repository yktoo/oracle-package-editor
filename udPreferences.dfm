object dPreferences: TdPreferences
  Left = 551
  Top = 373
  BorderStyle = bsDialog
  Caption = 'Program preferences'
  ClientHeight = 373
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    324
    373)
  PixelsPerInch = 96
  TextHeight = 13
  object bOK: TButton
    Left = 85
    Top = 342
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
    OnClick = zzApply
  end
  object bCancel: TButton
    Left = 165
    Top = 342
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 2
  end
  object pcMain: TPageControl
    Left = 8
    Top = 8
    Width = 312
    Height = 325
    ActivePage = tsLogin
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tsLogin: TTabSheet
      Caption = 'Login'
      object lSecureWarning: TLabel
        Left = 11
        Top = 224
        Width = 265
        Height = 13
        Caption = 'WARNING: storing passwords here is a security threat!'
      end
      inline frConnect: TfrConnect
        Left = 8
        Top = 8
        Width = 290
        Height = 202
        TabOrder = 0
      end
    end
    object tsGeneral: TTabSheet
      Caption = 'General'
      ImageIndex = 4
      DesignSize = (
        304
        297)
      object lTheme: TLabel
        Left = 8
        Top = 100
        Width = 64
        Height = 13
        Caption = 'Visual t&heme:'
        FocusControl = cbTheme
      end
      object cbAutoSave: TCheckBox
        Left = 8
        Top = 28
        Width = 289
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Autosa&ve file before compilation'
        TabOrder = 1
        OnClick = AdjustOKCancel
      end
      object cbRestoreDesktop: TCheckBox
        Left = 8
        Top = 48
        Width = 289
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Op&en last edited files on startup'
        TabOrder = 2
        OnClick = cbRestoreDesktopClick
      end
      object cbAutoloadStatus: TCheckBox
        Left = 24
        Top = 68
        Width = 273
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Load status of objects being open'
        TabOrder = 3
        OnClick = AdjustOKCancel
      end
      object cbTheme: TComboBox
        Left = 8
        Top = 116
        Width = 289
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
        OnChange = AdjustOKCancel
      end
      object cbAutoLogin: TCheckBox
        Left = 8
        Top = 8
        Width = 289
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Automatically login on startup'
        TabOrder = 0
        OnClick = AdjustOKCancel
      end
      object cbShowNavHints: TCheckBox
        Left = 8
        Top = 148
        Width = 289
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Sho&w proc/func arguments as Navigation pane hints'
        TabOrder = 5
        OnClick = AdjustOKCancel
      end
      object cbMultilineTabs: TCheckBox
        Left = 8
        Top = 168
        Width = 289
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'M&ultiline editor tabs'
        TabOrder = 6
        OnClick = AdjustOKCancel
      end
    end
    object tsEditor: TTabSheet
      Caption = 'Editor'
      ImageIndex = 2
      DesignSize = (
        304
        297)
      object lEditorFont: TLabel
        Left = 8
        Top = 52
        Width = 55
        Height = 13
        Caption = 'Editor &font:'
        FocusControl = eEditorFont
      end
      object lTabWidth: TLabel
        Left = 220
        Top = 92
        Width = 51
        Height = 13
        Caption = 'Tab &width:'
        FocusControl = eTabWidth
      end
      object lMaxUndo: TLabel
        Left = 8
        Top = 92
        Width = 81
        Height = 13
        Caption = 'Max &undo count:'
        FocusControl = eMaxUndo
      end
      object lRightEdge: TLabel
        Left = 112
        Top = 92
        Width = 92
        Height = 13
        Caption = 'Rig&ht edge marker:'
        FocusControl = eRightEdge
      end
      object eEditorFont: TComboEdit
        Left = 8
        Top = 68
        Width = 289
        Height = 21
        Color = clBtnFace
        DirectInput = False
        Glyph.Data = {
          D6000000424DD60000000000000076000000280000000C0000000C0000000100
          04000000000060000000C30E0000C30E00001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF000000F
          0000FFFFFFF00FFF0000FFFFFFF00FFF0000F88888800FFF0000FFF88FF00FFF
          0000FFF80FF00FF00000FFF80FF00FF00000FFF800F00F0000008FF800000000
          00008FF88FF8FFFF000088F88F88FFFF000088888888FFFF0000}
        NumGlyphs = 1
        TabOrder = 1
        OnButtonClick = eEditorFontButtonClick
      end
      object rgKwCase: TRadioGroup
        Left = 8
        Top = 8
        Width = 289
        Height = 37
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Type keywords in'
        Columns = 2
        Items.Strings = (
          'lower case'
          'UPPER CASE')
        TabOrder = 0
        OnClick = AdjustOKCancel
      end
      object eTabWidth: TRxSpinEdit
        Left = 220
        Top = 108
        Width = 77
        Height = 21
        Alignment = taRightJustify
        ButtonKind = bkStandard
        MaxValue = 255.000000000000000000
        MinValue = 1.000000000000000000
        Value = 8.000000000000000000
        TabOrder = 4
        OnChange = AdjustOKCancel
      end
      object eMaxUndo: TRxSpinEdit
        Left = 8
        Top = 108
        Width = 101
        Height = 21
        Alignment = taRightJustify
        ButtonKind = bkStandard
        MaxValue = 65535.000000000000000000
        MinValue = 1.000000000000000000
        Value = 1024.000000000000000000
        TabOrder = 2
        OnChange = AdjustOKCancel
      end
      object eRightEdge: TRxSpinEdit
        Left = 112
        Top = 108
        Width = 105
        Height = 21
        Alignment = taRightJustify
        ButtonKind = bkStandard
        MaxValue = 1024.000000000000000000
        MinValue = 1.000000000000000000
        Value = 80.000000000000000000
        TabOrder = 3
        OnChange = AdjustOKCancel
      end
      object gbEdOptions: TGroupBox
        Left = 8
        Top = 136
        Width = 289
        Height = 153
        Caption = 'Editor options'
        TabOrder = 5
        object cbLineNums: TCheckBox
          Left = 28
          Top = 44
          Width = 117
          Height = 17
          Caption = '&Show line numbers'
          TabOrder = 1
          OnClick = AdjustOKCancel
        end
        object cbShowGutter: TCheckBox
          Left = 12
          Top = 24
          Width = 133
          Height = 17
          Caption = 'Show &gutter'
          TabOrder = 0
          OnClick = cbShowGutterClick
        end
        object cbAutoIndent: TCheckBox
          Left = 12
          Top = 64
          Width = 133
          Height = 17
          Caption = '&Auto indent'
          TabOrder = 2
          OnClick = AdjustOKCancel
        end
        object cbDragDropEditing: TCheckBox
          Left = 12
          Top = 84
          Width = 133
          Height = 17
          Caption = '&Drag'#39'n'#39'drop editing'
          TabOrder = 3
          OnClick = AdjustOKCancel
        end
        object cbShowScrollHint: TCheckBox
          Left = 12
          Top = 104
          Width = 133
          Height = 17
          Caption = 'Sh&ow scroll-range hint'
          TabOrder = 4
          OnClick = AdjustOKCancel
        end
        object cbSmartTabs: TCheckBox
          Left = 12
          Top = 124
          Width = 133
          Height = 17
          Caption = 'S&mart tabs'
          TabOrder = 5
          OnClick = AdjustOKCancel
        end
        object cbTabsToSpaces: TCheckBox
          Left = 148
          Top = 24
          Width = 133
          Height = 17
          Caption = 'Conv&ert tabs to spaces'
          TabOrder = 6
          OnClick = AdjustOKCancel
        end
        object cbTrimTrailingSpaces: TCheckBox
          Left = 148
          Top = 44
          Width = 133
          Height = 17
          Caption = 'Tr&im trailing spaces'
          TabOrder = 7
          OnClick = AdjustOKCancel
        end
        object cbSmartTabDelete: TCheckBox
          Left = 148
          Top = 64
          Width = 133
          Height = 17
          Caption = 'Smart tab de&lete'
          TabOrder = 8
          OnClick = AdjustOKCancel
        end
        object cbEnhanceHomeKey: TCheckBox
          Left = 148
          Top = 84
          Width = 133
          Height = 17
          Caption = 'Enhan&ce home key'
          TabOrder = 9
          OnClick = AdjustOKCancel
        end
        object cbGroupUndo: TCheckBox
          Left = 148
          Top = 104
          Width = 133
          Height = 17
          Caption = 'Group u&ndo'
          TabOrder = 10
          OnClick = AdjustOKCancel
        end
        object cbWantTabs: TCheckBox
          Left = 148
          Top = 124
          Width = 133
          Height = 17
          Caption = 'Want ta&bs'
          TabOrder = 11
          OnClick = AdjustOKCancel
        end
      end
    end
    object tsHighlight: TTabSheet
      Caption = 'Highlight'
      ImageIndex = 1
      object lElement: TLabel
        Left = 8
        Top = 28
        Width = 42
        Height = 13
        Caption = '&Element:'
        FocusControl = lbElement
      end
      object lFgColor: TLabel
        Left = 124
        Top = 40
        Width = 86
        Height = 13
        Caption = '&Foreground color:'
        FocusControl = cbFgColor
      end
      object lBgColor: TLabel
        Left = 124
        Top = 80
        Width = 86
        Height = 13
        Caption = '&Background color:'
        FocusControl = cbBgColor
      end
      object lbElement: TListBox
        Left = 8
        Top = 44
        Width = 109
        Height = 241
        Style = lbOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 1
        OnClick = lbElementClick
        OnDrawItem = lbElementDrawItem
      end
      object cbFgColor: TColorBox
        Left = 124
        Top = 56
        Width = 173
        Height = 22
        DefaultColorColor = clWindowText
        NoneColorColor = clWindowText
        Selected = clNone
        Style = [cbStandardColors, cbSystemColors, cbIncludeDefault, cbCustomColor, cbPrettyNames]
        DropDownCount = 20
        ItemHeight = 16
        TabOrder = 2
        OnChange = UpdateSynElement
      end
      object cbBgColor: TColorBox
        Left = 124
        Top = 96
        Width = 173
        Height = 22
        DefaultColorColor = clWindow
        NoneColorColor = clWindow
        Style = [cbStandardColors, cbSystemColors, cbIncludeDefault, cbCustomColor, cbPrettyNames]
        DropDownCount = 20
        ItemHeight = 16
        TabOrder = 3
        OnChange = UpdateSynElement
      end
      object gbFontStyles: TGroupBox
        Left = 124
        Top = 128
        Width = 173
        Height = 113
        Caption = 'Font styles'
        TabOrder = 4
        object cbFSBold: TCheckBox
          Left = 16
          Top = 20
          Width = 45
          Height = 17
          Caption = 'B&old'
          TabOrder = 0
          OnClick = UpdateSynElement
        end
        object cbFSItalic: TCheckBox
          Left = 16
          Top = 40
          Width = 49
          Height = 17
          Caption = '&Italic'
          TabOrder = 1
          OnClick = UpdateSynElement
        end
        object cbFSUnderline: TCheckBox
          Left = 16
          Top = 60
          Width = 69
          Height = 17
          Caption = 'U&nderline'
          TabOrder = 2
          OnClick = UpdateSynElement
        end
        object cbFSStrikeout: TCheckBox
          Left = 16
          Top = 80
          Width = 65
          Height = 17
          Caption = '&Strikeout'
          TabOrder = 3
          OnClick = UpdateSynElement
        end
      end
      object cbHighlight: TCheckBox
        Left = 8
        Top = 8
        Width = 121
        Height = 17
        Caption = '&Use syntax highlight'
        TabOrder = 0
        OnClick = cbHighlightClick
      end
    end
    object tsKeys: TTabSheet
      Caption = 'Key bindings'
      ImageIndex = 3
      object lKeyCommands: TLabel
        Left = 8
        Top = 8
        Width = 56
        Height = 13
        Caption = '&Commands:'
        FocusControl = lbCommands
      end
      object lKeys: TLabel
        Left = 176
        Top = 8
        Width = 109
        Height = 13
        Caption = '&Assigned key bindings:'
        FocusControl = lbKeys
      end
      object lbCommands: TListBox
        Left = 8
        Top = 24
        Width = 161
        Height = 265
        Style = lbOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        OnClick = lbCommandsClick
        OnDrawItem = lbCommandsDrawItem
      end
      object bKeyResetDefaults: TButton
        Left = 176
        Top = 268
        Width = 121
        Height = 23
        Caption = 'Reset defaults'
        TabOrder = 5
        OnClick = bKeyResetDefaultsClick
      end
      object lbKeys: TListBox
        Left = 176
        Top = 24
        Width = 121
        Height = 129
        ItemHeight = 13
        TabOrder = 1
        OnClick = lbKeysClick
      end
      object bKeyAdd: TButton
        Left = 176
        Top = 160
        Width = 121
        Height = 23
        Caption = 'A&dd key...'
        TabOrder = 2
        OnClick = bKeyAddClick
      end
      object bKeyDelete: TButton
        Left = 176
        Top = 188
        Width = 121
        Height = 23
        Caption = 'D&elete key'
        TabOrder = 3
        OnClick = bKeyDeleteClick
      end
      object bKeyEdit: TButton
        Left = 176
        Top = 216
        Width = 121
        Height = 23
        Caption = 'Ed&it key...'
        TabOrder = 4
        OnClick = bKeyEditClick
      end
    end
  end
  object bApply: TButton
    Left = 244
    Top = 342
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Apply'
    TabOrder = 3
    OnClick = zzApply
  end
  object shSQL: TSynSQLSyn
    DefaultFilter = 'SQL Files (*.sql)|*.sql'
    SQLDialect = sqlSybase
    Left = 8
    Top = 336
  end
end
