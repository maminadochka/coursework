object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 918
  ClientWidth = 1796
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ClassesJournalLabel: TLabel
    Left = 24
    Top = 19
    Width = 37
    Height = 13
    Caption = #1050#1083#1072#1089#1089#1099
  end
  object SubjectsJournalLabel: TLabel
    Left = 24
    Top = 54
    Width = 44
    Height = 13
    Caption = #1055#1088#1077#1076#1084#1077#1090
  end
  object TeacherLabel1: TLabel
    Left = 686
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
  object ClassesJournalComboBox: TComboBox
    Left = 96
    Top = 16
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'ClassesJournalComboBox'
  end
  object SubjectsComboBox: TComboBox
    Left = 96
    Top = 51
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'SubjectsComboBox'
  end
  object ThirdButton: TButton
    Left = 491
    Top = 47
    Width = 75
    Height = 25
    Caption = '3 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 2
  end
  object ForthButton: TButton
    Left = 572
    Top = 47
    Width = 75
    Height = 25
    Caption = '4 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 3
  end
  object SecondButton: TButton
    Left = 410
    Top = 47
    Width = 75
    Height = 25
    Caption = '2 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 4
  end
  object FirstButton: TButton
    Left = 329
    Top = 47
    Width = 75
    Height = 25
    Caption = '1 '#1095#1077#1090#1074#1077#1088#1090#1100
    TabOrder = 5
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 78
    Width = 1338
    Height = 832
    ColCount = 17
    FixedCols = 2
    RowCount = 30
    FixedRows = 0
    TabOrder = 6
    OnDrawCell = StringGrid1DrawCell
    OnSetEditText = StringGrid1SetEditText
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
  object StringGrid2: TStringGrid
    Left = 1352
    Top = 78
    Width = 444
    Height = 776
    ColCount = 3
    FixedCols = 0
    RowCount = 17
    FixedRows = 0
    TabOrder = 7
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
      24)
  end
  object Button1: TButton
    Left = 1352
    Top = 860
    Width = 444
    Height = 50
    Caption = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091
    TabOrder = 8
  end
end
