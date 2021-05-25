unit MainScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AuthCore;

type
  TUser = record
    login: string;
    password: string;
    fullname: string;
  end;
  TUsersList = array of TUser;
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LoginInp: TEdit;
    PasswordInp: TEdit;
    LoginBtn: TButton;
    Button2: TButton;
    Button1: TButton;
    procedure LoginBtnClick(Sender: TObject);
//    function auth(Login, Password: string) : boolean;
    function auth(login: string; password: string): boolean;
    function getUser(login: string): TUser;
    function checkExists(login: string): boolean;
    function AddUser(login: string; password: string; fullname: string): boolean;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  usersList: TUsersList;

implementation
uses UserScreen, ParentsScreen, UsersManage;
{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
  Form6.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.color:=$ecb2ce;
  AddUser('ksu', '123', '��������� ������ ��������������');
  AddUser('boltyara', '4', '������ �������� ������������');
end;

procedure TForm1.LoginBtnClick(Sender: TObject);
var
  user: TUser;
begin
  if auth(LoginInp.Text, PasswordInp.Text) then
  begin
    user := getUser(LoginInp.Text);
    Form2.UserName.Caption := user.fullname;
    Form2.ShowModal();
  end
  else
  begin
    ShowMessage('auth failed!');
  end;
end;


function TForm1.checkExists(login: string): boolean;
var
  i: integer;
begin
  for i := 0 to Length(UsersList)-1 do
  begin
    if UsersList[i].login = login then
    begin
      Result := true;
      break;
    end;
  end;
end;


function TForm1.auth(login: string; password: string): boolean;
begin
  if not checkExists(login) then
    begin
      Result := false;
      exit;
    end;
    Result := true;
    exit;
end;

function TForm1.AddUser(login: string; password: string; fullname: string): boolean;
// TODO encrypt password
var
  user: TUser;
begin
  user.login := login;
  user.password := password;
  user.fullname := fullname;
  SetLength(UsersList, Length(UsersList)+1);
  UsersList[High(UsersList)] := user;
end;

function TForm1.getUser(login: string): TUser;
var
  i: integer;
begin
  for i := 0 to Length(UsersList) do
    begin
      if UsersList[i].login = login then
      begin
        Result := UsersList[i];
        exit;
      end;
    end;
end;


end.
