unit ZavuchScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UsersCore, ZavuchClassesManage, ClassesCore, UsersListsCore, ClassesListsCore;

type
  TForm2 = class(TForm)
    UserName: TLabel;
    Journal: TButton;
    UsersManage: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure UsersManageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JournalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    userLogin: string;
    userId: string;
    usersList: UsersListsCore.TList;
    classesList: ClassesListsCore.TList;
    UserType:string;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses UsersManage, Journal, ParentsScreen, Statistics;
{$R *.dfm}


procedure TForm2.Button1Click(Sender: TObject);
begin
  Form15.ShowModal;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form6.userlogin:=userlogin;
  Form6.ShowModal;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  fullName: string;
  user: UsersListsCore.TUser;

begin
  user := UsersCore.getUser(userLogin);
  fullName := user.firstName + ' ' + user.lastName;
  UserName.Caption := fullName;
  if user.userType = 'teacher' then
  begin
    Journal.Visible := True;
    UsersManage.Visible := False;
    Button1.Visible := False;
    Button2.Visible := False;
  end;
  if user.userType = 'zavuch' then
  begin
    Journal.Visible := True;
    UsersManage.Visible := True;
    Button1.Visible := True;
    Button2.Visible := False;
  end;
  if user.userType = 'pupil' then
  begin
    Journal.Visible := false;
    UsersManage.Visible := False;
    Button1.Visible := False;
    Button2.Visible := True;
  end;
end;

procedure TForm2.JournalClick(Sender: TObject);
begin
//    Form4.usersList := usersList;
    Form4.managerId := userId;
    Form4.ShowModal;
end;

procedure TForm2.UsersManageClick(Sender: TObject);
begin
//    Form3.usersList := usersList;
    Form3.ShowModal;
end;
end.
