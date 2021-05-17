unit Journal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, System.StrUtils;

type
  TJCell = record
    column: integer;
    row: integer;
    value: integer;
  end;

  TSubject = record
    name: string;
    marks_cells: array of TJCell;

  end;
  TJournal = record
    className: string;
    classPupils: array of string;
    teacherName: string;
    //cells: array of TJCell;
    subjects: array of TSubject;
  end;
  TForm4 = class(TForm)
    ClassesJournalComboBox: TComboBox;
    SubjectsComboBox: TComboBox;
    ClassesJournalLabel: TLabel;
    SubjectsJournalLabel: TLabel;
    ThirdButton: TButton;
    ForthButton: TButton;
    SecondButton: TButton;
    FirstButton: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    TeacherLabel1: TLabel;
    Button1: TButton;
    StatisticButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
              const Value: string);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StatisticButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    var
      errorCol, errorRow: integer;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
                  uses Statistics;

procedure TForm4.FormCreate(Sender: TObject);
var i: integer;
begin
//BorderStyle := bsNone;
WindowState := wsMaximized;
errorCol := -1;
errorRow := -1;

StringGrid1.ColWidths[0] := 50;
StringGrid1.ColWidths[1] := 300;
StringGrid2.ColWidths[1] := 400;
StringGrid2.ColWidths[2] := 400;

StringGrid1.Options:=StringGrid1.Options+[goEditing];
//StringGrid1.Options:=StringGrid1.Options+[goRowSelect];
StringGrid2.Options:=StringGrid2.Options+[goEditing];
 for i := 1 to 15 do
 begin
    StringGrid1.Cells[0, i]:=inttostr(i);
    StringGrid1.Cells[1, i] := 'pupil'+inttostr(i);
//    StringGrid1.Cells[i, 0] := inttostr(i);
 end;
 StringGrid1.Cells[0, 0]:='�';
 StringGrid1.Cells[1, 0]:='�.�.�.';
 StringGrid2.Cells[0, 0]:='����';
 StringGrid2.Cells[1, 0]:='���� �����';
 StringGrid2.Cells[2, 0]:='�������� �������';
end;

// TODO ������� ����� �������� � ������ �������� ��� ������� �������, ����� �� ������ ����� � ��� ���������� ������

procedure TForm4.StatisticButtonClick(Sender: TObject);
begin
   Form5.ShowModal;
end;

procedure TForm4.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
    if (Arow = 0) And (ACol >= 2) then
    begin
       StringGrid1.Canvas.Brush.Color:= $b3b3b3;
       StringGrid1.Canvas.FillRect(Rect);
       StringGrid1.Canvas.TextOut(Rect.Left,Rect.Top,StringGrid1.Cells[Acol,Arow]);
    end;
end;

procedure TForm4.StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
          const Value: string);
var code,date: integer;
   dayString, monthString: string;
   day, month: integer;
   intFlag1, intFlag2: integer;
begin
   if (Acol>=1) and (ARow>=1) then
    if length(value)<>0 then
     begin
      begin
        val(Value,date,code);
        if code = 1  then
        begin
        if value<>'�' then
        begin
          errorCol := ACol;
          errorRow := ARow;
//          StringGrid1.Canvas.Brush.Color:=clBlue;
//          StringGrid1.Repaint;
          showmessage('������!');
        end;
        end
        else
        if ((1>date) or (date>10)) then  showmessage('������!');
      end;
     end;

     // date validator
     if (ARow = 0) And (Acol >= 2) then
     begin
        if Length(Value) = 5 then
        begin
          dayString := SplitString(Value, '.')[0];
          monthString := SplitString(Value, '.')[1];
          val(dayString, day, intFlag1);
          val(monthString, month, intFlag2);
          if (intFlag1 = 1) Or (intFlag2 = 1) then
          begin
            ShowMessage('������! ���� ������ ������!');
          end
          else
          begin
            if (day > 31) Or (month > 12) Or (day < 1) Or (month < 1) then
              begin
                ShowMessage('������! ����� ���� �� ����������!');
              end;
          end;
        end;
        if Length(Value) > 5 then
        begin
          ShowMessage('������ ����� ����');
        end;
     end;


end;

end.
