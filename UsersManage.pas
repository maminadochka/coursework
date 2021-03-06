unit UsersManage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, UsersCore, AuthCore,
  Vcl.Grids, newUserScreen, UsersListsCore;

type
  TForm3 = class(TForm)
    UsersTable: TStringGrid;
    Label1: TLabel;
    NewUserBtn: TButton;
    DeleteBut: TButton;
    SaveBut: TButton;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure NewTeacherBtnClick(Sender: TObject);
    procedure NewUserBtnClick(Sender: TObject);
    procedure drawUsersTable(userType: string);
    procedure cleanUsersTable();
    procedure ShowTeachersBtnClick(Sender: TObject);
    procedure ShowZavuchesBtnClick(Sender: TObject);
    procedure ShowPupilsBtnClick(Sender: TObject);
    procedure showAllUsersClick(Sender: TObject);
    procedure DeleteButClick(Sender: TObject);
    procedure sortbylastname(Sender: TObject);

  private
    { Private declarations }
  public
    usersList: UsersListsCore.TList;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}


procedure TForm3.cleanUsersTable();
  var
  i: integer;
  j: Integer;
begin
  for i := 1 to 100 do
    begin
      for j := 0 to 100 do
        begin
          UsersTable.Cells[j, i] := '';
        end;
    end;
end;

procedure TForm3.DeleteButClick(Sender: TObject);
begin
  Showmessage(UsersTable.Cells[0,UsersTable.row]);
  UsersListsCore.deleteel(UsersTable.Cells[0,UsersTable.row]);
  AuthCore.DeleteUser(UsersTable.Cells[1, UsersTable.Row]);
  drawUsersTable('');
end;

procedure TForm3.drawUsersTable(userType: string);
var
  usersList: UsersListsCore.TList;
  curr: UsersListsCore.PTListElement;
  cnt: integer;
begin
  UsersListsCore.LoadList(usersList);
  curr := usersList.head;
  cnt := 0;
  UsersTable.RowCount := 100;
  while curr <> nil do
  begin
     UsersTable.Cells[0, cnt+1] := curr^.data.UserID;
     UsersTable.Cells[1, cnt+1] := curr^.data.login;
     UsersTable.Cells[2, cnt+1] := curr^.data.lastname;
     UsersTable.Cells[3, cnt+1] := curr^.data.firstname;
     UsersTable.Cells[4, cnt+1] := curr^.data.userType;
     UsersTable.Cells[5, cnt+1] := curr^.data.subject;
     cnt := cnt+1;
    curr := curr^.next;
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  usersTable.ColWidths[0] := 0;
  usersTable.ColWidths[1] := 800;
  usersTable.ColWidths[2] := 400;
  usersTable.ColWidths[3] := 400;
  usersTable.ColWidths[4] := 300;
  usersTable.ColWidths[5] := 300;
  usersTable.Cells[0,0] := 'userId';
  usersTable.Cells[1,0] := 'login';
  usersTable.Cells[2,0] := 'LastName';
  usersTable.Cells[3,0] := 'FirstName';
  usersTable.Cells[4,0] := 'userType';
  usersTable.Cells[5,0] := 'Subject';
  cleanUsersTable;
  drawUsersTable('all');
end;

procedure TForm3.NewTeacherBtnClick(Sender: TObject);
begin
  Form20.ShowModal;
end;

procedure TForm3.NewUserBtnClick(Sender: TObject);
begin
  Form20.ShowModal();
  cleanUsersTable();
  drawUsersTable('all');
end;

procedure TForm3.showAllUsersClick(Sender: TObject);
begin
  cleanUsersTable();
  drawUsersTable('all');
end;

procedure TForm3.ShowPupilsBtnClick(Sender: TObject);
begin
  cleanUsersTable();
  drawUsersTable('pupils');
end;

procedure TForm3.ShowTeachersBtnClick(Sender: TObject);
begin
  cleanUsersTable();
  drawUsersTable('teacher');
end;

procedure TForm3.ShowZavuchesBtnClick(Sender: TObject);
begin
  cleanUsersTable();
  drawUsersTable('zavuch');
end;

procedure TForm3.sortbylastname(Sender: TObject);      //dodelat'
var  i, j, cnt :integer;
begin
   begin
     Cnt := Userstable.RowCount;
   for j := 1 to Cnt - 2 do
    for i := j+1 to Cnt - 1 do
    begin
     if Userstable.Cells[2, i]='' then  exit;
      if Userstable.Cells[2, i] < Userstable.Cells[2, j] then
      with Userstable do
      begin
        Rows[Cnt] := Rows[i];
        Rows[i] := Rows[j];
        Rows[j] := Rows[Cnt];
      end;
    end;
   end;
end;
end.


