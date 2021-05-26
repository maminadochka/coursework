// created with love by Roman&Ksenia
unit Journal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, System.StrUtils, JournalCore, PupilsCore;

type
  TForm4 = class(TForm)
    ClassesJournalComboBox: TComboBox;
    SubjectsComboBox: TComboBox;
    ClassesJournalLabel: TLabel;
    SubjectsJournalLabel: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    ClassRucLabel: TLabel;
    StatisticButton: TButton;
    MonthComboBox: TComboBox;
    ClassNameLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
              const Value: string);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StatisticButtonClick(Sender: TObject);
    function LoadPupil(firstname, lastname: string): TPupil;
    function LoadPupilById(pupil_id: string): TPupil;
    procedure drawDates();
    procedure StringGrid1Click(Sender: TObject);
    procedure SubjectsComboBoxChange(Sender: TObject);
    procedure LoadSubject(subject_name: string);
    procedure SaveCurrentSubject();
    procedure cleanDateRow();
    procedure cleanMarks();
    procedure drawMarks();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    var
      errorCol, errorRow: integer;
      selectedCol, selectedRow: integer;
      journal: TJournal;
      current_subject: TSubject;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
uses Statistics;

procedure TForm4.FormCreate(Sender: TObject);
var
  i: integer;
begin
  // TODO i need to load subject that selected in combobox
  // creating new class and subjects
  journal._class := createNewClass(20, '7A', 'Boltak Sveta');
  journal.subjects := createSubjects();
  ClassRucLabel.Caption := 'Классный руководитель: '+ journal._class.classruc_name;
  ClassNameLabel.Caption := 'Класс: '+journal._class.name;
  for i := 0 to Length(journal.subjects) do
    begin
      SubjectsComboBox.Items.Add(journal.subjects[i].name);
    end;
  WindowState := wsMaximized;
  errorCol := -1;
  errorRow := -1;
  selectedRow := -1;
  selectedCol := -1;

  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 300;
  StringGrid2.ColWidths[1] := 400;
  StringGrid2.ColWidths[2] := 400;

  StringGrid1.Options:=StringGrid1.Options+[goEditing];
//  StringGrid1.Options:=StringGrid1.Options+[goRowSelect];
  StringGrid2.Options:=StringGrid2.Options+[goEditing];
   for i := 1 to 15 do
   begin
      StringGrid1.Cells[0, i]:=inttostr(i);
      StringGrid1.Cells[1, i] := journal._class.pupils[i].lastname+' '+journal._class.pupils[i].firstname;
//      StringGrid1.Cells[i, 0] := inttostr(i);
   end;
   StringGrid1.Cells[0, 0]:='№';
   StringGrid1.Cells[1, 0]:='Ф.И.О.';
   StringGrid2.Cells[0, 0]:='Дата';
   StringGrid2.Cells[1, 0]:='Тема урока';
   StringGrid2.Cells[2, 0]:='Домашнее задание';

   // drawing pupils list

end;

// TODO сделать полку журналов в личном кабинете для каждого учителя, чтобы он просто тыкал и ему открывался журнал

procedure TForm4.StatisticButtonClick(Sender: TObject);
begin
   Form5.ShowModal;
end;

procedure TForm4.StringGrid1Click(Sender: TObject);
begin
  selectedRow := StringGrid1.Row;
//   ShowMessage(inttostr(StringGrid1.Row));
end;

procedure TForm4.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
    if (Arow = 0) And (ACol >= 2) then
    begin
//       StringGrid1.Canvas.Brush.Color:= $b3b3b3;
//       StringGrid1.Canvas.FillRect(Rect);
//       StringGrid1.Canvas.TextOut(Rect.Left,Rect.Top,StringGrid1.Cells[Acol,Arow]);
    end;
    if (ARow = selectedRow) then
    begin
//      StringGrid1.Canvas.Brush.Color:= clYellow;
      // TODO think about how to highlight all string
//      StringGrid1.Canvas.FillRect(Rect);
//      StringGrid1.Canvas.TextOut(Rect.Left,Rect.Top,StringGrid1.Cells[ARow,ACol]);
    end;

end;

//procedure draw();
// function get class journal info

procedure TForm4.StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
          const Value: string);
var code,date: integer;
   dayString, monthString: string;
   day, month: integer;
   intFlag1, intFlag2: integer;
   dateOut: TDateTime;
   dateErrFlag: boolean;
   mark: TMark;
   pupil_firstname, pupil_lastname, pupil_fullname, pupil_id: string;
begin
  dateErrFlag := false;
   if (Acol>=1) and (ARow>=1) then
   begin
    if length(value)<>0 then
     begin
      begin
        val(Value,date,code);
        if code = 1  then
        begin
        if value<>'н' then
        begin
          showmessage('error!');
        end;
        end
        else
        if ((1>date) or (date>10)) then  showmessage('error!');
      end;
      mark.value := Value;
      mark.date := StringGrid1.Cells[ACol, 0];
      pupil_fullname := StringGrid1.Cells[1, ARow];
      pupil_lastname := SplitString(pupil_fullname, ' ')[0];
      pupil_firstname := SplitString(pupil_fullname, ' ')[1];
//      ShowMessage(pupil_lastname+' '+pupil_firstname);
      pupil_id := LoadPupil(pupil_firstname, pupil_lastname).pupil_id;
      mark.pupil_id := pupil_id;
      current_subject := addPupilMarkToSubject(current_subject, mark);
