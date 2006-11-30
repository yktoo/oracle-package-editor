{****************************************************************
  $Id: PkgEditr.dpr,v 1.2 2006-11-30 10:30:41 dale Exp $
****************************************************************}
program PkgEditr;

uses
  Forms,
  ConsVarsTypes in 'ConsVarsTypes.pas',
  EdTS in 'EdTS.pas',
  Main in 'Main.pas' {fMain},
  udPreferences in 'udPreferences.pas' {dPreferences},
  udConnect in 'udConnect.pas' {dConnect},
  udAbout in 'udAbout.pas' {dAbout},
  udRetrieveObject in 'udRetrieveObject.pas' {dRetrieveObject},
  udConfirmReplace in 'udConfirmReplace.pas' {dConfirmReplace},
  udSearch in 'udSearch.pas' {dSearch},
  udKeyBinding in 'udKeyBinding.pas' {dKeyBinding},
  ufrConnect in 'ufrConnect.pas' {frConnect: TFrame};

{$R *.RES}

begin
  Application.Initialize;
  Application.HelpFile := 'PkgEd.hlp';
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.

