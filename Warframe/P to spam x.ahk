#SingleInstance, Force
#MaxThreadsPerHotkey, 3
SetControlDelay, -1
SetMouseDelay, -1

~p::
	toggle := !toggle
	while (toggle && WinActive("WARFRAME")) {
		Send x
		Sleep 100
		Send 4
	}
return

~Esc::
	suspend permit
	exitapp 
return

/*
$2::
    KeyWait v, T0.25                 ; Wait 1/2 second for user to release "a" key
    If ErrorLevel                   ; Still held down
        While GetKeyState("2"){ ; While it is held down
            Send 2
            Sleep 25
        }
    Else                            ; They let go in time
        Send 2
return
*/