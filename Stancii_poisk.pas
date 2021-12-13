unit Stancii_poisk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TStancii_p = class(TForm)
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
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
  Stancii_p: TStancii_p;

implementation

uses Glav;

{$R *.dfm}

procedure TStancii_p.BitBtn1Click(Sender: TObject);
var s:string;
begin
  if combobox1.text = 'Дорожное управление' then
  begin
  edit1.Visible:=false;
  combobox2.Visible:=true;
  Glavn.IBQuery1.Active:=false;
  Glavn.IBQuery1.SQL.Clear;
  Glavn.IBQuery1.SQL.Add('select * from Stancii where Dor_uprav ='+inttostr(combobox2.itemindex));
  Glavn.IBQuery1.Active:=true;
  end
  else begin
  if combobox1.text = 'Адрес' then s:='Adress' else
  if combobox1.text = 'Название' then s:='Name';
  edit1.Visible:=true;
  combobox2.Visible:=False;
  Glavn.IBQuery1.Active:=false;
  Glavn.IBQuery1.SQL.Clear;
  Glavn.IBQuery1.SQL.Add('select * from Stancii where '+s+' ='+#39+edit1.Text+#39);
  Glavn.IBQuery1.Active:=true;
  end;
end;

procedure TStancii_p.BitBtn2Click(Sender: TObject);
begin
  Glavn.IBQuery1.Active:=false;
  Glavn.IBQuery1.SQL.Clear;
  Glavn.IBQuery1.SQL.Add('select * from Stancii');
  Glavn.IBQuery1.Active:=true;
end;

procedure TStancii_p.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TStancii_p.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TStancii_p.ComboBox1Change(Sender: TObject);
begin
  if combobox1.text = 'Дорожное управление' then
  begin
  edit1.Visible:=false;
  combobox2.Visible:=true;
  end else
  begin
  edit1.Visible:=true;
  combobox2.Visible:=false;
  end;
end;

end.
