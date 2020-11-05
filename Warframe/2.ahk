#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force
#MaxThreadsPerHotkey, 3

2::
	toggle := !toggle
	While (toggle) {
		Send, 2
		; Sleep, 225 ; nt sonar
	    Sleep, 250 ; no nt sonar
	    ; Sleep, 500
	    ; Sleep, 1000
	    ; Sleep, 10
	}
Return

; ~Esc::
;   Suspend, Permit
;   Exitapp 
; Return

NumpadSub::
  Reload
Return