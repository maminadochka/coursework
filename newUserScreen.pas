unit newUserScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UsersCore, UsersListsCore, AuthCore;

type
  TForm20 = class(TForm)
    LastNameEdit: TEdit;
    FirstNameEdit: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    UserLoginEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    SubjectComboBox: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}


procedure TForm20.Button1Click(Sender: TObject);
var AuthUsersList: AuthCore.TUsersList;
    password: integer;
begin
//AuthUsersList:= AuthCore.loadlist;
  UsersCore.createUser(UserLoginEdit.Text, FirstNameEdit.Text, LastNameEdit.Text, 'teacher' ,'', '',SubjectComboBox.Text);
//  AuthCore.AddUser()
  password:= random(100);
  Showmessage('login: '+ UserLoginEdit.Text+ '  password: '+inttostr(password));
  AuthCore.AddUser(AuthUsersList, UserLoginEdit.Text, password.ToString);
  Form20.Close;
end;

//drawTable

procedure TForm20.FormShow(Sender: TObject);

begin
  // pass
  SubjectComboBox.Items.Clear;
  SubjectComboBox.Items.Add ('Math');
  SubjectComboBox.Items.Add ('Rus');
end;
end.
