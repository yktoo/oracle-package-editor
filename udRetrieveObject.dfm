object dRetrieveObject: TdRetrieveObject
  Left = 343
  Top = 199
  ActiveControl = tvMain
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Select an object to retrieve'
  ClientHeight = 435
  ClientWidth = 632
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object tvMain: TTreeView
    Left = 0
    Top = 29
    Width = 632
    Height = 371
    Align = alClient
    HideSelection = False
    Images = fMain.ilMain
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnDblClick = bOKClick
  end
  object pBottom: TPanel
    Left = 0
    Top = 400
    Width = 632
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      632
      35)
    object bOK: TButton
      Left = 472
      Top = 6
      Width = 75
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = bOKClick
    end
    object bCancel: TButton
      Left = 552
      Top = 6
      Width = 75
      Height = 23
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lObjType: TLabel
      Left = 8
      Top = 8
      Width = 115
      Height = 13
      Caption = '&Object type to retrieve:'
      FocusControl = cbObjType
    end
    object cbObjType: TComboBoxEx
      Left = 128
      Top = 4
      Width = 109
      Height = 22
      Hint = 'Object type|Specifies the type of the object being edited'
      ItemsEx = <>
      Style = csExDropDownList
      ItemHeight = 16
      TabOrder = 0
      OnChange = LoadObjects
      Images = fMain.ilMain
      DropDownCount = 8
    end
  end
end
