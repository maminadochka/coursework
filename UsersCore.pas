unit UsersCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Libs, UsersListsCore;

type
  // classes should be in one file. i can get they and manage. so studyclass will be integer with class uuid
  // user types: pupil, parent, teacher, zavuch
  
  TForm10 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  user: TUser;

function createUser(login, firstname, lastname, userType, ownClass, classes, studyClass: string): boolean;
function getUser(const login: string): TUser;
function getUserById(const userId: string): TUser;

implementation

{$R *.dfm}

function createUser(login, firstname, lastname, userType, ownClass, classes, studyClass: string): boolean;
var
  UsersList: UsersListsCore.TUsersList;
  curr: UsersListsCore.PTListElement;
begin
//  Form21.dirSource := 'UsersList';
  // if not check exists
  // TODO load users list from usersListCore
  New(curr);
  // file not found error
  UsersListsCore.LoadList(UsersList);
  curr^.data.userId := GenerateUUID();
  curr^.data.login := login;
  curr^.data.firstname := firstname;
  curr^.data.lastname := lastname;
  curr^.data.userType := userType;
  curr^.data.ownClass := ownClass;
  curr^.data.classes := classes;
  curr^.data.studyClass := studyClass;
  UsersListsCore.AddToEnd(UsersList, curr);
  UsersListsCore.SaveList(UsersList);
//  SetLength(UsersList, Length(UsersList)+1);
//  UsersList[High(UsersList)] := user;
  Result := true;
  exit;
end;

function getUser(const login: string): TUser;
var
  i: integer;
  usersList: UsersListsCore.TUsersList;
begin
  for i := 0 to Length(UsersList)-1 do
    begin
      if UsersList[i].data.login = login then
      begin
        Result := UsersList[i];
        exit;
      end;
    end;
end;

function getUserById(const userId: string): TUser;
var
  i: integer;
begin
  for i := 0 to Length(UsersList)-1 do
    begin
      if UsersList[i].userId = userId then
      begin
        Result := UsersList[i];
        exit;
      end;
    end;
end;

// function checkExists()
end.
