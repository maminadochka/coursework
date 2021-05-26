unit AuthCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TUser = record
    login: string;
    password: string;
  end;
  TUsersList = array of TUser;
  TForm9 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

function checkExists(const usersList: TUsersList; const login: string): boolean;
function AddUser(var usersList: TUsersList; const login: string; const password: string): boolean;
function getUser(var usersList: TUsersList; const login: string): TUser;
function auth(var usersList: TUsersList; login: string; password: string): boolean;

implementation

{$R *.dfm}

function auth(var usersList: TUsersList; login: string; password: string): boolean;
begin
  if not checkExists(usersList, login) then
    begin
      Result := false;
      exit;
    end;
    Result := true;
    exit;
end;

function checkExists(const usersList: TUsersList; const login: string): boolean;
var
  i: integer;
begin
  for i := 0 to Length(UsersList)-1 do
  begin
    if UsersList[i].login = login then
    begin
      Result := true;
      break;
    end;
  end;
end;

function AddUser(var usersList: TUsersList; const login: string; const password: string): boolean;
// TODO encrypt password
var
  user: TUser;
begin
  user.login := login;
  user.password := password;
  SetLength(UsersList, Length(UsersList)+1);
  UsersList[High(UsersList)] := user;
end;


function getUser(var usersList: TUsersList; const login: string): TUser;
var
  i: integer;
begin
  for i := 0 to Length(UsersList)-1 do
    begin
      if UsersList[i].login = login then
      begin
        Result := UsersList[i];
        exit;
      end;
    end;
end;
end.
