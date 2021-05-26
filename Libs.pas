unit Libs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm12 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

function GenerateUUID(): string;

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

end.
