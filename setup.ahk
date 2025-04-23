#SingleInstance Force
SetWorkingDir %A_ScriptDir%

; === Load Settings ===
IniRead, inGameSens, settings.ini, Settings, InGameSensitivity, 2.5
IniRead, mouseDPI, settings.ini, Settings, MouseDPI, 800
IniRead, windowsCursorSpeed, settings.ini, Settings, WindowsCursorSpeed, 10
IniRead, normalYawSpeed, settings.ini, Settings, NormalYawSpeed, 180
IniRead, slowYawSpeed, settings.ini, Settings, SlowYawSpeed, 90
IniRead, slowKey, settings.ini, Settings, SlowKey, LShift
IniRead, toggleKey, settings.ini, Settings, ToggleKey, LAlt
IniRead, leftBind, settings.ini, Settings, LeftBind, LButton
IniRead, rightBind, settings.ini, Settings, RightBind, RButton

; === GUI ===
Gui, +AlwaysOnTop
Gui, Font, s10

Gui, Add, Text,, In-Game Sensitivity (0.1 - 10.0):
Gui, Add, Edit, vInGameSensEdit w200, %inGameSens%

Gui, Add, Text,, Mouse Sensitivity (DPI) (1 - 5000):
Gui, Add, Edit, vMouseDPIEdit w200, %mouseDPI%

Gui, Add, Text,, Windows Cursor Speed (1 - 20):
Gui, Add, Edit, vWindowsCursorSpeed w200, %windowsCursorSpeed%

Gui, Add, Text,, Normal Yaw Speed (0 - 720):
Gui, Add, Edit, vNormalYawSpeedEdit w200, %normalYawSpeed%

Gui, Add, Text,, Slow Yaw Speed (0 - 720):
Gui, Add, Edit, vSlowYawSpeedEdit w200, %slowYawSpeed%

Gui, Add, Text,, Slow Key:
Gui, Add, Edit, vSlowKeyEdit w200, %slowKey%

Gui, Add, Text,, Toggle Key:
Gui, Add, Edit, vToggleKeyEdit w200, %toggleKey%

Gui, Add, Text,, Left Bind:
Gui, Add, Edit, vLeftBindEdit w200, %leftBind%

Gui, Add, Text,, Right Bind:
Gui, Add, Edit, vRightBindEdit w200, %rightBind%


; --- Hyperlink Section ---
Gui, Font, cDefault  ; Reset color/font
Gui, Add, Text,, You can find a list of key aliases
Gui, Font, cBlue underline
Gui, Add, Text, gOpenKeyListLink vLinkText, here
GuiControl, +Cursor, LinkText, Hand
Gui, Font  ; Reset font

Gui, Add, Button, gRunMainScript w100, Run

; --- Show GUI ---
Gui, Show, w300 h620, Turnbinds Settings
return

; --- Open Hyperlink ---
OpenKeyListLink:
    Run, https://www.autohotkey.com/docs/v1/KeyList.htm
return

; --- Button Click Handler ---
RunMainScript:
    Gui, Submit, NoHide

    ; Save settings
    IniWrite, %InGameSensEdit%, settings.ini, Settings, InGameSensitivity
    IniWrite, %MouseDPIEdit%, settings.ini, Settings, MouseDPI
    IniWrite, %WindowsCursorSpeed%, settings.ini, Settings, WindowsCursorSpeed
    IniWrite, %NormalYawSpeedEdit%, settings.ini, Settings, NormalYawSpeed
    IniWrite, %SlowYawSpeedEdit%, settings.ini, Settings, SlowYawSpeed
    IniWrite, %SlowKeyEdit%, settings.ini, Settings, SlowKey
    IniWrite, %ToggleKeyEdit%, settings.ini, Settings, ToggleKey
    IniWrite, %LeftBindEdit%, settings.ini, Settings, LeftBind
    IniWrite, %RightBindEdit%, settings.ini, Settings, RightBind

    Run, turnbinds.ahk
    GuiClose:
    ExitApp
return

