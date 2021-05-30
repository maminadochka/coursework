unit UsersListsCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TUser = record
    userId: string[10];
    login: string[10];
    firstname: string[50];
    lastname: string[50];
    userType: string[50];
    ownClass: string[50]; // will be integer
    classes: string[50];
    studyClass: string[50];
  end;
  TUsersList = array of TUser;
  PTListElement = ^TListElement;
  TListElement = record
    data: TUser;
    next: PTListElement;
    prev: PTListElement;
  end;
  TList = record
    head: PTListElement;
    tail: PTListElement;
    elemsCount: integer;
  end;
  TForm21 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

procedure AddToEnd(var List: TList; var NewElementPointer: PTListElement);
procedure SaveList(const List: TList);
procedure LoadList(var List: TList);

implementation

{$R *.dfm}

procedure LoadList(var List: TList);
var
  f: file of TUser;
  tmp: PTListElement;
  cnt: integer;
  curr: PTListElement;
  dirSource: string;
begin
  dirSource := 'UsersList.txt';
  cnt := 0;
  List.head := nil;
  List.tail := nil;
  if FileExists(dirSource) = false then
  begin
    exit;
  end;
  New(curr);
  if FileSize(f) <> 0 then
  begin
    Read(f, curr^.data);
    AddToEnd(List, curr);
    while not EOF(f) do
    begin
      tmp := curr;
      New(curr);
      Read(f, curr^.data);
      AddToEnd(List, curr);
      tmp.next := curr;
      curr.prev := tmp;
    end;
  end;
end;

procedure SaveList(const List: TList);
var
  f: file of TUser;
  curr: PTListElement;
  dirSource: string;
begin
  dirSource := 'UsersList.txt';
  AssignFile(f, dirSource);
  Rewrite(f);
  curr := List.head;
  while curr <> nil do
  begin
    Write(f, curr^.data);
    curr := curr^.next;
  end;
  ShowMessage('List saved!');
end;

procedure AddToEnd(var List: TList; var NewElementPointer: PTListElement);
begin
  inc(List.elemsCount);
  if List.head = nil then
  begin
    List.head := NewElementPointer;
    List.tail := NewElementPointer;
    NewElementPointer^.next := nil;
    NewElementPointer^.prev := nil;
    exit;
  end;
  NewElementPointer^.next := nil;
  NewElementPointer^.prev := List.tail;
  List.tail^.next := NewElementPointer;
  List.tail := NewElementPointer;
  ShowMessage(inttostr(List.elemsCount));
end;

end.
