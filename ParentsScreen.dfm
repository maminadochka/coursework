object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 845
  ClientWidth = 1540
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PupilName: TLabel
    Left = 64
    Top = 32
    Width = 100
    Height = 25
    Caption = 'PupilName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DnevnikStringGrid1: TStringGrid
    Left = 24
    Top = 136
    Width = 841
    Height = 201
    RowCount = 8
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 24
    Top = 384
    Width = 1425
    Height = 249
    Caption = 'Panel1'
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 1128
    Top = 78
    Width = 321
    Height = 259
    Caption = 'poseshaemost'
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 528
    Top = 680
    Width = 497
    Height = 137
    Caption = 'Panel3'
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 94
    Width = 153
    Height = 21
    TabOrder = 4
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
end
