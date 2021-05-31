unit ZavuchClassesManage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, ClassesCore, ClassViewScreen, UsersListsCore, ClassesListsCore;

type
  TForm15 = class(TForm)
    ClassesListTable: TStringGrid;
    NewClassNameEdit: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Name: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure drawClassesList();
    procedure cleanClassesList();
    procedure FormCreate(Sender: TObject);
    procedure ClassesListTableSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.drawClassesList();
var
  i: integer;
  classesList: ClassesListsCore.TList;
  curr: ClassesListsCore.PTListElement;
  cnt: integer;
begin
  classesListsCore.LoadList(classesList);
  cnt := 0;
  curr := classesList.head;
  classesListTable.RowCount := 100;
  while curr <> nil do
  begin
    classesListTable.Cells[0, cnt+1] := curr^.data.classId;
    classesListTable.Cells[1, cnt+1] := curr^.data.name;
    cnt := cnt+1;
    curr := curr^.next;
  end;
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  ClassesListTable.Cells[0,0] := 'Class id';
  ClassesListTable.Cells[1,0] := 'Class Name';
  ClassesListTable.Cells[2,0] := 'Pupils count';
end;


procedure TForm15.FormShow(Sender: TObject);
var
  usersList: usersListsCore.TList;
  curr: usersListsCore.PTListElement;
begin
  usersListsCore.LoadList(usersList);
  curr := usersList.head;
  while curr <> nil do
  begin
    ComboBox1.Items.Add(curr^.data.firstname+' '+curr^.data.lastname);
    curr := curr^.next;
  end;
  cleanClassesList;
  drawClassesList;
end;

procedure TForm15.ClassesListTableSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  var
    classId: string;
begin
  classId := ClassesListTable.Cells[0, ARow];
  Form16.classId := classId;
  Form16.ShowModal();
end;

procedure TForm15.cleanClassesList();
  var
  i: integer;
  j: Integer;
begin
  for i := 1 to 15 do
    begin
      for j := 0 to 15 do
        begin
          classesListTable.Cells[j, i] := '';
        end;
    end;
end;

procedure TForm15.Button1Click(Sender: TObject);
begin
  ClassesCore.createClass(NewClassNameEdit.Text, '1');
//  ShowMessage(classesList[0].name);
  cleanClassesList();
  drawClassesList();
end;

end.
