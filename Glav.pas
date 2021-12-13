unit Glav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, DB, IBStoredProc, IBCustomDataSet,
  IBQuery, IBDatabase, StdCtrls, Buttons, DBTables, RpCon, RpConDS,
  RpDefine, RpRave;

type
  TGlavn = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Label1: TLabel;
    DBGrid3: TDBGrid;
    IBQuery2: TIBQuery;
    DataSource2: TDataSource;
    IBQuery3: TIBQuery;
    DataSource3: TDataSource;
    IBQuery3NOM_PP: TIntegerField;
    IBQuery3DATA_S: TDateField;
    IBQuery3DATA_PO: TDateField;
    IBQuery3NOM_SOSTAVA: TIntegerField;
    IBQuery3NOM_STANCII: TIntegerField;
    IBQuery3STATUS: TSmallintField;
    IBQuery2NOM_PP: TIntegerField;
    IBQuery2NAME: TIBStringField;
    IBQuery2SVOI_ARENDA: TSmallintField;
    IBQuery2COLOR: TIntegerField;
    IBQuery1NOM_PP: TIntegerField;
    IBQuery1NAME: TIBStringField;
    IBQuery1DOR_UPRAV: TSmallintField;
    IBQuery1ADRESS: TIBStringField;
    IBQuery3Name_sostava: TStringField;
    IBQuery3Name_stancii: TStringField;
    DBGrid2: TDBGrid;
    DataSourceTemp: TDataSource;
    IBQueryTemp: TIBQuery;
    BitBtn10: TBitBtn;
    RvProject3: TRvProject;
    RvDataSetConnection3: TRvDataSetConnection;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid4DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BitBtn10Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Glavn: TGlavn;

implementation

uses Stancii_dob, Sostav_dob, Jurnal_dob, Stancii_red, Sostav_red,
  Jurnal_red, Stancii_poisk, Sostav_poisk, Jurnal_poisk, Stancii_fil,
  Sostav_fil, Jurnal_fil, Help, Graph_p;

{$R *.dfm}

procedure TGlavn.BitBtn1Click(Sender: TObject);
begin
  DBGrid1.visible:=true;
  DBGrid2.visible:=false;
  DBGrid3.visible:=false;
  BitBtn10.Visible:=false;
  label1.Caption:='Станции';
end;

procedure TGlavn.BitBtn2Click(Sender: TObject);
begin
  DBGrid1.visible:=false;
  DBGrid2.visible:=true;
  DBGrid3.visible:=false;
  BitBtn10.Visible:=false;
  label1.Caption:='Подвижной состав';
  DBGrid2.Repaint;
end;

procedure TGlavn.BitBtn3Click(Sender: TObject);
begin
  DBGrid1.visible:=false;
  DBGrid2.visible:=false;
  DBGrid3.visible:=true;
  BitBtn10.Visible:=true;
  label1.Caption:='Журнал';
end;

procedure TGlavn.FormShow(Sender: TObject);
begin
  IBQuery1.Active:=false;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('select * from Stancii');
  IBQuery1.Active:=true;
  IBQuery2.Active:=false;
  IBQuery2.SQL.Clear;
  IBQuery2.SQL.Add('select * from Podvijnoi_sostav');
  IBQuery2.Active:=true;
  IBQuery3.Active:=false;
  IBQuery3.SQL.Clear;
  IBQuery3.SQL.Add('select * from Jurnal');
  IBQuery3.Active:=true;
end;

procedure TGlavn.BitBtn5Click(Sender: TObject);
var
  sql:string;
