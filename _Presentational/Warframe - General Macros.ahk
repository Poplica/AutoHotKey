#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force

SendMode, Input

; slide attack spam
$e::
  While (GetKeyState("e","P")) {
    Send, {LCtrl down}
    Send, {e}
    Send, {LCtrl up}

    ; main
    ; Sleep, 10
    ; Sleep, 190 ; volt
    ; Sleep, 250 ; resource
    Sleep, 290 ; loctidra - 91%
    ; Sleep, 320 ; berserker
    ; Sleep, 350 ; fury

    ; alt
    ; Sleep, 370 ; berserker
    ; Sleep, 390 ; fury
  }
Return

; melee attack spam
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

; bleedout skip
$Insert::
  Click, L
  Send, {XButton1}
  Sleep, 500
  Send, {x down}
  Sleep, 1000
  ; Sleep, 1050 ; 100+ ping
  Send, {x up}
Return

; join on koto
^NumpadAdd::
  Send, t 
  Sleep, 100
  Send, /join koto{Enter}{Esc}
Return
; join on bash
^+NumpadAdd::
  Send, t 
  Sleep, 100
  Send, /join bash.{Enter}{Esc}
Return
; unstuck macro
^NumpadMult::
  Send, t
  Sleep, 100
  Send, /unstuck{Enter}{Esc}
Return

; susepnd script
^+e::
  Suspend, Toggle
Return

; reload script
^NumpadSub::
  Reload
Return
; pw macros
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

; abort mission macro
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

; auto energy pads for nova portals
*~$2::
	energy := energy - 13
	if (energy < 50) {
		Sleep, 500
		Send, {v}
		energy := energy + 100
	}
Return

; continuous reload animation with sonicor
x::
  Loop {
    Send, {LButton}
    Sleep, 1
    Sleep, 300
    Send, {r}
    Sleep, 3100
  }
Return
; reload rebind
z::
  Reload
Return

; energy pad rebind
$XButton1::
  Sleep, 5900
  Send, {XButton1}
Return
