#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         The Empty

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

#Region
#AutoIt3Wrapper_Icon = manager.ico
#EndRegion

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("UsP", 370, 60, 192, 124)
GUISetFont(12, 400, 0, "Georgia")
Global $optionCombo = GUICtrlCreateCombo("", 24, 16, 177, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Username|Main Password|Password 2|Password 3|Main email|Sub email|Email SV|CMND|CCCD|MSSV|SĐT|Reddit URL|Twitter Username|Twitter URL", 'Username')
GUICtrlSetColor(-1, 0x000000)
Global $fillButton = GUICtrlCreateButton("Fill", 224, 8, 123, 25)
GUICtrlSetColor(-1, 0x000000)
Global $copyButton = GUICtrlCreateButton("Copy", 224, 32, 123, 25)
GUICtrlSetColor(-1, 0x000000)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $content = 'content'
Global $username = IniRead($content, 'Username', 'username', 0)
Global $password = IniRead($content, 'Password', '1', 0)
Global $password2 = IniRead($content, 'Password', '2', 0)
Global $mainPassword = IniRead($content, 'Password', '3', 0)
Global $phonenumber = IniRead($content, 'Phone', 'phonenumber', 0)
Global $email_1 = IniRead($content, 'Email', '1', 0)
Global $email_2 = IniRead($content, 'Email', '2', 0)
Global $email_3 = IniRead($content, 'Email', '3', 0)
Global $studentcode = IniRead($content, 'Student', 'code', 0)
Global $CMND = IniRead($content, 'Student', 'CMND', 0)
Global $CCCD = IniRead($content, 'Student', 'CCCD', 0)
Global $redditURL = IniRead($content, 'Picoworks', 'redditURL', 0)
Global $twitter = IniRead($content, 'Picoworks', 'twitterUserName', 0)
Global $twitterURL = IniRead($content, 'Picoworks', 'twitterURL', 0)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $fillButton
			If processStep() Then
				Sleep(2000)
				Send(processStep())
			Else
				MsgBox( 16 + 262144, 'Error', 'Something went wrong!')
			EndIf

		Case $copyButton
			If processStep() Then
				ClipPut(processStep())
			Else
				MsgBox( 16 + 262144, 'Error', 'Something went wrong!')
			EndIf

	EndSwitch
WEnd

Func userOption()
	$output = GUICtrlRead($optionCombo)
	Return $output
EndFunc

Func processStep()

	$option = userOption()
	$data = ''

	Switch True
		Case $option = 'Username'
			$data = $username
			return $data
		Case $option = 'Main Password'
			$data = $mainPassword
			return $data
		Case $option = 'Password 2'
			$data = $password
			return $data
		Case $option = 'Password 3'
			$data = $password2
			return $data
		Case $option = 'Main email'
			$data = $email_1
			return $data
		Case $option = 'Sub email'
			$data = $email_2
			return $data
		Case $option = 'Email SV'
			$data = $email_3
			return $data
		Case $option = 'CMND'
			$data = $CMND
			return $data
		Case $option = 'CCCD'
			$data = $CCCD
			return $data
		Case $option = 'MSSV'
			$data = $studentcode
			return $data
		Case $option = 'SĐT'
			$data = $phonenumber
			return $data
		Case $option = 'Reddit URL'
			Return $redditURL
		Case $option = 'Twitter Username'
			Return $twitter
		Case $option = 'Twitter URL'
			Return $twitterURL
	EndSwitch
EndFunc
