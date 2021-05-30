// classes logic
// TODO remove, edit
unit ClassesCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Libs;

type
  TPupilsIdsList = array of string;
  T_Class = record
    classId: string;
    pupils: TPupilsIdsList; // array of class pupils ids
    name: string;
    managerId: string; // klass ruk id
    // subjects: array of string;
  end;
  TClassesList = array of T_Class;
  TForm11 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

function getClass(const ClassesList: TClassesList; classId: string): T_Class;
function createClass(var ClassesList: TClassesList; name: string; managerId: string): boolean;

implementation

{$R *.dfm}

function createClass(var ClassesList: TClassesList; name: string; managerId: string): boolean;
var
  _class: T_Class;
begin
  _class.name := name;
  _class.managerId := managerId;
  _class.classId := GenerateUUID();
  SetLength(ClassesList, Length(ClassesList)+1);
  ClassesList[High(ClassesList)] := _class;
  Result := true;
end;

function getClass(const ClassesList: TClassesList; classId: string): T_Class;
var
  i: integer;
begin
  ShowMessage(inttostr(Length(classesList)));
  for i := 0 to Length(ClassesList)-1 do
    begin
      if ClassesList[i].classId = classId then
      begin
        Result := ClassesList[i];
        exit;
      end;
    end;
  end;

function getClassesList(ClasesList: TClassesList): TClassesList;
// it is promezhutocny variant. do not use
begin
//  Result := copy(ClassesList);
end;

end.
