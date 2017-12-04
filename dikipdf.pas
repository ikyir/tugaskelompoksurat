unit dikipdf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxPreview, StdCtrls, ExtCtrls, frxDBSet, frxExportPDF, ShellAPI;

type
  Tkeluar2 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxPreview1: TfrxPreview;
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DelFilesFrom(Directory, Filemask : string; DelSubDirs : Boolean);
    function waktu: string;
  end;

var
  keluar2: Tkeluar2;

implementation

uses
  diki, dm;

{$R *.dfm}

{ TForm2 }

procedure Tkeluar2.DelFilesFrom(Directory, Filemask: string;
  DelSubDirs: Boolean);
  var Sourcelst : string;
  FOS : TSHFileOpStruct;
begin
  FillChar(FOS, SizeOf(FOS), 0);
  FOS.Wnd := Application.MainForm.Handle;
  FOS.wFunc := FO_DELETE;
  Sourcelst := Directory+'\'+Filemask+#0;
  FOS.pFrom := PChar(Sourcelst);
  if not DelSubDirs then
  FOS.fFlags := FOS.fFlags or FOF_FILESONLY;
  FOS.fFlags := FOS.fFlags or FOF_NOCONFIRMATION;
  SHFileOperation(FOS);
end;

function Tkeluar2.waktu: string;
var tgl : TDateTime;
begin
tgl :=now();
Result:= FormatDateTime('yyyy', tgl);
end;

procedure Tkeluar2.frxReport1BeforePrint(Sender: TfrxReportComponent);
var img : TfrxComponent;
begin
  try
    img:=frxReport1.FindObject('Picture1');
    TfrxPictureView(img).Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+
    '\HGambar\'+DataModule1.VirtualTable1.FieldValues['Image']);
    except
      ShowMessage('Objek Tidak DItemukan');
    end;
end;

procedure Tkeluar2.FormShow(Sender: TObject);
begin
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'PreviewScanPdf.fr3');
  frxReport1.FileName:=ExtractFilePath(Application.ExeName)+'PreviewScanPdf.fr3';
  frxReport1.ShowReport();
end;

procedure Tkeluar2.Button1Click(Sender: TObject);
var namapdf:string;
var PDFku: TfrxCustomExportFilter;
lokasihapus : string;
begin
with DataModule1.zqry1 do
begin
    if asalScan = 0 then
  begin
  namapdf := keluar.Edit1.Text+'-'+keluar.Edit2.Text+'-'+waktu+ ' -Surat-masuk.pdf';
  PDFku := TfrxCustomExportFilter(frxPDFExport1);
  PDFku.ShowDialog := False;
  PDFku.FileName := ExtractFilePath(Application.ExeName)+'\FilePDF\'+namapdf;
  frxReport1.PrepareReport(false);
  frxReport1.Export(PDFku);
  keluar.lbl1.Caption := namapdf;
  end;

  DataModule1.VirtualTable1.Clear;
  lokasihapus := (ExtractFilePath(Application.ExeName)+'\Gambar_scan\');
  DelFilesFrom(lokasihapus, '*.*', False);
  namapdf := 'Surat Keluar'+keluar.Edit1.Text+keluar.Edit2.Text+'.pdf';
  DataModule1.zqry1.Active:=True;
  DataModule1.zqry1.Append;
  DataModule1.zqry1.FieldByName('nama_file').AsString := namapdf;
  DataModule1.zqry1.Post;
  keluar2.Close;
end;
end;


end.
