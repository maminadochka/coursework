unit MainScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AuthCore, UsersCore;

type
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
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AuthUsersList: AuthCore.TUsersList;
  UsersList: UsersCore.TUsersList;

implementation
uses ZavuchScreen, ParentsScreen, UsersManage, teacherScreen, pupilScreen;
{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
  Form6.ShowModal;
end;

procedure startup();
// creates new users for testing
begin
  AuthCore.AddUser(AuthUsersList, 'ksu', '123');
  AuthCore.AddUser(AuthUsersList, 'bt', '4');
  UsersCore.createUser(UsersList, 'ksu', 'Ksenia', 'Tsusalevich', 'zavuch', '11A', '', '');
  UsersCore.createUser(UsersList, 'bt', 'Sveta', 'Boltak', 'teacher', '10A', '', '');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.color:=$ecb2ce;
  startup();
end;

procedure TForm1.LoginBtnClick(Sender: TObject);
var
  user: TUser;
begin
  if auth(AuthUsersList, LoginInp.Text, PasswordInp.Text) then
  begin
    user := UsersCore.getUser(usersList, LoginInp.Text);
    if user.userType = 'zavuch' then
    begin
      Form2.usersList := usersList;
      Form2.userLogin := user.login;
      Form2.ShowModal();
    end;
    if user.userType = 'teacher' then
    begin
      Form13.ShowModal();
    end;
    if user.userType = 'pupil' then
    begin
      Form14.ShowModal();
    end;
  end
  else
  begin
    ShowMessage('auth failed!');
  end;
end;
end.
