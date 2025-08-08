object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'KittyMath'
  ClientHeight = 137
  ClientWidth = 306
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
  TextHeight = 17
  object DecLabel: TLabel
    Left = 98
    Top = 18
    Width = 58
    Height = 17
    Alignment = taRightJustify
    Caption = 'Decimal:'
  end
  object DTLabel: TLabel
    Left = 62
    Top = 58
    Width = 94
    Height = 17
    Alignment = taRightJustify
    Caption = 'Duotrigesimal:'
  end
  object DecField: TEdit
    Left = 163
    Top = 15
    Width = 128
    Height = 25
    Alignment = taRightJustify
    Color = clWhite
    MaxLength = 10
    NumbersOnly = True
    TabOrder = 0
    Text = '0'
    OnKeyUp = DecFieldKeyUp
  end
  object DTField: TEdit
    Left = 163
    Top = 54
    Width = 128
    Height = 26
    Alignment = taRightJustify
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Artitype D'
    Font.Style = []
    MaxLength = 7
    ParentFont = False
    TabOrder = 1
    Text = #57344
    OnKeyUp = DTFieldKeyUp
  end
  object CopyBtn: TButton
    Left = 163
    Top = 94
    Width = 128
    Height = 28
    Caption = 'copy'
    Default = True
    TabOrder = 2
    OnClick = CopyBtnClick
  end
  object AboutBtn: TButton
    Left = 18
    Top = 94
    Width = 128
    Height = 28
    Caption = 'About'
    TabOrder = 3
    OnClick = AboutBtnClick
  end
end
