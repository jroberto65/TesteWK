unit uFuncao;

interface

uses
   Classes, Windows, Forms, SysUtils, Dialogs, Math, Controls, Messages,
   Graphics, Menus, ToolWin, ComCtrls, ExtCtrls, ImgList, Db, DateUtils,
   WinSock, Mask, TypInfo, StdCtrls, DBGrids, StrUtils, Data.Win.ADODB,
   Datasnap.DBClient, system.json, REST.Types, REST.Client, xml.XMLDoc,
   Xml.xmldom, Xml.XMLIntf, IdBaseComponent, IdComponent, IdTCPConnection,
   IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
   IdSMTP, IdMessage, IdText, IdSSLOpenSSL, IdAttachmentFile;

type
   TOperation = (toInsert, toUpdate, toNone);

type
   TFuncoes = class
   public
       class function StrZero(Valor: string; Tamanho: Integer): string; overload;
       class function StrZero(Valor: Integer; Tamanho: Integer): string; overload;
       class function SoNumero(Valor: string): string;
       class function DataOk(Datas: String): Boolean;
       class function CpfOk(Cpf: string): Boolean;
       class function SoValor(Valor: string): string;
       class function SoAlfa(Nome, Caract: string): string;
       class function Stred(Valor: string; Tamanho: Integer): string;
       class function Stree(Valor: string; Tamanho: Integer): string;
       class function Strec(Valor: string; Tamanho: Integer): string;
       class function Strect(Valor: string; Tamanho: Integer): string;
       class function CnpjOk(ACnpj: string): Boolean;
       class function Repli(Valor: string; Tamanho: Integer): string;
       class function limpaTela(frmForm: tform) : string;
       class function BuscarCEPNoViaCEP(UmCEP: string): TStringList;
       class function ValidarEMail(aStr: string): Boolean;
       class function pesquisa(texto, numero: array of string; cds: TClientDataSet;
         linha: string; form : TForm) : string;
       class function enviarEmail(emailEnvia, emailEnviaPass, emailPara, emailCopia, emailAssunto,
         textoEmail, host, formulario: string; anexo: array of string; porta: Word):Boolean;
       class function confereCampos(campo :Tedit; nomeCampo: string; SomenteAviso, obrigatorio: Boolean): Boolean;
       class function BuscarDadsosCPFReceita(cpf: string): TStringList;

   end;

    var
       datastr : string;
       idade, nmeses, ndias : Word;

implementation

{ TFuncao }

class function TFuncoes.BuscarCEPNoViaCEP(UmCEP: string): TStringList;
var
  Retorno: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
  Endereco: TStringList;
begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + UmCEP + '/json';
  RESTRequest1.Execute;
  Retorno := RESTResponse1.JSONValue as TJSONObject;
  try
    if Assigned(Retorno) then
    begin
      Endereco := TStringList.Create;
      Endereco.Clear;
      if Retorno.Count >= 5 then
      begin
        try
          if Assigned(Retorno) then
          begin
            Endereco.Add(Retorno.Values['logradouro'].Value);
            Endereco.Add(Retorno.Values['bairro'].Value);
            Endereco.Add(Retorno.Values['uf'].Value);
            Endereco.Add(Retorno.Values['localidade'].Value);
            Endereco.Add(Retorno.Values['complemento'].Value);
          end;
        finally
          FreeAndNil(Retorno);
        end;
      end;
    end;
  except
    FreeAndNil(Retorno);
  end;
  Result := Endereco;
end;

class function TFuncoes.BuscarDadsosCPFReceita(cpf: string): TStringList;
var
  Retorno: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
  DadosRetorno: TStringList;
begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL := 'https://infosimples.com/consultas/receita-federal-cpf/' + CPF + '/json';
  RESTRequest1.Execute;
  Retorno := RESTResponse1.JSONValue as TJSONObject;
  try
    if Assigned(Retorno) then
    begin
      DadosRetorno := TStringList.Create;
      DadosRetorno.Clear;
      if Retorno.Count >= 5 then
      begin
        try
          if Assigned(Retorno) then
          begin
            DadosRetorno.Add(Retorno.Values['logradouro'].Value);
            DadosRetorno.Add(Retorno.Values['bairro'].Value);
            DadosRetorno.Add(Retorno.Values['uf'].Value);
            DadosRetorno.Add(Retorno.Values['localidade'].Value);
            DadosRetorno.Add(Retorno.Values['complemento'].Value);
          end;
        finally
          FreeAndNil(Retorno);
        end;
      end;
    end;
  except
    FreeAndNil(Retorno);
  end;
  Result := DadosRetorno;
