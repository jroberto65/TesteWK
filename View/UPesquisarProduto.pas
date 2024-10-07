unit UPesquisarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TPesquisarProduto = class(TForm)
    dbgProdutos: TDBGrid;
    GroupBox1: TGroupBox;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    dsProdutos: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgProdutosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoProduto: Integer;
    procedure selecionaProduto;
  end;

var
  PesquisarProduto: TPesquisarProduto;

implementation

uses
  UDataModuloProduto;

{$R *.dfm}

procedure TPesquisarProduto.dbgProdutosDblClick(Sender: TObject);
begin
  if dsProdutos.DataSet.RecordCount > 0 then
    SelecionaProduto;
end;

procedure TPesquisarProduto.dbgProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (dsProdutos.DataSet.RecordCount > 0) then
    SelecionaProduto;
end;

procedure TPesquisarProduto.edtCodigoExit(Sender: TObject);
begin
  edtCodigo.Text := FormatFloat('000000', StrToIntDef(edtCodigo.Text, 0));
  if StrToIntDef(edtCodigo.Text, 0) > 0 then
    dsProdutos.DataSet.Locate('Codigo', edtCodigo.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TPesquisarProduto.FormActivate(Sender: TObject);
begin
  edtCodigo.SetFocus;
end;

procedure TPesquisarProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TPesquisarProduto.FormCreate(Sender: TObject);
begin
  CodigoProduto := 0;
end;

procedure TPesquisarProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TPesquisarProduto.selecionaProduto;
begin
  CodigoProduto := dsProdutos.DataSet.FieldByName('Codigo').AsInteger;
  Close;
end;

end.
