�
 TCADASTROCLIENTE 0H  TPF0TCadastroClienteCadastroClienteLeft Top CaptionCadastro de clienteClientHeightwClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
KeyPreview	PositionpoScreenCenterOnCreate
FormCreate	OnDestroyFormDestroy
OnKeyPressFormKeyPressOnShowFormShow
TextHeight TPanelpnlCadastroClienteLeft TopNWidth�Height)AlignalBottomTabOrder ExplicitTopEExplicitWidth� TSpeedButton	btngravarLeft/Top	WidthAHeightCaption&GravarOnClickbtngravarClick  TSpeedButton
btnexcluirLeft�Top	WidthAHeightCaption&ExcluirOnClickbtnexcluirClick  TSpeedButton	btnfecharLeft�Top	WidthAHeightCaption&FecharOnClickbtnfecharClick  TSpeedButtonbtnnovoLeft� Top	WidthAHeightCaption&NovoOnClickbtnnovoClick   TPageControl
pgcClienteLeft Top Width�HeightN
ActivePageConsultaAlignalClientTabOrderOnEnterpgcClienteEnterExplicitWidth�ExplicitHeightE 	TTabSheetCadastroCaptionCadastroFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFont TLabel	lblCodigoLeftTopWidth!HeightCaption   Código  TLabel	lblCidadeLeftTopfWidth!HeightCaptionCidade  TLabel	lblEstadoLeft� TopfWidthHeightCaptionUF  TLabellblNomeLeftTop7WidthHeightCaptionNome  TDBEditedtnomeLeftTopJWidth�HeightCharCaseecUpperCase	DataFieldNOME
DataSourcedsPesquisaClienteTabOrder  TDBEdit	edtcidadeLeftTopyWidth� HeightCharCaseecUpperCase	DataFieldCIDADE
DataSourcedsPesquisaClienteTabOrder  TDBEdit	edtcodigoLeftTopWidthyHeight	DataFieldCODIGO
DataSourcedsPesquisaClienteTabOrder OnExitedtcodigoExit  TDBComboBoxcbbUFLeft� TopyWidth<Height	DataFieldUF
DataSourcedsPesquisaClienteItems.StringsACALAPAMBACEDFESGOMAMTMSMGPAPBPRPEPIRJRNRSRORRSCSPSETO TabOrder   	TTabSheetConsultaCaptionConsultaFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ImageIndex
ParentFont TLabelLabel7LeftTop`Width(HeightCaptionESTADOFocusControlDBEdit7  TLabelLabel8LeftTop�WidthHeightCaptionFONEFocusControlDBEdit8  TLabelLabel15LeftTop
WidthHeightCaptionNome  TDBGrid
dbgClienteLeft Top(Width�Height� Hint#Aperte delete para excluir registro
DataSourcedsPesquisaClienteOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExitdgTitleClickdgTitleHotTrack ParentShowHintShowHint	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameTahomaTitleFont.Style 
OnDblClickdbgClienteDblClick	OnKeyDowndbgClienteKeyDownColumnsExpanded	FieldNameCodigoVisible	 Expanded	FieldNameNomeWidth,Visible	 Expanded	FieldNameCidadeWidthVisible	 Expanded	FieldNameUFVisible	    TDBEditDBEdit6LeftTop@Width�Height	DataFieldCIDADETabOrder  TDBEditDBEdit7LeftToppWidthHeight	DataFieldESTADOTabOrder  TDBEditDBEdit8LeftTop�Width� Height	DataFieldFONETabOrder  TDBEditedtNomePLeft9TopWidth�HeightCharCaseecUpperCaseTabOrder   TButtonbtnPesquisarLeft�TopWidthKHeightCaption	PesquisarTabOrderOnClickbtnPesquisarClick    TDataSourcedsPesquisaClienteDataSet&DataModuloCliente.fdQryPesquisaClienteLeft�TopP   