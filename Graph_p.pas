unit Graph_p;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, StdCtrls, Series, DB,
  IBCustomDataSet, IBTable, DbChart, Glav, IBQuery, ComCtrls, Buttons,
  Grids, DBGrids, ExtDlgs;

type
  TGraph = class(TForm)
    DataSource1: TDataSource;
    IBQuery1: TIBQuery;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid1: TDBGrid;
    IBQueryTemp: TIBQuery;
    DataSource2: TDataSource;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    Button1: TButton;
    IBQueryColor: TIBQuery;
    ComboBox2: TComboBox;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    SavePictureDialog1: TSavePictureDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Graph: TGraph;

implementation

uses Math, Filtr;

{$R *.dfm}

function idtonum(yss:integer):integer;
var i:integer;
s:string;
begin
   for i:=0 to Graph.ComboBox2.Items.Count-1 do
   begin
     s:=Graph.ComboBox2.Items[i];
     If yss=StrToInt(s) then
     begin
       idtonum:=i+1;
       break;
     end;
   end;
end;

procedure TGraph.BitBtn1Click(Sender: TObject);
var i,h,l,h1,h2,xs,xe,ys,fl,rec,m,n,c,x,y,j,t,k,p,p1,f,start,yn,xn,ps:integer;
    d1,d2,s:string;
    G:array of integer;
