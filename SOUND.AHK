; Written by Joe Stratton 1/2016
; Used nircmd and devcon tool, see README for more

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent														   ; no idea if needed
^!Numpad7::setHD800()										
^!Numpad9::setTurtles()       		                               
				
setActive() {
	Run, cmd.exe	
	WinWaitActive, Administrator: C:\Windows\System32\cmd.exe, , 1 ; Waits for the cmd prompt
}

setHD800() {
	setActive()
	Send, nircmd setdefaultsounddevice "HD800" {Enter}     	       ;sets default device to my headphones
	Send, exit {Enter}			    							   ; Closes command prompt
}

setTurtles() {
	setActive()
	Send, nircmd setdefaultsounddevice "Turtles" {Enter}           
	Send, exit {Enter}			    							   ; Closes command prompt
}
	
Return


