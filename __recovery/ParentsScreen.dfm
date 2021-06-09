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
  object Label1: TLabel
    Left = 912
    Top = 88
    Width = 137
    Height = 24
    Caption = #1042#1089#1077#1075#1086' '#1079#1072#1085#1103#1090#1080#1081':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 1072
    Top = 88
    Width = 6
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DnevnikStringGrid1: TStringGrid
    Left = 24
    Top = 136
    Width = 841
    Height = 553
    RowCount = 100
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 94
    Width = 153
    Height = 21
    TabOrder = 1
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object Panel2: TPanel
    Left = 912
    Top = 136
    Width = 537
    Height = 553
    TabOrder = 2
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 537
      Height = 553
    end
  end
end