begin
  if DBGrid1.visible=true then
    Stancii_d.show
  else if DBGrid2.Visible=True then Sostav_d.show
  else
  begin
     IBQueryTemp.SQL.Clear;
     SQL:='SELECT NOM_PP,NAME FROM STANCII';
     IBQueryTemp.SQL.Add(SQL);
     IBQueryTemp.Open;
     if IBQueryTemp.RecordCount>0 then
     begin
       Jurnal_d.ComboBoxStations.Items.Clear;
       While not IBQueryTemp.Eof do
       begin
         Jurnal_d.ComboBoxStations.Items.Add(IBQueryTemp.Fields[1].AsString);
         Jurnal_d.ComboBox3.Items.Add(IBQueryTemp.Fields[0].AsString);
         IBQueryTemp.Next;
       End;
     end;
     IBQueryTemp.SQL.Clear;
     SQL:='SELECT NOM_PP,NAME FROM PODVIJNOI_SOSTAV';
     IBQueryTemp.SQL.Add(SQL);
     IBQueryTemp.Open;
     if IBQueryTemp.RecordCount>0 then
     begin
       Jurnal_d.ComboBoxSostav.Items.Clear;
       While not IBQueryTemp.Eof do
       begin
         Jurnal_d.ComboBoxSostav.Items.Add(IBQueryTemp.Fields[1].AsString);
         Jurnal_d.ComboBox2.Items.Add(IBQueryTemp.Fields[0].AsString);
         IBQueryTemp.Next;
       End;
     end;
    Jurnal_d.show;
  end;
end;

procedure TGlavn.BitBtn6Click(Sender: TObject);
var sql:string;
begin
  if DBGrid1.visible=true then
  begin
  Stancii_r.show;
  Stancii_r.Edit1.text:=IBquery1.fieldvalues['Name'];
  Stancii_r.Edit2.text:=IBquery1.fieldvalues['Adress'];
  Stancii_r.Edit3.text:=IBquery1.fieldvalues['Nom_pp'];
  Stancii_r.combobox1.itemindex:=IBquery1.fieldvalues['Dor_uprav'];
  end
  else if DBGrid2.Visible=True then begin
  Sostav_r.show;
  Sostav_r.Edit1.text:=IBquery2.fieldvalues['Name'];
  Sostav_r.colorbox1.ItemIndex:=IBquery2.fieldvalues['Color'];
  Sostav_r.Edit2.text:=IBquery2.fieldvalues['Nom_pp'];
  Sostav_r.combobox1.itemindex:=IBquery2.fieldvalues['Svoi_arenda'];
  end
  else
  begin
     IBQueryTemp.SQL.Clear;
     SQL:='SELECT NOM_PP,NAME FROM STANCII';
     IBQueryTemp.SQL.Add(SQL);
     IBQueryTemp.Open;
     if IBQueryTemp.RecordCount>0 then
     begin
       Jurnal_r.ComboBoxStations.Items.Clear;
       While not IBQueryTemp.Eof do
       begin
         Jurnal_r.ComboBoxStations.Items.Add(IBQueryTemp.Fields[1].AsString);
         Jurnal_r.ComboBox3.Items.Add(IBQueryTemp.Fields[0].AsString);
         IBQueryTemp.Next;
       End;
     end;
     IBQueryTemp.SQL.Clear;
     SQL:='SELECT NOM_PP,NAME FROM PODVIJNOI_SOSTAV';
     IBQueryTemp.SQL.Add(SQL);
     IBQueryTemp.Open;
     if IBQueryTemp.RecordCount>0 then
     begin
       Jurnal_r.ComboBoxSostav.Items.Clear;
       While not IBQueryTemp.Eof do
       begin
         Jurnal_r.ComboBoxSostav.Items.Add(IBQueryTemp.Fields[1].AsString);
         Jurnal_r.ComboBox2.Items.Add(IBQueryTemp.Fields[0].AsString);
         IBQueryTemp.Next;
       End;
     end;
  Jurnal_r.show;
  Jurnal_r.Combobox2.text:=IBquery3.fieldvalues['Nom_sostava'];
  Jurnal_r.datetimepicker1.date:=IBquery3.fieldvalues['Data_s'];
  Jurnal_r.datetimepicker2.date:=IBquery3.fieldvalues['Data_po'];
  Jurnal_r.Combobox3.text:=IBquery3.fieldvalues['Nom_stancii'];
  Jurnal_r.ComboboxSostav.text:=IBquery3.fieldvalues['Name_sostava'];
  Jurnal_r.ComboboxStations.text:=IBquery3.fieldvalues['Name_stancii'];
  Jurnal_r.Edit3.text:=IBquery3.fieldvalues['Nom_pp'];
  Jurnal_r.combobox1.itemindex:=IBquery3.fieldvalues['Status'];
  end;
