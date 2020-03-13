object _0: T_0
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'JPG to HTML'
  ClientHeight = 234
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object _1: TButton
    Left = 8
    Top = 182
    Width = 258
    Height = 42
    Caption = 'PROSES FILE'
    TabOrder = 0
    OnClick = _1Click
  end
  object _12: TMemo
    Left = 254
    Top = 8
    Width = 185
    Height = 89
    TabOrder = 1
    Visible = False
    WordWrap = False
  end
  object _13: TProgressBar
    Left = 8
    Top = 159
    Width = 258
    Height = 17
    TabOrder = 2
  end
  object _2: TGroupBox
    Left = 8
    Top = 104
    Width = 258
    Height = 49
    Caption = 'Piksel'
    TabOrder = 3
    object _6: TLabel
      Left = 5
      Top = 17
      Width = 33
      Height = 13
      Caption = 'Jarak :'
    end
    object _7: TLabel
      Left = 171
      Top = 17
      Width = 35
      Height = 13
      Caption = 'Tinggi :'
    end
    object _8: TLabel
      Left = 91
      Top = 17
      Width = 37
      Height = 13
      Caption = 'Lebar : '
    end
    object _3: TEdit
      Left = 44
      Top = 14
      Width = 39
      Height = 21
      TabOrder = 0
      Text = '0'
      OnChange = _3Change
      OnKeyPress = _3KeyPress
    end
    object _4: TEdit
      Left = 209
      Top = 14
      Width = 39
      Height = 21
      TabOrder = 1
      Text = '2'
      OnChange = _4Change
      OnKeyPress = _4KeyPress
    end
    object _5: TEdit
      Left = 129
      Top = 14
      Width = 39
      Height = 21
      TabOrder = 2
      Text = '2'
      OnChange = _5Change
      OnKeyPress = _5KeyPress
    end
  end
  object _9: TGroupBox
    Left = 8
    Top = 8
    Width = 258
    Height = 90
    Caption = 'File Gambar'
    TabOrder = 4
    object _E: TLabel
      Left = 8
      Top = 19
      Width = 43
      Height = 13
      Caption = 'Sumber :'
    end
    object _F: TLabel
      Left = 8
      Top = 42
      Width = 29
      Height = 13
      Caption = 'Hasil :'
    end
    object _10: TLabel
      Left = 8
      Top = 66
      Width = 54
      Height = 13
      Caption = 'Skala (%) :'
    end
    object _11: TLabel
      Left = 116
      Top = 66
      Width = 42
      Height = 13
      Caption = 'Warna : '
    end
    object _B: TEdit
      Left = 53
      Top = 16
      Width = 195
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnClick = _BClick
    end
    object _C: TEdit
      Left = 53
      Top = 39
      Width = 195
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnClick = _CClick
    end
    object _D: TEdit
      Left = 67
      Top = 63
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '80'
      OnChange = _DChange
      OnKeyPress = _DKeyPress
    end
    object _A: TComboBox
      Left = 156
      Top = 63
      Width = 63
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 4
      TabOrder = 3
      Text = '24 Bit'
      Items.Strings = (
        '4 Bit'
        '8 Bit'
        '15 Bit'
        '16 Bit'
        '24 Bit'
        '32 Bit')
    end
  end
end
