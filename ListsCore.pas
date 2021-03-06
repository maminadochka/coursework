// Lists core
// TODO dynamic list payload. And CRUD

unit ListsCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TPayload = record
    created_data: integer;
  end;
  TPayloadList = array of TPayload;
  PTListElement = ^TListElement;
  TListElement = record
    data: TPayload;
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
    dirSource: string;
    { Public declarations }
  end;

var
  Form21: TForm21;
  List: TList;

implementation

{$R *.dfm}

procedure LoadList(var List: TList);
var
  f: file of TPayload;
  tmp: PTListElement;
  cnt: integer;
  curr: PTListElement;
begin
  cnt := 0;
  List.head := nil;
  List.tail := nil;
  AssignFile(f, dirSource);
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
    end;
  end;
end;

procedure SaveList(const List: TList);
var
  f: file of TPayload;
  curr: PTListElement;
begin
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
end;
end.
