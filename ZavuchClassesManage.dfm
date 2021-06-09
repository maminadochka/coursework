object Form15: TForm15
  Left = 0
  Top = 0
  Caption = 'Form15'
  ClientHeight = 688
  ClientWidth = 1123
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 680
    Top = 104
    Width = 67
    Height = 13
    Caption = 'add new class'
  end
  object Name: TLabel
    Left = 680
    Top = 133
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 680
    Top = 189
    Width = 81
    Height = 13
    Caption = 'Choose manager'
  end
  object ClassesListTable: TStringGrid
    Left = 24
    Top = 72
    Width = 633
    Height = 489
    TabOrder = 0
    OnSelectCell = ClassesListTableSelectCell
  end
  object NewClassNameEdit: TEdit
    Left = 680
    Top = 152
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 680
    Top = 254
    Width = 161
    Height = 25
    Caption = 'Add'
    TabOrder = 2
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 680
    Top = 208
    Width = 161
    Height = 21
    TabOrder = 3
  end
end
