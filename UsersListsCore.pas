unit UsersListsCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TUser = record
    userId: string[50];
    login: string[50];
    firstname: string[50];
    lastname: string[50];
    userType: string[50];
    classes: string[50];
    studyClassID: string[50];
    subject: string[20];
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
procedure SaveList(var List: TList);
procedure LoadList(var List: TList);
procedure DeleteEl(UserID: string);

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
  AssignFile(f, dirSource);
  cnt := 0;
  List.head := nil;
  List.tail := nil;
  if FileExists(dirSource) = false then
  begin
    List.elemsCount := 0;
    exit;
  end;
  Reset(f);
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
      cnt := cnt+1;
    end;
    List.elemsCount := cnt;
  end;
  CloseFile(f);
  Dispose(curr);
end;

procedure SaveList(var List: TList);
var
  f: file of TUser;
  curr: PTListElement;
  dirSource: string;
  cnt: integer;
begin
  dirSource := 'UsersList.txt';
  AssignFile(f, dirSource);
  Rewrite(f);
  New(curr);
  curr := List.head;
  while curr <> nil do
  begin
    Write(f, curr^.data);
    curr := curr^.next;
  end;
  Dispose(curr);
  CloseFile(f);
end;

procedure AddToEnd(var List: TList; var NewElementPointer: PTListElement);
var
  curr: PTListElement;
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
end;

procedure DeleteEl(UserID: string);
var List :TList; curr :PTListElement;
begin
 LoadList(List);
 New(curr);
 curr:=List.head;
 while curr<>nil do
   begin
    if curr.data.userId=UserID then
     begin
       if (curr=List.head) and (curr.next=nil) then  //????????  ???????????? ??????
        begin
         Dispose(curr);
         List.head:=nil;
        end
       else
        begin
         if curr=List.head then   //???????? ?????? ??????
          begin
            List.head := curr.next;
            curr.next.prev := nil;
            curr.next := nil;
            Dispose(curr);
          end
         else
          begin
           if curr.next=nil then //???????? ????????? ??????
            begin
             curr.prev.next:= nil;
             curr.prev:=nil;
             Dispose(curr);
            end
           else
            begin             //???????? ????? ?????? ??????
             curr.Prev^.Next := curr.Next;
             curr.Next^.Prev := curr.Prev;
             curr.Prev := nil;
             curr.Next := nil;
             Dispose(curr);
            end;
          end;
        end;
     end;
    curr:=curr.next;
   end;
 SaveList(List);
end;
end.
