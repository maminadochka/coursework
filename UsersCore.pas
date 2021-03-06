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

function createUser(login, firstname, lastname, userType, classes, studyClass, subject: string): string;
function getUser(const login: string): TUser;
function getUsersBySubject(const subject: string): UsersListsCore.TUsersList;
function checkExists(login: string): boolean;

implementation

{$R *.dfm}

function createUser(login, firstname, lastname, userType, classes, studyClass, subject: string): string;
var
  UsersList: UsersListsCore.TList;
  curr: UsersListsCore.PTListElement;
begin
    if checkExists(login) then
      begin
        Result:=login;
        exit;
      end;
    New(curr);
    UsersListsCore.LoadList(UsersList);
    curr^.data.userId := Libs.generateUUID();
    if Length(login) = 0 then
    begin
      curr^.data.login := curr^.data.userId;
    end
    else
    begin
      curr^.data.login := login;
    end;
     curr^.data.firstname := firstname;
     curr^.data.lastname := lastname;
     curr^.data.userType := userType;
     curr^.data.classes := classes;
     curr^.data.studyClassID := studyClass;
     curr^.data.subject := subject;
     UsersListsCore.AddToEnd(UsersList, curr);
     UsersListsCore.SaveList(UsersList);
     Result := curr.data.login;
    Dispose(curr);
    exit;
  end;

function getUser(const login: string): TUser;
var
  i: integer;
  emptyUser: TUser;
  usersList: UsersListsCore.TList;
  curr: UsersListsCore.PTListElement;
begin
  UsersListsCore.LoadList(usersList);
  New(curr);
  curr := usersList.head;
  while curr <> nil do
  begin
    if curr^.data.login = login then
    begin
      Result := curr^.data;
      exit;
    end;
    curr := curr^.next;
  end;
end;

function getUsersBySubject(const subject: string): TUsersList;
var
 i: integer;
 curr: UsersListsCore.PTListElement;
 usersList: UsersListsCore.TList;
 results: UsersListsCore.TUsersList;
begin
 New(curr);
 curr := usersList.head;
 while curr <> nil do
 begin
   if curr^.data.subject = subject then
   begin
     SetLength(results, Length(results)+1);
     results[High(result)] := curr^.data;
   end;
 end;
end;

 function checkExists(login: string): boolean;
 var
  i: integer;
  exFlag: boolean;
  usersList: UsersListsCore.TList;
  curr: UsersListsCore.PTListElement;
begin
  exFlag := false;
  UsersListsCore.LoadList(usersList);
  New(curr);
  curr := usersList.head;
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
end.
