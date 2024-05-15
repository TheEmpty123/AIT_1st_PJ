#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#NoTrayIcon
;#include <Array.au3>
;#include <Test.au3>

#include <MsgBoxConstants.au3>

; Press Esc to terminate script, Pause/Break to "pause"


Global $g_bPaused = False

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{s}", "Terminate")
HotKeySet("+!d", "ShowMessage") ; Shift-Alt-d

While 1
    Sleep(100)
WEnd

Func TogglePause()
    $g_bPaused = Not $g_bPaused
    While $g_bPaused
        Sleep(100)
        ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ToolTip("")
EndFunc   ;==>TogglePause

Func Terminate()
    Exit
EndFunc   ;==>Terminate

Func ShowMessage()
    MsgBox($MB_SYSTEMMODAL, "", "This is a message.")
EndFunc   ;==>ShowMessage


;sayHi('Empty')
;MsgBox(0,'Message', @DesktopHeight & ' x ' & @DesktopWidth & @CRLF & @HotKeyPressed)
#cs
Func main()
	Run('notepad')
	Sleep(2000)
	Send('The Empty')
EndFunc
;main()

Func SayHello($name)
	MsgBox(0, 'Message','Hello ' & $name)
EndFunc
;SayHello('The Empty')

Func calculator($a, $b)
	Return $a + $b
EndFunc

Global $c =123

Func dandom()
	Local $d =345
	Return '$c có giá trị là: ' & $c & @CRLF & '$d có giá trị là: ' & $d
EndFunc

MsgBox(0, 'Message', dandom() )
#ce
