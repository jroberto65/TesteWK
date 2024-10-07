unit UDataModulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Comp.UI, IniFiles, Vcl.Forms;

type
  TDataModulo = class(TDataModule)
    fdConexao: TFDConnection;
    fdDriverLink: TFDPhysMySQLDriverLink;
    fdWaitCursor: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    DataBase, User_name, Server, Port, Password, Biblioteca, Banco_Versao: String;
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModulo.DataModuleCreate(Sender: TObject);
var
  vArquivoINI: Tinifile;
begin
  vArquivoINI := Tinifile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
    DataBase := vArquivoINI.ReadString('banco', 'Database', EmptyStr);
    User_name := vArquivoINI.ReadString('banco', 'User_name', EmptyStr);
    Server := vArquivoINI.ReadString('banco', 'Server', EmptyStr);
    Port := vArquivoINI.ReadString('banco', 'Port', EmptyStr);
    Password := vArquivoINI.ReadString('banco', 'Password', EmptyStr);
    Biblioteca := vArquivoINI.ReadString('banco', 'Biblioteca', EmptyStr);
    Banco_Versao := vArquivoINI.ReadString('banco', 'Banco_Versao', EmptyStr);
    if Trim(DataBase) > '' then
    begin
      fdConexao.Params.Add('DataBase='+ DataBase);
      fdConexao.Params.Add('User_name='+ User_name);
      fdConexao.Params.Add('Password='+ Password);
      fdConexao.Params.Add('Server='+ Server);
      fdConexao.Params.Add('Port='+ Port);
      try
        fdConexao.Connected := True;
      except on E: Exception do
        //
      end;
    end;
  finally
    FreeAndNil(vArquivoINI);
  end;
end;

end.
