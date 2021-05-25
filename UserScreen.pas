unit UserScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    UserName: TLabel;
    Journal: TButton;
    UsersManage: TButton;
    UserEdit: TButton;
    procedure UsersManageClick(Sender: TObject);
    procedure JournalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  user_name: string;

implementation
                uses UsersManage, Journal;
{$R *.dfm}


procedure TForm2.JournalClick(Sender: TObject);
begin
    Form4.ShowModal;
end;

procedure TForm2.UsersManageClick(Sender: TObject);
begin
    Form3.ShowModal;
end;

end.