end;

class function TFuncoes.CnpjOk(ACnpj: string): Boolean;
var
    cnpj: array[1..15] of integer;
    apoio: array[0..15] of integer;
    f: integer;//para uso no for
    total: integer;//para totalização dos valores
    D1: integer;//primeiro dígito calculado
    D2: integer;//segundo dígito calculado
begin
//Primeiro teste: o número de algarismos

    if (Length(ACnpj)<>14) then
        result:=false
    else
    begin
        for f := 1 to 14 do
        begin
            cnpj[f]:=strtoint(ACnpj[f]);
        end;

    end;

    apoio[0]:=6;//só será usada no cálculo do segundo dígito verificador
    apoio[1]:=5;
    apoio[2]:=4;
    apoio[3]:=3;
    apoio[4]:=2;
    apoio[5]:=9;
    apoio[6]:=8;
    apoio[7]:=7;
    apoio[8]:=6;
    apoio[9]:=5;
    apoio[10]:=4;
    apoio[11]:=3;
    apoio[12]:=2;

    //Começa cálculo do primeiro dígito verificador

    total:=0;//variável que conterá a soma da operação com os números

    for f := 1 to 12 do
    begin
        total:=total+(cnpj[f]*apoio[f]);
    end;

    D1 := total mod 11;
    if (D1<2) then
       D1:=0
    else
       D1:=11-D1;

    if (D1<>cnpj[13]) then
    begin
        //Primeiro dígito verificador não confere
        Result:=false;
    end else
    begin
        //Entrou aqui, então o primeiro dígito confere!
        total:=0;
        for f := 0 to 12 do
        begin
            total:=total+(cnpj[f+1]*apoio[f]);
        end;
        D2 :=total mod 11;
        if (D2<2) then
           D2:=0
        else
           D2:=11-D2;
        if (D2<>cnpj[14]) then
        begin
            //Segunod digito verificador não confere
            Result:=false;
        end else
            Result:=true;

    end;
end;

class function TFuncoes.confereCampos(campo: Tedit; nomeCampo: string;
  SomenteAviso, obrigatorio: Boolean): Boolean;
begin
  Result := True;
  if trim(campo.Text) = '' then
  begin
    if obrigatorio then
    begin
      Application.MessageBox(PChar('O campo ' + nomecampo + ' é obrigatório, verifique!'), 'Atenção',
                              MB_OK + MB_ICONWARNING);
      Result := False;
    end else
      Application.MessageBox(PChar('Falta digitar o campo ' + nomeCampo + ', verifique!'), 'Atenção',
                              MB_OK + MB_ICONWARNING);
  end;
end;

class function TFuncoes.CpfOk(Cpf: string): Boolean;
var
  cpfcalc: string;
  x1, x2, x3, x4, x5, x6, x7, x8, x9, x10: Integer;
  soma, digito, resto: Integer;
begin
  cpf := Trim(cpf);
  Result := True;
  //
  case AnsiIndexStr(cpf, ['11111111111', '22222222222', '33333333333', '44444444444', '55555555555',
    '66666666666', '77777777777', '88888888888', '99999999999', '00000000191',
      '00000000272', '00000000353', '00000000434', '00000000515', '00000000604']) of
    0..14: Result := False;
  end;
  if not Result then
    Exit;
  //
  cpfcalc := copy(cpf, 1, 9);
  x1 := StrToInt(cpfcalc[01]);
  x2 := StrToInt(cpfcalc[02]);
  x3 := StrToInt(cpfcalc[03]);
  x4 := StrToInt(cpfcalc[04]);
  x5 := StrToInt(cpfcalc[05]);
  x6 := StrToInt(cpfcalc[06]);
  x7 := StrToInt(cpfcalc[07]);
  x8 := StrToInt(cpfcalc[08]);
  x9 := StrToInt(cpfcalc[09]);

  soma := (x1 * 10) + (x2 * 09) + (x3 * 08) + (x4 * 07) + (x5 * 06)
    + (x6 * 05) + (x7 * 04) + (x8 * 03) + (x9 * 2);
  resto := soma mod 11;
  if 11 - resto >= 10 then
    digito := 0
  else
    digito := 11 - resto;
  cpfcalc := cpfcalc + copy(IntToStr(digito), 1, 1);
  x10 := digito;

  soma := (x1 * 11) + (x2 * 10) + (x3 * 09) + (x4 * 08) + (x5 * 07)
    + (x6 * 06) + (x7 * 05) + (x8 * 04) + (x9 * 3) + (x10 * 2);
  resto := soma mod 11;
  if 11 - resto >= 10 then
    digito := 0
  else
    digito := 11 - resto;
  cpfcalc := cpfcalc + copy(IntToStr(digito), 1, 1);
  x10 := digito;
  if cpf <> cpfcalc then
    Result := False
  else
    Result := True;
