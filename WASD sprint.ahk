#NoEnv
#InstallKeybdHook
#SingleInstance, Force
#MaxThreadsPerHotkey, 3

SendMode, Input
SetKeyDelay, -1

~$w::
~$a::
~$s::
~$d::
  Send, {LShift down}
  KeyWait, w
  KeyWait, a
  KeyWait, s
  KeyWait, d
  Send, {LShift up}
Return

Pause::
  Suspend, Toggle
  Send, {Capslock UP}
  ; Reload
Return
