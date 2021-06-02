// created with love by Roman&Ksenia
unit JournalCore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PupilsCore;


type

 TMark = record
    // each mark is binded with date and pupil for current subject
    // i need a method to get marks from the list and to draw it on journal
    // i need to save dates
    value: string[50];
    date: string[50];
    pupil_id: string[50];
    subject: string[50];
  end;

  TForm7 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation


{$R *.dfm}
end.
