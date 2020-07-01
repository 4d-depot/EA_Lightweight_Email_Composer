//%attributes = {"shared":true}

  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 05-15-20, 11:09:38
  // ----------------------------------------------------
  // Method: lw_MailEditor
  // Description
  //     Open the Email Composer for the current user
  //
  // Parameters
  //    $1    -    email address(s)
  // ----------------------------------------------------

C_TEXT:C284($1)  // pre-defined
C_LONGINT:C283($2)
C_TEXT:C284($path_t)
C_LONGINT:C283($win_l;$proc_l)
C_OBJECT:C1216($smtp_o)

Case of 
	: (Count parameters:C259=0)
		$proc_l:=New process:C317(Current method name:C684;0;"email process";"";1)
		
	: (Count parameters:C259=1)
		$proc_l:=New process:C317(Current method name:C684;0;"email process";$1;1)
		
	Else 
		
		$smtp_o:=loadSMTPSetting 
		If ($smtp_o#Null:C1517)
			
			$smtp_o.to:=$1
			$win_l:=Open form window:C675("email")
			DIALOG:C40("email";$smtp_o)
			CLOSE WINDOW:C154($win_l)
			
		Else 
			CONFIRM:C162("Before you can send an email, your SMTP settings must be set up first. Would you like to set it up now?";"Yes";"No")
			If (OK=1)
				lw_SmtpSettings 
			End if 
		End if 
End case 

