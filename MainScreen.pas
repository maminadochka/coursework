unit MainScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
    function auth(Login, Password: string) : boolean;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
                  uses UserScreen, ParentsScreen;
{$R *.dfm}
function TForm1.auth(Login, Password: string) : boolean;
  begin
    if (Login = 'Lu') and (Password = '123') then
       Result:= true;
  end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form6.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.color:=$ecb2ce;
end;

procedure TForm1.LoginBtnClick(Sender: TObject);
begin
if auth( LoginInp.Text, PasswordInp.Text) then
   begin
      Form2.ShowModal;
   end
   else ShowMessage('��������� �������� ������');
end;
end.
