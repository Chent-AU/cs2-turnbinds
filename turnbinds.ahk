#SingleInstance Force
SetWorkingDir %A_ScriptDir%
#Persistent
SetBatchLines -1

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
IniRead, tickRate, settings.ini, Settings, TickRate, 128
IniRead, cS2Scale, settings.ini, Settings, CS2Scale, 2.3528
IniRead, forceWindowTitle, settings.ini, Settings, ForceWindowTitle, 1
IniRead, windowTitle, settings.ini, Settings, WindowTitle, "Counter-Strike 2"

; === Calculate mouse delta per tick ===
tickInterval := 1000 / tickRate
normalMouseDelta := ((cS2Scale * windowsCursorSpeed * mouseDPI * inGameSens * normalYawSpeed * tickInterval / 1000) / 360)
slowMouseDelta := ((cS2Scale * windowsCursorSpeed * mouseDPI * inGameSens * slowYawSpeed * tickInterval / 1000) / 360)
mouseDelta := normalMouseDelta

; === State flags ===
movementEnabled := false
movingLeft := false
movingRight := false

; === Timer for mouse movement ===
SetTimer, MouseMoveTick, %tickInterval%

; === Register hotkeys dynamically ===
Hotkey, ~*%leftBind%, StartMoveLeft
Hotkey, ~*%leftBind% up, StopMoveLeft
Hotkey, ~*%rightBind%, StartMoveRight
Hotkey, ~*%rightBind% up, StopMoveRight
Hotkey, ~*%toggleKey%, ToggleMovement
Hotkey, ~*%slowKey%, StartSlowSpeed
Hotkey, ~*%slowKey% up, StopSlowSpeed

return

; === Handlers ===
StartMoveLeft:
    if (movementEnabled)
        movingLeft := true
return

StopMoveLeft:
    movingLeft := false
return

StartMoveRight:
    if (movementEnabled)
        movingRight := true
return

StopMoveRight:
    movingRight := false
return

ToggleMovement:
    movementEnabled := !movementEnabled
    status := movementEnabled ? "ENABLED" : "DISABLED"
    ToolTip, Turnbinds %status%
    SetTimer, HideTooltip, -1000
return

StartSlowSpeed:
    mouseDelta := slowMouseDelta
return

StopSlowSpeed:
    mouseDelta := normalMouseDelta
return

HideTooltip:
    ToolTip
return

CheckWindowTitle() {
    global windowTitle
    WinGetTitle, currentWindowTitle, A
    
    if InStr(currentWindowTitle, windowTitle)
    {
        return 1
    }
    else
    {
        return 0
    }
}

MouseMoveTick:
    if (!movementEnabled)
        return

    if (forceWindowTitle)
        if (!CheckWindowTitle())
            return

    if (movingLeft && !movingRight)
        DllCall("mouse_event", "UInt", 0x0001, "Int", -mouseDelta, "Int", 0, "UInt", 0, "Ptr", 0)
    else if (movingRight && !movingLeft)
        DllCall("mouse_event", "UInt", 0x0001, "Int", mouseDelta, "Int", 0, "UInt", 0, "Ptr", 0)
return
