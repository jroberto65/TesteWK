unit UCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.Provider, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, uClienteController, UDataModuloCliente;

type
  TCadastroCliente = class(TForm)
    pnlCadastroCliente: TPanel;
    btngravar: TSpeedButton;
    btnexcluir: TSpeedButton;
    btnfechar: TSpeedButton;
    pgcCliente: TPageControl;
    Cadastro: TTabSheet;
    Consulta: TTabSheet;
    dbgCliente: TDBGrid;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    lblCodigo: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblNome: TLabel;
    edtnome: TDBEdit;
    edtcidade: TDBEdit;
    btnnovo: TSpeedButton;
    Label15: TLabel;
    edtNomeP: TDBEdit;
    edtcodigo: TDBEdit;
    dsPesquisaCliente: TDataSource;
    cbbUF: TDBComboBox;
    btnPesquisar: TButton;
    procedure btnfecharClick(Sender: TObject);
    procedure edtcodigoExit(Sender: TObject);
    procedure limpaObjetos;
    procedure pgcClienteEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btngravarClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure dbgClienteDblClick(Sender: TObject);
    procedure ConsultaRegistro(ARegistro: Integer);
    procedure FormShow(Sender: TObject);
    procedure dbgClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pesquisarCliente;
    procedure carregarCliente;
    procedure alterarCliente;
    procedure excluirCliente;
    procedure InserirCliente;
    procedure GravarCliente;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    vDataModuloCliente: TDataModuloCliente;
    registroNovo : Boolean;
    vclienteController : TClienteController;
  public
    { Public declarations }

  end;

var
  CadastroCliente: TCadastroCliente;

implementation

{$R *.dfm}

uses UDataModulo, uClienteModel;

procedure TCadastroCliente.edtcodigoExit(Sender: TObject);
begin
//  edtcodigo.Text := FormatFloat('000000', StrToIntDef(edtcodigo.Text, 0));
  ConsultaRegistro(StrToIntDef(edtcodigo.Text, 0));
end;

procedure TCadastroCliente.excluirCliente;
var
  vErro : string;
begin
  vErro := '';
  try
    if (dsPesquisaCliente.DataSet.Active) and (dsPesquisaCliente.DataSet.RecordCount > 0) then
    begin
      if Application.MessageBox('Confirma a exclus�o deste registro?',
                                'Aten��o', MB_YESNO + MB_ICONWARNING) = mrYes then
        if vClienteController.Excluir(dsPesquisaCliente.DataSet.FieldByName('Codigo').Value, vErro) = False then
          raise Exception.Create(vErro);
      vClienteController.pesquisarCliente(edtnome.Text);
    end else
    begin
      raise Exception.Create(vErro);
    end;
  finally
  end;
end;

procedure TCadastroCliente.FormCreate(Sender: TObject);
begin
  vclienteController := TClienteController.Create(dsPesquisaCliente);
end;

procedure TCadastroCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(vclienteController);
end;

procedure TCadastroCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TCadastroCliente.FormShow(Sender: TObject);
var
  vErro : string;
begin
  vclienteController.pesquisarCliente(edtnome.Text);
  if dsPesquisaCliente.DataSet.RecordCount > 0 then
    pgcCliente.TabIndex := 1
  else
    pgcCliente.TabIndex := 0
end;

procedure TCadastroCliente.GravarCliente;
begin
  try
    if registroNovo then
      InserirCliente
    else
      alterarCliente;
    vclienteController.pesquisarCliente;
    pgcCliente.TabIndex := 1;
  finally
  end;
end;

procedure TCadastroCliente.InserirCliente;
var
  vCliente : TCliente;
  vErro : string;
begin
  vCliente := TCliente.Create;
  vErro := '';
  try
    With vCliente do
    begin
      Nome := edtnome.Text;
      cidade := edtcidade.Text;
      UF := cbbUF.Text;
    end;
    if vclienteController.Inserir(vCliente, vErro) = False then
      raise Exception.Create(vErro);
  finally
    FreeAndNil(vCliente);
  end;
end;

procedure TCadastroCliente.carregarCliente;
var
  vCliente : TCliente;
begin
  vCliente := TCliente.Create;
  try
    With vCliente do
    begin
      vclienteController.CarregarCliente(vCliente, dsPesquisaCliente.DataSet.FieldByName('Codigo').Value);
      registroNovo := False;
    end;
  finally
    FreeAndNil(vCliente);
  end;
end;

procedure TCadastroCliente.dbgClienteDblClick(Sender: TObject);
begin
  pgcCliente.TabIndex := 0;
  edtcodigoExit(nil);
  edtnome.SetFocus;
end;

procedure TCadastroCliente.dbgClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    registroNovo := False;
    btnexcluirClick(Self);
  end;
end;

procedure TCadastroCliente.limpaObjetos;
begin
  dsPesquisaCliente.DataSet.Append;
  cbbUF.ItemIndex := 0;
  registroNovo := True;
end;

procedure TCadastroCliente.pgcClienteEnter(Sender: TObject);
begin
  if edtCodigo.CanFocus then
    edtcodigo.SetFocus;
end;

procedure TCadastroCliente.ConsultaRegistro(ARegistro: Integer);
begin
  if StrToInt(edtcodigo.Text) > 0 then
  begin
    carregarCliente;
    edtcodigo.Text := dsPesquisaCliente.DataSet.FieldByName('Codigo').Value;
  end;
end;

procedure TCadastroCliente.pesquisarCliente;
begin
  vClienteController.pesquisarCliente(edtnome.Text);
end;

procedure TCadastroCliente.btngravarClick(Sender: TObject);
begin
  GravarCliente;
end;

procedure TCadastroCliente.btnnovoClick(Sender: TObject);
begin
  limpaObjetos;
  registroNovo := True;
  pgcCliente.TabIndex := 0;
  edtnome.SetFocus;
end;

procedure TCadastroCliente.btnPesquisarClick(Sender: TObject);
begin
  pesquisarCliente;
end;

procedure TCadastroCliente.AlterarCliente;
var
  vCliente : TCliente;
  vErro : string;
begin
  vCliente := TCliente.Create;
  vErro := '';
  try
    With vCliente do
    begin
       Codigo := StrToIntDef(edtcodigo.Text, 0);
       Nome := Trim(edtnome.Text);
       Cidade := Trim(edtCidade.text);
       UF := cbbUF.Text;
    end;
    if vClienteController.Alterar(vCliente, vErro) = False then
      raise Exception.Create(vErro);
  finally
    FreeAndNil(vCliente);
  end;
end;

procedure TCadastroCliente.btnexcluirClick(Sender: TObject);
begin
  if (dsPesquisaCliente.DataSet.Active) and (dsPesquisaCliente.DataSet.RecordCount > 0) then
  begin
    excluirCliente;
    limpaObjetos;
    vclienteController.pesquisarCliente;
    pgcCliente.TabIndex := 1;
  end;
end;

procedure TCadastroCliente.btnfecharClick(Sender: TObject);
begin
  Close;
end;

end.
