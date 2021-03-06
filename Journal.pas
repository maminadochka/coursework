unit Journal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, System.StrUtils, JournalCore, PupilsCore, UsersCore,
  ClassesCore, UsersListsCore, ClassesListsCore, MarksCore, MarksListCore, EventsCore, EventsListCore;

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
    ClassNameLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
              const Value: string);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StatisticButtonClick(Sender: TObject);
    procedure drawEvents();
    procedure StringGrid1Click(Sender: TObject);
    procedure SubjectsComboBoxChange(Sender: TObject);
    procedure drawMarks();
    procedure FormShow(Sender: TObject);
    procedure drawPupils();
    procedure cleanRightTable();
    procedure ClassesJournalComboBoxChange(Sender: TObject);
    procedure CleanMarks();
    procedure cleanPupils();
    procedure cleanDates();
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
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
   EventsList: EventsListCore.TList;

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
//      check exists and call edit

      MarksCore.addmark(Stringgrid1.Cells[0,Arow],Stringgrid1.Cells[Acol,0],Value, SubjectsComboBox.text);
     end;
                  //////SDELAT' 10!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
            EventsListCore.LoadList(EventsList);
            EventsCore.createEvent(EventsList, ClassesCore.getclassbyname(ClassesJournalComboBox.Text).classId, SubjectsComboBox.Text, value, '', '');
            cleanRightTable;
            drawEvents;
          end;
        end;
        if Length(Value) > 5 then
        begin
          ShowMessage('date error');
          dateErrFlag := true;
        end;
     end;
end;

procedure TForm4.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
//    EventsCore.editEvent(ClassesCore.getClassByName(ClassesJournalCombobox.Text).classId, SubjectsCombobox.Text, StringGrid2.Cells[0, ARow], StringGrid2.Cells[1, ARow], StringGrid2.Cells[2, ARow]);
//    ShowMessage('edited');
    end;

procedure TForm4.StringGrid2SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  EventsCore.editEvent(ClassesCore.getClassByName(ClassesJournalCombobox.Text).classId, SubjectsCombobox.Text, StringGrid2.Cells[0, ARow], StringGrid2.Cells[1, ARow], StringGrid2.Cells[2, ARow]);
//    ShowMessage('edited');
end;

procedure TForm4.drawPupils();
var i,j,cnt: integer;
    UsersList: UsersListsCore.TList;
    curr: UsersListsCore.PTListElement;
    _class:  ClassesListsCore.T_Class;
begin
  UsersListsCore.LoadList(UsersList);
  New(curr);
  curr:=UsersList.head;
  cnt:=0;
  _class:= ClassesCore.getclassbyname(classesjournalcombobox.text);
  while curr <> nil do
    begin
      if curr.data.userType = 'pupil' then
        begin
          if curr.data.studyClassID = _class.classId then
          begin
            Stringgrid1.Cells[2,cnt+1] := curr.data.lastname + ' ' +curr.data.firstname;
            Stringgrid1.Cells[1,cnt+1] := inttostr(cnt+1);
            Stringgrid1.Cells[0,cnt+1] := curr.data.userId;
            cnt:= cnt + 1;
          end;
        end;
      curr:= curr.next;
    end;
end;

procedure TForm4.drawEvents();
var
  EventsList: EventsCore.TEventsList;
  i, j: integer;
begin
  EventsList := EventsCore.getEvents(SubjectsCombobox.Text, ClassesCore.getclassbyname(ClassesJournalCombobox.Text).classId);
  for i := 0 to Length(EventsList)-1 do
    begin
      StringGrid2.Cells[0, i+1] := EventsList[i].date;
      StringGrid2.Cells[1, i+1] := EventsList[i].HomeTask;
      StringGrid2.Cells[2, i+1] := EventsList[i].lessonTheme;
    end;
end;

procedure TForm4.drawMarks();
var
  i, j, dtc: integer;
  dateCnt: integer;
  pupilID: string[50];
  pupil_fullname: string;
  pupil_row: integer;
  date_column: integer;
  MarksList: MarksCore.TMarksList;
  datesList: array of string;
  dateExistFlag: boolean;
  dt: string;
begin
 dateExistFlag := false;
 dateCnt := 1;
 // getting unique dates
 for i := 1 to 100 do
 begin
  pupilID := StringGrid1.Cells[0, i];
  if Length(pupilID) = 38 then
  begin
//    ShowMessage('pupilID: '+pupilID);
    MarksList := MarksCore.getPupilMarks(pupilID, SubjectsComboBox.Text);
//    ShowMessage(inttostr(Length(MarksList)));
    for j := 0 to Length(MarksList)-1 do
      begin
//        ShowMessage('mark date: '+MarksList[j].date+' value: '+MarksList[j].value);
        dateExistFlag := false;
        for dtc := 0 to Length(datesList)-1 do
          begin
            if datesList[dtc] = MarksList[j].date then
            begin
              dateExistFlag := true;
              break;
            end;
          end;
          if dateExistFlag = false then
          begin
             SetLength(datesList, Length(datesList)+1);
             datesList[High(datesList)] := MarksList[j].date;
             stringgrid1.Cells[3+Length(datesList)-1, 0] := MarksList[j].date;
          end;
      end;
  end;
 end;
//  ShowMessage('dates: '+inttostr(Length(DatesList)));
  for i := 1 to 3 do
    begin
      pupilID := StringGrid1.Cells[0, i];
      if Length(pupilID) = 38 then
      begin
        MarksList := MarksCore.getPupilMarks(pupilID, SubjectsComboBox.Text);
        for j := 0 to Length(MarksList)-1 do
          begin
            for dtc := 3 to Length(datesList)+2 do
              begin
                if stringgrid1.Cells[dtc, 0] = MarksList[j].date then
                begin
                  StringGrid1.Cells[dtc, i] := MarksList[j].value;
                end;
              end;
          end;

      end;
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
  cleanRightTable;
  drawEvents();
  cleanMarks();
  cleanDates();
  cleanPupils();
  drawpupils();
end;

procedure TForm4.cleanMarks();
var
  i,j: integer;
begin
  for i := 3 to 100 do
    begin
      for j := 1 to 100 do
       StringGrid1.Cells[i,j] := '';
    end;
end;

procedure TForm4.cleanRightTable();
var
  i,j: integer;
begin
  for i := 0 to 2 do
    begin
      for j := 1 to 100 do
        begin
          StringGrid2.Cells[i, j] := '';
        end;
    end;
end;

procedure TForm4.cleanPupils();
var
  i,j: integer;
begin
  for i := 0 to 3 do
    begin
      for j := 1 to 100 do
       StringGrid1.Cells[i,j] := '';
    end;
end;

procedure TForm4.cleanDates();
var
  i,j: integer;
begin
      for i := 3 to 100 do
       StringGrid1.Cells[i,0] := '';
end;

procedure TForm4.SubjectsComboBoxChange(Sender: TObject);
var
  subject_name: string;
begin
  cleanMarks();
  cleanDates();
  subject_name := SubjectsCombobox.Items[SubjectsCombobox.ItemIndex];
  cleanRightTable;
  drawEvents();
  drawMarks();
end;

end.
