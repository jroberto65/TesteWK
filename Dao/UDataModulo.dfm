object DataModulo: TDataModulo
  OnCreate = DataModuleCreate
  Height = 450
  Width = 871
  PixelsPerInch = 120
  object fdConexao: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 144
    Top = 128
  end
  object fdDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'libmysql.dll'
    Left = 316
    Top = 128
  end
  object fdWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 488
    Top = 128
  end
end
