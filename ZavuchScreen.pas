unit ZavuchScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UsersCore, ZavuchClassesManage, ClassesCore;

type
  TForm2 = class(TForm)
    UserName: TLabel;
    Journal: TButton;
    UsersManage: TButton;
    UserEdit: TButton;
    Button1: TButton;
    procedure UsersManageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JournalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    user: UsersCore.TUser;
    userLogin: string;
    usersList: UsersCore.TUsersList;
    classesList: ClassesCore.TClassesList;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses UsersManage, Journal;
{$R *.dfm}


procedure TForm2.Button1Click(Sender: TObject);
begin
  Form15.classesList := classesList;
  Form15.ShowModal;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  fullName: string;
begin
  user := UsersCore.getUser(usersList, userLogin);
  fullName := user.firstName + ' ' + user.lastName;
  UserName.Caption := fullName; 
end;

procedure TForm2.JournalClick(Sender: TObject);
begin
    Form4.ShowModal;
end;

procedure TForm2.UsersManageClick(Sender: TObject);
begin
    Form3.usersList := usersList;
    Form3.ShowModal;
end;

end.
