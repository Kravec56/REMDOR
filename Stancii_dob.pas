unit Stancii_dob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TStancii_d = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
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
  Stancii_d: TStancii_d;

implementation

uses Glav;

{$R *.dfm}

procedure TStancii_d.BitBtn1Click(Sender: TObject);
begin
  Glavn.IBQuery1.Active:=false;
  Glavn.IBQuery1.SQL.Clear;
  Glavn.IBQuery1.SQL.Add('Insert into Stancii (Name,Dor_uprav,Adress) values ('+#39+edit1.Text+#39+','+IntToStr(combobox1.itemindex)+','+#39+edit2.text+#39+')');
  Glavn.IBQuery1.ExecSQL;
  Glavn.IBQuery1.SQL.Clear;
  Glavn.IBQuery1.SQL.Add('select * from Stancii');
  Glavn.IBQuery1.Active:=true;
  Stancii_d.Close;
  Edit1.text:=''; Edit2.text:='';
end;

procedure TStancii_d.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TStancii_d.BitBtn2Click(Sender: TObject);
begin
  Stancii_d.Close;
end;

procedure TStancii_d.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

end.