end;

class function TFuncoes.DataOk(Datas: String): Boolean;
var
  m_Dt : TDate;
begin
  Result := True;

  if Pos('/',Datas) > 0 then
    dataStr := Datas
  else
    dataStr := Copy(Datas,1,2) + '/' + Copy(Datas,3,2) + '/' + Copy(Datas,5,4);
  try
    m_Dt := StrToDate(dataStr);
  except
    Result := False;
  end;
end;

class function TFuncoes.enviarEmail(emailEnvia, emailEnviaPass, emailPara, emailCopia, emailAssunto,
  textoEmail, host, formulario: string; anexo: array of string; porta: Word): Boolean;
var
  servidor: TIdSMTP;
  messagem: TIdMessage;
  Texto: TIdText;
  SSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
  ind : Integer;
  // 'smtp.mail.yahoo.com'
  // 'smtp.gmail.com'
  // servidor.Port := 465;
  //  servidor.Username := 'emailparaenvio@gmail.com';
  //  servidor.Password := 'senhadoemailparaenvio';
begin
// instanciação dos objetos  de envio do email
  SSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create();
  servidor := TIdSMTP.Create();
  messagem := TIdMessage.Create();

  try
    Result := True;
    // Configuração do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
    SSLIOHandlerSocket.DefaultPort := porta;
    SSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    SSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configuração do servidor SMTP (TIdSMTP)
    servidor.IOHandler := SSLIOHandlerSocket;
    servidor.UseTLS := utUseImplicitTLS;
    servidor.AuthType := satNone;
    servidor.Port := porta;
    servidor.Host := host;
    servidor.Username := emailEnvia;
    servidor.Password := emailEnviaPass;

    // Configuração da mensagem (TIdMessage)
    messagem.From.Address := emailPara;
    messagem.From.Name := formulario;
    messagem.ReplyTo.EMailAddresses := emailCopia;
    messagem.Recipients.Add.Text := '';
    messagem.Subject := emailAssunto;
    messagem.Encoding := meMIME;

    // Configuração do corpo do email (TIdText)
    Texto := TIdText.Create(messagem.MessageParts);
    Texto.Body.Add(textoEmail);
    Texto.ContentType := 'text/plain; charset=iso-8859-1';

    // Opcional - Anexo da mensagem (TIdAttachmentFile)
    if trim(Anexo[Low(anexo)]) > '' then
    begin
      if High(anexo) > -1  then
      begin
        for ind := Low(anexo) to High(anexo) do
        begin
            if FileExists(Anexo[ind]) then
            begin
              TIdAttachmentFile.Create(messagem.MessageParts, Anexo[ind]);
            end;
          end;
        end;
    end;
    // Conexão e autenticação
    try
      servidor.Connect;
      servidor.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conexão ou autenticação: ' +
          E.Message, mtWarning, [mbOK], 0);
        Result := false;
        Exit;
      end;
    end;
    // Envio da mensagem
    try
      servidor.Send(messagem);
      ShowMessage('E-mail enviado com sucesso!');
    except
      On E:Exception do
      begin
        Result := false;
        ShowMessage('Erro ao enviar o E-mail, verifique!');      end;
    end;
  finally
    // desconecta do servidor
    servidor.Disconnect;
    // liberação da DLL
    UnLoadOpenSSLLibrary;
    // liberação dos objetos da memória
    FreeAndNil(messagem);
    FreeAndNil(SSLIOHandlerSocket);
    FreeAndNil(servidor);
  end;
end;

class function TFuncoes.limpaTela(frmForm: tform): string;
var
  i : integer;
