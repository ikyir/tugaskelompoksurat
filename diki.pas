unit diki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, DelphiTwain, DB, MemDS, VirtualTable, jpeg, ShellAPI;

type
  Tkeluar = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel2: TPanel;
    Label5: TLabel;
    pnl2: TPanel;
    dbgrd1: TDBGrid;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    pnl1: TPanel;
    lbl1: TLabel;
    img1: TImage;
    DelphiTwain1: TDelphiTwain;
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure DelphiTwain1TwainAcquire(Sender: TObject;
      const Index: Integer; Image: TBitmap; var Cancel: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function NamaGambar: string;
  end;

var
  keluar: Tkeluar;
  JPGku : TJPEGImage;
  asalScan : Integer;

implementation

uses dikipdf, dm;

{$R *.dfm}

procedure Tkeluar.btn1Click(Sender: TObject);
var
  sourceIndex : Integer;
  source : TTwainSource;
begin
  with DataModule1.VirtualTable1 do
  begin
  DelphiTwain1.LibraryLoaded :=True;
  DelphiTwain1.SourceManagerLoaded :=True;
  sourceIndex := DelphiTwain1.SelectSource();

  if(sourceIndex <> -1) then
  begin
    source :=DelphiTwain1.Source[sourceIndex];
    source.Loaded := True;
    source.Enabled := True;
  end;
  end;
end;

procedure Tkeluar.btn3Click(Sender: TObject);
begin
if DataModule1.VirtualTable1.IsEmpty then
ShowMessage('Data Kosong') else
DataModule1.VirtualTable1.Delete;
end;

function Tkeluar.NamaGambar: string;
var
  tgl, bln, thn, konversi, nom : string;
begin
  konversi := DateToStr(Now);
  tgl := Copy(konversi,1,2);
  bln := Copy(konversi,4,2);
  thn := Copy(konversi,7,2);
  nom := IntToStr(DataModule1.tabelufi.RecordCount);
  Result := 'IMG'+tgl+bln+thn+nom+'.jpeg';
end;

procedure Tkeluar.btn2Click(Sender: TObject);
begin
keluar2.ShowModal;
end;

procedure Tkeluar.DelphiTwain1TwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
var Lokasi, Gambar : string;
begin
  Img1.Picture.Assign(Image);
  Cancel := True;
  Gambar := NamaGambar;
  Lokasi := ExtractFilePath(Application.ExeName)+'\HGambar\';
  JPGku := TJPEGImage.Create;
  JPGku.Assign(Img1.Picture.Bitmap);
  JPGku.SaveToFile(Lokasi+Gambar);
  JPGku.Free;
  DataModule1.VirtualTable1.Append;
  DataModule1.VirtualTable1['Image'] := Gambar;
  DataModule1.VirtualTable1.Post;
end;

end.
