unit Stancii_red;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TStancii_r = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Stancii_r: TStancii_r;

implementation

uses Glav, Stancii_dob;

{$R *.dfm}

procedure TStancii_r.BitBtn1Click(Sender: TObject);
begin
  Glavn.IBQuery1.Active:=false;
  Glavn.IBQuery1.SQL.Clear;
  Glavn.IBQuery1.SQL.Add('Update Stancii Set Name = '#39+edit1.Text+#39',Dor_uprav = '+IntToStr(combobox1.itemindex)+',Adress = '#39+edit2.text+#39' where Nom_pp = '+edit3.text+'');
  Glavn.IBQuery1.ExecSQL;
  Glavn.IBQuery1.SQL.Clear;
  Glavn.IBQuery1.SQL.Add('select * from Stancii');
  Glavn.IBQuery1.Active:=true;
  ShowMessage('Данные были обновлены.');
  Stancii_r.Close;
end;

procedure TStancii_r.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TStancii_r.BitBtn2Click(Sender: TObject);
begin
  Stancii_r.close;
end;

procedure TStancii_r.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

end.
