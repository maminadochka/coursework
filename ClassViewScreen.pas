﻿unit ClassViewScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, ClassesCore, ClassesListsCore, UsersListsCore;

type
  TForm16 = class(TForm)
    PupilsListTable: TStringGrid;
    Label1: TLabel;
    classNameLabel: TLabel;
    classNameLabel2: TLabel;
    Label2: TLabel;
    ManagerNameLabel2: TLabel;
    addPupilBtn: TButton;
    LastNameEdit: TEdit;
    FirstNameEdit: TEdit;
    MATH: TLabel;
    RUSSKIY: TLabel;
    MATHteacherComboBox: TComboBox;
    RUSteacherComboBox: TComboBox;
    SaveBut: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    classId: string[50];
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

procedure TForm16.FormCreate(Sender: TObject);
begin
  PupilsListTable.Cells[0,0] := 'pupil_id';
  PupilsListTable.Cells[1,0] := '№';
  PupilsListTable.Cells[2, 0] := 'LastName';
  PupilsListTable.Cells[3, 0] := 'FirstName';
end;

procedure TForm16.FormShow(Sender: TObject);
var
  _class: ClassesListsCore.T_Class;
  userslist: UsersListsCore.TList;
  curr: UsersListsCore.PTListElement;
begin
  _class := ClassesCore.getClass(classId);
  classNameLabel2.Caption := _class.name;
  // TODO get manager name
  ManagerNameLabel2.Caption := _class.managerId;

  UsersListsCore.loadlist(Userslist);
  Curr:= Userslist.head;
  while curr <> nil do
  begin
    if curr.data.subject = 'Math' then
    MATHteachercombobox.items.Add(curr.data.firstname+ ' ' + curr.data.lastname);
    if curr.data.subject = 'Rus' then
    RUSteachercombobox.items.Add(curr.data.firstname+ ' ' + curr.data.lastname);
    curr:= curr.next;

  end;
end;
end.
