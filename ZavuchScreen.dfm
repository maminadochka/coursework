object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object UserName: TLabel
    Left = 248
    Top = 80
    Width = 7
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Journal: TButton
    Left = 450
    Top = 224
    Width = 153
    Height = 41
    Caption = #1046#1091#1088#1085#1072#1083
    TabOrder = 0
    OnClick = JournalClick
  end
  object UsersManage: TButton
    Left = 450
    Top = 296
    Width = 153
    Height = 41
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084#1080
    TabOrder = 1
    OnClick = UsersManageClick
  end
  object UserEdit: TButton
    Left = 450
    Top = 152
    Width = 153
    Height = 41
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1086#1092#1080#1083#1100
    TabOrder = 2
  end
  object Button1: TButton
    Left = 450
    Top = 360
    Width = 153
    Height = 33
    Caption = #1050#1083#1072#1089#1089#1099
    TabOrder = 3
    OnClick = Button1Click
  end
end