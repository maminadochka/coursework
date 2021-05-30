unit ClassViewScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, ClassesCore;

type
  TForm16 = class(TForm)
    PupilsListTable: TStringGrid;
    Label1: TLabel;
    classNameLabel: TLabel;
    classNameLabel2: TLabel;
    Label2: TLabel;
    ManagerNameLabel2: TLabel;
    addPupilBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    _class: ClassesCore.T_Class;
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

procedure TForm16.FormCreate(Sender: TObject);
begin
  PupilsListTable.Cells[0,0] := 'pupil_id';
  PupilsListTable.Cells[1,0] := '№';
  PupilsListTable.Cells[2, 0] := 'LastName';
  PupilsListTable.Cells[3, 0] := 'FirstName';
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  classNameLabel2.Caption := _class.name;
  // TODO get manager name
  ManagerNameLabel2.Caption := _class.managerId;
end;
end.
