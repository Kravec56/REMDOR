unit Jurnal_poisk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TJurnal_p = class(TForm)
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Jurnal_p: TJurnal_p;

implementation

uses Glav;

{$R *.dfm}

procedure TJurnal_p.BitBtn1Click(Sender: TObject);
var s:string;
begin
  if combobox1.text = 'Дата с' then s:='Data_s'
  else if combobox1.text = 'Дата по' then s:='Data_po'
  else if combobox1.text = 'Номер состава' then s:='Nom_sostava'
  else if combobox1.text = 'Номер станции' then s:='Nom_stancii'
  else if combobox1.text = 'Статус' then s:='Status';
  Glavn.IBQuery3.Active:=false;
  Glavn.IBQuery3.SQL.Clear;
  Glavn.IBQuery3.SQL.Add('select * from Jurnal where '+s+'='+#39+edit1.Text+#39);
  Glavn.IBQuery3.Active:=true;
end;

procedure TJurnal_p.BitBtn2Click(Sender: TObject);
begin
  Glavn.IBQuery3.Active:=false;
  Glavn.IBQuery3.SQL.Clear;
  Glavn.IBQuery3.SQL.Add('select * from Jurnal');
  Glavn.IBQuery3.Active:=true;
end;                                                                    

procedure TJurnal_p.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TJurnal_p.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

end.
