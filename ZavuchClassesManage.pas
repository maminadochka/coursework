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
  New(curr);
  curr := classesList.head;
  if curr = nil then  exit;

  classesListTable.RowCount := 100;
//   ShowMessage('from draw: '+curr^.data.name);
//  classesListTable.Cells[0, cnt+1] := curr^.data.classId;
//  classesListTable.Cells[1, cnt+1] := curr^.data.name;
  while curr <> nil do
  begin
//    ShowMessage('from draw: '+curr^.data.name);
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
  usersCurr: usersListsCore.PTListElement;
begin
  ComboBox1.Items.Clear;
  usersListsCore.LoadList(usersList);
  usersCurr := usersList.head;
  while usersCurr <> nil do
  begin
    if usersCurr.data.userType <> 'pupil' then
    begin
      ComboBox1.Items.Add(usersCurr^.data.firstname+' '+usersCurr^.data.lastname);
    end;
    usersCurr := usersCurr^.next;
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
  for i := 1 to 100 do
    begin
      for j := 0 to 100 do
        begin
          classesListTable.Cells[j, i] := '';
        end;
    end;
end;

procedure TForm15.Button1Click(Sender: TObject);
begin
  // TODO get manager ID
  ClassesCore.createClass(NewClassNameEdit.Text, Combobox1.Text);
//  ShowMessage(classesList[0].name);
  cleanClassesList();
  drawClassesList();
end;
end.
