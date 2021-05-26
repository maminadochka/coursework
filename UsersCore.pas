unit UsersCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Libs;

type
  // classes should be in one file. i can get they and manage. so studyclass will be integer with class uuid
  // user types: pupil, parent, teacher, zavuch
  TUser = record
    userId: string;
    login: string;
    firstname: string;
    lastname: string;
    userType: string;
    ownClass: string; // will be integer
    classes: string;
    studyClass: string; // will be integer
  end;
  TUsersList = array of TUser;
  TForm10 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  user: TUser;

function createUser(var UsersList: TUsersList; login, firstname, lastname, userType, ownClass, classes, studyClass: string): boolean;
function getUser(var UsersList: TUsersList; const login: string): TUser;

implementation

{$R *.dfm}

function createUser(var UsersList: TUsersList; login, firstname, lastname, userType, ownClass, classes, studyClass: string): boolean;
begin
  // if not check exists
  user.userId := GenerateUUID();
  user.login := login;
  user.firstname := firstname;
  user.lastname := lastname;
  user.userType := userType;
  user.ownClass := ownClass;
  user.classes := classes;
  user.studyClass := studyClass;
  SetLength(UsersList, Length(UsersList)+1);
  UsersList[High(UsersList)] := user;
  Result := true;
end;

function getUser(var UsersList: TUsersList; const login: string): TUser;
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

// function checkExists()
end.
