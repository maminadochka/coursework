﻿// created with love by Roman&Ksenia
unit Journal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, System.StrUtils, JournalCore, PupilsCore, UsersCore,
  ClassesCore, UsersListsCore, ClassesListsCore, MarksCore, MarksListCore;

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
    procedure drawDates();
    procedure StringGrid1Click(Sender: TObject);
    procedure SubjectsComboBoxChange(Sender: TObject);
    procedure drawMarks();
    procedure FormShow(Sender: TObject);
    procedure drawPupils();
    procedure ClassesJournalComboBoxChange(Sender: TObject);
    procedure CleanTable();
  private
    { Private declarations }
  public
    var
      errorCol, errorRow: integer;
      selectedCol, selectedRow: integer;
      managerId: string; // classruc info
      // userId: string;
      usersList: UsersListsCore.TList;
      classesList: ClassesListsCore.TList;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
uses Statistics;

procedure TForm4.FormCreate(Sender: TObject);
// TODO load journal and manager info on startup
var
  i: integer;
begin
  // TODO i need to load subject that selected in combobox
  // creating new class and subjects
  // drawing pupils list
end;

procedure TForm4.StatisticButtonClick(Sender: TObject);
begin
   Form5.ShowModal;
end;

procedure TForm4.StringGrid1Click(Sender: TObject);
begin
  selectedRow := StringGrid1.Row;
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
   mark: MarksListCore.TMark;
   pupil_firstname, pupil_lastname, pupil_fullname, pupil_id: string;

begin
  dateErrFlag := false;
   if (Acol>=3) and (ARow>=1) then
   begin
    if length(value)<>0 then
     begin
      begin
        val(Value,date,code);
        if code = 1  then
        begin
        if value<>'n' then
        begin
          showmessage('error!');
        end;
        end
        else
        if ((1>date) or (date>10)) then  showmessage('error!');
      end;
      MarksCore.addmark(Stringgrid1.Cells[0,Arow],Stringgrid1.Cells[Acol,0],Value, SubjectsComboBox.text);
     end;
   end;

     // date validator and adder
     if (ARow = 0) And (Acol >= 3) then
     begin
        if Length(Value) = 5 then
        begin
          if not TryStrToDate(Value, dateOut) then
          begin
            ShowMessage('date error');
            dateErrFlag := true;
          end
          else
          begin
            // tut bag, kogda tykaesh na enter, ono eshe raz addit. i solved it
            // with non-repeated items rule in dates list
            //current_subject := addDateToSubject(current_subject, Value);
          end;

        end;
        if Length(Value) > 5 then
        begin
          ShowMessage('date error');
          dateErrFlag := true;
        end;
     end;
end;

procedure TForm4.drawPupils();
var i,j,cnt: integer;
    UsersList: UsersListsCore.TList;
    curr: UsersListsCore.PTListElement;
    _class:  ClassesListsCore.T_Class;
begin
  UsersListsCore.LoadList(UsersList);
  curr:=UsersList.head;
  cnt:=0;
  _class:= ClassesCore.getclassbyname(classesjournalcombobox.text);
  while curr <> nil do
    begin
      if curr.data.userType = 'pupil' then
        begin
          if curr.data.studyClassID = _class.classId then
            Stringgrid1.Cells[2,cnt+1] := curr.data.lastname + ' ' +curr.data.firstname;
            Stringgrid1.Cells[1,cnt+1] := inttostr(cnt+1);
            Stringgrid1.Cells[0,cnt+1] := curr.data.userId;
            cnt:= cnt + 1;
        end;
      curr:= curr.next;
    end;
end;

procedure TForm4.drawDates();
var
  i:integer;
begin
  // TODO sort by lowest to higher and draw
//   ShowMessage('dates to render: '+inttostr(Length(current_subject.dates)));
  //for i := 0 to Length(current_subject.dates)-1 do
  //begin
    //StringGrid1.Cells[i+2, 0] := current_subject.dates[i];
  //end;
end;

procedure TForm4.drawMarks();
var
  i, j, k, q, u: integer;
  dateCnt: integer;
  pupil: TPupil;
  pupil_fullname: string;
  pupil_row: integer;
  date_column: integer;
  MarksList: MarksCore.TMarksList;
  datesList: array [1..20] of string;
  dateExistFlag: boolean;
begin
 // pupil_row := -1;
 // date_column := -1;
 dateExistFlag := false;
 dateCnt := 1;
 // idem po pupilam
