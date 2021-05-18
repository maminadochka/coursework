unit ParentsScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TForm6 = class(TForm)
    PupilName: TLabel;
    ParentName1: TLabel;
    ParentName2: TLabel;
    DnevnikStringGrid1: TStringGrid;
    MonthCalendar1: TMonthCalendar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
var
  i: integer;
begin
  DnevnikStringGrid1.Cells[1,0] := 'Домашнее задание';
  DnevnikStringGrid1.Cells[2,0] := 'Тема урока';
  DnevnikStringGrid1.Cells[3,0] := 'Отметка';
  DnevnikStringGrid1.ColWidths[0] := 100;
  DnevnikStringGrid1.ColWidths[1] := 300;
  DnevnikStringGrid1.ColWidths[2] := 300;
  DnevnikStringGrid1.ColWidths[3] := 100;

  DnevnikStringGrid1.Cells[0,1] := 'Понедельник';
  DnevnikStringGrid1.Cells[0,9] := 'Вторник';
  DnevnikStringGrid1.Cells[0,17] := 'Среда';
end;

end.
