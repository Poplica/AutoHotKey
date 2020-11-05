#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force
#MaxThreadsPerHotkey, 3

y::
	toggle := !toggle
	While (toggle) {
		Send, y
	    Sleep, 2000
	}
Return

; ~Esc::
;   Suspend, Permit
;   Exitapp 
; Return

NumpadSub::
  Reload
Return