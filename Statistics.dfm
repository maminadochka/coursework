object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 845
  ClientWidth = 1540
  Color = clMoneyGreen
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
  object ClassesStatisticsLabel: TLabel
    Left = 24
    Top = 19
    Width = 37
    Height = 13
    Caption = #1050#1083#1072#1089#1089#1099
  end
  object SubjectsStatisticsLabel: TLabel
    Left = 24
    Top = 54
    Width = 44
    Height = 13
    Caption = #1055#1088#1077#1076#1084#1077#1090
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 78
    Width = 1508
    Height = 715
    ColCount = 13
    FixedCols = 2
    RowCount = 30
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object ClassesComboBox: TComboBox
    Left = 96
    Top = 16
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'ClassesComboBox'
    OnChange = ClassesComboBoxChange
  end
  object SubjectsComboBox: TComboBox
    Left = 96
    Top = 51
    Width = 145
    Height = 21
    TabOrder = 2
    Text = 'SubjectsComboBox'
    OnChange = SubjectsComboBoxChange
  end
  object ThirdButtonStatistics: TButton
    Left = 903
    Top = 47
    Width = 75
    Height = 25
    Caption = '3 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 3
    OnClick = ThirdButtonStatisticsClick
  end
  object ForthButtonStatistics: TButton
    Left = 1135
    Top = 47
    Width = 75
    Height = 25
    Caption = '4 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 4
    OnClick = ForthButtonStatisticsClick
  end
  object SecondButtonStatistics: TButton
    Left = 650
    Top = 47
    Width = 75
    Height = 25
    Caption = '2 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 5
    OnClick = SecondButtonStatisticsClick
  end
  object FirstButtonStatistics: TButton
    Left = 418
    Top = 47
    Width = 75
    Height = 25
    Caption = '1 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 6
    OnClick = FirstButtonStatisticsClick
  end
  object Button1: TButton
    Left = 1357
    Top = 47
    Width = 75
    Height = 25
    Caption = #1043#1086#1076
    TabOrder = 7
    OnClick = Button1Click
  end
end
