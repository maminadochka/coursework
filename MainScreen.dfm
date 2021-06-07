object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 845
  ClientWidth = 1540
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 574
    Top = 248
    Width = 371
    Height = 25
    Caption = '                   '#1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103'                   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 678
    Top = 302
    Width = 30
    Height = 13
    Caption = #1051#1086#1075#1080#1085
  end
  object Label3: TLabel
    Left = 678
    Top = 348
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object LoginInp: TEdit
    Left = 678
    Top = 321
    Width = 180
    Height = 21
    TabOrder = 0
    Text = 'ksu'
  end
  object PasswordInp: TEdit
    Left = 678
    Top = 367
    Width = 180
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = '123'
  end
  object LoginBtn: TButton
    Left = 678
    Top = 407
    Width = 180
    Height = 33
    Caption = #1042#1086#1081#1090#1080
    Default = True
    TabOrder = 2
    OnClick = LoginBtnClick
    OnEnter = LoginBtnClick
  end
  object Button3: TButton
    Left = 678
    Top = 446
    Width = 180
    Height = 33
    Cancel = True
    Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
    TabOrder = 3
    OnClick = Button3Click
    OnExit = Button3Click
  end
end
