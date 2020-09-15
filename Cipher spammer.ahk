#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force
#MaxThreadsPerHotkey, 10

SendMode, Input

global energy := 200

$CapsLock::
  While (GetKeyState("CapsLock","P")) {
    ; Send, {x}{y}{XButton1}
    ; Sleep, 1
    Send, {Space}
    Sleep, 10
  }
Return

; $`::
;   Send, {v}{F1}{F2}{F4}{4}
;   ; Send, {v}{F4}{4}
;   ; Send, {v}{F1}{F2}{4}
;   ; Send, {F4}{v}{4}
;   ; Send, {v}{2} ; volt
;   ; Send, {F4}{v}{F1}{F2}{F3}{4}
;   ; Sleep, 50
;   ; Send, {F3}
;   ; Send, {Numpad4}
; Return

; $XButton2::
;   While (GetKeyState("XButton2","P")) {
;     Send, {x}{y}{XButton1}
;     Sleep, 1
;   }
; Return

6::
	energy := 200
	BlockInput, MouseMove
	Send, {Esc}
	Sleep, 200
	Click, 400, 725
	Sleep, 700
	Send, {Enter}
	Sleep, 250
	Send, {Enter}
	BlockInput, MouseMoveOff
Return

; auto pad for portals, 12.5e/6portals deficit
; *~$3::
;     ; Send, {3}
;     energy := energy - 19
;   if (energy < 50) {
;     Sleep, 500
;     Send, {v}
;     energy := energy + 100
;   }
; Return

; *~$4::
; 	energy := energy - 25
; 	if (energy < 50) {
; 		Sleep, 1000
; 		Send, {v}
; 		energy := energy + 100
; 	}
; Return

; $CapsLock::
;   ; toggle := !toggle
;   While (GetKeyState("CapsLock","P")) {
;   ; while (toggle) {
;     Click, L
;     Send, {XButton1}
;     Sleep, 5
;   }
; Return

; $z::
;   SendInput x
;   Sleep, (140+130)
;   Send, {Space}
;   Sleep, 100
;   Send, {Space}
;   Sleep, 390
;   Send, {Space}
;   Sleep, 90
;   Send, {Space}
;   Sleep, 350
;   Send, {Space}
;   Sleep, 90
;   Send, {Space}
;   Sleep, 250
;   Send, {Space}
;   Sleep, 60
;   Send, {Space}
; Return

NumpadSub::
Reload
Return
