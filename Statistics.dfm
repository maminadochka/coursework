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
  OnCreate = FormCreate
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
  object TeacherLabel1: TLabel
    Left = 886
    Top = 19
    Width = 296
    Height = 24
    Caption = #1041#1086#1083#1090#1072#1082' '#1057#1074#1077#1090#1083#1072#1085#1072' '#1042#1083#1072#1076#1080#1084#1080#1088#1086#1074#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object StatisticsStringGrid: TStringGrid
    Left = 24
    Top = 78
    Width = 1508
    Height = 715
    ColCount = 8
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
  object ClassesStatisticsComboBox: TComboBox
    Left = 96
    Top = 16
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'ClassesStatisticsComboBox'
  end
  object SubjectsStatisticsComboBox: TComboBox
    Left = 96
    Top = 51
    Width = 145
    Height = 21
    TabOrder = 2
    Text = 'SubjectsStatisticsComboBox'
  end
  object ThirdButtonStatistics: TButton
    Left = 491
    Top = 47
    Width = 75
    Height = 25
    Caption = '3 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 3
  end
  object ForthButtonStatistics: TButton
    Left = 572
    Top = 47
    Width = 75
    Height = 25
    Caption = '4 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 4
  end
  object SecondButtonStatistics: TButton
    Left = 410
    Top = 47
    Width = 75
    Height = 25
    Caption = '2 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 5
  end
  object FirstButtonStatistics: TButton
    Left = 329
    Top = 47
    Width = 75
    Height = 25
    Caption = '1 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 6
  end
end
