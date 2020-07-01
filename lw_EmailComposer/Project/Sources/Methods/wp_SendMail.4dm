//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 05-15-20, 11:16:16
  // ----------------------------------------------------
  // Method: wp_SendMail
  // Description
  //     Send email the composed email body from 4D Write Pro
  //     with the SMTP Settings for the current user.
  //
  // Parameters
  //     $1    -    4D Write Pro object
  //     $2    -    SMTP settings
  // ----------------------------------------------------

C_LONGINT:C283($0)
C_OBJECT:C1216($1;$2;$wp_o;$emailParams_o)

If (Count parameters:C259>=2)
	C_OBJECT:C1216($email_o;$smtp_o;$mailTmp_o;$transporter_o;$status_o)
	C_TEXT:C284($mime_t;$attachment_t)
	
	$wp_o:=$1
	$emailParams_o:=$2
	
	If ($emailParams_o.host#Null:C1517) & ($emailParams_o.port#Null:C1517)
		
		$smtp_o:=New object:C1471("host";$emailParams_o.host;"port";$emailParams_o.port)
		
		  // Authentication Credential
		If ($emailParams_o.user#Null:C1517) & ($emailParams_o.password#Null:C1517)
			$smtp_o.user:=$emailParams_o.user
			$smtp_o.password:=$emailParams_o.password
			If ($emailParams_o.log)
				$smtp_o.logFile:=Get 4D folder:C485(Logs folder:K5:19)+"smtpLog.txt"
			End if 
		Else 
			  // Bad SMTP Settings: Missing username and/or password
		End if 
		
		If ($emailParams_o.subject#Null:C1517) & ($emailParams_o.to#Null:C1517) & ($emailParams_o.from#Null:C1517)
			$email_o:=New object:C1471
			$email_o.subject:=$emailParams_o.subject
			$email_o.to:=$emailParams_o.to
			$email_o.from:=$emailParams_o.from
			$email_o.replyTo:=$emailParams_o.from
			If ($emailParams_o.cc#Null:C1517)
				$email_o.cc:=$emailParams_o.cc
			End if 
			  // Bad Email Content: Missing subject, recipient address and/or sender address
		End if 
		
	Else 
		  // Bad SMTP Settings: Missing host and/or port number
	End if 
	
	If ($email_o#Null:C1517)
		WP EXPORT VARIABLE:C1319($wp_o;$mime_t;wk mime html:K81:1)
		$mailTmp_o:=MAIL Convert from MIME:C1681($mime_t)  // conversion of Write Pro document Mime in mail object
		
		  // Add included images
		If ($mailTmp_o.attachments#Null:C1517)
			If ($email_o.attachments=Null:C1517)
				$email_o.attachments:=$mailTmp_o.attachments
			Else 
				$email_o.attachments.combine($mailTmp_o.attachments)
			End if 
		End if 
		$email_o.bodyStructure:=$mailTmp_o.bodyStructure
		$email_o.bodyValues:=$mailTmp_o.bodyValues
		$email_o.bodyValues.p0001.value:=Replace string:C233($email_o.bodyValues.p0001.value;"white-space:pre-wrap;";"")
		
		  // Set header
		$email_o.headers:=New collection:C1472()
		$email_o.headers.push(New object:C1471("name";"Accept-Language";"value";"en-US"))
		If ($emailParams_o.importance#Null:C1517)
			$email_o.headers.push(New object:C1471("name";"Importance";"value";$emailParams_o.importance))
		End if 
		
		  // Check for other attachments
		If ($emailParams_o.attachments#Null:C1517)
			If ($email_o.attachments=Null:C1517)
				$email_o.attachments:=New collection:C1472
			End if 
			For each ($attachment_t;$emailParams_o.attachments)
				$email_o.attachments.push(MAIL New attachment:C1644($attachment_t))
			End for each 
		End if 
		
		  // Sending Email
		If ($smtp_o#Null:C1517)
			$transporter_o:=SMTP New transporter:C1608($smtp_o)
			ON ERR CALL:C155("onSmtpErr")
			$status_o:=$transporter_o.send($email_o)
			ON ERR CALL:C155("")
			If (Not:C34($status_o.success))
				ALERT:C41("An error occurred sending the mail: "+$status_o.message)
			Else 
				$0:=1
			End if 
		End if 
		
	End if 
End if 