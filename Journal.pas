unit Journal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, System.StrUtils;

type
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
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
              const Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}


procedure TForm4.FormCreate(Sender: TObject);
var i: integer;
begin
StringGrid1.Options:=StringGrid1.Options+[goEditing];
StringGrid2.Options:=StringGrid2.Options+[goEditing];
   for i := 2 to 30 do
     StringGrid1.Cells[0, i]:=inttostr(i-1);
   StringGrid1.Cells[0, 0]:='№';
   StringGrid1.Cells[1, 0]:='Фамилии';
   StringGrid2.Cells[0, 0]:='Дата';
   StringGrid2.Cells[1, 0]:='Тема урока';
   StringGrid2.Cells[2, 0]:='Домашнее задание';
end;

procedure TForm4.StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
          const Value: string);
var code,date: integer;
   left, right: string;
begin
   if (Acol>=2) and (ARow>=2) then
    if length(value)<>0 then
     begin
      begin
        val(Value,date,code);
        if code = 1  then
        begin
        if value<>'н' then showmessage('ошибка!') ;
        end
        else
        if ((1>date) or (date>10)) then  showmessage('ошибка!');
      end;
     end;
   {if (Acol>1) and (ARow=1) then
    if length(value)<>0 then                                    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     begin                                                      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        left:=SplitString(Value,'.')[0];                        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        right:=SplitString(Value,'.')[1];                       // DODELAT'!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
        val(left,date,code);                                    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        if code = 1  then  showmessage(left);                   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        val(right,date,code);                                   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        if code = 1  then  showmessage(right);
     end;}

end;

end.
