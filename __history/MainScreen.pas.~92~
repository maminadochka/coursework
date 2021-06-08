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
    Button3: TButton;
    procedure LoginBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AuthUsersList: AuthCore.TUsersList;

implementation
uses ZavuchScreen, UsersManage, teacherScreen, pupilScreen,
  UsersListsCore;
{$R *.dfm}


procedure startup();
// creates new users for testing
begin
  AuthCore.AddUser(AuthUsersList, 'ksu', '123');
  AuthCore.AddUser(AuthUsersList, 'bt', '4');
  UsersCore.createUser('ksu', 'Ksenia', 'Tsutsalevich', 'zavuch', '7A', '11A', '8A','');
// UsersCore.createUser('bt', 'Boltak', 'Sveta', 'zavuch', '7A', '11A', '8A');
//  UsersCore.createUser('bt', 'Sveta', 'Boltak', 'teacher', '10A', '', '');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if Form1.CloseQuery then Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.color:=$ecb2ce;
  startup();
end;

procedure TForm1.LoginBtnClick(Sender: TObject);
var
  user: TUser;
  UsersList: UsersListsCore.TList;
begin
  if auth(AuthUsersList, LoginInp.Text, PasswordInp.Text) then
  begin
    // ShowMessage('auth ok');
//     UsersListsCore.LoadList(usersList);
     user := UsersCore.getUser(LoginInp.Text);
//     ShowMessage(user.login);
    // if user.userType = 'zavuch' then
    // begin
//       Form2.usersList := usersList;
       Form2.userLogin := user.login;
//       Form2.userId := user.userId;
      // Form2.ShowModal();
    // end;
    // if user.userType = 'teacher' then
    // begin
    //   Form2.usersList := usersList;
    //   Form2.userLogin := user.login;
    //   Form2.userId := user.userId;
       Form2.ShowModal();
    // end;
    // if user.userType = 'pupil' then
    // begin
    //   Form2.usersList := usersList;
    //   Form2.userLogin := user.login;
    //   Form2.userId := user.userId;
    //   Form14.ShowModal();
    // end;
  end
  else
  begin
    ShowMessage('auth failed!');
  end;
end;
end.
