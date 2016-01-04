; Written by Joe Stratton 1/2016
; Used devcon tool, see README for more


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent														   ; no idea if needed
^!Numpad0::        		                                           ; This defines the shortcut, control+alt+0 in this case
	
setActive()
initialFix()
didItWork()
				
setActive() {
	Run, cmd.exe	
	WinWaitActive, Administrator: C:\Windows\System32\cmd.exe, , 1 ; Waits for the cmd prompt
}

initialFix() {
	Send, devcon restart PCI\CC_0300 {Enter}     				   ; Sends restart gpu command, followed by enter
	Send, exit {Enter}			    							   ; Closes command prompt
}
	
didItWork() {
	MsgBox, 4, Dell's Screw-Up Fix by Joe 1.0, Did the Restart Method Work?, 10 ;This creates a yes/no box, names it, and adds a 10 second time out
		
	IfMsgBox, Yes                        					   ; Exits if it worked
		Return
	IfMsgBox, Timeout                   					   ; Exits if no answer, in which we presume it worked
		Return
	IfMsgBox, No                          					   ; Tries the enable/disable method
		SetActive()
		Send,  devcon disable PCI\CC_0300 {Enter}
		Sleep, 10000
		Send,  devcon enable  PCI\CC_0300 {Enter}
		Send,  exit {Enter}
}
	
Return

