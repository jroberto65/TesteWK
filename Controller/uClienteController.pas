unit uClienteController;

interface

uses
  UDataModuloCliente, uClienteModel, System.SysUtils, db;

type
  TClienteController = class
  private
    { private declarations }
    FDataSet: TDataset;
  public
    { public declarations }
    Constructor Create(var ADataSource: TDataSource);
    destructor Destroy; override;
    procedure pesquisarCliente(pNome: string); overload;
    procedure pesquisarCliente; overload;
    procedure CarregarCliente(pCliente: TCliente; pCodigoCliente: Integer);
    function  Inserir(pCliente: tCliente; var pErro: String): Boolean;
    function  Alterar(pCliente: tCliente; var pErro: String): Boolean;
    function  Excluir(pCodigoCliente: Integer; var pErro: String): Boolean;
    function getDataSet: TDataset;
  end;

implementation

{ TClienteController }

function TClienteController.Alterar(pCliente: tCliente;
  var pErro: String): Boolean;
begin
  Result := DataModuloCliente.AlterarCliente(pCliente, pErro);
end;

procedure TClienteController.CarregarCliente(pCliente: TCliente;
  pCodigoCliente: Integer);
begin
  DataModuloCliente.CarregarCliente(pCliente, pCodigoCliente);
end;

constructor TClienteController.Create(var ADataSource: TDataSource);
begin
  DataModuloCliente := TDataModuloCliente.Create(nil);
  ADataSource.DataSet := DataModuloCliente.fdQryPesquisaCliente;
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(DataModuloCliente);
  inherited;
end;

function TClienteController.Excluir(pCodigoCliente: Integer;
  var pErro: String): Boolean;
begin
  Result := DataModuloCliente.ExcluirCliente(pCodigoCliente, pErro);
end;

function TClienteController.getDataSet: TDataset;
begin
  Result := FDataset;
end;

function TClienteController.Inserir(pCliente: tCliente;
  var pErro: String): Boolean;
begin
  Result := DataModuloCliente.InserirCliente(pCliente, pErro);
end;

procedure TClienteController.pesquisarCliente;
begin
  DataModuloCliente.pesquisarCliente;
  FDataSet := DataModuloCliente.fdQryPesquisaCliente;
end;

procedure TClienteController.pesquisarCliente(pNome: string);
begin
  DataModuloCliente.pesquisarCliente(pNome);
  FDataSet := DataModuloCliente.fdQryPesquisaCliente;
end;

end.
