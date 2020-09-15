#SingleInstance, Force
#MaxThreadsPerHotkey, 3

SetControlDelay, 0
; bring front and mid: ctrl + shift + left
; toggle suspend on scripts:: ctrl + shift + down / ScrollLock
; add timer that toggles a variable for checking if stage 12 is still running
; ctrl + pgup: exploration

global winName := "BlueStacks App Player"
global colorPopo1 := 0x231607
global colorPopo2 := 0x241E0F

global xSpam := 845
global ySpam := 535

global xStage := 360
global yStage := 460
global xTown := 785
global xConfirm := 540
global yConfirm := 425

global yQuest1 := 175

global xPopo := 932
global yPopo := 393

defaultSettings()

~XButton2::
	if WinActive(winName) 
		toggle := !toggle
	while toggle {
		WinMove, % winName,, -xPopo, 0 ; corner
		clickPos(xStage, yStage, 10) ; stage; 14

		color := getColor(xPopo, yPopo) ; popo
		
		if ((color == colorPopo1 or color == colorPopo2) and toggle) { 
			defaultSettings()
			clickPos(895, 100) ; close dungeon window
			MsgBox, 4,, Popo is here
			IfMsgBox, Yes
				WinActivate, % winName
			WinMove, % winName,, 380, 0 ; bring front and mid
			toggle := false
		} 
		else if toggle {
			clickPos(xSpam, ySpam, 3) ; dungeon ready button; 2.5
			if (countQuiz++ == 2) {
				color := getColor(xPopo, yPopo) ; dungeon enter screen
				if ((color != 0x373628) and toggle) {
					toggle := false
					Msgbox, Quiz
					WinMove, % winName,, 380, 0
					WinActivate, % winName
					break
				}
			}
			clickPos(xSpam, ySpam, 55) 
			clickPos(xConfirm, yConfirm, 4) ; confirm button
			clickPos(xConfirm, yConfirm) 
		}
    }
Return

getColor(x, y) {
	WinGetActiveTitle, lastWinName
	WinActivate, % winName
	PixelGetColor, color, x, y, RGB  
	WinActivate, % lastWinName
	return %color%
}

defaultSettings() {
	global
	toggle := false
	countQuiz := 0
}

clickPos(x, y, slp:=.05) {
	ControlClick, x%x% y%y%, % winName,,,, NA
	Sleep, slp * 1000
}
clickPos2(x, y, slp:=.05) {
	Click
	Sleep, slp * 1000
}

questReject(y, slp:=.05) {
	clickPos(1000,  y, .5) ; quest: 1 2 3 
	clickPos(615, 385, .3) ; reject
	clickPos(655, 450, .2) ; confirm
	Sleep, slp * 1000
}

completeExploration() {
	clickPos2(985, 105) ; top map
	clickPos2(xSpam, ySpam, 4) ; explore
	clickPos2(xSpam, ySpam, 4) ; OK
	clickPos2(xSpam, ySpam, 4) ; screen
	clickPos2(xConfirm, yConfirm+100, 3) ; confirm
	acceptBottomMap()
}

rushExploration() {
	clickPos2(xSpam, ySpam, 4) ; explore
	clickPos2(xSpam, ySpam, 2) ; quick exploration
	clickPos2(xConfirm, yConfirm, 3) ; confirm
	clickPos2(xConfirm, yConfirm, 4) ; screen
	clickPos2(xConfirm, yConfirm+100, 3) ; confirm
	acceptBottomMap()
}

acceptBottomMap() {
	clickPos2(985, 430) ; bottom map
	clickPos2(xSpam, ySpam, 1) ; explore
	clickPos2(760, 530, 2) ; hero suggestion
	clickPos2(xSpam, ySpam, 3) ; confirm
	clickPos2(xSpam, ySpam, 2) ; screen
	clickPos2(910, 50) ; close
}

^+Left::
	WinActivate, % winName
	WinMove, % winName,, 447, 0
Return

~^Delete::
	KeyWait, Ctrl
	if WinActive(winName) 
		questReject(yQuest1)
Return
~^End::
	KeyWait, Ctrl
	if WinActive(winName) 
		questReject(yQuest1+70)
Return
~^PgDn::
	KeyWait, Ctrl
	if WinActive(winName) 
		questReject(yQuest1+140)
Return
~^Home::
	KeyWait, Ctrl
	if WinActive(winName) {
		questReject(yQuest1, 1.5)
		questReject(yQuest1+70, 1.5)
		questReject(yQuest1+140)
	}
Return
~^PgUp::
	KeyWait, Ctrl
	if WinActive(winName)
		completeExploration()
Return
~^+PgUp::
	KeyWait, Ctrl
	if WinActive(winName)
		rushExploration()
Return

Pause::Pause
Return
!Pause::Reload
Return

~XButton1::
	WinMove, %winName%,,,, 1024, 576
	if WinActive(winName) 
		defaultSettings()
	if WinExist("BlueStacksTV")
		WinClose, BlueStacksTV
	KeyWait, XButton1, T1 ; wait 2 seconds for release key
	if ErrorLevel { ; more than 2 sec have passed
		defaultSettings()
		Suspend, On
 	}
Return

ScrollLock::
^+Down:: ; swap suspends
	defaultSettings()
	MouseGetPos, xPos
	MouseMove, xPos, 1079
	Suspend, On
	DetectHiddenWindows, On
	SetTitleMatchMode, 1
	PostMessage, 0x111, 65305,,, %A_ScriptDir%\CQ Bot.ahk ; suspend cq bot.ahk
Return
