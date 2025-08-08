program KittyMath;



uses
  Forms, Types, Windows,
  KittyMain in 'KittyMain.pas' {MainForm},
  KittyAbout in 'KittyAbout.pas' {AboutForm};

{$R *.res}

var
  ResHandle: THandle;
  ResPtr: Pointer;
  ResSize: DWORD;
  Fonts: DWORD;

begin
  ResHandle := FindResource(HInstance, 'ARTITYPED', 'TTF');
  if ResHandle <> 0 then
  begin
    ResSize := SizeofResource(HInstance, ResHandle);
    ResPtr := LockResource(LoadResource(HInstance, ResHandle));
    if ResPtr <> nil then
    begin
      AddFontMemResourceEx(ResPtr, ResSize, nil, @Fonts);
    end;
  end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'KittyMath';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
