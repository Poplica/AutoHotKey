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