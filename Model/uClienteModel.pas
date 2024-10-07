unit uClienteModel;

interface
uses
  System.SysUtils;
type
  TCliente = class
  private
    { private declarations }
    FCodigo: Integer;
    FNome: String;
    FCidade: String;
    FUF: String;
    procedure SetNome(const Value: String);
  public
    { public declarations }
    //Utilizadn leitura e escrita do prórpio Delphi
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write SetNome;
    property Cidade: String read FCidade Write FCidade;
    property UF: String read FUF Write FUF;
  end;

implementation

{ TCliente }

procedure TCliente.SetNome(const Value: String);
begin
  if  not Value.isEmpty then
    FNome := Value
  else
    raise Exception.Create('Nome não pode ser vazio.');
end;

end.