// for i := 1 to 3 do
// begin
//  MarksList:=MarksCore.getpupilmarks(stringgrid1.Cells[0,i], SubjectsComboBox.Text);
//  ShowMessage(inttostr(Length(MarksList)));
//  dateExistFlag := false;
//  for j := 1 to Length(MarksList) do
//    begin
//    if i = 1 then
//    begin
//      datesList[1] := MarksList[1].date;
//      dateCnt := dateCnt+1;
//      continue;
//    end;
//    ShowMessage('date: '+MarksList[j].date);
//      for u := 1 to dateCnt do
//        begin
//          ShowMessage('datesList date: '+datesList[u]);
//          if MarksList[j].date = datesList[u] then
//          begin
//            ShowMessage('eq');
//            dateExistFlag := true;
//            break;
//          end;
//        end;
//        if dateExistFlag = false then
//        begin
//          ShowMessage('date: '+MarksList[j].date+' is unique');
//          dateCnt := dateCnt+1;
//        end;
//    end;
  //  if i = 1 then
//  begin
//    // idem po marksam
//    datesList[dateCnt] := MarksList[]
//  end;
   //idem po marks dates
//  for j := 1 to Length(MarksList) do
//    begin
//      dateExistFlag := false;
//      for u := 1 to dateCnt do
//        begin
//          if MarksList[j].date = datesList[u]  then
//          begin
//            dateExistFlag := true;
//          end;
//          if dateExistFlag = false then
//          begin
//            ShowMessage(inttostr(dateCnt));
//////            datesList[dateCnt] := MarksList[j].date;
//            dateCnt:= dateCnt+1;
//          end;
//        end;
//    end;
 end;
end;

procedure TForm4.FormShow(Sender: TObject);
var
  i: integer;
  user: UsersListsCore.TUser;
  classesList: classesListsCore.TList;
  classesCurr: ClassesListsCore.PTListElement;
begin
  ClassesJournalCombobox.Items.Clear;
  SubjectsComboBox.Items.Clear;
  classesListsCore.LoadList(classesList);
  classesCurr := classesList.head;
  SubjectsCombobox.Items.Add('Math');
  SubjectsCombobox.Items.Add('Rus');
  while classesCurr <> nil do
  begin
    ClassesJournalCombobox.Items.Add(classesCurr.data.name);
    classesCurr := classesCurr.next;
  end;

  // ClassesJournalComboBox.Items.Add();
//  ShowMessage(inttostr(Length(classesList)));
  // user := UsersCore.getUserById(usersList, managerId);
  // journal._class := getClass();
  // journal._class := createNewClass(20, '7A', user.firstname);
  // journal.subjects := createSubjects();
  // ClassRucLabel.Caption := 'classruc: '+ journal._class.classruc_name;
  // ClassNameLabel.Caption := 'classname: : '+journal._class.name;
  // for i := 0 to Length(journal.subjects) do
  //   begin
  //     SubjectsComboBox.Items.Add(journal.subjects[i].name);
  //   end;
  // WindowState := wsMaximized;
  errorCol := -1;
  errorRow := -1;
  selectedRow := -1;
  selectedCol := -1;

  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 50;
  StringGrid1.ColWidths[2] := 500;
  StringGrid2.ColWidths[1] := 300;
  StringGrid2.ColWidths[2] := 200;

   StringGrid1.Options:=StringGrid1.Options+[goEditing];
   StringGrid2.Options:=StringGrid2.Options+[goEditing];
   StringGrid1.Cells[0, 0]:='PupilID';
   StringGrid1.Cells[1, 0]:='number';  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!CHANGE
   StringGrid1.Cells[2, 0]:='FIO';
   StringGrid2.Cells[0, 0]:='date';
   StringGrid2.Cells[1, 0]:='lesson theme';
   StringGrid2.Cells[2, 0]:='home task';
end;

procedure TForm4.ClassesJournalComboBoxChange(Sender: TObject);
begin
  cleanTable();
  drawpupils();
end;

procedure TForm4.cleanTable();
var
  i,j: integer;
begin
  for i := 0 to 100 do
    begin
      for j := 1 to 100 do
       StringGrid1.Cells[i,j] := '';
    end;
end;

procedure TForm4.SubjectsComboBoxChange(Sender: TObject);
var
  subject_name: string;
begin
//  cleanTable();
  subject_name := SubjectsCombobox.Items[SubjectsCombobox.ItemIndex];
  drawDates();
  drawMarks();
end;

end.
