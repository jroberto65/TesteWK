unit UDataModuloCliente;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uClienteModel;

type
  TDataModuloCliente = class(TDataModule)
    fdQryPesquisaCliente: TFDQuery;
    fdQryInserirCliente: TFDQuery;
    fdQryAlterarCliente: TFDQuery;
    fdQryExcluirCliente: TFDQuery;
    fdQryPesquisaClienteCodigo: TFDAutoIncField;
    fdQryPesquisaClienteNome: TStringField;
    fdQryPesquisaClienteCidade: TStringField;
    fdQryPesquisaClienteUF: TStringField;
    fdTransInserir: TFDTransaction;
    fdTransAlterar: TFDTransaction;
    fdTransExcluir: TFDTransaction;
    fbQryCliente: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure pesquisarCliente(pNome: string); overload;
    procedure pesquisarCliente; overload;
    procedure CarregarCliente(pCliente: TCliente; pCodigoCliente: Integer);
    function GerarCodigo: Integer;
    function InserirCliente(pCliente: TCliente; out pErro: string): Boolean;
    function AlterarCliente(pCliente: TCliente; out pErro: string): Boolean;
    function ExcluirCliente(pCodigoCliente: Integer; out pErro: string): Boolean;
  end;

var
  DataModuloCliente: TDataModuloCliente;

implementation

uses UDataModulo;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleCliente }

function TDataModuloCliente.AlterarCliente(pCliente: TCliente;
  out pErro: string): Boolean;
begin
  Result := True;
  with fdQryAlterarCliente, pCliente do
  begin
    ParamByName('Codigo').Value := Codigo;
    ParamByName('Nome').Value := Nome;
    ParamByName('Cidade').Value := Cidade;
    ParamByName('UF').Value := UF;
    try
      Transaction.StartTransaction;
      ExecSQL();
      Transaction.Commit;
    except on E: Exception do
      begin
        Transaction.Rollback;
        pErro := 'Erro ao tentar alterar o cliente: ' + sLineBreak +  e.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TDataModuloCliente.CarregarCliente(pCliente: TCliente;
  pCodigoCliente: Integer);
var
  sqlCliente : TFDQuery;
begin
  sqlCliente := TFDQuery.Create(nil);
  try
    with sqlCliente do
    begin
      Connection := DataModulo.fdConexao;
      SQL.Text := 'select * from clientes where codigo = ' + IntToStr(pCodigoCliente);
      Open;
      with pCliente do
      begin
        Codigo := FieldByName('Codigo').Value;
        Nome := FieldByName('Nome').Value;
        Cidade := FieldByName('Cidade').Value;
        UF := FieldByName('UF').Value;
     end;
    end;
  finally
    FreeAndNil(sqlCliente);
  end;
end;

function TDataModuloCliente.ExcluirCliente(pCodigoCliente: Integer;
  out pErro: string): Boolean;
begin
  with fdQryExcluirCliente do
  begin
    params[0].Value := pCodigoCliente;
    try
      Transaction.StartTransaction;
      ExecSQL;
      Transaction.Commit;
      Result := True
    except on E: Exception do
      begin
        Transaction.Rollback;
        pErro := 'Erro ao tentar excluir o cliente: ' + sLineBreak +  e.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDataModuloCliente.GerarCodigo: Integer;
var
  sqlSequencia : TFDQuery;
begin
  sqlSequencia := TFDQuery.Create(nil);
  try
    with sqlSequencia do
    begin
      Connection := DataModulo.fdConexao;
      SQL.Text := 'select coalesce(max(codigo), 0) + 1 as seq from clientes';
      Open;
      Result := FieldByName('seq').AsInteger;
      Close;
    end;
  finally
    FreeAndNil(sqlSequencia);
  end;
end;

function TDataModuloCliente.InserirCliente(pCliente: TCliente;
  out pErro: string): Boolean;
begin
  with fdQryInserirCliente, pCliente do
  begin
    Params[0].Value := Nome;
    Params[1].Value := Cidade;
    Params[2].Value := UF;
    try
      Transaction.StartTransaction;
      ExecSQL();
      Transaction.Commit;
      Result := True
    except on E: Exception do
      begin
        Transaction.Rollback;
        pErro := 'Erro ao tentar inserir o cliente: ' + sLineBreak +  e.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TDataModuloCliente.pesquisarCliente;
const
  SQL_ = 'Select * from Clientes ';
begin
  fdQryPesquisaCliente.Close;
  fdQryPesquisaCliente.sql.Text := SQL_;
  fdQryPesquisaCliente.Open;
  fdQryPesquisaCliente.First;
end;

procedure TDataModuloCliente.pesquisarCliente(pNome: string);
begin
  if fdQryPesquisaCliente.Active then
    fdQryPesquisaCliente.Close;
  fdQryPesquisaCliente.ParamByName('Nome').AsString := ('%'+pNome+'%');
  fdQryPesquisaCliente.Open;
  fdQryPesquisaCliente.First;
end;

end.
