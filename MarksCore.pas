unit MarksCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MarksListCore;

type
  TMarksList = array [1..2] of MarksListCore.TMark;
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
function getpupilmarks(PupilID, SubjectName: string): TMarksList;
var MarksList: MarksListCore.TList;
    Results: TMarksList;
    curr: MarksListCore.PTListElement;
    mark: MarksListCore.TMark;
    cnt: integer;
 begin
//    SetLength(results, 0);
    cnt := 1;
    New(curr);
    MarksListCore.loadlist(MarksList);
    curr:= MarksList.head;
    while curr <> nil do
    begin
//      ShowMessage('getpupilmarks: '+curr.data.pupilId+' '+curr.data.subject+'value: '+curr.data.value+' date: '+curr.data.date);
      if (curr.data.PupilID = PupilID) and (curr.data.Subject = SubjectName) then
      begin
        Results[cnt] := curr.data;
        cnt := cnt+1;
        //ShowMessage('qq');
        //Setlength(Results,length(Results)+1);
        //ShowMessage('high: '+inttostr(High(Results)));
        //ShowMessage('length: '+inttostr(Length(Results)));
//        Results[High(Results)]:= mark;
      end;
      curr:= curr.next;
    end;
    Result := Results;
 end;

procedure addmark(PupilID,Date,Value,SubjectName: String);
var MarksList: MarksListCore.TList;
    curr: MarksListCore.PTListElement;
    curr2: MarksListCore.PTListElement;
    begin
      ShowMessage('addmark: '+pupilID+' '+date+' '+value+' '+subjectName);
      new(curr);
      New(curr2);
      MarksListCore.LoadList(MarksList);

       curr2 := MarksList.head;
      // no povtoryasyesya otmetki
      while curr2 <> nil do
      begin
        if (curr2.data.pupilId = pupilID) and (curr2.data.date = date) and (curr2.data.subject = subjectName) then
        begin
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
