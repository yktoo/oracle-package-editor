object dKeyBinding: TdKeyBinding
  Left = 597
  Top = 173
  ActiveControl = eKey1
  BorderStyle = bsDialog
  Caption = 'Key binding'
  ClientHeight = 152
  ClientWidth = 190
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    190
    152)
  PixelsPerInch = 96
  TextHeight = 13
  object pMain: TPanel
    Left = 8
    Top = 8
    Width = 174
    Height = 102
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object lKey1: TLabel
      Left = 12
      Top = 12
      Width = 105
      Height = 13
      Caption = '&First key combination:'
      FocusControl = eKey1
    end
    object lKey2: TLabel
      Left = 12
      Top = 52
      Width = 119
      Height = 13
      Caption = '&Second key combination:'
      FocusControl = eKey2
    end
    object eKey1: THotKey
      Left = 12
      Top = 28
      Width = 149
      Height = 19
      HotKey = 0
      Modifiers = []
      TabOrder = 0
      OnChange = AdjustOKCancel
    end
    object eKey2: THotKey
      Left = 12
      Top = 68
      Width = 149
      Height = 19
      HotKey = 0
      Modifiers = []
      TabOrder = 1
      OnChange = AdjustOKCancel
    end
  end
  object bOK: TButton
    Left = 27
    Top = 121
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
  end
  object bCancel: TButton
    Left = 107
    Top = 121
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 2
  end
end
