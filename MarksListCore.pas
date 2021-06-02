unit MarksListCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TMark = record
    pupilId: string[50];
    date: string[50];
    subject: string[20];
    value: string[50];
    comment: string[50];     //???????????????????????
  end;
  //TMarksList = array of TMark;
  PTListElement = ^TListElement;
  TListElement = record
    data: TMark;
    next: PTListElement;
    prev: PTListElement;
  end;
  TList = record
    head: PTListElement;
    tail: PTListElement;
    elemsCount: integer;
  end;
  TForm23 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;

procedure AddToEnd(var List: TList; var NewElementPointer: PTListElement);
procedure SaveList(var List: TList);
procedure LoadList(var List: TList);

implementation

{$R *.dfm}

procedure LoadList(var List: TList);
var
  f: file of TMark;
  tmp: PTListElement;
  cnt: integer;
  curr: PTListElement;
  dirSource: string;
begin
  dirSource := 'MarksList.txt';
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
  f: file of TMark;
  curr: PTListElement;
  dirSource: string;
  cnt: integer;
begin
  dirSource := 'MarksList.txt';
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

end.
