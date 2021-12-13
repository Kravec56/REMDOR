unit Sostav_red;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TSostav_r = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    ColorBox1: TColorBox;
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
  Sostav_r: TSostav_r;

implementation

uses Glav;

{$R *.dfm}


procedure TSostav_r.BitBtn1Click(Sender: TObject);
begin
  Glavn.IBQuery2.Active:=false;
  Glavn.IBQuery2.SQL.Clear;
  Glavn.IBQuery2.SQL.Add('Update Podvijnoi_sostav Set Name = '#39+edit1.Text+#39',Svoi_arenda = '+IntToStr(combobox1.itemindex)+',Color = '+Inttostr(colorbox1.selected)+' where Nom_pp = '+edit2.text+'');
  Glavn.IBQuery2.ExecSQL;
  Glavn.IBQuery2.SQL.Clear;
  Glavn.IBQuery2.SQL.Add('select * from Podvijnoi_sostav');
  Glavn.IBQuery2.Active:=true;
  ShowMessage('Данные были обновлены.');
  Sostav_r.Close;
end;

procedure TSostav_r.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TSostav_r.BitBtn2Click(Sender: TObject);
begin
  Sostav_r.close;
end;

procedure TSostav_r.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

end.
