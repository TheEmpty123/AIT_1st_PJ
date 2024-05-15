#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#NoTrayIcon

#cs
Run('notepad')
WinWaitActive('Untitled - Notepad')
Send('Hi and Hello!')
#ce

;~ Func sayHi($name)
;~ 	MsgBox(0, 'Message', 'Salutations! By: ' & $name)
;~ EndFunc

Global $content = 'content'

;~ IniWrite($content,'Username', 'username', "The Empty")
;~ IniWrite($content,'Password', '1', "01864977437")
;~ IniWrite($content,'Password', '2', "0964377428")
;~ IniWrite($content,'Password', '3', "Crazycraft.56")
;~ IniWrite($content,'Phone', 'phonenumber', "0933718070")
;~ IniWrite($content,'Email', '1', "toangaming.203@gmail.com")
;~ IniWrite($content,'Email', '2', "toangaming.23@gmail.com")
;~ IniWrite($content,'Email', '3', "21130569@st.hcmuaf.edu.vn")
;~ IniWrite($content,'Student', 'code', "21130569")
;~ IniWrite($content,'Student', 'CMND', "276106965")
;~ IniWrite($content,'Student', 'CCCD', "075203019210")
;~ IniWrite($content,'Picoworks', 'redditURL', "https://www.reddit.com/user/TheEmpty203")
;~ IniWrite($content,'Picoworks', 'twitterUserName', "TWAMZ Toan @TwamzT")
;~ IniWrite($content,'Picoworks', 'twitterURL', "https://twitter.com/TwamzT")

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

MsgBox( 0, 0, $redditURL & @CRLF & $twitter & @CRLF & $twitterURL)
;~ MsgBox( 0, 0, $username & @CRLF & $password & @CRLF & $password2 & @CRLF & $mainPassword & @CRLF & $phonenumber & @CRLF & $email_1 & @CRLF &  $email_2 & @CRLF & $email_3 & @CRLF & $studentcode)
