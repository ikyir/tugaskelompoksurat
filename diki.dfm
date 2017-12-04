object keluar: Tkeluar
  Left = 542
  Top = 39
  Width = 683
  Height = 677
  Caption = 'Surat Dinas Keluar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 48
    Width = 241
    Height = 585
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 0
      Width = 46
      Height = 13
      Caption = 'No. Surat'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Dikirim Ke'
    end
    object Edit1: TEdit
      Left = 16
      Top = 16
      Width = 185
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 16
      Top = 64
      Width = 185
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 49
    Color = clWhite
    TabOrder = 1
    object Label5: TLabel
      Left = 216
      Top = 8
      Width = 196
      Height = 25
      Caption = 'Surat Dinas Keluar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnl2: TPanel
    Left = 240
    Top = 48
    Width = 425
    Height = 585
    Color = clWhite
    TabOrder = 2
    object dbgrd1: TDBGrid
      Left = 16
      Top = 0
      Width = 361
      Height = 137
      DataSource = DataModule1.ds1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object btn1: TButton
      Left = 14
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Scan'
      TabOrder = 1
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 110
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Lihat Hasil'
      TabOrder = 2
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 206
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 3
      OnClick = btn3Click
    end
    object pnl1: TPanel
      Left = 16
      Top = 168
      Width = 361
      Height = 401
      Color = clBtnHighlight
      TabOrder = 4
      object lbl1: TLabel
        Left = 158
        Top = 380
        Width = 43
        Height = 13
        Caption = 'FileName'
      end
      object img1: TImage
        Left = 1
        Top = 1
        Width = 359
        Height = 399
        Align = alClient
      end
    end
  end
  object DelphiTwain1: TDelphiTwain
    OnTwainAcquire = DelphiTwain1TwainAcquire
    TransferMode = ttmMemory
    SourceCount = 0
    Info.MajorVersion = 1
    Info.MinorVersion = 0
    Info.Language = tlUserLocale
    Info.CountryCode = 1
    Info.Groups = [tgControl, tgImage]
    Info.VersionInfo = 'Application name'
    Info.Manufacturer = 'Application manufacturer'
    Info.ProductFamily = 'App product family'
    Info.ProductName = 'App product name'
    LibraryLoaded = True
    SourceManagerLoaded = False
    Left = 64
    Top = 192
  end
end
