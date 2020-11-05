#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force
#MaxThreadsPerHotkey, 3

4::
  toggle := !toggle
  While (toggle) {
    Send, 4
    ; Sleep, 100
    Sleep, 10500 ; volt
    ; Send, {4 down}
    ; Sleep, 1700 ; hydroid nt
    ; Sleep, 10500 ; equinox
    ; Send, {4 up}
    ; Send, 4 ; equinox
    ; Sleep, 3000
    ; Sleep, 1000 ; equinox
  }
Return

; ~Esc::
;   Suspend, Permit
;   Exitapp 
; Return

NumpadSub::
  Reload
Return