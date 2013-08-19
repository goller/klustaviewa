; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "KlustaViewa"
#define MyAppVersion "0.2.0dev"
#define MyAppPublisher "Klusta-Team"
#define MyAppURL "https://github.com/klusta-team/klustaviewa"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{E271F842-D4CF-4D8D-8421-EEEFB8347E98}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
SetupIconFile=D:\Git\klustaviewa\klustaviewa\icons\favicon.ico
Compression=zip
WizardImageFile=wizard.bmp
WizardImageStretch=no
WizardSmallImageFile=wizard-small.bmp
WizardImageBackColor=$ffffff
OutputBaseFilename=klustaviewa-setup
OutputDir=.
ChangesAssociations=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "D:\Git\klustaviewa\dev\wininstaller\KlustaViewa\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
; KlustaViewa
Name: "{group}\KlustaViewa"; Filename: "{app}\WinPython-64bit-2.7.5.2\python-2.7.5.amd64\Scripts\klustaviewa.exe"; WorkingDir: "{userdocs}"; IconFilename: "{app}\favicon.ico"
Name: "{userdesktop}\KlustaViewa"; Filename: "{app}\WinPython-64bit-2.7.5.2\python-2.7.5.amd64\Scripts\klustaviewa.exe"; WorkingDir: "{userdocs}"; IconFilename: "{app}\favicon.ico"

; KwikSkope
Name: "{group}\KwikSkope"; Filename: "{app}\WinPython-64bit-2.7.5.2\python-2.7.5.amd64\Scripts\kwikskope.exe"; WorkingDir: "{userdocs}"; IconFilename: "{app}\favicon.ico"
Name: "{userdesktop}\KwikSkope"; Filename: "{app}\WinPython-64bit-2.7.5.2\python-2.7.5.amd64\Scripts\kwikskope.exe"; WorkingDir: "{userdocs}"; IconFilename: "{app}\favicon.ico"

; Update and Uninstall
Name: "{group}\Update KlustaViewa"; Filename: "{app}\WinPython-64bit-2.7.5.2\python-2.7.5.amd64\python.exe"; WorkingDir: "{app}"; Parameters: """{app}\tools\update.py""";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\WinPython-64bit-2.7.5.2\python-2.7.5.amd64\python.exe"; WorkingDir: "{app}"; Parameters: """{app}\tools\update.py"""; Flags: runhidden

[Dirs]
Name: "{app}\"; Permissions: everyone-modify

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\WinPython-64bit-2.7.5.2\python-2.7.5.amd64\Scripts"; Check: NeedsAddPath('{app}\WinPython-64bit-2.7.5.2\python-2.7.5.amd64\Scripts')
Root: HKCR; Subkey: ".kwik"; ValueType: string; ValueName: ""; ValueData: "Kwik spike file"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "KlustaViewa"; ValueType: string; ValueName: ""; ValueData: "KlustaViewa"; Flags: uninsdeletekey
Root: HKCR; Subkey: "KlustaViewa\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\favicon.ico"
Root: HKCR; Subkey: "KlustaViewa\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\WinPython-64bit-2.7.5.2\python-2.7.5.amd64\Scripts\klustaviewa.exe"" ""%1"""

[Code]
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  // look for the path with leading and trailing semicolon
  // Pos() returns 0 if not found
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end; 