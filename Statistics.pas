unit Statistics;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, MarksCore, ClassesListsCore, ClassesCore, UsersListsCore;

type
  TStatItem = record
    pupil_id: string;
    ncnt: integer;
    srmark: integer;
  end;
  TStatsList=array of TStatItem;
  TForm5 = class(TForm)
    StringGrid1: TStringGrid;
    ClassesStatisticsLabel: TLabel;
    SubjectsStatisticsLabel: TLabel;
    ClassesComboBox: TComboBox;
    SubjectsComboBox: TComboBox;
    ThirdButtonStatistics: TButton;
    ForthButtonStatistics: TButton;
    SecondButtonStatistics: TButton;
    FirstButtonStatistics: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure SubjectsComboBoxChange(Sender: TObject);
    procedure ClassesComboBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cleanPupils();
    procedure cleanStatistics();
    procedure drawPupils();
    function statistics(start,finish: integer): TStatsList;
    procedure yearstatistics();
    procedure FirstButtonStatisticsClick(Sender: TObject);
    procedure SecondButtonStatisticsClick(Sender: TObject);
    procedure ThirdButtonStatisticsClick(Sender: TObject);
    procedure ForthButtonStatisticsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.cleanPupils();
var
  i,j: integer;
begin
  for i := 0 to 3 do
    begin
      for j := 1 to 100 do
       StringGrid1.Cells[i,j] := '';
    end;
end;

procedure TForm5.cleanStatistics();
var
  i,j: integer;
begin
  for i := 3 to 5 do
    begin
      for j := 1 to 100 do
       StringGrid1.Cells[i,j] := '';
    end;
end;

procedure TForm5.ClassesComboBoxChange(Sender: TObject);
begin
  cleanPupils();
  drawpupils();
end;

procedure TForm5.drawPupils();
var i,j,cnt: integer;
    UsersList: UsersListsCore.TList;
    curr: UsersListsCore.PTListElement;
    _class:  ClassesListsCore.T_Class;
begin
  UsersListsCore.LoadList(UsersList);
  New(curr);
  curr:=UsersList.head;
  cnt:=0;
  _class:= ClassesCore.getclassbyname(classesCombobox.text);
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

procedure TForm5.yearstatistics();
var MarksList: MarksCore.TMarksList;
    i,j,ncnt,marksum,markscnt: integer;
    pupilID : string;
begin
  for i := 1 to 100 do
  begin
  marksum:=0;
  ncnt:=0;
  markscnt:=0;
   pupilID := StringGrid1.Cells[0, i];
   if Length(pupilID) = 38 then
      begin
        MarksList := MarksCore.getPupilMarks(pupilID, SubjectsComboBox.Text);
//    ShowMessage(inttostr(Length(MarksList)));

        {  Stringgrid1.Cells[3,i]:=inttostr(ncnt);
          if markscnt=0 then Stringgrid1.Cells[4,i]:='-'
          else
          Stringgrid1.Cells[4,i]:=inttostr(marksum div markscnt); }
      end;
  end;
end;

function TForm5.statistics(start,finish: integer): TStatsList;
var MarksList: MarksCore.TMarksList;
    res: TStatItem;
    i,j,ncnt,marksum,markscnt: integer;
    statsList: TStatsList;
    pupilID : string;
begin
  for i := 1 to 100 do
  begin
  marksum:=0;
  ncnt:=0;
  markscnt:=0;
   pupilID := StringGrid1.Cells[0, i];
   if Length(pupilID) = 38 then
      begin
        MarksList := MarksCore.getPupilMarks(pupilID, SubjectsComboBox.Text);
//    ShowMessage(inttostr(Length(MarksList)));
         for j := 0 to Length(MarksList)-1 do
           begin
           // 25.09
//        ShowMessage('mark date: '+MarksList[j].date+' value: '+MarksList[j].value);
           if (strtoint(MarksList[j].date[4]+MarksList[j].date[5]) >= start)
           and(strtoint(MarksList[j].date[4]+MarksList[j].date[5]) <= finish) then
           begin
           if MarksList[j].value = 'n' then ncnt:=ncnt+1
            else
            begin
              marksum:=marksum+strtoint(MarksList[j].value);
              markscnt:=markscnt+1;
            end;
           end;
          end;
          Stringgrid1.Cells[3,i]:=inttostr(ncnt);
          if markscnt=0 then Stringgrid1.Cells[4,i]:='-'
          else
          Stringgrid1.Cells[4,i]:=inttostr(marksum div markscnt);
//          res.pupil_id := pupilID;
//          res.ncnt := ncnt;
//          res.srmark := marksum div markscnt;
//          SetLength(StatsList, Length(StatsList)+1);
//          StatsList[High(StatsList)] := res;
      end;
  end;
  Result := StatsList;
end;

procedure TForm5.FirstButtonStatisticsClick(Sender: TObject);
begin
 cleanStatistics();
 statistics(09,10);
end;

procedure TForm5.SecondButtonStatisticsClick(Sender: TObject);
begin
  cleanStatistics();
  statistics(11,12);
end;

procedure TForm5.ThirdButtonStatisticsClick(Sender: TObject);
begin
  cleanStatistics();
  statistics(01,03);
end;

procedure TForm5.ForthButtonStatisticsClick(Sender: TObject);
begin
  cleanStatistics();
  statistics(04,05);
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  cleanStatistics();
  yearstatistics();
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
   StringGrid1.ColWidths[0] := 50;
   StringGrid1.ColWidths[1] := 50;
   StringGrid1.ColWidths[2] := 600;
   StringGrid1.ColWidths[3] := 300;
   StringGrid1.ColWidths[4] := 300;

   StringGrid1.Cells[0, 0] := 'ID';
   StringGrid1.Cells[1, 0] := '�';
   StringGrid1.Cells[2, 0] := '�.�.�.';
   StringGrid1.Cells[3, 0] := '��������';
   StringGrid1.Cells[4, 0] := '������� ����';
end;

procedure TForm5.FormShow(Sender: TObject);
  var
  i: integer;
  classesList: classesListsCore.TList;
  classesCurr: ClassesListsCore.PTListElement;
begin
  ClassesCombobox.Items.Clear;
  SubjectsComboBox.Items.Clear;
  classesListsCore.LoadList(classesList);
  classesCurr := classesList.head;
  SubjectsCombobox.Items.Add('Math');
  SubjectsCombobox.Items.Add('Rus');
  while classesCurr <> nil do
  begin
    ClassesCombobox.Items.Add(classesCurr.data.name);
    classesCurr := classesCurr.next;
  end;

end;

procedure TForm5.SubjectsComboBoxChange(Sender: TObject);
begin
  //MarksCore.getpupilmarks();
end;

end.
