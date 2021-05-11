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
    procedure LoginBtnClick(Sender: TObject);
    function auth(Login, Password: string) : boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
                  uses Zavuch;
{$R *.dfm}
function TForm1.auth(Login, Password: string) : boolean;
  begin
    if (Login = 'Lu') and (Password = '123') then
       Result:= true;
  end;

procedure TForm1.LoginBtnClick(Sender: TObject);
begin
if auth( LoginInp.Text, PasswordInp.Text) then
   begin
      Form2.ShowModal;
   end
   else ShowMessage('Проверьте введённые данные');
end;

end.
