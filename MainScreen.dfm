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
    Left = 256
    Top = 192
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
    Left = 352
    Top = 245
    Width = 30
    Height = 13
    Caption = #1051#1086#1075#1080#1085
  end
  object Label3: TLabel
    Left = 352
    Top = 308
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object LoginInp: TEdit
    Left = 352
    Top = 263
    Width = 180
    Height = 21
    TabOrder = 0
    Text = 'Lu'
  end
  object PasswordInp: TEdit
    Left = 352
    Top = 327
    Width = 180
    Height = 21
    TabOrder = 1
    Text = '123'
  end
  object LoginBtn: TButton
    Left = 352
    Top = 368
    Width = 180
    Height = 33
    Caption = #1042#1086#1081#1090#1080
    TabOrder = 2
    OnClick = LoginBtnClick
  end
  object Button2: TButton
    Left = 352
    Top = 416
    Width = 180
    Height = 33
    Caption = #1059' '#1084#1077#1085#1103' '#1077#1089#1090#1100' '#1087#1088#1080#1075#1083#1072#1089#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1086#1076
    TabOrder = 3
  end
  object Button1: TButton
    Left = 392
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
end
