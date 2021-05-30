object Form20: TForm20
  Left = 0
  Top = 0
  Caption = 'Form20'
  ClientHeight = 347
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
  object Label5: TLabel
    Left = 104
    Top = 200
    Width = 49
    Height = 13
    Caption = 'User Type'
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
    Top = 256
    Width = 121
    Height = 25
    Caption = 'create'
    TabOrder = 2
    OnClick = Button1Click
  end
  object UserLoginEdit: TEdit
    Left = 104
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object UserTypeComboBox: TComboBox
    Left = 104
    Top = 221
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
