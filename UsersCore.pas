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

function createUser(login, firstname, lastname, userType, ownClass, classes, studyClass, subject: string): boolean;
function getUser(const login: string): TUser;
function getUserById(const userId: string): TUser;

implementation

{$R *.dfm}

function createUser(login, firstname, lastname, userType, ownClass, classes, studyClass, subject: string): boolean;
var
  UsersList: UsersListsCore.TList;
  curr: UsersListsCore.PTListElement;
begin   //remove usertype!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  New(curr);
  UsersListsCore.LoadList(UsersList);
   curr^.data.login := login;
   curr^.data.firstname := firstname;
   curr^.data.lastname := lastname;
   curr^.data.userType := userType;
   curr^.data.ownClass := ownClass;
   curr^.data.classes := classes;
   curr^.data.studyClass := studyClass;
   curr^.data.subject := subject;
   UsersListsCore.AddToEnd(UsersList, curr);
   UsersListsCore.SaveList(UsersList);
  Dispose(curr);
  Result := true;
  exit;
end;

function getUser(const login: string): TUser;
var
  i: integer;
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

function getUserById(const userId: string): TUser;
//var
//  i: integer;
//  curr: UsersListsCore.PTPElement;
//  usersList: UsersListsCore.TList;
//begin
//  New(curr);
//  curr := usersList.head;
//  while curr <> nil do
//  begin
//    if curr^.data.login = userId then
//    begin
//      Result := curr^.data;
//      exit;
//    end;
//  end;
//end;
begin

end;

// function checkExists()
end.
