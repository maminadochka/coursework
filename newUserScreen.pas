unit newUserScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UsersCore, UsersListsCore;

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
begin
  UsersCore.createUser(UserLoginEdit.Text, FirstNameEdit.Text, LastNameEdit.Text, UserTypeComboBox.Text, '11A','8A','7A');
  Form20.Close;
end;

//drawTable

procedure TForm20.FormShow(Sender: TObject);

begin
  // pass
end;
end.
