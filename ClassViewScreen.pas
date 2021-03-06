unit ClassViewScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, ClassesCore, ClassesListsCore, UsersListsCore, UsersCore, AuthCore;

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
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure addPupilBtnClick(Sender: TObject);
    procedure SaveButClick(Sender: TObject);
    procedure drawUsersTable();
    procedure cleanUsersTable();
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

procedure TForm16.cleanUsersTable();
  var
  i: integer;
  j: Integer;
begin
  for i := 1 to 100 do
    begin
      for j := 0 to 100 do
        begin
          PupilsListTable.Cells[j, i] := '';
        end;
    end;
end;

procedure TForm16.drawUsersTable();
var
  usersList: UsersListsCore.TList;
  curr: UsersListsCore.PTListElement;
  cnt: integer;
begin
  UsersListsCore.LoadList(usersList);
  curr := usersList.head;
  cnt := 0;
  PupilsListTable.RowCount := 100;
  while curr <> nil do
  begin
     if curr^.data.studyClassID = classID then
     begin
      PupilsListTable.Cells[2, cnt+1] := curr^.data.lastname;
      PupilsListTable.Cells[3, cnt+1] := curr^.data.firstname;
      cnt := cnt+1;
     end;
    curr := curr^.next;
  end;
end;

procedure TForm16.addPupilBtnClick(Sender: TObject);
var
  upassw: string;
  ulogin: string;
begin
  ulogin:=UsersCore.createUser('',FirstNameEdit.Text, LastNameEdit.Text, 'pupil','',classID,'');
  randomize;
  upassw := inttostr(Random(100));
  AuthCore.AddUser(ulogin,upassw);
  cleanUsersTable;
  drawUsersTable;
end;

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
  cleanUsersTable;
  drawUsersTable;
  MATHteachercombobox.Items.Clear;
  RUSteachercombobox.Items.Clear;
  _class := ClassesCore.getClass(classID);
  classNameLabel2.Caption := _class.name;
  // TODO get manager id by name
//  ShowMessage(_class.managerId);
  ManagerNameLabel2.Caption := _class.managerId;

  UsersListsCore.loadlist(Userslist);
  Curr:= Userslist.head;
  MathTeacherCombobox.Text := _class.MathTeacherName;
  RusTeacherCombobox.Text := _class.RusTeacherName;
  while curr <> nil do
  begin
    if curr.data.subject = 'Math' then
    MATHteachercombobox.items.Add(curr.data.firstname+ ' ' + curr.data.lastname);
    if curr.data.subject = 'Rus' then
    RUSteachercombobox.items.Add(curr.data.firstname+ ' ' + curr.data.lastname);
    curr:= curr.next;
  end;
end;
procedure TForm16.SaveButClick(Sender: TObject);
begin
  classesCore.updateClass(classID, MATHteachercombobox.Text, Rusteachercombobox.Text);
  cleanUsersTable;
  drawUsersTable;
end;
end.
