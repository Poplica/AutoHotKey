#SingleInstance force
#MaxThreadsPerHotkey 3
SetKeyDelay -1

global title := "Warframe"
WinActivate %title%

~3::
	if WinActive(title) {
		loop 8 {
			send 3
			sleep 100
		}
	}
return

; Esc::
; suspend permit
;    Exitapp 