//      mark.pupil_id := ;
     end;
   end;

     // date validator and adder
     if (ARow = 0) And (Acol >= 2) then
     begin
        if Length(Value) = 5 then
        begin
          if not TryStrToDate(Value, dateOut) then
          begin
            ShowMessage('ошибка! такой даты не существует');
            dateErrFlag := true;
          end
          else
          begin
            // tut bag, kogda tykaesh na enter, ono eshe raz addit. i solved it
            // with non-repeated items rule in dates list
            current_subject := addDateToSubject(current_subject, Value);
          end;

        end;
        if Length(Value) > 5 then
        begin
          ShowMessage('ошибка ввода даты');
          dateErrFlag := true;
        end;
     end;


end;

procedure TForm4.drawDates();
var
  i:integer;
begin
  // TODO sort by lowest to higher and draw
//   ShowMessage('dates to render: '+inttostr(Length(current_subject.dates)));
  for i := 0 to Length(current_subject.dates)-1 do
  begin
    StringGrid1.Cells[i+2, 0] := current_subject.dates[i];
  end;
end;

procedure TForm4.drawMarks();
var
  i, j: integer;
  pupil: TPupil;
  pupil_fullname: string;
  pupil_row: integer;
  date_column: integer;
begin
  pupil_row := -1;
  date_column := -1;
  // TODO write generateFullName method
  // it is very no-effective algo
//  for i := 0 to Length(journal._class.pupils)-1 do
//    begin
//      for j := 0 to Length(current_subject.marks)-1 do
//        begin
//          pupil := LoadPupilById(current_subject.marks[j].pupil_id);
//          pupil_fullname := pupil.lastname+' '+pupil.firstname;
//          if pupil_fullname = StringGrid1.Cells[1, i] then
//          begin
//            pupil_row := i;
//            break;
//          end;
//        end;
//    end;
//  for i := Low to High do
//
//  for i := 0 to Length(journal._class.pupils)-1 do
//    begin
//      for j := 0 to Length(current_subject.dates)-1 do
//        begin
//          pupil := LoadPupilById(current_subject.marks[i].pupil_id);
//          if (current_subject.marks[i].date = StringGrid1.Cells[i, j]) And ((pupil.firstname +' '+pupil.lastname) = StringGrid1.Cells[1, i]) then
//          begin
//            StringGrid1.Cells[i, j] := current_subject.marks[i].value;
//          end;
//        end;
//    end;
end;

procedure TForm4.FormShow(Sender: TObject);

begin
  drawDates();
  drawMarks();
end;

function TForm4.LoadPupil(firstname, lastname: string): TPupil;
// loads pupil from current journal class
var
  i: integer;
begin
  for i := 0 to Length(journal._class.pupils)-1 do
    begin
      // but can be two similar persons!
      if (journal._class.pupils[i].firstname = firstname) And (journal._class.pupils[i].lastname = lastname) then
      begin
        Result := journal._class.pupils[i];
        break;
      end;
    end;
end;

function TForm4.LoadPupilById(pupil_id: string): TPupil;
// loads pupil from current journal class
var
  i: integer;
begin
  for i := 0 to Length(journal._class.pupils)-1 do
    begin
      // but can be two similar persons!
      if journal._class.pupils[i].pupil_id = pupil_id then
      begin
        Result := journal._class.pupils[i];
        break;
      end;
    end;
end;

procedure TForm4.LoadSubject(subject_name: string);
var
  i:integer;
  subject: TSubject;
begin
  for i := 0 to Length(journal.subjects)-1 do
  begin
    subject := journal.subjects[i];
    if subject.name = subject_name then
    begin
//      ShowMessage('subject found! '+ subject.name);
//      ShowMessage('subject dates: '+inttostr(Length(subject.dates)));
      current_subject.name := subject.name;
      current_subject.dates := copy(subject.dates);
      current_subject.marks := copy(subject.marks);
      current_subject.teacher_name := subject.teacher_name;
      break;
    end;
  end;
end;

procedure TForm4.SaveCurrentSubject();
var
  i: integer;
  subject: TSubject;
begin
  for i := 0 to Length(journal.subjects)-1 do
    begin
      subject := journal.subjects[i];
      if subject.name = current_subject.name then
      begin
        journal.subjects[i].name := current_subject.name;
        journal.subjects[i].dates := copy(current_subject.dates);
        journal.subjects[i].marks := copy(current_subject.marks);
        break;

//        ShowMessage('old subj dates '+inttostr(Length(current_subject.dates)));
//        ShowMessage('subj save is ok');
      end;
    end;
end;

procedure TForm4.cleanDateRow();
var
  i: integer;
begin
  for i := 0 to 15 do
    begin
      StringGrid1.Cells[i+2, 0] := '';
    end;
end;

procedure TForm4.cleanMarks();
var
  i, j: integer;
begin
  for i := 2 to 15 do
    begin
      for j := 2 to 15 do
      begin
        StringGrid1.Cells[j, i] := '';
      end;
    end;
end;

procedure TForm4.SubjectsComboBoxChange(Sender: TObject);
var
  subject_name: string;
begin
  cleanDateRow();
  cleanMarks();
  SaveCurrentSubject();
  subject_name := SubjectsCombobox.Items[SubjectsCombobox.ItemIndex];
  LoadSubject(subject_name);
  drawDates();
  drawMarks();
end;

end.