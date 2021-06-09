program Project1;

uses
  Vcl.Forms,
  MainScreen in 'MainScreen.pas' {Form1},
  ZavuchScreen in 'ZavuchScreen.pas' {Form2},
  UsersManage in 'UsersManage.pas' {Form3},
  Journal in 'Journal.pas' {Form4},
  Statistics in 'Statistics.pas' {Form5},
  ParentsScreen in 'ParentsScreen.pas' {Form6},
  PupilsCore in 'PupilsCore.pas' {Form8},
  AuthCore in 'AuthCore.pas' {Form9},
  UsersCore in 'UsersCore.pas' {Form10},
  ClassesCore in 'ClassesCore.pas' {Form11},
  Libs in 'Libs.pas' {Form12},
  ZavuchClassesManage in 'ZavuchClassesManage.pas' {Form15},
  ClassViewScreen in 'ClassViewScreen.pas' {Form16},
  newUserScreen in 'newUserScreen.pas' {Form20},
  UsersListsCore in 'UsersListsCore.pas' {Form21},
  MarksCore in 'MarksCore.pas' {Form22},
  MarksListCore in 'MarksListCore.pas' {Form23},
  EventsListCore in 'EventsListCore.pas' {Form13},
  EventsCore in 'EventsCore.pas' {Form17},
  AuthListsCore in 'AuthListsCore.pas' {Form14};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm22, Form22);
  Application.CreateForm(TForm23, Form23);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm14, Form14);
  Application.Run;
end.
