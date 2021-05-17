unit Statistics;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    StatisticsStringGrid: TStringGrid;
    ClassesStatisticsLabel: TLabel;
    SubjectsStatisticsLabel: TLabel;
    ClassesStatisticsComboBox: TComboBox;
    SubjectsStatisticsComboBox: TComboBox;
    TeacherLabel1: TLabel;
    ThirdButtonStatistics: TButton;
    ForthButtonStatistics: TButton;
    SecondButtonStatistics: TButton;
    FirstButtonStatistics: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
begin
   StatisticsStringGrid.ColWidths[0] := 50;
   StatisticsStringGrid.ColWidths[1] := 300;
   StatisticsStringGrid.ColWidths[2] := 600;
   StatisticsStringGrid.ColWidths[3] := 600;

   StatisticsStringGrid.Cells[0, 0] := '№';
   StatisticsStringGrid.Cells[1, 0] := 'Ф.И.О.';
   StatisticsStringGrid.Cells[2, 0] := 'Пропуски';
   StatisticsStringGrid.Cells[3, 0] := 'Средний балл';
end;

end.
