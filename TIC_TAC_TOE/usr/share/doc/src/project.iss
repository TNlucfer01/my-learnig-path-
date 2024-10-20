[Setup]
AppName=My Tic-Tac-Toe Game
AppVerName=My Tic-Tac-Toe Game Version 1.0  ; User-friendly version name
AppVersion=1.0
DefaultDirName={pf}\MyTicTacToeGame
DefaultGroupName=Tic-Tac-Toe Game
OutputDir=userdocs:Inno Setup Output
OutputBaseFilename=TicTacToeInstaller



[Files]
Source: "Z:/home/darkemperor/aathi/my-learnig-path-/TIC_TAC_TOE/usr/share/doc/src/a.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "Z:/home/darkemperor/aathi/my-learnig-path-/TIC_TAC_TOE/usr/share/doc/src/SDL2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Z:/home/darkemperor/aathi/my-learnig-path-/TIC_TAC_TOE/usr/share/doc/assets\*"; DestDir: "{app}\resources"; Flags: ignoreversion recursesubdirs
Source: "Z:/home/darkemperor/aathi/my-learnig-path-/TIC_TAC_TOE/usr/share/icons/hicolor/app.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Tic-Tac-Toe Game"; Filename: "{app}\a.exe"; IconFilename: "{app}\app.ico"

[Run]
Filename: "{app}\a.exe"; Description: "Launch Tic-Tac-Toe Game"; Flags: nowait postinstall skipifsilent

