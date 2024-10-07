unit UDataModuloPedido;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, UPedidosModel;

type
  TDataModuloPedido = class(TDataModule)
    fdQryInserirPedido: TFDQuery;
    fdTransInserir: TFDTransaction;
    fdQryPesquisaPedido: TFDQuery;
    fdQryPesquisaPedidoNumero: TFDAutoIncField;
    fdQryPesquisaPedidoInseridoEm: TDateTimeField;
    fdQryPesquisaPedidoCodigoCliente: TIntegerField;
    fdQryPesquisaPedidoValorTotal: TBCDField;
    fdQryPesquisaPedidoNome: TStringField;
    fdQryExcluirPedido: TFDQuery;
    fdTransExcluir: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoPedido: Integer;
    function InserirPedido(pPedido: TPedidos; out pErro: string): Boolean;
    function ExcluirPedido(pCodigoPedido: Integer; out pErro: string): Boolean;
    procedure pesquisarPedido; overload;
  end;

var
  DataModuloPedido: TDataModuloPedido;

implementation

uses
  UDataModulo;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuloPedido }

function TDataModuloPedido.ExcluirPedido(pCodigoPedido: Integer;
  out pErro: string): Boolean;
begin
  with fdQryExcluirPedido do
  begin
    params[0].Value := pCodigoPedido;
    try
      Transaction.StartTransaction;
      ExecSQL;
      Transaction.Commit;
      Result := True
    except on E: Exception do
      begin
        Transaction.Rollback;
        pErro := 'Erro ao tentar excluir o pedido: ' + sLineBreak +  e.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDataModuloPedido.InserirPedido(pPedido: TPedidos;
  out pErro: string): Boolean;
var
  sqlQuery : TFDQuery;
begin
  sqlQuery := TFDQuery.Create(self);
  sqlQuery.Connection := DataModulo.fdConexao;
  sqlQuery.SQL.Text := 'Select max(NumeroPedido) as NumeroPedido from pedidos';
  CodigoPedido := 0;
  with fdQryInserirPedido, pPedido do
  begin
    ParamByName('NumeroPedido').Value := NumeroPedido;
    ParamByName('CodigoCliente').Value := CodigoCliente;
    ParamByName('ValorTotal').Value := ValorTotal;
    ParamByName('InseridoEm').Value := EmitidoEm;
    try
      Transaction.StartTransaction;
      ExecSQL();
      Transaction.Commit;
      sqlQuery.Open;
      if  sqlQuery.RecordCount > 0 then
        CodigoPedido := sqlQuery.FieldByName('NumeroPedido').AsInteger;
      FreeAndNil(sqlQuery);
      Result := True;
    except on E: Exception do
      begin
        Transaction.Rollback;
        pErro := 'Erro ao tentar inserir o pedido: ' + sLineBreak +  e.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TDataModuloPedido.pesquisarPedido;
begin
  if fdQryPesquisaPedido.Active then
    fdQryPesquisaPedido.Close;
  fdQryPesquisaPedido.Open;
  fdQryPesquisaPedido.First;
end;

end.
