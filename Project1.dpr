﻿program Project1;

uses
  Vcl.Forms,
  MainScreen in 'MainScreen.pas' {Form1},
  UserScreen in 'UserScreen.pas' {Form2},
  UsersManage in 'UsersManage.pas' {Form3},
  Journal in 'Journal.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
