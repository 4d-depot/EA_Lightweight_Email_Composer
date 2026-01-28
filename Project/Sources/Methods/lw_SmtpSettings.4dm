//%attributes = {"shared":true}
// ----------------------------------------------------
// User name (OS): Add Komoncharoensiri
// Date and time: 02/27/19, 08:38:15
// Updated by Soukaina BACHIKH 
// ----------------------------------------------------
// Method: lw_SmtpSettings
// Description
//     Display the current STMP Settings
// Changes 
//     Modern syntax
// ----------------------------------------------------

var $smtp_o : Object
var $win_l : Integer
var $path_t : Text

$smtp_o:=loadSMTPSetting
If ($smtp_o=Null:C1517)
	$smtp_o:=New object:C1471("host"; ""; "port"; ""; "from"; ""; "user"; ""; "password"; ""; "log"; False:C215)
End if 

$win_l:=Open form window:C675("smtpSettings")
DIALOG:C40("smtpSettings"; $smtp_o)
CLOSE WINDOW:C154($win_l)
If (OK=1)
	saveSMTPSetting($smtp_o)
End if 
