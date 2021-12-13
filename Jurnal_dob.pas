unit Jurnal_dob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls, DB, IBCustomDataSet,
  IBStoredProc, IBQuery, DBGrids;

type
  TJurnal_d = class(TForm)
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    IBStoredProc1: TIBStoredProc;
    IBQuery1NOM_PP: TIntegerField;
    IBQuery1NOM_MAT: TIntegerField;
    IBQuery1NOM_JUR: TIntegerField;
    IBQuery1MASSA: TFloatField;
    IBQuery2: TIBQuery;
    IBQuery2NOM_PP: TIntegerField;
    IBQuery2NAME: TIBStringField;
    IBQuery1Name_mat: TStringField;
    ComboBoxStations: TComboBox;
    ComboBoxSostav: TComboBox;
    Combobox2: TComboBox;
    ComboBox3: TComboBox;
    BitBtn7: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxSostavChange(Sender: TObject);
    procedure ComboBoxStationsChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure ComboBoxSostavKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxStationsKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Jurnal_d: TJurnal_d;

implementation

uses Glav, Gruz2_dob, Gruz2_red;

{$R *.dfm}

procedure TJurnal_d.BitBtn1Click(Sender: TObject);
begin
  Glavn.IBQuery3.Active:=false;
  Glavn.IBQuery3.SQL.Clear;
  Glavn.IBQuery3.SQL.Add('Insert into Jurnal (Data_s,Data_po,Nom_sostava, Nom_stancii, status) values ('+#39+DatetoStr(Datetimepicker1.date)+#39+','+#39+DatetoStr(Datetimepicker2.date)+#39+','+ComboBox2.Text+','+ComboBox3.Text+','+IntToStr(combobox1.itemindex)+')');
  Glavn.IBQuery3.ExecSQL;
  Glavn.IBQuery3.SQL.Clear;
  Glavn.IBQuery3.SQL.Add('select * from Jurnal');
  Glavn.IBQuery3.Active:=true;
  Jurnal_d.Close;
  ComboBoxStations.text:=''; ComboBoxSostav.text:='';
end;

procedure TJurnal_d.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TJurnal_d.ComboBoxSostavChange(Sender: TObject);
var i:integer;
begin
  i:=comboboxsostav.ItemIndex;
  combobox2.ItemIndex:=i;
end;

procedure TJurnal_d.ComboBoxStationsChange(Sender: TObject);
var i:integer;
begin
  i:=comboboxstations.ItemIndex;
  combobox3.ItemIndex:=i;
end;

procedure TJurnal_d.BitBtn7Click(Sender: TObject);
begin
  Jurnal_d.close;
end;

procedure TJurnal_d.ComboBoxSostavKeyPress(Sender: TObject; var Key: Char);
begin
  key:=Chr(0);
end;

procedure TJurnal_d.ComboBoxStationsKeyPress(Sender: TObject;
  var Key: Char);
begin
  key:=Chr(0);
end;

procedure TJurnal_d.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

end.