end;

procedure TGlavn.BitBtn7Click(Sender: TObject);
begin
  if DBGrid1.visible=true then Stancii_p.show
  else if DBGrid2.Visible=True then Sostav_p.show
  else Jurnal_p.show;
end;

procedure TGlavn.BitBtn8Click(Sender: TObject);
begin
  if DBGrid1.visible=true then Stancii_f.show
  else if DBGrid2.Visible=True then Sostav_f.show
  else Jurnal_f.show;
end;

procedure TGlavn.BitBtn9Click(Sender: TObject);
begin
  if DBGrid1.visible=true then
  begin
    IBQueryTemp.Close;
    IBQueryTemp.SQL.Clear;
    IBQueryTemp.SQL.Add('DELETE from Stancii where Nom_pp='+IntToStr(IBQuery1.fieldbyname('Nom_pp').asInteger));
    IBQueryTemp.ExecSQL;
    IBQuery1.Active:=false;
    IBQuery1.Active:=true;
  end
  else if DBGrid2.Visible=True then
  begin
    IBQueryTemp.Close;
    IBQueryTemp.SQL.Clear;
    IBQueryTemp.SQL.Add('DELETE from Podvijnoi_sostav where Nom_pp='+IntToStr(IBQuery2.fieldbyname('Nom_pp').asInteger));
    IBQueryTemp.ExecSQL;
    IBQuery2.Active:=false;
    IBQuery2.Active:=true;
  end
  else
  begin
    IBQueryTemp.Close;
    IBQueryTemp.SQL.Clear;
    IBQueryTemp.SQL.Add('DELETE from Jurnal where Nom_pp='+IntToStr(IBQuery3.fieldbyname('Nom_pp').asInteger));
    IBQueryTemp.ExecSQL;
    IBQuery3.Active:=false;
    IBQuery3.Active:=true;
  end;
end;

procedure TGlavn.DBGrid4DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
var
  img:TBitmap;
begin
    if Field.DisplayName = 'Цвет' then
    begin
      with (sender as tdbgrid).canvas do
      begin
          Img := TBitmap.Create;
          Brush.Color := field.AsInteger;
          FillRect(Rect);
          Draw(round((Rect.Left + Rect.Right - Img.Width) / 2), Rect.Top, Img);
          Img.Destroy;
      end;
    end;
    if Field.DisplayName = 'Свой/аренда' then
    begin
      with (sender as tdbgrid).canvas do
      begin
          fillrect(rect);
          CASE field.AsInteger OF
            0:textout(rect.left+2,rect.top+3,'Свой');
            1:textout(rect.left+2,rect.top+3,'Аренда');
          End;
      end;
    end;
end;

procedure TGlavn.DBGrid3DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if Field.DisplayName = 'Статус' then
  begin
    with (sender as tdbgrid).canvas do
    begin
          fillrect(rect);
          CASE field.AsInteger OF
            0:textout(rect.left+2,rect.top+3,'Загружается');
            1:textout(rect.left+2,rect.top+3,'Разгружается');
            2:textout(rect.left+2,rect.top+3,'Простаивает');
            3:textout(rect.left+2,rect.top+3,'Движется');
          End;
    end;
  end;
end;

procedure TGlavn.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
    if Field.DisplayName = 'Дорожное управление' then
    begin
      with (sender as tdbgrid).canvas do
      begin
          fillrect(rect);
          CASE field.AsInteger OF
            0:textout(rect.left+2,rect.top+3,'Собственная');
            1:textout(rect.left+2,rect.top+3,'Чужая');
          End;
      end;
    end;
end;

procedure TGlavn.BitBtn10Click(Sender: TObject);
begin
    RvProject3.Execute;
end;

procedure TGlavn.N2Click(Sender: TObject);
begin
  Glavn.Close;
end;

procedure TGlavn.N4Click(Sender: TObject);
begin
  Spravka.Show;
end;

procedure TGlavn.BitBtn4Click(Sender: TObject);
begin
  Graph.Show;
end;

procedure TGlavn.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

end.
