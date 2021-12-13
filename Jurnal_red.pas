unit Jurnal_red;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls;

type
  TJurnal_r = class(TForm)
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    ComboBoxStations: TComboBox;
    ComboBoxSostav: TComboBox;
    Combobox2: TComboBox;
    ComboBox3: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBoxSostavChange(Sender: TObject);
    procedure ComboBoxStationsChange(Sender: TObject);
    procedure ComboBoxStationsKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxSostavKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Jurnal_r: TJurnal_r;

implementation

uses Glav;

{$R *.dfm}

procedure TJurnal_r.BitBtn1Click(Sender: TObject);
begin
  Glavn.IBQuery3.Active:=false;
  Glavn.IBQuery3.SQL.Clear;
  Glavn.IBQuery3.SQL.Add('Update Jurnal Set Data_s = '+#39+DatetoStr(Datetimepicker1.date)+#39+',Data_po = '+#39+DatetoStr(Datetimepicker2.date)+#39+',Nom_sostava = '+combobox2.text+',Nom_stancii = '+combobox3.text+',status = '+IntToStr(combobox1.itemindex)+' where Nom_pp = '+edit3.text+'');
  Glavn.IBQuery3.ExecSQL;
  Glavn.IBQuery3.SQL.Clear;
  Glavn.IBQuery3.SQL.Add('select * from Jurnal');
  Glavn.IBQuery3.Active:=true;
  ShowMessage('Данные были обновлены.');
  Jurnal_r.Close;
end;

procedure TJurnal_r.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TJurnal_r.BitBtn2Click(Sender: TObject);
begin
  Jurnal_r.close;
end;

procedure TJurnal_r.ComboBoxSostavChange(Sender: TObject);
var i:integer;
begin
  i:=comboboxsostav.ItemIndex;
  combobox2.ItemIndex:=i;
end;

procedure TJurnal_r.ComboBoxStationsChange(Sender: TObject);
var i:integer;
begin
  i:=comboboxstations.ItemIndex;
  combobox3.ItemIndex:=i;
end;

procedure TJurnal_r.ComboBoxStationsKeyPress(Sender: TObject;
  var Key: Char);
begin
  key:=Chr(0);
end;

procedure TJurnal_r.ComboBoxSostavKeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TJurnal_r.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

end.
