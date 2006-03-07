object dSearch: TdSearch
  Left = 471
  Top = 491
  ActiveControl = cbSearchText
  BorderStyle = bsDialog
  Caption = 'Search Text'
  ClientHeight = 307
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    361
    307)
  PixelsPerInch = 96
  TextHeight = 13
  object bOK: TButton
    Left = 199
    Top = 276
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = bOKClick
  end
  object bCancel: TButton
    Left = 278
    Top = 276
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object pMain: TPanel
    Left = 8
    Top = 8
    Width = 345
    Height = 258
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object lSearchText: TLabel
      Left = 56
      Top = 12
      Width = 54
      Height = 13
      Caption = '&Search for:'
      FocusControl = cbSearchText
    end
    object lReplaceText: TLabel
      Left = 56
      Top = 53
      Width = 65
      Height = 13
      Caption = '&Replace with:'
      FocusControl = cbReplaceText
    end
    object iIcon: TImage
      Left = 12
      Top = 12
      Width = 32
      Height = 32
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000000000000000000000000007777777777777777777
        77777700000000000000000000000000000007000000FFFFFFFFFFFFFFFFFFFF
        FFFF07000000FFFFFFFFFFFFFFFFFFFFFFFF07000000F7777777FFFFFFFF7777
        777F07000000777777777FFFFFF777777777070000007777777777FFFF777777
        7777070000007777777777FFFF7777777777070000007777777777FFFF777777
        7777070000000000077777FFFF00000007770700006E6E6E6077777FF06E6E6E
        607707000EFCCCCCCE0777770ECCCCCCCE07070006EFEFEFEF607770EFEFEFEF
        E60707000EFCCCCCCCE07FF06ECCCCCCCE07070006EFEFEFEF60FFF0EFEFEFEF
        E60F07000EFCCCCCCCE0FFF06ECCCCCCCE0F070006EFEFEFEF60FFF0EFEFEFEF
        E60F07000E6CCCCCCCE00F006ECCCCCCCE0F070000E6E6E6E6C00000C6E6E6E6
        E00F0700000000000004FFF40000000000FF07000000CFFFFFFFFFFFFFFFFFC0
        FFFF070000000CFFFFFFFFFFFFFFFC0FFFFF07000000F0CFFFCFFFFFCFFFC0FF
        FFFF07000000FF0CFF0CFFFC0FFC0FFFFFFF07000000FFF0CF0CFFFC0FC0FF00
        000007000000FFFF0C0CFFFC0C0FFF0FF77807000000FFFFF0CFFFFFC0FFFF0F
        778077000000FFFFFFFFFFFFFFFFFF07780777000000FFFFFFFFFFFFFFFFFF07
        807777000000FFFFFFFFFFFFFFFFFF0800000000000000000000000000000000
        00000000F0000001F0000001E0000001E0000001E0000001E0000001E0000001
        E0000001E0000001E0000001C000000180000001000000010000000100000001
        000000010000000100000001000000010000000180000001E0000001E0000001
        E0000001E0000001E0000001E0000001E0000001E0000001E0000001E0000001
        E00000FF}
    end
    object cbSearchText: TComboBox
      Left = 56
      Top = 28
      Width = 277
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object gbOptions: TGroupBox
      Left = 56
      Top = 100
      Width = 153
      Height = 145
      Caption = 'Options'
      TabOrder = 2
      object cbCaseSensitive: TCheckBox
        Left = 12
        Top = 20
        Width = 94
        Height = 17
        Caption = '&Case sensitive'
        TabOrder = 0
      end
      object cbWholeWords: TCheckBox
        Left = 12
        Top = 40
        Width = 106
        Height = 17
        Caption = '&Whole words only'
        TabOrder = 1
      end
      object cbSelectedOnly: TCheckBox
        Left = 12
        Top = 60
        Width = 106
        Height = 17
        Caption = 'S&elected text only'
        TabOrder = 2
      end
      object cbReplaceAll: TCheckBox
        Left = 12
        Top = 80
        Width = 81
        Height = 17
        Caption = 'Replace &all'
        TabOrder = 3
      end
      object cbPromptForReplace: TCheckBox
        Left = 12
        Top = 100
        Width = 113
        Height = 17
        Caption = '&Prompt for replace'
        TabOrder = 4
      end
      object cbRegexSearch: TCheckBox
        Left = 12
        Top = 120
        Width = 121
        Height = 17
        Caption = 'Regular e&xpressions'
        TabOrder = 5
      end
    end
    object rgDirection: TRadioGroup
      Left = 220
      Top = 100
      Width = 113
      Height = 69
      Caption = 'Direction'
      ItemIndex = 0
      Items.Strings = (
        '&Forward'
        '&Backward')
      TabOrder = 3
    end
    object cbReplaceText: TComboBox
      Left = 56
      Top = 69
      Width = 277
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object rgScope: TRadioGroup
      Left = 220
      Top = 176
      Width = 113
      Height = 69
      Caption = 'Scope'
      Items.Strings = (
        'Fr&om cursor'
        'Ent&ire scope')
      TabOrder = 4
    end
  end
end
