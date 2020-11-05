#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force
#MaxThreadsPerHotkey, 3

3::
  toggle := !toggle
  While (toggle) {
    Send, 3
    Sleep, 10
    ; Send, 4
    ; Sleep, 1800
    ; Send, 4
    ; Sleep, 1700 ; frost
  }
Return

; ~Esc::
;   Suspend, Permit
;   Exitapp 
; Return

NumpadSub::
Reload
Return