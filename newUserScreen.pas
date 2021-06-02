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
    OwnClassComboBox: TComboBox;
    Label5: TLabel;
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
begin
//AuthUsersList:= AuthCore.loadlist;
  UsersCore.createUser(UserLoginEdit.Text, FirstNameEdit.Text, LastNameEdit.Text, 'teacher', OwnClassComboBox.Text,'8A','7A',SubjectComboBox.Text);
//  AuthCore.AddUser()
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
