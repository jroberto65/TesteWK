unit URelatorioCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TRelatorioCliente = class(TForm)
    Panel1: TPanel;
    btnimprimir: TSpeedButton;
    btnfechar: TSpeedButton;
    GroupBox1: TGroupBox;
    edtcodigoI: TEdit;
    Label1: TLabel;
    edtCodigoF: TEdit;
    Label2: TLabel;
    zqryCli: TZQuery;
    zqryCliID: TIntegerField;
    zqryCliCODIGO: TIntegerField;
    zqryCliNOME: TWideStringField;
    zqryCliENDERECO: TWideStringField;
    zqryCliNUMERO: TIntegerField;
    zqryCliCEP: TWideStringField;
    zqryCliBAIRRO: TWideStringField;
    zqryCliCIDADE: TWideStringField;
    zqryCliESTADO: TWideStringField;
    zqryCliFONE: TWideStringField;
    zqryCliCELULAR: TWideStringField;
    zqryCliEMAIL: TWideStringField;
    zqryCliDATAINCLUSAO: TDateField;
    procedure edtcodigoIExit(Sender: TObject);
    procedure edtCodigoFExit(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelatorioCliente: TRelatorioCliente;

implementation

{$R *.dfm}

procedure TRelatorioCliente.btnfecharClick(Sender: TObject);
begin
  Close;
end;

procedure TRelatorioCliente.btnimprimirClick(Sender: TObject);
begin
  zqryCli.Close;
  zqryCli.SQL.Clear;
  zqryCli.SQL.Add('select * from clientes');
  zqryCli.SQL.Add('where codigo between :codigoi and :codigof');
  zqryCli.ParamByName('codigoi').AsInteger := StrToIntDef(edtcodigoI.Text, 0);
  zqryCli.ParamByName('codigof').AsInteger := StrToIntDef(edtcodigoF.Text, 0);
  {
  frxDBCliente.Open;
  try
    frxClientes.PrepareReport();
    frxClientes.ShowPreparedReport;
  finally
    frxDBCliente.Close;
  end;
  }
end;

procedure TRelatorioCliente.edtCodigoFExit(Sender: TObject);
begin
  edtcodigoF.Text := FormatFloat('000000', StrToIntDef(edtcodigoF.Text, 0));
  if StrToIntDef(edtcodigoF.Text, 0) < StrToIntDef(edtcodigoI.Text, 0) then
  begin
    Application.MessageBox('C�digo final menor que inicial, verifique!',
                           'Aten��o', MB_OK + MB_ICONWARNING);
    edtCodigoF.SetFocus;
  end;
end;

procedure TRelatorioCliente.edtcodigoIExit(Sender: TObject);
begin
  edtcodigoI.Text := FormatFloat('000000', StrToIntDef(edtcodigoI.Text, 0));
end;

procedure TRelatorioCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    perform(WM_NEXTDLGCTL,0,0);
  end;
end;

end.
