unit ZavuchClassesManage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, ClassesCore, ClassViewScreen, UsersListsCore;

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
    classesList: TClassesList;
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.drawClassesList();
var
  i: integer;
  _class: ClassesCore.T_Class;
begin
  for i := 0 to Length(classesList)-1 do
  begin
    _class := ClassesList[i];
    classesListTable.Cells[0, i+1] := _class.classId;
    classesListTable.Cells[1, i+1] := _class.name;
    classesListTable.Cells[2, i+1] := inttostr(Length(_class.pupils));
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
end;

procedure TForm15.ClassesListTableSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  var
    _class: ClassesCore.T_Class;
    class_id: string;
begin
  class_id := ClassesListTable.Cells[0, ARow];
  _class := ClassesCore.getClass(ClassesList, class_id);
  Form16._class := _class;
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
  ClassesCore.createClass(classesList, NewClassNameEdit.Text, '1');
//  ShowMessage(classesList[0].name);
  cleanClassesList();
  drawClassesList();
end;

end.
