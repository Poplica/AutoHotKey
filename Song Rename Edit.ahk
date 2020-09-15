#SingleInstance, Force
#MaxThreadsPerHotkey, 3

;SetKeyDelay, 200

; Insert	 : front file rename
; Shift	     : end file rename
; Ctrl		 : remove tags
; Ctrl+Shift : remove tags, name album, and fill in title

numRArrows := 3
numSongs := 4

Ins::
	Send, {Tab}
	;Sleep, 200
	Send, {Right}
	;Sleep, 200
	Send, {Enter}
	;Sleep, 200
	Send, {Home}
	;Sleep, 200
	loop %numSongs% {
		Send, {F2}
		;Sleep, 200
		Send, {Home}
		Send, {Shift down}
		loop %numRArrows% {
			Send, {Right}
			;Sleep, 200
		}
		;Sleep, 200
		Send, {Shift up}
		Send, {Backspace}
		Send, ^v
		Send, {Enter}
		;Sleep, 200
		Send, {Down}
		;Sleep, 200
	}
Return

+Ins::
	Keywait, Shift
	loop %numSongs% {
		Send, {F2}
		;Sleep, 200
		Send, {Right}
		Send, ^V
		Send, {Enter}
		;Sleep, 200
		Send, {Down}
		;Sleep, 200
	}
Return

^Ins::
	Keywait, Ctrl
	;Send, {Ctrl down}{Shift down}Z
	;Send, {Ctrl up}{Shift up}
	Send, ^+z
	Sleep, 1000
	
	;Send, {Shift down}{Tab}{Shift up}{Left}
	Send, +{Tab}
	Send, {Left}
	Sleep, 500
	
	loop 2 
		Send, {Tab}
	Send, T
	loop 2 
		Send, {Up}
	Send, {Enter}{Left}{Enter}
	Sleep, 6000
	Send, O
Return

+^Ins::
	Keywait, Ctrl
	Keywait, Shift
	;Send, {Ctrl down}{Shift down}Z
	;Send, {Ctrl up}{Shift up}
	Send, ^+z
	Sleep, 1000
	
	;Send, {Shift down}{Tab}{Shift up}{Left}
	Send, +{Tab}
	Send, {Left}
	Sleep, 500
	
	loop 2 
		Send, {Tab}
	Send, T
	loop 2 
		Send, {Up}
	Send, {Enter}{Left}{Enter}
	Sleep, 6000
	
	;Send, {Shift down}{Tab}{Shift up}
	Send, +{Up}
	Sleep, 500
	
	loop 3 
		Send, {Down}
	Sleep, 500
	
	Send, {F2}
	;Send, {Shift down}Q{Shift up}
	Send, +q
	Send, {Enter}
	Send, {Esc}
	Sleep, 500
	
	Send, {Tab}
	Send, T
	Send, F
	Sleep, 500
	
	loop 2 
		Send, {Down}
	loop 3 
		Send, {Tab}
	Sleep, 500
	
	;Send, {Shift down}{5}{Shift up}
	Send, +5
	Send, title
	;Send, {Shift down}{5}{Shift up}
	Send, +5
	;Send, {Tab}
	Send, {Tab}{Enter}O
	;Send, {Enter}
	;Send, O
Return

~Esc::
	Reload 
Return
