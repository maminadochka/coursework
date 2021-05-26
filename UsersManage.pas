unit UsersManage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, UsersCore,
  Vcl.Grids, newUserScreen;

type
  TForm3 = class(TForm)
    UsersTable: TStringGrid;
    Label1: TLabel;
    NewUserBtn: TButton;
    ShowTeachersBtn: TButton;
    ShowZavuchesBtn: TButton;
    ShowPupilsBtn: TButton;
    SortBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure NewTeacherBtnClick(Sender: TObject);
    procedure NewUserBtnClick(Sender: TObject);
    procedure drawUsersTable();
    procedure cleanUsersTable();
  private
    { Private declarations }
  public
    usersList: UsersCore.TUsersList;
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
  for i := 1 to 15 do
    begin
      for j := 0 to 15 do
        begin
          UsersTable.Cells[j, i] := '';
        end;
    end;
end;

procedure TForm3.drawUsersTable();
var
  i: integer;
  user: UsersCore.TUser;
begin
  for i := 0 to Length(usersList)-1 do
  begin
    user := usersList[i];
    UsersTable.Cells[0, i+1] := user.userId;
    UsersTable.Cells[1, i+1] := user.login;
    UsersTable.Cells[2, i+1] := user.lastname;
    UsersTable.Cells[3, i+1] := user.firstname;
    UsersTable.Cells[4, i+1] := user.userType;
  end;
end;


procedure TForm3.FormShow(Sender: TObject);
begin
  usersTable.Cells[0,0] := 'userId';
  usersTable.Cells[1,0] := 'login';
  usersTable.Cells[2,0] := 'LastName';
  usersTable.Cells[3,0] := 'FirstName';
  usersTable.Cells[4,0] := 'userType';
  cleanUsersTable;
  drawUsersTable;
end;

procedure TForm3.NewTeacherBtnClick(Sender: TObject);
begin
  Form20.ShowModal;
end;

procedure TForm3.NewUserBtnClick(Sender: TObject);
begin
  Form20.usersList := usersList; // it is not correct. list will be not updated
  Form20.ShowModal();
  cleanUsersTable();
  drawUsersTable();
end;

end.
