#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force

$CapsLock::
  ; toggle := !toggle
  While (GetKeyState("CapsLock","P")) {
  ; while (toggle) {
    Click, L
    Send, {XButton1}
    Sleep, 5
  }
Return

; $x::
;   Click, L
;   Send, {XButton1}
;   Sleep, 500
;   Send, {x down}
;   Sleep, 1000
;   Send, {x up}
; Return

$End::
  Loop {
    Send, {Space}{Space}
    Click, L
    Send, {XButton1}
    Sleep, 100
    Click, L
    Send, {XButton1}
    Sleep, 2000
  }
Return

~v::Reload
Return