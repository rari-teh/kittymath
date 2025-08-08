unit KittyMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, KittyAbout, Clipbrd, Math;

type
  TMainForm = class(TForm)
    DecLabel: TLabel;
    DTLabel: TLabel;
    DecField: TEdit;
    DTField: TEdit;
    CopyBtn: TButton;
    AboutBtn: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AboutBtnClick(Sender: TObject);
    procedure CopyBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DecFieldKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    procedure DTFieldKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  AboutForm: TAboutForm;
  Slate: array[0..7] of integer;
  Decimal: integer;
  Buffer: integer;
  i: integer;
  t: integer;
  Trunk: string;

implementation

{$R *.dfm}
{$R ArtitypeD.RES}

function ZeroKil(Mode: Byte; Number: UnicodeString): UnicodeString;
var
  position: Byte;
begin
  Trunk := Number;
  if Mode = 10 then
  begin
  for position := 1 to Length(Trunk) do
       if Trunk[position] <> '0' then
          break
  end
  else if Mode = 32 then
  begin
  for position := 1 to Length(Trunk) do
       if Trunk[position] <> Char($E000) then
          break
  end
  else
    Exit('Error');
  Trunk := Copy(Trunk, position, Length(Trunk) - position + 1);
  if Trunk = '' then
    begin
     if Mode = 10 then
        Exit('0');
     Exit(Char($E000));
    end;
  Exit(Trunk);
end;

procedure TMainForm.AboutBtnClick(Sender: TObject);
begin
    with TAboutForm.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TMainForm.CopyBtnClick(Sender: TObject);
begin
  Clipboard.AsText := DTField.Text;
end;

procedure TMainForm.DecFieldKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
DecField.Text := ZeroKil(10, DecField.Text);
if DecField.Text = '0' then
  DTField.Text := Char($E000)
else if DecField.Text = '' then
  DTField.Text := ''
else
  begin
    try
    Decimal := StrToInt(DecField.Text);
    i := 7;
    while i <> (-1) do
      begin
        Slate[i - 1] := 0;
        i := i - 1;
      end;
    while Decimal <> 0 do
      begin
        i := i + 1;
        Slate[i] := Decimal mod 32;
        Decimal := (Decimal - Slate[i]) div 32;
      end;
    DTField.Text := '';
    while i <> (-1) do
      begin
        DTField.Text := DTField.Text + Char($E000 + Slate[i]);
        i := i - 1;
      end;
    except
    on E: EConvertError do
          DTField.Text := 'overflow'
    end;
  end;
end;

procedure TMainForm.DTFieldKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
DTField.Text := ZeroKil(32, DTField.Text);
if DTField.Text = Char($E000) then
     DecField.Text := '0'
else if DTField.Text = '' then
     DecField.Text := ''
else
  begin
    try
        t := Length(DTField.Text);
        Buffer := 0;
        while t <> 0 do
        begin
             if (Ord(Copy(DTField.Text, t, 1)[1]) < $E000) or (Ord(Copy(DTField.Text, t, 1)[1]) > $E01F) then
                 raise Exception.Create('NaN');
             Buffer := Buffer + (Ord(Copy(DTField.Text, t, 1)[1]) - $E000) * Trunc(IntPower(32, (Length(DTField.Text) - t)));
             t := t - 1;
        end;
        DecField.Text := IntToStr(Buffer);
    except
       on E: Exception do
        DecField.Text := 'data error'
    end;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Left:=(Screen.Width-Width)  div 2;
  Top:=(Screen.Height-Height) div 2;
end;
end.
