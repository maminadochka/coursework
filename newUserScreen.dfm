object Form20: TForm20
  Left = 0
  Top = 0
  Caption = 'Form20'
  ClientHeight = 316
  ClientWidth = 331
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 53
    Width = 47
    Height = 13
    Caption = 'LastName'
  end
  object Label2: TLabel
    Left = 104
    Top = 99
    Width = 48
    Height = 13
    Caption = 'FirstName'
  end
  object Label3: TLabel
    Left = 104
    Top = 149
    Width = 22
    Height = 13
    Caption = 'login'
  end
  object Label4: TLabel
    Left = 104
    Top = 24
    Width = 46
    Height = 13
    Caption = 'New User'
  end
  object Label6: TLabel
    Left = 104
    Top = 208
    Width = 36
    Height = 13
    Caption = 'Subject'
  end
  object LastNameEdit: TEdit
    Left = 104
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object FirstNameEdit: TEdit
    Left = 104
    Top = 118
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 104
    Top = 254
    Width = 121
    Height = 25
    Caption = 'create'
    Default = True
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = Button1Click
    OnEnter = Button1Click
  end
  object UserLoginEdit: TEdit
    Left = 104
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object SubjectComboBox: TComboBox
    Left = 104
    Top = 227
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
