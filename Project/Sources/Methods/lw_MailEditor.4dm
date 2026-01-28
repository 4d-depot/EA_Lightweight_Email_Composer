//%attributes = {"shared":true}
// ----------------------------------------------------
// User name (OS): Add Komoncharoensiri
// Date and time: 05-15-20, 11:09:38
// Updated by Soukaina BACHIKH
// ----------------------------------------------------
// Method: lw_MailEditor
// Description
//     Open the Email Composer for the current user
// Changes
//     Modern syntax    
// Parameters
//    $emailAddress    -    email address(s)
// ----------------------------------------------------

#DECLARE($emailAddress : Text)

var $path_t : Text
var $win_l; $proc_l : Integer
var $smtp_o : Object

Case of 
	: (Count parameters:C259=0)
		$proc_l:=New process:C317(Current method name:C684; 0; "email process"; ""; 1)
		
	: (Count parameters:C259=1)
		$proc_l:=New process:C317(Current method name:C684; 0; "email process"; $emailAddress; 1)
		
	Else 
		
		// Initialize Storage for email composition
		initEmailStorage
		
		$smtp_o:=loadSMTPSetting
		If ($smtp_o#Null:C1517)
			
			$smtp_o.to:=$emailAddress
			$win_l:=Open form window:C675("email")
			DIALOG:C40("email"; $smtp_o)
			CLOSE WINDOW:C154($win_l)
			
		Else 
			CONFIRM:C162("Before you can send an email, your SMTP settings must be set up first. Would you like to set it up now?"; "Yes"; "No")
			If (OK=1)
				lw_SmtpSettings
			End if 
		End if 
End case 