begin
  IBQueryTemp.Active:=false;
  IBQueryTemp.SQL.Clear;
  IBQueryTemp.SQL.Add('Delete from Graph');
  IBQueryTemp.Active:=true;
  IBQuery1.Active:=false;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('select * from Jurnal where Data_s >= '+#39+datetostr(datetimepicker1.date)+#39+' and Data_po <= '+#39+datetostr(datetimepicker2.date)+#39);
  IBQuery1.Active:=true;
  p:=1;
  IBQuery1.First;
  While not IBQuery1.Eof do
  begin
    d1:=IBQuery1.Fields[1].asstring;
    d2:=IBQuery1.Fields[2].asstring;
    m:=IBQuery1.Fields[3].asinteger;
    n:=IBquery1.Fields[4].asinteger;
    IBQueryColor.Active:=false;
    IBQueryColor.SQL.Clear;
    IBQueryColor.SQL.Add('select Color from Podvijnoi_sostav where Nom_pp = '+inttostr(m));
    IBQueryColor.Active:=true;
    c:=ibquerycolor.Fields[0].asinteger;
    IBQueryColor.Next;
    IBQueryTemp.Active:=false;
    IBQueryTemp.SQL.Clear;
    IBQueryTemp.SQL.Add('Insert into Graph (Data_ss,Data_ppo,ID_sost,ID_stan,Colorr) values ('+#39+d1+#39+','+#39+d2+#39+','+inttostr(m)+','+inttostr(n)+','+inttostr(c)+')');
    IBQueryTemp.ExecSQL;
    IBQueryTemp.SQL.Clear;
    IBQueryTemp.SQL.Add('select * from Graph');
    IBQueryTemp.Active:=true;
    IBQuery1.Next;
    p:=p+1;
  End;
  t:=1;
  SetLength(G, p+1);
  While not IBQueryTemp.Eof do
  begin
    G[t]:=IBqueryTemp.Fields[3].asinteger;
    IBQueryTemp.Next;
    t:=t+1;
  end;
  p1:=1;
  i:=1;
  while i<=t do
  begin
    j:=i+1;
    while j<=t do
    begin
      if G[j]=G[i] then
      begin
        for k:=j to t-1 do
        G[k]:=G[k+1];
      t:=t-1;
      end else j:=j+1;
    end;
    i:=i+1;
    p1:=p1+1;
  end;
  p1:=p1-1;
  for I := 1 to p1-2 do
    for j := 1 to p1-2 do
      if G[j] > G[j+1] then
        begin
          x := G[j+1];
          G[j+1] := G[j];
          G[j] := x;
        end;
  l:=1;
  for i:=1 to p1-1 do
  begin
    ComboBox2.Items.Add(inttostr(G[i]));
    l:=l+1;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '01' then
  begin
  label2.caption:='Январь';
  f:=31;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '02' then
  begin
  label2.caption:='Февраль';
  f:=29;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '03' then
  begin
  label2.caption:='Март';
  f:=31;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '04' then
  begin
  label2.caption:='Апрель';
  f:=30;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '05' then
  begin
  label2.caption:='Май';
  f:=31;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '06' then
  begin
  label2.caption:='Июнь';
  f:=30;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '07' then
  begin
  label2.caption:='Июль';
  f:=31;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '08' then
  begin
  label2.caption:='Август';
  f:=31;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '09' then
  begin
  label2.caption:='Сентябрь';
  f:=30;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '10' then
  begin
  label2.caption:='Октябрь';
  f:=31;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '11' then
  begin
  label2.caption:='Ноябрь';
  f:=30;
  end;
  if FormatDateTime('mm', DateTimePicker1.Date) = '12' then
  begin
  label2.caption:='Декабрь';
  f:=31;
  end;
  PatBlt(Graph.Canvas.Handle, 0, 0, Graph.ClientWidth, Graph.ClientHeight, WHITENESS);
  Canvas.Pen.Color := clblack;
  xn:=Round(graph.ClientWidth/f-5);
  yn:=Round(graph.ClientHeight/p1-4);
  Canvas.MoveTo(100,30);
  Canvas.LineTo(100,900);
  Canvas.MoveTo(100,30);
  Canvas.LineTo(1840,30);
  Canvas.MoveTo(0,900);
  Canvas.LineTo(1840,900);
  start:=100;
  for i:=1 to f do
    begin
     Canvas.MoveTo(start+xn,30);
     Canvas.LineTo(start+xn,900);
     start:=start+xn;
     Canvas.TextOut (Round(start-xn/2),35,IntToStr(i));
    end;
    start:=graph.ClientHeight-90;
  for i:=1 to p1-1 do
    begin
    Canvas.MoveTo(0,start-yn);
    Canvas.LineTo(1840,start-yn);
    if Glavn.ibquery3.Locate('Nom_stancii', G[i],[loCaseInsensitive, loPartialKey]) then  s:=Glavn.IBQuery3.Fields[4].asstring;
    Canvas.TextOut (10,Round(start-yn/2),s);
    start:=start-yn;
    end;
    ibQueryTemp.Active:=false;
    ibQueryTemp.SQL.Clear;
    ibQueryTemp.SQL.Add('Select * from graph order By id_sost asc, data_ss asc');
    ibQueryTemp.Active:=True;
    rec:=0;
    ibQueryTemp.First;
    for I := 1 to p1-2 do
    for j := 1 to p1-2 do
      if G[j] < G[j+1] then
        begin
          x := G[j+1];
          G[j+1] := G[j];
          G[j] := x;
        end;
    h:=0;
    h1:=0;
    h2:=20;
    x:=100;
    y:=890;
    repeat
    ps:=ibQueryTemp.FieldByName('ID_sost').asinteger;
    xs:=StrToInt(FormatDateTime('d',ibQueryTemp.FieldByName('data_ss').AsDateTime));
    Canvas.MoveTo(xs*xn+70,graph.ClientHeight-ys*yn);
    fl:=0;
    while ibQueryTemp.FieldByName('id_sost').asinteger = ps do
      begin
      Canvas.Pen.Color:=ibQueryTemp.fieldbyname('Colorr').AsInteger;
      xs:=StrToInt(FormatDateTime('d',ibQueryTemp.FieldByName('data_ss').AsDateTime));
      xe:=StrToInt(FormatDateTime('d',ibQueryTemp.FieldByName('data_ppo').AsDateTime));
      t:=ibQueryTemp.FieldByName('id_stan').asinteger;
      ys:=idtonum(t);
      if fl<>0 then Canvas.LineTo(xs*xn+70,graph.ClientHeight-ys*yn+h);
      Canvas.MoveTo(xs*xn+70,graph.ClientHeight-ys*yn+h);
      Canvas.LineTo(xe*xn+70,graph.ClientHeight-ys*yn+h);
      ibQueryTemp.Next;
      fl:=1;
      rec:=rec+1;
      h:=h+1;
      if rec=ibQueryTemp.RecordCount then Break;
      end;
      if y>=940 then
      begin
        x:=x+200;
        h2:=20;
        y:=890;
      end;
      y:=y+h2;
      if Glavn.ibquery3.Locate('Nom_sostava', ps,[loCaseInsensitive, loPartialKey]) then  s:=Glavn.IBQuery3.Fieldbyname('Name_sostava').asstring;
      Canvas.MoveTo(x+70,y+5);
      Canvas.LineTo(x+150,y+5);
      Canvas.TextOut(x,y,s);
    until rec=ibQueryTemp.RecordCount;
    ShowMessage('График построен');
end;

procedure TGraph.FormPaint(Sender: TObject);
begin
  Canvas.Pen.Color := clblack;
  Canvas.MoveTo(100,0);
  Canvas.LineTo(100,800);
  Canvas.MoveTo(0,800);
  Canvas.LineTo(1900,800);
  Canvas.MoveTo(0,400);
  Canvas.LineTo(1900,400);
  Canvas.TextOut(30, 380, 'Станции');
  Canvas.TextOut(900, 30, 'Дата');
  Canvas.MoveTo(950,0);
  Canvas.LineTo(950,800);
end;

procedure TGraph.Button1Click(Sender: TObject);
begin
  IBQueryTemp.Active:=false;
  IBQueryTemp.SQL.Clear;
  IBQueryTemp.SQL.Add('Delete from Graph');
  IBQueryTemp.Active:=true;
  PatBlt(Graph.Canvas.Handle, 0, 0, Graph.ClientWidth, Graph.ClientHeight, WHITENESS);
  Canvas.Pen.Color := clblack;
  Canvas.MoveTo(100,0);
  Canvas.LineTo(100,800);
  Canvas.MoveTo(0,800);
  Canvas.LineTo(1900,800);
  Canvas.MoveTo(0,400);
  Canvas.LineTo(1900,400);
  Canvas.TextOut(30, 380, 'Станции');
  Canvas.TextOut(900, 30, 'Дата');
  Canvas.MoveTo(950,0);
  Canvas.LineTo(950,800);
end;

procedure TGraph.DBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
var
  img:TBitmap;
begin
  if Field.displayName = 'COLORR' then
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
end;

procedure TGraph.Button2Click(Sender: TObject);
begin
  Sved.Show;
end;

procedure TGraph.Button3Click(Sender: TObject);
var b: TBitmap;
    i: integer;
begin
    b := TBitmap.Create();
    b.Width := Graph.ClientWidth;
    b.Height := 860;
    b.Canvas.CopyRect(Rect(0, 0, b.Width, b.Height), Graph.Canvas,Graph.ClientRect);
    if not SavePictureDialog1.Execute then Exit;
    b.SaveToFile(SavePictureDialog1.FileName);
    b.Free;
end;

end.

