object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 845
  ClientWidth = 1540
  Color = clSkyBlue
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
  object Label1: TLabel
    Left = 24
    Top = 21
    Width = 43
    Height = 13
    Caption = 'Users list'
  end
  object UsersTable: TStringGrid
    Left = 16
    Top = 48
    Width = 969
    Height = 585
    ColCount = 6
    TabOrder = 0
  end
  object NewUserBtn: TButton
    Left = 120
    Top = 17
    Width = 129
    Height = 25
    Caption = 'New Teacher'
    TabOrder = 1
    OnClick = NewUserBtnClick
  end
  object DeleteBut: TButton
    Left = 991
    Top = 600
    Width = 186
    Height = 33
    Caption = 'DeleteBut'
    TabOrder = 2
    OnClick = DeleteButClick
  end
  object SaveBut: TButton
    Left = 991
    Top = 561
    Width = 186
    Height = 33
    Caption = 'Button1'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 1016
    Top = 80
    Width = 131
    Height = 241
    Caption = 'Button1'
    TabOrder = 4
    OnClick = sortbylastname
  end
end
