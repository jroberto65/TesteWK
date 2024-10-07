unit UPesquisarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TPesquisarCliente = class(TForm)
    dbgPedidos: TDBGrid;
    GroupBox1: TGroupBox;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    dsClientes: TDataSource;
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
    CodigoCliente: Integer;
    procedure selecionaCliente;
  end;

var
  PesquisarCliente: TPesquisarCliente;

implementation

uses
  UDataModuloCliente, UDataModulo;

{$R *.dfm}

procedure TPesquisarCliente.dbgPedidosDblClick(Sender: TObject);
begin
  if dsClientes.DataSet.RecordCount > 0 then
    selecionaCliente;
end;

procedure TPesquisarCliente.dbgPedidosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (dsClientes.DataSet.RecordCount > 0) then
    SelecionaCliente;
end;

procedure TPesquisarCliente.edtCodigoExit(Sender: TObject);
begin
  edtCodigo.Text := FormatFloat('000000', StrToIntDef(edtCodigo.Text, 0));
  if StrToIntDef(edtCodigo.Text, 0) > 0 then
    dsClientes.DataSet.Locate('Codigo', edtCodigo.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TPesquisarCliente.FormActivate(Sender: TObject);
begin
  edtCodigo.SetFocus;
end;

procedure TPesquisarCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TPesquisarCliente.FormCreate(Sender: TObject);
begin
  CodigoCliente  := 0;
end;

procedure TPesquisarCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TPesquisarCliente.selecionaCliente;
begin
  CodigoCliente := dsClientes.DataSet.FieldByName('Codigo').AsInteger;
  Close;
end;

end.
