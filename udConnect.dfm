object dConnect: TdConnect
  Left = 662
  Top = 362
  BorderStyle = bsDialog
  Caption = 'Connect to server'
  ClientHeight = 251
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    306
    251)
  PixelsPerInch = 96
  TextHeight = 13
  object bOK: TButton
    Left = 143
    Top = 220
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object bCancel: TButton
    Left = 223
    Top = 220
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object cbSetDefault: TCheckBox
    Left = 12
    Top = 222
    Width = 89
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'S&et as default'
    TabOrder = 3
  end
  inline frConnect: TfrConnect
    Left = 8
    Top = 8
    Width = 290
    Height = 202
    TabOrder = 0
  end
end
