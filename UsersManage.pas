unit UsersManage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TTeacher = record
    firstname : string;
    lastname : string;
    ownclass : string;
    classes: array[1..1000] of string;
  end;
    TPupil = record
    firstname : string;
    lastname : string;
    studyclass : string;
  end;
  TForm3 = class(TForm)
    UserAddBtn: TButton;
    ShowTeachersRadioBtn: TRadioButton;
    ShowPupilsRadioBtn: TRadioButton;
    PupilPanel: TPanel;
    AddPupilRadioBtn: TRadioButton;
    AddTeacherRadioBtn: TRadioButton;
    LastNamePupilLabel: TLabel;
    FirstNamePupilLabel: TLabel;
    ClassPupilLabel: TLabel;
    LastNamePupilEdit: TEdit;
    FirstNamePupilEdit: TEdit;
    ClassPupilComboBox: TComboBox;
    TeacherPanel: TPanel;
    LastNameTeacherLabel: TLabel;
    FirstNameTeacherLabel: TLabel;
    OwnClassTeacherLabel: TLabel;
    LastNameTeacherEdit: TEdit;
    FirstNameTeacherEdit: TEdit;
    OwnClassTeacherComboBox: TComboBox;
    UserEditBtn: TButton;
    TeachersListScrollBox: TScrollBox;
    procedure AddTeacherRadioBtnClick(Sender: TObject);
    procedure AddPupilRadioBtnClick(Sender: TObject);
    procedure UserAddBtnClick(Sender: TObject);
    procedure ShowPupilsRadioBtnClick(Sender: TObject);
    procedure ShowTeachersRadioBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TeachersListClick(Sender: TObject);
    procedure PupilsListClick(Sender: TObject);
    procedure renderTeachersList;
  private
    { Private declarations }
  public
    teachersList: array [1..100] of TTeacher;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.AddPupilRadioBtnClick(Sender: TObject);
begin
   PupilPanel.Visible := true;
   TeacherPanel.Visible := false;
end;

procedure TForm3.renderTeachersList();
var
  teacher: TTeacher;
  itemLabel: TLabel;
begin
  teacher.firstname := 'Sveta';
  teacher.lastname := 'Boltak';
  teacher.ownclass := '051005';
  teachersList[1] := teacher;
  itemLabel.Create(TeachersListScrollBox);
  itemLabel.Parent := TeachersListScrollBox;
  itemLabel.Caption := teacher.firstname + teacher.lastname;
  itemLabel.Top := 10;
  itemLabel.Left := 10;
end;

procedure TForm3.AddTeacherRadioBtnClick(Sender: TObject);
begin
   PupilPanel.Visible := false;
   TeacherPanel.Visible := true;
end;

procedure TForm3.FormCreate(Sender: TObject);
var i: integer;
    j: integer;
    classlet: string ;
begin
classlet:= '����';
   for i := 1 to 11 do
    for j := 1 to 4 do
     begin
       Form3.OwnClassTeacherComboBox.Items.Add(inttostr(i)+classlet[j]);
       Form3.ClassPupilComboBox.Items.Add(inttostr(i)+classlet[j]);
     end;
end;

procedure TForm3.ShowPupilsRadioBtnClick(Sender: TObject);
begin
//   TeachersList.Visible := false;
//   PupilsList.Visible := true;
end;

procedure TForm3.ShowTeachersRadioBtnClick(Sender: TObject);
begin
//   TeachersList.Visible := true;
//   PupilsList.Visible := false;
end;

procedure TForm3.TeachersListClick(Sender: TObject);
begin
//ShowMessage(inttostr(TeachersList.ItemIndex));
end;

procedure TForm3.PupilsListClick(Sender: TObject);
begin
//ShowMessage(inttostr((PupilsList.ItemIndex)));
end;

procedure TForm3.UserAddBtnClick(Sender: TObject);
var
    Pupil: TPupil;
    Teacher: TTeacher;
begin
  if AddPupilRadioBtn.Checked = true then
    begin
      Pupil.firstname := FirstNamePupilEdit.Text;
      Pupil.lastname := LastNamePupilEdit.Text;
      Pupil.studyclass := ClassPupilComboBox.Text;

//      PupilsList.Items.Add(Pupil.lastname + ' ' + Pupil.firstname);
    end
  else
  if AddTeacherRadioBtn.Checked = true then
    begin
      Teacher.firstname := FirstNameTeacherEdit.Text;
      Teacher.lastname := LastNameTeacherEdit.Text;
      Teacher.ownclass := OwnClassTeacherComboBox.Text;
      renderTeachersList();
//      TeachersList.Items.Add(Teacher.lastname + ' ' + Teacher.firstname);
    end;

end;

end.
