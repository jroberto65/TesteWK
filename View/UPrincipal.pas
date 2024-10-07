unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, IniFiles;

type
  TfrmPrincipal = class(TForm)
    mmMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Relatrios1: TMenuItem;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    Cliente1: TMenuItem;
    Clientes1: TMenuItem;
    pnlPrincipal: TPanel;
    lblEmpresa: TLabel;
    lblUsuarioLogado: TLabel;
    Vendas1: TMenuItem;
    Pedidos1: TMenuItem;
    ImageIcons: TImageList;
    procedure Sair1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UCadastroCliente, UDataModulo, UDataModuloCliente, UPedidoVendas;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  CadastroCliente := TCadastroCliente.Create(Self);
  CadastroCliente.ShowModal;
end;

procedure TfrmPrincipal.Pedidos1Click(Sender: TObject);
begin
  PedidoVendas := TPedidoVendas.Create(Self);
  PedidoVendas.ShowModal;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
  Close;
end;

end.
