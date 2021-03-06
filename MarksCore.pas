unit MarksCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MarksListCore;

type
  TMarksList = array of MarksListCore.TMark;
  TForm22 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

  function getpupilmarks(PupilID, SubjectName: string): TMarksList;
  procedure addmark(PupilID,Date,Value,SubjectName: String);

implementation

{$R *.dfm}
function getPupilMarks(PupilID, SubjectName: string): TMarksList;
var MarksList: MarksListCore.TList;
    ResultsList: TMarksList;
    curr: MarksListCore.PTListElement;
    mark: MarksListCore.TMark;
    cnt: integer;
 begin
    cnt := 0;
    New(curr);
    MarksListCore.loadlist(MarksList);
    curr:= MarksList.head;
    while curr <> nil do
    begin
      if (curr.data.PupilID = PupilID) and (curr.data.Subject = SubjectName) then
      begin
        cnt := cnt+1;
      end;
      curr:= curr.next;
    end;
    dispose(curr);
    New(curr);
    curr:= MarksList.head;
    SetLength(ResultsList, cnt);
    cnt := 0;
    while curr <> nil do
    begin
      if (curr.data.PupilID = PupilID) and (curr.data.Subject = SubjectName) then
      begin
        //Setlength(ResultsList,Length(ResultsList)+1);
        ResultsList[cnt]:= curr.data;
//        ShowMessage('adding date: '+curr.data.date+' value '+curr.data.value);
        cnt := cnt+1;
      end;
      curr:= curr.next;
    end;
    dispose(curr);
    Result := ResultsList;
    exit;
 end;

procedure addmark(PupilID,Date,Value,SubjectName: String);
var MarksList: MarksListCore.TList;
    curr: MarksListCore.PTListElement;
    curr2: MarksListCore.PTListElement;
    begin
//      ShowMessage('addmark: '+pupilID+' '+date+' '+value+' '+subjectName);
      new(curr);
      New(curr2);
      MarksListCore.LoadList(MarksList);

       curr2 := MarksList.head;
      // no povtoryasyesya otmetki
      while curr2 <> nil do
      begin
        if (curr2.data.pupilId = pupilID) and (curr2.data.date = date) and (curr2.data.subject = subjectName) then
        begin
//          ShowMessage('replacing '+curr2.data.value + 'na: '+value);
          curr2.data.value := value;
          MarksListCore.SaveList(MarksList);
          exit;
        end;
        curr2 := curr2^.next;
      end;
      curr^.data.pupilId:= pupilID;
      curr^.data.Date:= Date;
      curr^.data.Value:= Value;
      curr^.data.Subject:= SubjectName;
      MarksListCore.AddToEnd(MarksList, curr);
      MarksListCore.savelist(MarksList);
      dispose(curr);
      exit;
    end;
end.
