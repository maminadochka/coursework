unit PupilsCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type

  TPupil = record
    firstname: string;
    lastname: string;
    pupil_id: string;
  end;

  TForm8 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

function createPupil(firstname, lastname: string): TPupil;

implementation

{$R *.dfm}

function GenerateUUID(): string;
var
  Uid: TGuid;
  Res: HResult;
begin
  Res := CreateGuid(Uid);
  if Res = S_OK then
  begin
    Result := GuidToString(Uid);
  end;
end;

function createPupil(firstname, lastname: string): TPupil;
var
  pupil: TPupil;
begin
  pupil.pupil_id := GenerateUUID();
  pupil.firstname := firstname;
  pupil.lastname := lastname;
  Result := pupil;
end;
end.
