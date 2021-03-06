unit AuthCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AuthListsCore, Libs;

type
  TAuthUser = record
    login: string;
    password: string;
  end;
  TAuthUsersList = array of TAuthUser;
  TForm9 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

function AddUser(const login: string; const password: string): boolean;
function auth(const login: string; password: string): boolean;
function checkExists(login: string): boolean;
procedure DeleteUser(login: string);

implementation

{$R *.dfm}

function auth(const login: string; password: string): boolean;
var
  curr: AuthListsCore.PTListElement;
  AuthList: AuthListsCore.TList;
begin
  AuthListsCore.LoadList(AuthList);
  New(curr);
  curr := AuthList.head;
  while curr <> nil do
  begin
//    ShowMessage('login: '+curr.data.login+' passw'+curr.data.password);
    if curr.data.login = login then
    begin
      if curr.data.password = password then
      begin
        Result := true;
        exit;
      end;
    end;
    curr := curr.next;
  end;
  Result := false;
  exit;
end;


function AddUser(const login: string; const password: string): boolean;    // FIX IT
// TODO encrypt password SHA1 or MD5
var
  AuthUsersList: AuthListsCore.TList;
  curr: AuthListsCore.PTListElement;
begin
    if (login <> '') And (checkExists(login)) then
      begin
        exit;
      end;
    New(curr);
    AuthListsCore.LoadList(AuthUsersList);
    if Length(login) = 0 then
    begin
      curr^.data.login := Libs.generateUUID();
    end
    else
    begin
      curr^.data.login := login;
    end;
     curr^.data.password := password;
     AuthListsCore.AddToEnd(AuthUsersList, curr);
     AuthListsCore.SaveList(AuthUsersList);
     ShowMessage('login: '+curr.data.login+' password: '+curr.data.password);
    Dispose(curr);
    Result := true;
    exit;
end;

function checkExists(login: string): boolean;
 var
  i: integer;
  exFlag: boolean;
  AuthUsersList: AuthListsCore.TList;
  curr: AuthListsCore.PTListElement;
begin
  exFlag := false;
  AuthListsCore.LoadList(AuthUsersList);
  New(curr);
  curr := AuthUsersList.head;
  while curr <> nil do
  begin
    if curr^.data.login = login then
    begin
      exFlag := true;
      break;
    end;
    curr := curr^.next;
  end;
  Result := exFlag;
  exit;
 end;

 procedure DeleteUser(login: string);
 begin
    AuthListsCore.DeleteEl(login);
 end;


end.
