object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Form16'
  ClientHeight = 640
  ClientWidth = 1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 43
    Height = 13
    Caption = 'Pupils list'
  end
  object classNameLabel: TLabel
    Left = 632
    Top = 24
    Width = 56
    Height = 13
    Caption = 'ClassName:'
  end
  object classNameLabel2: TLabel
    Left = 694
    Top = 24
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 632
    Top = 43
    Width = 73
    Height = 13
    Caption = 'ManagerName:'
  end
  object ManagerNameLabel2: TLabel
    Left = 711
    Top = 43
    Width = 3
    Height = 13
  end
  object MATH: TLabel
    Left = 605
    Top = 192
    Width = 100
    Height = 25
    Caption = 'MATH'
  end
  object RUSSKIY: TLabel
    Left = 605
    Top = 240
    Width = 109
    Height = 25
    Caption = 'RUS'
  end
  object PupilsListTable: TStringGrid
    Left = 40
    Top = 48
    Width = 545
    Height = 569
    TabOrder = 0
  end
  object addPupilBtn: TButton
    Left = 605
    Top = 128
    Width = 75
    Height = 25
    Caption = 'add pupil'
    TabOrder = 1
  end
  object LastNameEdit: TEdit
    Left = 605
    Top = 72
    Width = 252
    Height = 21
    TabOrder = 2
    Text = 'LastNameEdit'
  end
  object FirstNameEdit: TEdit
    Left = 605
    Top = 99
    Width = 252
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object MATHteacherComboBox: TComboBox
    Left = 728
    Top = 189
    Width = 217
    Height = 21
    TabOrder = 4
    Text = 'MATHteacherComboBox'
  end
  object RUSteacherComboBox: TComboBox
    Left = 728
    Top = 237
    Width = 217
    Height = 21
    TabOrder = 5
    Text = 'ComboBox1'
  end
  object SaveBut: TButton
    Left = 694
    Top = 584
    Width = 146
    Height = 33
    Caption = 'SaveBut'
    TabOrder = 6
  end
end
