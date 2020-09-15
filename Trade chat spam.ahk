; ----- Have the trade tab selected -----
#NoEnv
#SingleInstance, Force
; SetKeyDelay, 50

interval := 121000
; message := "WTS "
message := "WTS [Lanka Satiata] 2.5k [Tiberon Acricron] 3k [Lato Zeti-visicron] 2k"
; message := "WTS [Lanka Satiata] 2.5k [Tiberon Acricron] 3k [Tiberon Crita-visidex] 2.5k [Lato Zeti-visicron] 2.5k"
; [Tiberon Crita-visidex] 3k

; Scroll lock: starts the script
ScrollLock::
    global
    Loop {
        BlockInput On
        IfWinNotActive, Warframe 
            MouseGetPos, _mouseX, _mouseY, _winID
        WinActivate, Warframe
        Sleep 300

        Click 150, 150 ; make sure this isnt actually clicking anything ingame. (0,0) is top left of window
        Sleep 200
        Send t
        Sleep 100
        SendInput %message%{Enter}
        Sleep 300
        Send {Esc}
        Click 150, 150

        WinActivate, ahk_id %_winID%
        Mousemove, _mouseX, _mouseY, 0
        BlockInput Off
        Sleep interval
    }
Return

; Pause: reloads the script
Pause::Reload
Return
