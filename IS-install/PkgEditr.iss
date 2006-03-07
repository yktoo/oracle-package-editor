;****************************************************************
;  $Id: PkgEditr.iss,v 1.1 2006-03-07 05:35:48 dale Exp $
;****************************************************************
[Setup]
  MinVersion             = 4.0,4.0
  AppName                = PackageEditor
  AppVersion             = 3.01
  AppVerName             = PackageEditor v3.01
  AppCopyright           = Copyright ©1999-2006 DK Software
  AppPublisher           = DK Software
  AppPublisherURL        = http://devtools.narod.ru/
  AppSupportURL          = http://devtools.narod.ru/
  AppUpdatesURL          = http://devtools.narod.ru/
  AllowNoIcons           = yes
  ChangesAssociations    = yes
  DisableStartupPrompt   = yes
  DefaultDirName         = {pf}\DK Software\PackageEditor
  DefaultGroupName       = PackageEditor
  OutputDir              = .
  OutputBaseFilename     = pkged-setup-3.01
  VersionInfoVersion     = 3.1.0.285
  VersionInfoCompany     = DK Software
  VersionInfoDescription = PackageEditor Setup
  VersionInfoTextVersion = 3.01
  ; -- Compression
  SolidCompression       = yes
  Compression            = lzma

[Languages]
  Name: en; MessagesFile: compiler:Default.isl; LicenseFile: license.rtf;

[Tasks]
  Name: desktopicon;     Description: {cm:CreateDesktopIcon};                     GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
  Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon};                 GroupDescription: {cm:AdditionalIcons};
  Name: associate;       Description: {cm:AssocFileExtension,PackageEditor,.sql};

[Files]
;Application files
  Source: "..\PkgEditr.exe"; DestDir: "{app}"

[INI]
  Filename: "{app}\devtools.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://devtools.narod.ru/"

[Icons]
  Name: "{group}\PackageEditor";       Filename: "{app}\PkgEditr.exe";  Comment: "Oracle Executable Object development tool"
  Name: "{group}\devtools in the Web"; Filename: "{app}\devtools.url";  Comment: "devtools.narod.ru"
  Name: "{userdesktop}\PackageEditor"; Filename: "{app}\pkgeditr.exe"; Tasks: desktopicon; Comment: "Oracle Executable Object development tool"
  Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\PackageEditor"; Filename: "{app}\pkgeditr.exe"; Tasks: quicklaunchicon; Comment: "Oracle Executable Object development tool"

[Registry]
  Root: HKCR; Subkey: ".sql";                          ValueType: string; ValueData: "sql.script";                    Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: associate
  Root: HKCR; Subkey: "sql.script";                    ValueType: string; ValueData: "SQL Script File";               Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: associate
  Root: HKCR; Subkey: "sql.script\shell\open\command"; ValueType: string; ValueData: """{app}\pkgeditr.exe"" ""%1"""; Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: associate
  Root: HKCR; Subkey: "sql.script\DefaultIcon";        ValueType: string; ValueData: """{app}\pkgeditr.exe"",0";      Flags: uninsdeletevalue uninsdeletekeyifempty; Tasks: associate

[Run]
  Filename: "{app}\PkgEditr.exe"; Description: "Run PackageEditor"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
  Type: files;      Name: "{app}\devtools.url"
  Type: dirifempty; Name: "{app}"
  
