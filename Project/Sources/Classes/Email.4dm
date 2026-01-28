// ----------------------------------------------------
// User name (OS): Soukaina BACHIKH
// Date and time: 12/22/25, 10:32:55
// ----------------------------------------------------
// Method: Email Class
// Description
//     Email configuration 
//
// ----------------------------------------------------


property to : Text
property cc : Text
property from : Text
property subject : Text
property importance : Text
property attachments : Collection
property writeProArea : Variant


Class constructor()
	This:C1470.to:=""
	This:C1470.cc:=""
	This:C1470.from:=""
	This:C1470.subject:=""
	This:C1470.importance:=""
	This:C1470.attachments:=New collection:C1472
	This:C1470.writeProArea:=Null:C1517
	
	
Function setTo($addresses : Text)->$this : cs:C1710.Email
	This:C1470.to:=$addresses
	$this:=This:C1470
	
	
Function setCc($addresses : Text)->$this : cs:C1710.Email
	This:C1470.cc:=$addresses
	$this:=This:C1470
	
	
Function setFrom($address : Text)->$this : cs:C1710.Email
	This:C1470.from:=$address
	$this:=This:C1470
	
	
Function setSubject($subject : Text)->$this : cs:C1710.Email
	This:C1470.subject:=$subject
	$this:=This:C1470
	
	
Function setImportance($importance : Text)->$this : cs:C1710.Email
	// Values: "high", "normal", "low"
	This:C1470.importance:=$importance
	$this:=This:C1470
	
	
Function setWriteProArea($wpArea : Object)->$this : cs:C1710.Email
	This:C1470.writeProArea:=$wpArea
	$this:=This:C1470
	
	
Function addAttachment($filePath : Text)->$this : cs:C1710.Email
	If (Test path name:C476($filePath)=Is a document:K24:1)
		This:C1470.attachments.push($filePath)
	End if 
	$this:=This:C1470
	
	
Function addAttachments($filePaths : Collection)->$this : cs:C1710.Email
	var $path : Text
	For each ($path; $filePaths)
		This:C1470.addAttachment($path)
	End for each 
	$this:=This:C1470
	
	
Function send($smtpSettings : cs:C1710.SMTPSettings)->$result : Object
	
	var $email_o; $mailTmp_o; $transporter_o; $status_o : Object
	var $mime_t; $attachment_t : Text
	
	$result:=New object:C1471("success"; False:C215; "message"; ""; "status"; Null:C1517)
	
	// Validate settings
	If ($smtpSettings=Null:C1517) || (Not:C34($smtpSettings.isValid()))
		$result.message:="Invalid SMTP settings: Missing host and/or port number"
		return 
	End if 
	
	// Validate email content
	If (This:C1470.subject="") || (This:C1470.to="") || (This:C1470.from="")
		$result.message:="Invalid email content: Missing subject, recipient address and/or sender address"
		return 
	End if 
	
	$email_o:=New object:C1471
	$email_o.subject:=This:C1470.subject
	$email_o.to:=This:C1470.to
	$email_o.from:=This:C1470.from
	$email_o.replyTo:=This:C1470.from
	If (This:C1470.cc#"")
		$email_o.cc:=This:C1470.cc
	End if 
	
	If (This:C1470.writeProArea#Null:C1517)
		WP EXPORT VARIABLE:C1319(This:C1470.writeProArea; $mime_t; wk mime html:K81:1)
		$mailTmp_o:=MAIL Convert from MIME:C1681($mime_t)
		
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
		$email_o.bodyValues.p0001.value:=Replace string:C233($email_o.bodyValues.p0001.value; "white-space:pre-wrap;"; "")
	End if 
	
	// Set headers
	$email_o.headers:=New collection:C1472
	$email_o.headers.push(New object:C1471("name"; "Accept-Language"; "value"; "en-US"))
	If (This:C1470.importance#"")
		$email_o.headers.push(New object:C1471("name"; "Importance"; "value"; This:C1470.importance))
	End if 
	
	// Add file attachments
	If (This:C1470.attachments.length>0)
		If ($email_o.attachments=Null:C1517)
			$email_o.attachments:=New collection:C1472
		End if 
		For each ($attachment_t; This:C1470.attachments)
			$email_o.attachments.push(MAIL New attachment:C1644($attachment_t))
		End for each 
	End if 
	
	// Send email
	$transporter_o:=$smtpSettings.createTransporter()
	If ($transporter_o#Null:C1517)
		ON ERR CALL:C155("onSmtpErr")
		$status_o:=$transporter_o.send($email_o)
		ON ERR CALL:C155("")
		
		$result.status:=$status_o
		$result.success:=$status_o.success
		If (Not:C34($status_o.success))
			$result.message:="An error occurred sending the mail: "+$status_o.message
		Else 
			$result.message:="Email sent successfully"
		End if 
	Else 
		$result.message:="Failed to create SMTP transporter"
	End if 
	