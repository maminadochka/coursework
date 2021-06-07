unit EventsCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EventsListCore;

type
  TEventsList=array of EventsListCore.TEvent;
  TForm17 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

  procedure createEvent(List: EventsListCore.TList; classID: string; subject: string; date: string; hometask: string; lessonTheme: string);
  procedure editEvent(classID: string; subject: string; date: string; hometask: string; lessonTheme: string);
  function getEvent(subject: string; date: string; classID: string): EventsListCore.TEvent;
  function getEvents(subject: string; classID: string): TEventsList;
//  procedure editEvent(classID: string; subject: string; date: string; hometask: string; lessonTheme: string);

implementation

{$R *.dfm}


procedure createEvent(List: EventsListCore.TList; classID: string; subject: string; date: string; hometask: string; lessonTheme: string);
var
  curr: EventsListCore.PTListElement;
  EventsList: EventsListCore.TList;
begin
//  ShowMessage('class ID'+classID+'subject '+subject+' date: '+date);
  EventsListCore.LoadList(EventsList);
  New(curr);
  curr := EventsList.head;
  while curr <> nil do
  begin
    if (curr.data.classID = classID) And (curr.data.subject = subject) And (curr.data.date = date) then
    begin
//      ShowMessage('exists');
      exit;
    end;
//    ShowMessage('list class ID'+curr.data.classID+'list sibject '+curr.data.subject+' list date: '+curr.data.date);
    curr := curr.next;
  end;
  Dispose(curr);
  New(curr);
  curr.data.classID := classID;
  curr.data.subject := subject;
  curr.data.date := date;
  curr.data.HomeTask := hometask;
  curr.data.lessonTheme := lessonTheme;
  EventsListCore.AddToEnd(EventsList, curr);
  EventsListCore.SaveList(EventsList);
  Dispose(curr);
  exit;
end;

procedure editEvent(classID: string; subject: string; date: string; hometask: string; lessonTheme: string);
var
  curr: EventsListCore.PTListElement;
  EventsList: EventsListCore.TList;
begin
  New(curr);
  EventsListCore.LoadList(EventsList);

  curr := EventsList.head;
  while curr <> nil do
  begin
    if (curr.data.date = date) And (curr.data.subject = subject) And (curr.data.classID = classID) then
    begin
      curr.data.HomeTask := hometask;
      curr.data.lessonTheme := lessonTheme;
      EventsListCore.SaveList(EventsList);
      exit;
    end;
    curr := curr.next;
  end;

end;

function getEvent(subject: string; date: string; classID: string): EventsListCore.TEvent;
var
  curr: EventsListCore.PTListElement;
  EventsList: EventsListCore.TList;
begin
  New(curr);
  EventsListCore.LoadList(EventsList);
  curr := EventsList.head;
  while curr <> nil do
  begin
    if (curr.data.subject = subject) And (curr.data.date = date) And (curr.data.classID = classID) then
    begin
      Result := curr.data;
      exit;
    end;
    curr := curr.next;
  end;
  New(curr);
  curr.data.classID := 'nil';
  Result := curr.data;
  exit;
end;

function getEvents(subject: string; classID: string): TEventsList;
var
  EventsList: EventsListCore.TList;
  ResList: TEventsList;
  curr: EventsListCore.PTListElement;
begin
  EventsListCore.LoadList(EventsList);
  New(curr);
  curr := EventsList.head;
  while curr <> nil do
  begin
    if (curr.data.subject = subject) And (curr.data.classID = classID) then
    begin
      SetLength(ResList, Length(ResList)+1);
      ResList[High(ResList)] := curr.data;
    end;
    curr := curr.next;
  end;
  Result := ResList;
  exit;
end;

end.
