unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, Grids, StdCtrls;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cbb1: TComboBox;
    edt1: TEdit;
    cbb2: TComboBox;
    btn1: TButton;
    btn2: TButton;
    strngrd1: TStringGrid;
    cht1: TChart;
    psrsSeries1: TPieSeries;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}


procedure TForm6.FormShow(Sender: TObject);
begin
  strngrd1.RowCount:=1;
  strngrd1.ColCount:=4;
  strngrd1.Cells[0,0]:='NO';
  strngrd1.Cells[1,0]:='JUMLAH TERDAFTAR';
  strngrd1.Cells[2,0]:='FAKULTAS';
  strngrd1.Cells[3,0]:='TAAHUN ANGKATAN';

  strngrd1.ColWidths[0]:=20;
  strngrd1.ColWidths[2]:=70;
  strngrd1.ColWidths[3]:=140;
  strngrd1.ColWidths[1]:=110;
end;

procedure TForm6.btn1Click(Sender: TObject);
begin
  strngrd1.RowCount := strngrd1.RowCount+1;
  strngrd1.Cells[0,strngrd1.RowCount -1]:=IntToStr(strngrd1.RowCount -1);
  strngrd1.Cells[1,strngrd1.RowCount -1]:= edt1.Text;
  strngrd1.Cells[3,strngrd1.RowCount -1]:= cbb1.Text;
  strngrd1.Cells[2,strngrd1.RowCount -1]:= cbb2.Text;
end;

procedure TForm6.btn2Click(Sender: TObject);
var
  i:Integer;
begin
  cht1.Series[0].Clear;
  for i:=1 to strngrd1.RowCount-1 do
  begin
    cht1.Series[0].Add(StrToFloat(strngrd1.Cells[1,i]),strngrd1.cells[2,i]);
  end;
end;

end.
