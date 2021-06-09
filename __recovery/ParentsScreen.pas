unit ParentsScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, EventsCore, EventsListCore, UsersCore, UsersListsCore, ClassesCore, MarksCore, MarksListCore;

type
  TForm6 = class(TForm)
    PupilName: TLabel;
    DnevnikStringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cleantable();
  private
    { Private declarations }
  public   userlogin: string;
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}
procedure TForm6.cleantable();
var
  i,j: integer;
begin
  for i := 0 to 3 do
    begin
      for j := 1 to 100 do
       DnevnikStringGrid1.Cells[i,j] := '';
    end;
end;

procedure TForm6.ComboBox1Change(Sender: TObject);
var
  f : TextFile;
  i,j,ncnt,mst: integer;
  EventsList: EventsCore.TEventsList;
  classID: string;
  Pupil: UsersListsCore.TUser;
  MarksList: MarksCore.TMarksList;
begin
  cleantable();
  image1.Picture:= nil;
  ncnt:=0;
  Pupil:= UsersCore.getUser(userlogin);
  EventsList:= EventsCore.getEvents(Combobox1.Text, Pupil.StudyClassId);
  MarksList:= getpupilmarks(Pupil.userId,Combobox1.Text);
    for i := 0 to length(eventsList)-1 do
    begin
      DnevnikStringGrid1.Cells[0,i+1] := EventsList[i].date;
      DnevnikStringGrid1.Cells[1,i+1] := EventsList[i].HomeTask;
      DnevnikStringGrid1.Cells[2,i+1] := EventsList[i].lessonTheme;
      for j := 0 to length(MarksList)-1 do
        begin
          if MarksList[j].date = EventsList[i].date then
          begin
           if MarksList[j].value = 'n' then ncnt:= ncnt+1
            else
            begin
             DnevnikStringGrid1.Cells[3,i+1] := MarksList[j].value;
            end;
          end;
        end;
    end;
  Label2.Caption:=inttostr(length(eventslist));
  if length(eventslist) > 0 then
  begin
  mst:= Round(Image1.Height/length(eventslist));
  Image1.Canvas.Brush.Color := $507fff;
  Image1.Canvas.Rectangle(0,Image1.Height, 700, Image1.Height-mst*ncnt);
  Image1.Canvas.Brush.Color := $ff7f50;
  Image1.Canvas.Rectangle(700,Image1.Height, 1400, Image1.Height-mst*(length(eventslist)-ncnt));
  end;
  AssignFile(f, 'statistic'+pupil.userid+Combobox1.Text+'.txt');
  Rewrite(f);
  Writeln(f, 'Количество пропусков:'+inttostr(ncnt));
  Closefile(f);
end;

procedure TForm6.FormCreate(Sender: TObject);
var
  i: integer;
begin
  DnevnikStringGrid1.Cells[0,0] := 'Дата';
  DnevnikStringGrid1.Cells[2,0] := 'Домашнее задание';
  DnevnikStringGrid1.Cells[1,0] := 'Тема урока';
  DnevnikStringGrid1.Cells[3,0] := 'Отметка';

  DnevnikStringGrid1.ColWidths[0] := 150;
  DnevnikStringGrid1.ColWidths[1] := 300;
  DnevnikStringGrid1.ColWidths[2] := 300;
  DnevnikStringGrid1.ColWidths[3] := 200;
end;

procedure TForm6.FormShow(Sender: TObject);
var Pupil: UsersListsCore.TUser;
begin
  cleantable();

  Pupil:= UsersCore.getUser(userlogin);
  PupilName.Caption := Pupil.lastname+' '+pupil.firstname;

  Combobox1.Items.Add('Math');
  Combobox1.Items.clear;
  Combobox1.Items.Add('Math');
  Combobox1.Items.Add('Rus');

end;

end.
