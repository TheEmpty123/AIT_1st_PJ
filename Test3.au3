#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Login", 291, 138, -1, -1)
GUISetFont(14, 400, 0, "MS Sans Serif")
$Label1 = GUICtrlCreateLabel("username", 16, 16, 89, 28)
$input1 = GUICtrlCreateInput("", 120, 16, 121, 32)
$Label2 = GUICtrlCreateLabel("password", 16, 56, 93, 28)
$Input2 = GUICtrlCreateInput("", 120, 56, 121, 32, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD))
$Button1 = GUICtrlCreateButton("Login", 120, 104, 123, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
			Local $username = GUICtrlRead($input1)
			Local $password = GUICtrlRead($Input2)

			If $username == 'admin' And $password == '1234' Then
				MsgBox(0, 'LoginOutput', 'Login Successfully!')
			Else
				MsgBox(0, 'LoginOutput', 'Login False Successfuly!')
			EndIf
	EndSwitch
WEnd

