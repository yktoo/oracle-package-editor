object frConnect: TfrConnect
  Left = 0
  Top = 0
  Width = 290
  Height = 202
  TabOrder = 0
  object pMain: TPanel
    Left = 0
    Top = 0
    Width = 290
    Height = 202
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object lUserName: TLabel
      Left = 60
      Top = 148
      Width = 55
      Height = 13
      Caption = '&User name:'
      FocusControl = eUserName
    end
    object lPassword: TLabel
      Left = 60
      Top = 172
      Width = 50
      Height = 13
      Caption = '&Password:'
      FocusControl = ePassword
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
        FFFFFF0000000000000000000000000000000000000000000000000000000007
        7080000000000000000000000000077FF7080000000000000000000000007FFF
        7F70800000000000000000000000FF7FFFF0800000000000000000000007F7F7
        77FF08000000000BBBBBB0000007F7FF7F7F080000000BB999999BB0000FF7F7
        FFFF08000000B9990000009B007F7FFFFFFFF080000B990080000009007FFFFF
        00FFF08000B990880088800007FFFFF0000FF0800B9907807888880077FFFFF0
        000FF0700B990807778800FF88FFFFF0000FF0700B9077077700FF88FFFFFFF0
        000FF0F0B9907F07770F88FF00FFFFF0000FF070B907F0777707FF0077FFFFF0
        000FF0F0B90F7077770F0077FFFF7FFF00FFF070B907F077770777F7707FF7FF
        FFF7F0F0B90FF077770FF777070FF7F7FF7F0700B90FF077770F7700F00F7F7F
        7F7F0F00B90FF077770F00FF0007FF77FF7F0700B90FFF077700FF0000B0FF7F
        77F07000B990FF077770000700B07FFFFFF0F0000B90FF077777777709B007F7
        FF0F00000B990FF0777777700B00000FF0F000000B990FFF007770009B000000
        0000000000B990FFF0000009B000000000000000000B9900FFFF009B00000000
        000000000000B999000099B0000000000000000000000BB99999BB0000000000
        000000000000000BBBBB00000000000000000000000000000000000000000000
        00000000FFFFFE1FFFFFF807FFFFF007FFFFE003FFFFE003FFFFC001FE07C001
        F801C001F0008000E0000000C00000C0800000C0800000C0800000C0000000C0
        000000C000000000000000000000000100000001000000010000000300000003
        800010078000380F80003E1FC0007FFFE000FFFFF001FFFFF803FFFFFE0FFFFF
        FFFFFFFF}
    end
    object eUserName: TEdit
      Left = 176
      Top = 144
      Width = 89
      Height = 21
      TabOrder = 2
    end
    object ePassword: TEdit
      Left = 176
      Top = 168
      Width = 89
      Height = 21
      PasswordChar = #8226
      TabOrder = 3
    end
    object gbServer: TGroupBox
      Left = 56
      Top = 12
      Width = 221
      Height = 125
      TabOrder = 1
      object lService: TLabel
        Left = 12
        Top = 20
        Width = 83
        Height = 13
        Caption = 'SQL*Net &service:'
        FocusControl = eService
      end
      object lServer: TLabel
        Left = 12
        Top = 44
        Width = 79
        Height = 13
        Caption = '&Server name/IP:'
        FocusControl = eServer
      end
      object lPort: TLabel
        Left = 12
        Top = 68
        Width = 63
        Height = 13
        Caption = 'P&ort number:'
        FocusControl = ePort
      end
      object lSID: TLabel
        Left = 12
        Top = 92
        Width = 70
        Height = 13
        Caption = 'Database S&ID:'
        FocusControl = eSID
      end
      object eService: TEdit
        Left = 120
        Top = 16
        Width = 89
        Height = 21
        TabOrder = 0
      end
      object eServer: TEdit
        Left = 120
        Top = 40
        Width = 89
        Height = 21
        TabOrder = 1
      end
      object ePort: TEdit
        Left = 120
        Top = 64
        Width = 89
        Height = 21
        TabOrder = 2
      end
      object eSID: TEdit
        Left = 120
        Top = 88
        Width = 89
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
      end
    end
    object cbNetDirect: TCheckBox
      Left = 60
      Top = 8
      Width = 213
      Height = 17
      Caption = '&Use direct connection (no Oracle client)'
      TabOrder = 0
      OnClick = cbNetDirectClick
    end
  end
end
