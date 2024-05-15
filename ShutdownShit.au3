#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         TheEmpty

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#Region
#AutoIt3Wrapper_Icon = shutdown.ico
#EndRegion

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>


#Region ### START Koda GUI section ### Form=
Global $FormMain = GUICreate("FormMain", 399, 364, -1, -1)
GUISetFont(14, 400, 0, "Times New Roman")
Global $SellectBox = GUICtrlCreateLabel("Select", 16, 24, 49, 25)
Global $ShutdownandSleepSellectBox = GUICtrlCreateCombo("", 80, 24, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Shutdown|Restart", 'Shutdown')
Global $ForceCloseRuningApplicationsCheck = GUICtrlCreateCheckbox("Force running applications to close", 24, 64, 401, 41)
Global $TimeOutCheckBox = GUICtrlCreateCheckbox("Set the time-out period before shutdown", 24, 104, 513, 25)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $TimeOutBox = GUICtrlCreateLabel("Time-out", 16, 144, 72, 25)
Global $TimeOutInputBox = GUICtrlCreateInput("300", 104, 144, 97, 29, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER))
Global $SecondsBox = GUICtrlCreateLabel("Seconds", 208, 144, 69, 25)
Global $CommentBox = GUICtrlCreateLabel("Comment", 16, 184, 77, 25)
Global $CommentInputBox = GUICtrlCreateEdit("", 16, 224, 369, 89)
Global $StartButton = GUICtrlCreateButton("Start", 16, 328, 115, 25)
Global $AbortButton = GUICtrlCreateButton("Abort", 248, 328, 139, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
				Exit

		Case $TimeOutCheckBox
			If GUICtrlRead($TimeOutCheckBox) = $GUI_CHECKED Then
				toggleTimer(True)
				GUICtrlSetState($TimeOutInputBox, $GUI_FOCUS)
			Else
				toggleTimer(False)
			EndIf

		Case $StartButton
			;MsgBox(0,0,timeoutSet())
			Run(timeoutSet(), '', @SW_HIDE)

		Case $AbortButton
			Run('shutdown -a', '', @SW_HIDE)
	EndSwitch
WEnd

Func timeoutSet()
	$cmd = 'shutdown'

	;Shutdown or Restart??
	$cmd &= ' ' & (StringLower(GUICtrlRead($ShutdownandSleepSellectBox)) = 'shutdown' ? '-s' : '-r')

	;Force
	If GUICtrlRead($ForceCloseRuningApplicationsCheck) = $GUI_CHECKED Then
		$cmd &= ' -f'
	EndIf

	;Time-out
	If GUICtrlRead($TimeOutCheckBox) = $GUI_CHECKED Then
		Local $time = GUICtrlRead($TimeOutInputBox)
			If Not $time Then
				$time = 300
				GUICtrlSetData($TimeOutInputBox, 300)
			EndIf
		$cmd &= ' -t ' & $time
	Else
		$cmd &= ' -t 300'
	EndIf

	;Comment
	Local $comment = GUICtrlRead($CommentInputBox)
		If $comment Then
			$cmd &= ' -c "' & $comment & '"'
		EndIf

	Return $cmd
EndFunc

Func toggleTimer($enable)
	Local $value = $enable ? $GUI_ENABLE : $GUI_DISABLE

	GUICtrlSetState($TimeOutBox, $value)
	GUICtrlSetState($TimeOutInputBox, $value)
	GUICtrlSetState($SecondsBox, $value)
EndFunc

