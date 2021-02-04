#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force

SendMode, Input

; $e::
;   While (GetKeyState("e","P")) {
;     Send, {LCtrl down}
;     Send, {e}
;     Send, {LCtrl up}

;     ; main
;     ; Sleep, 10
;     ; Sleep, 190 ; volt
;     ; Sleep, 250 ; resource
;     Sleep, 290 ; loctidra - 91%
;     ; Sleep, 320 ; berserker
;     ; Sleep, 350 ; fury

;     ; alt
;     ; Sleep, 370 ; berserker
;     ; Sleep, 390 ; fury
;   }
; Return

$e::
  While (GetKeyState("e","P")) {
    Send, {e}

    ; main
    ; Sleep, 10
    Sleep, 190 ; volt
    ; Sleep, 250 ; resource
    ; Sleep, 290 ; loctidra - 91%
    ; Sleep, 320 ; berserker
    ; Sleep, 350 ; fury

    ; alt
    ; Sleep, 370 ; berserker
    ; Sleep, 390 ; fury
  }
Return

$Insert::
  Click, L
  Send, {XButton1}
  Sleep, 500
  Send, {x down}
  Sleep, 1000
  ; Sleep, 1050 ; 100+ ping
  Send, {x up}
Return

^NumpadAdd::
  Send, t 
  Sleep, 100
  Send, /join koto{Enter}{Esc}
Return
^+NumpadAdd::
  Send, t 
  Sleep, 100
  Send, /join bash.{Enter}{Esc}
Return
^NumpadMult::
  Send, t
  Sleep, 100
  Send, /unstuck{Enter}{Esc}
Return

^+e::
  Suspend, Toggle
Return

^NumpadSub::
  Reload
Return

^Numpad7::
  Send, Qweqwe22{!}
  KeyWait, Ctrl
  Send, {Enter}
Return
^Numpad8::
  Send, p4sswarframe
  KeyWait, Ctrl
  Send, {Enter}
Return
^Numpad9::
  Send, qweqwe22
  KeyWait, Ctrl
  Send, {Enter}
Return

6::
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

; *~$2::
; 	energy := energy - 13
; 	if (energy < 50) {
; 		Sleep, 500
; 		Send, {v}
; 		energy := energy + 100
; 	}
; Return

; continuous reload animation with sonicor
; x::
;   Loop {
;     Send, {LButton}
;     Sleep, 1
;     ; Sleep, 300
;     ; Send, {r}
;     ; Sleep, 3100
;   }
; Return
; z::
;   Reload
; Return

; $XButton1::
;   Sleep, 5900
;   Send, {XButton1}
; Return