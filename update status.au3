#include <Date.au3>
#include <MsgBoxConstants.au3>

;================================================================================
; Declare variables used in the script
Dim $i, $Count, $Answer, $Message
Dim $ScriptName

; This is the name of the script
; It is used as the title for pop-up windows
$ScriptName = "Status update"


; Check whether a bib record window is open
; If there is, make it the active window
; If not, exit the script
$Answer = WinActivate("Bib Record")
   If $Answer = 0 Then
	  Exit
   EndIf


; Set a delay between virtual keystrokes
; This is necessary so that Sierra can react to keystrokes
; Adjust this value as needed
AutoITSetOption("SendKeyDelay", 500)

; Prompt the user for the number of records in review file
; If user hits cancel, exit the script
Local $Count = InputBox ( "Number of Records", "Type in the number of records in this review file" )
If @error = 1 Then
	Exit
EndIf

Local $i = 1

; Move to next record and print, until you reach the end of the review file
While $i <= $Count
Local $sText = WinGetTitle("[ACTIVE]")

Send("{DOWN}")
Send("{DOWN}")
Send("{TAB}")
Send("{TAB}")
Send("{TAB}")
Send("z")
Send("^]")
WinWaitActive ("WARNING")
Send("!y")
WinWaitNotActive ("WARNING")
WinWaitNotActive ($sText)
Sleep(2000)
$i = $i + 1
WEnd
