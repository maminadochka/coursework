unit newUserScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UsersCore;

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
    UserTypeComboBox: TComboBox;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    usersList: UsersCore.TUsersList;
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}


procedure TForm20.Button1Click(Sender: TObject);
begin
  UsersCore.createUser(usersList, UserLoginEdit.Text, FirstNameEdit.Text, LastNameEdit.Text, UserTypeComboBox.Text, '','','');
  ShowMessage(inttostr(Length(usersList)));
end;

end.