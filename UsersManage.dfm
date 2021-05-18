object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UserAddBtn: TButton
    Left = 408
    Top = 335
    Width = 353
    Height = 38
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    TabOrder = 0
    OnClick = UserAddBtnClick
  end
  object ShowTeachersRadioBtn: TRadioButton
    Left = 25
    Top = 9
    Width = 113
    Height = 17
    Caption = #1057#1087#1080#1089#1086#1082' '#1059#1095#1080#1090#1077#1083#1077#1081
    TabOrder = 1
    OnClick = ShowTeachersRadioBtnClick
  end
  object ShowPupilsRadioBtn: TRadioButton
    Left = 224
    Top = 9
    Width = 113
    Height = 17
    Caption = #1057#1087#1080#1089#1086#1082' '#1091#1095#1077#1085#1080#1082#1086#1074
    TabOrder = 2
    OnClick = ShowPupilsRadioBtnClick
  end
  object PupilPanel: TPanel
    Left = 455
    Top = 122
    Width = 266
    Height = 191
    TabOrder = 3
    object LastNamePupilLabel: TLabel
      Left = 16
      Top = 16
      Width = 44
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object FirstNamePupilLabel: TLabel
      Left = 16
      Top = 72
      Width = 19
      Height = 13
      Caption = #1048#1084#1103
    end
    object ClassPupilLabel: TLabel
      Left = 16
      Top = 128
      Width = 29
      Height = 13
      Caption = #1050#1083#1072#1089#1089
    end
    object LastNamePupilEdit: TEdit
      Left = 16
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object FirstNamePupilEdit: TEdit
      Left = 16
      Top = 91
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object ClassPupilComboBox: TComboBox
      Left = 16
      Top = 147
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '7A'
    end
  end
  object AddPupilRadioBtn: TRadioButton
    Left = 608
    Top = 99
    Width = 113
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1077#1085#1080#1082#1072
    TabOrder = 4
    OnClick = AddPupilRadioBtnClick
  end
  object AddTeacherRadioBtn: TRadioButton
    Left = 455
    Top = 99
    Width = 113
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1080#1090#1077#1083#1103
    TabOrder = 5
    OnClick = AddTeacherRadioBtnClick
  end
  object TeacherPanel: TPanel
    Left = 455
    Top = 122
    Width = 266
    Height = 191
    TabOrder = 6
    object LastNameTeacherLabel: TLabel
      Left = 16
      Top = 16
      Width = 44
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object FirstNameTeacherLabel: TLabel
      Left = 16
      Top = 72
      Width = 19
      Height = 13
      Caption = #1048#1084#1103
    end
    object OwnClassTeacherLabel: TLabel
      Left = 16
      Top = 128
      Width = 116
      Height = 13
      Caption = #1050#1083#1072#1089#1089#1085#1086#1077' '#1088#1091#1082#1086#1074#1086#1076#1089#1090#1074#1086
    end
    object LastNameTeacherEdit: TEdit
      Left = 16
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object FirstNameTeacherEdit: TEdit
      Left = 16
      Top = 91
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object OwnClassTeacherComboBox: TComboBox
      Left = 16
      Top = 147
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object UserEditBtn: TButton
    Left = 408
    Top = 371
    Width = 353
    Height = 38
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    TabOrder = 7
  end
  object TeachersListScrollBox: TScrollBox
    Left = 8
    Top = 32
    Width = 233
    Height = 407
    TabOrder = 8
  end
end
