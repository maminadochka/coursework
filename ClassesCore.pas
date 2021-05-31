// classes logic
// TODO remove, edit
unit ClassesCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Libs, ClassesListsCore;

type
  TForm11 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

function getClass(classId: string): ClassesListsCore.T_Class;
function createClass(name: string; managerId: string): boolean;

implementation

{$R *.dfm}

function createClass(name: string; managerId: string): boolean;
var
  curr: ClassesListsCore.PTListElement;
  classesList: ClassesListsCore.TList;
begin
  ShowMessage('create class called');
  New(curr);
  ClassesListsCore.LoadList(classesList);
  curr^.data.name := name;
  curr^.data.managerId := managerId;
//  curr^.data.classId := GenerateUUID();
  ClassesListsCore.AddToEnd(classesList, curr);
  ClassesListsCore.SaveList(classesList);
  Dispose(curr);
  Result := true;
  exit;
end;

function getClass(classId: string): ClassesListsCore.T_Class;
var
  i: integer;
  classesList: ClassesListsCore.TList;
  curr: ClassesListsCore.PTListElement;
begin
  ClassesListsCore.LoadList(classesList);
  New(curr);
  curr := classesList.head;
  while curr <> nil do
  begin
    if curr^.data.classId = classId then
    begin
      Result := curr^.data;
      exit;
    end;
    curr := curr^.next;
  end;
end;
end.
