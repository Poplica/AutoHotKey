#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Auto Draconis Mons
; ^Insert::
;   sleepDuration := 100
;   numScroll := 1

;   MouseGetPos, currX, currY
;   Click, 2
;   Sleep, 10000
;   Send, f ; loot
;   Sleep, 10000
;   Send, {F12}
;   Sleep, sleepDuration
;   Click, 950, 600 ; char select
;   Sleep, 5000
;   Click, numScroll, 1385, 985 ; char scroll bar 
;   Sleep, sleepDuration
;   MouseMove, currX, currY
; Return

; Destroy moused item
; Delete::
;   MouseGetPos, currX, currY
;   MouseClick, Right
;   Sleep, 100
;   MouseMove, currX+40, currY+30
;   Sleep, 100
;   Click
;   MouseMove, 960, 590
;   Sleep, 100
;   Click
;   MouseMove, currX, currY
; Return

; Slb bugged pretraps
; X::
; x := 1020 ; trap 1 x pos

; Loop 3 {
;   Click, R, 1095, 1030 ; util key: e
;   Sleep, 200
;   Click, %x%, 970
;   Sleep, 200
;   Send, {e}
;   Sleep, 400  
;   Click, 83, 335 ; trait swap
;   Sleep, 50
;   Click, 83, 335 ; trait swap

;   Sleep, 700
;   Click, 555, 95 ; revert build
;   x += 45
; }
; Return