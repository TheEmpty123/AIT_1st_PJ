#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <File.au3>

#Region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("Untitled - EmptyPad", 598, 420, -1, -1, BitOR($GUI_SS_DEFAULT_GUI,$WS_MAXIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_TABSTOP))
Global $MenuItem1 = GUICtrlCreateMenu("&File")
Global $MenuItem2 = GUICtrlCreateMenuItem("&New"&@TAB&"Ctrl + N", $MenuItem1)
Global $MenuItem3 = GUICtrlCreateMenuItem("&Save"&@TAB&"Ctrl + S", $MenuItem1)
Global $MenuItem4 = GUICtrlCreateMenuItem("&Open"&@TAB&"Ctrl + O", $MenuItem1)
Global $MenuItem5 = GUICtrlCreateMenuItem("", $MenuItem1)
Global $MenuItem6 = GUICtrlCreateMenuItem("E&xit", $MenuItem1)
Global $MenuItem7 = GUICtrlCreateMenu("&Help")
Global $MenuItem8 = GUICtrlCreateMenuItem("&About", $MenuItem7)
GUISetFont(14, 400, 0, "Arial Narrow")
Global $Edit1 = GUICtrlCreateEdit("", 0, 0, 614, 416)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $MenuItem2 ;New
			;Xem có dữ liệu không
			;Có thì hỏi muốn lưu không, không thì thôi không làm gì cả
			saveFile(True)

		Case $MenuItem3	;Save
			Local $fp = saveFile()
			changeTitle($fp)

		Case $MenuItem4	;Open
			Local $fp = FileOpenDialog('Open', @ScriptDir,'Text files (*.txt)|All (*.*)',1,'',$Form1)

			If $fp Then
				Local $fp2 = FileOpen($fp,128)
				Local $data = FileRead($fp)
				FileClose($fp2)
				GUICtrlSetData($Edit1,$data)

				;Change title
				changeTitle($fp)
			EndIf
		Case $MenuItem6	;Exit
			Exit

		Case $MenuItem8	;About
			MsgBox(64 + 262144, 'About', 'Developed by The Empty')

	EndSwitch
WEnd

Func saveFile($Clear = False)
	Local $Content = GUICtrlRead($Edit1)
		If $Content Then
			Local $fp = FileSaveDialog('Save',@ScriptDir,'Text files (*.txt)|All (*.*)',2 + 16,'',$Form1)
			If $fp Then
				FileWrite($fp,$Content)
				FileClose($fp)
				If $Clear Then
					GUICtrlSetData($Edit1,'')
				EndIf

				Return $fp
			EndIf
		EndIf

EndFunc

Func changeTitle($fp)
	Local $Drive, $Dir, $FileName, $ext
	Local $arr = _PathSplit($fp, $Drive, $Dir, $FileName, $ext)
	WinSetTitle($Form1, '', $FileName&$ext&'- EmptyPad')
EndFunc
