unit UPesquisarPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TPesquisarPedido = class(TForm)
    dbgPedidos: TDBGrid;
    GroupBox1: TGroupBox;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    dsPedidos: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPedidosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgPedidosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoPedido: Integer;
    procedure selecionaPedido;
  end;

var
  PesquisarPedido: TPesquisarPedido;

implementation

uses
  UDataModuloPedido;

{$R *.dfm}

procedure TPesquisarPedido.dbgPedidosDblClick(Sender: TObject);
begin
  if dsPedidos.DataSet.RecordCount > 0 then
    SelecionaPedido;
end;

procedure TPesquisarPedido.dbgPedidosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (dsPedidos.DataSet.RecordCount > 0) then
    SelecionaPedido;
end;

procedure TPesquisarPedido.edtCodigoExit(Sender: TObject);
begin
  edtCodigo.Text := FormatFloat('000000', StrToIntDef(edtCodigo.Text, 0));
  if StrToIntDef(edtCodigo.Text, 0) > 0 then
    dsPedidos.DataSet.Locate('NumeroPedido', edtCodigo.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TPesquisarPedido.FormActivate(Sender: TObject);
begin
  edtCodigo.SetFocus;
end;

procedure TPesquisarPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TPesquisarPedido.FormCreate(Sender: TObject);
begin
  CodigoPedido := 0;
end;

procedure TPesquisarPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TPesquisarPedido.selecionaPedido;
begin
  CodigoPedido := dsPedidos.DataSet.FieldByName('NumeroPedido').AsInteger;
  Close;
end;

end.
