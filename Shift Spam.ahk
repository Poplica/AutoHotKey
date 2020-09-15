#SingleInstance, Force
#MaxThreadsPerHotkey, 3
SetControlDelay, -1
SetMouseDelay, -1

~q::
	toggle := !toggle
	while (toggle) {
		Send {shift}
		Sleep 27
	}
return

~Esc::
	suspend permit
	exitapp 
return
