; Written by Joe Stratton 1/2016
; Used multimonitor tool, see README for more


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent														   ; no idea if needed
^!Numpad1::        		                                           ; This defines the shortcut, control+alt+1 in this case
	
setActive()
loadConfig()	
				
setActive() {
	Run, cmd.exe	
	WinWaitActive, Administrator: C:\Windows\System32\cmd.exe, , 1 ; Waits for the cmd prompt
}

monitorDisable() {
	Send, mmt /disable MONITOR\DEL409C\{4d36e96e-e325-11ce-bfc1-08002be10318}\0002 {Enter} 
	Sleep, 5000	
}

monitorEnable() {
	Send, mmt /enable MONITOR\DEL409C\{4d36e96e-e325-11ce-bfc1-08002be10318}\0002 {Enter}   
    Sleep, 5000	
}	

loadConfig() {
	Send, mmt /LoadConfig E:\Programs\WDK\monitor_config.cfg {Enter}
	Sleep, 3000	
	Send, exit {Enter}
}
	
Return

