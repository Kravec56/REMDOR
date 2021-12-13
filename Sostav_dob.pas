unit Sostav_dob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TSostav_d = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    ColorBox1: TColorBox;
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
  Sostav_d: TSostav_d;

implementation

uses Glav;

{$R *.dfm}


procedure TSostav_d.BitBtn1Click(Sender: TObject);
begin
  Glavn.IBQuery2.Active:=false;
  Glavn.IBQuery2.SQL.Clear;
  Glavn.IBQuery2.SQL.Add('Insert into Podvijnoi_sostav (Name,Svoi_arenda,Color) values ('+#39+edit1.Text+#39+','+IntToStr(combobox1.itemindex)+','+IntToStr(colorbox1.selected)+')');
  Glavn.IBQuery2.ExecSQL;
  Glavn.IBQuery2.SQL.Clear;
  Glavn.IBQuery2.SQL.Add('select * from Podvijnoi_sostav');
  Glavn.IBQuery2.Active:=true;
  Sostav_d.Close;
  Edit1.text:='';
end;

procedure TSostav_d.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TSostav_d.BitBtn2Click(Sender: TObject);
begin
  Sostav_d.close;
end;

procedure TSostav_d.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

end.
