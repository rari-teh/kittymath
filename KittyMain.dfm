object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'KittyMath'
  ClientHeight = 121
  ClientWidth = 270
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -15
  Font.Name = 'Artitype D'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object DecLabel: TLabel
    Left = 66
    Top = 16
    Width = 72
    Height = 15
    Alignment = taRightJustify
    Caption = 'Decimal:'
  end
  object DTLabel: TLabel
    Left = 12
    Top = 51
    Width = 126
    Height = 15
    Alignment = taRightJustify
    Caption = 'Duotrigesimal:'
  end
  object DecField: TEdit
    Left = 144
    Top = 13
    Width = 113
    Height = 23
    Alignment = taRightJustify
    Color = clWhite
    MaxLength = 10
    NumbersOnly = True
    TabOrder = 0
    Text = '0'
    OnKeyUp = DecFieldKeyUp
  end
  object DTField: TEdit
    Left = 144
    Top = 48
    Width = 113
    Height = 23
    Alignment = taRightJustify
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Artitype D'
    Font.Style = []
    MaxLength = 7
    ParentFont = False
    TabOrder = 1
    Text = #57344
    OnKeyUp = DTFieldKeyUp
  end
  object CopyBtn: TButton
    Left = 144
    Top = 83
    Width = 113
    Height = 25
    Caption = 'copy'
    Default = True
    TabOrder = 2
    OnClick = CopyBtnClick
  end
  object AboutBtn: TButton
    Left = 16
    Top = 83
    Width = 113
    Height = 25
    Caption = 'About'
    TabOrder = 3
    OnClick = AboutBtnClick
  end
end
