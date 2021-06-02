object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 845
  ClientWidth = 1540
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
  OnShow = FormShow
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
  object ClassRucLabel: TLabel
    Left = 886
    Top = 19
    Width = 6
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ClassNameLabel: TLabel
    Left = 686
    Top = 19
    Width = 6
    Height = 24
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
    OnChange = ClassesJournalComboBoxChange
  end
  object SubjectsComboBox: TComboBox
    Left = 96
    Top = 54
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'SubjectsComboBox'
    OnChange = SubjectsComboBoxChange
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 78
    Width = 1089
    Height = 715
    ColCount = 17
    FixedCols = 2
    RowCount = 30
    FixedRows = 0
    TabOrder = 2
    OnClick = StringGrid1Click
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
    Left = 1119
    Top = 78
    Width = 394
    Height = 667
    ColCount = 3
    FixedCols = 0
    RowCount = 17
    FixedRows = 0
    TabOrder = 3
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
  object StatisticButton: TButton
    Left = 1119
    Top = 751
    Width = 394
    Height = 42
    Caption = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091
    TabOrder = 4
    OnClick = StatisticButtonClick
  end
  object MonthComboBox: TComboBox
    Left = 360
    Top = 16
    Width = 145
    Height = 21
    TabOrder = 5
    Text = 'MonthComboBox'
  end
end