begin
  for i := frmForm.ComponentCount -1 downto 0 do
  begin
    if (frmForm.Components[i] is TEdit) then
      (frmForm.Components[i] as TEdit).text := '';
    if (frmForm.Components[i] is TMaskEdit) then
      (frmForm.Components[i] as TMaskEdit).text := '';
    if (frmForm.Components[i] is TCheckBox) then
      (frmForm.Components[i] as TCheckBox).Checked := False;
    if (frmForm.Components[i] is TMemo) then
      (frmForm.Components[i] as TMemo).Text := '';
    if (frmForm.Components[i] is TMaskEdit) then
      (frmForm.Components[i] as TMaskEdit).Text := '';
    if (frmForm.Components[i] is TListBox) then
     (frmForm.Components[i] as TListBox).ItemIndex := -1;
    if (frmForm.Components[i] is TComboBox) then
     (frmForm.Components[i] as TComboBox).ItemIndex := -1;
end;
end;

class function TFuncoes.pesquisa(texto, numero: array of string;
  cds: TClientDataSet; linha: string; form :TForm): string;
begin
end;

class function TFuncoes.SoAlfa(Nome, Caract: string): string;
var
  i: SmallInt;
  x: string;
  y: string[1];
begin
  x := '';
  for i := 1 to Length(Trim(Nome)) do
  begin
    y := Copy(Nome, i, 1);
    if y <> Caract then
      x := x + y;
  end;
  Result := x;
end;

class function TFuncoes.SoNumero(Valor: string): string;
var
  Cont: Integer;
  x: string;
begin
    x := '';
    for cont := 1 to length(valor) do
        if valor[cont] in ['0'..'9'] then
           x := x + valor[cont];
  Result := x;
end;

class function TFuncoes.SoValor(Valor: string): string;
var
  cont: Integer;
  x: string;
begin
  x := '';
  for cont := 1 to length(valor) do
    if (valor[cont] in ['0'..'9']) or (valor[cont] = ',') then
      x := x + valor[cont];
  Result := x;
end;

class function TFuncoes.Strec(Valor: string; Tamanho: Integer): string;
begin
  if Length(Valor) > Tamanho then
    Valor := Copy(Valor, 1, Tamanho);
  Valor := Repli(' ', (Tamanho - Length(Valor)) div 2) + Valor +
    Repli(' ', (Tamanho - Length(Valor)) div 2) + Repli(' ', (Tamanho - Length(Valor)) mod 2);
  Result := Valor;
end;

class function TFuncoes.Strect(Valor: string; Tamanho: Integer): string;
begin
  if Length(Valor) > Tamanho then
    Valor := Copy(Valor, 1, Tamanho);
  Valor := Repli('-', (Tamanho - Length(Valor)) div 2) + Valor +
    Repli('-', (Tamanho - Length(Valor)) div 2) + Repli('-', (Tamanho - Length(Valor)) mod 2);
  Result := Valor;
end;

class function TFuncoes.Stred(Valor: string; Tamanho: Integer): string;
begin
  while length(valor) < Tamanho do
    Valor := Valor + ' ';
  if Length(Valor) > Tamanho then
    Valor := Copy(Valor, 1, Tamanho);
  Result := Valor;
end;

class function TFuncoes.Stree(Valor: string; Tamanho: Integer): string;
begin
  while length(valor) < Tamanho do
    Valor := ' ' + Valor;
  if Length(Valor) > Tamanho then
    Valor := Copy(Valor, 1, Tamanho);
  if Trim(Valor) = '0' then
    Valor := Repli(' ', Length(Valor));
  Result := Valor;
end;

class function TFuncoes.StrZero(Valor, Tamanho: Integer): string;
begin
  result := StrZero(inttostr(valor), Tamanho);
end;

class function TFuncoes.ValidarEMail(aStr: string): Boolean;
begin
 aStr := Trim(UpperCase(aStr));
 if Pos('@', aStr) > 1 then
 begin
   Delete(aStr, 1, pos('@', aStr));
   Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
 end
 else
   Result := False;
end;

class function TFuncoes.StrZero(Valor: string; Tamanho: Integer): string;
begin
    while length(valor) < Tamanho do
          valor := '0' + valor;
    Result := valor;
end;

class function TFuncoes.Repli(Valor: string; Tamanho: Integer): string;
var
  quantus: smallint;
  estring: string;
begin
  quantus := 0;
  estring := '';
  while quantus < Tamanho do
  begin
    estring := estring + Valor;
    Inc(quantus);
  end;
  Result := estring;
end;

end.
