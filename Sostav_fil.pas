unit Sostav_fil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TSostav_f = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox2: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sostav_f: TSostav_f;

implementation

uses Glav;

{$R *.dfm}

procedure TSostav_f.BitBtn1Click(Sender: TObject);
var s:string;
begin
  if combobox1.text = 'Название' then
  begin
  Glavn.IBQuery2.Active:=false;
  Glavn.IBQuery2.SQL.Clear;
  Glavn.IBQuery2.SQL.Add('select * from Podvijnoi_sostav where Name like '+#39+edit1.Text+#39);
  Glavn.IBQuery2.Active:=true;
  end
  else if combobox1.text = 'Свой/аренда' then
  begin
  Glavn.IBQuery2.Active:=false;
  Glavn.IBQuery2.SQL.Clear;
  Glavn.IBQuery2.SQL.Add('select * from Podvijnoi_sostav where Svoi_arenda like '+#39+IntToStr(combobox2.itemindex)+#39);
  Glavn.IBQuery2.Active:=true;
  end;
end;

procedure TSostav_f.BitBtn2Click(Sender: TObject);
begin
  Glavn.IBQuery2.Active:=false;
  Glavn.IBQuery2.SQL.Clear;
  Glavn.IBQuery2.SQL.Add('select * from Podvijnoi_sostav');
  Glavn.IBQuery2.Active:=true;
end;

procedure TSostav_f.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TSostav_f.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TSostav_f.ComboBox1Change(Sender: TObject);
begin
  if combobox1.text = 'Название' then
  begin
  edit1.Visible:=true;
  combobox2.Visible:=false;
  end else if combobox1.text = 'Свой/аренда' then
  begin
  edit1.Visible:=false;
  combobox2.Visible:=true;
  end;
end;

end.
