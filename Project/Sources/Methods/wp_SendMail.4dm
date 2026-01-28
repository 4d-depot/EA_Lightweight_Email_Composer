//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Add Komoncharoensiri
// Date and time: 05-15-20, 11:16:16
// Updated By Soukaina BACHIKH 
// ----------------------------------------------------
// Method: wp_SendMail
// Description
//     Send email the composed email body from 4D Write Pro
//     with the SMTP Settings for the current user.
//
// Parameters
//     $wp_o             -    4D Write Pro object
//     $emailParams_o    -    SMTP settings
// ----------------------------------------------------

#DECLARE($wp_o : Object; $emailParams_o : Object)->$result : Integer

var $email : cs:C1710.Email
var $smtpSettings : cs:C1710.SMTPSettings
var $sendResult : Object

If (Count parameters:C259>=2)
	// Create SMTP settings from parameters
	$smtpSettings:=cs:C1710.SMTPSettings.new(\
		$emailParams_o.host; \
		$emailParams_o.port; \
		$emailParams_o.from; \
		$emailParams_o.user; \
		$emailParams_o.password; \
		$emailParams_o.log)
	
	// Create and configure email
	$email:=cs:C1710.Email.new()
	$email.setTo($emailParams_o.to)\
		.setCc($emailParams_o.cc)\
		.setFrom($emailParams_o.from)\
		.setSubject($emailParams_o.subject)\
		.setWriteProArea($wp_o)
	
	If ($emailParams_o.importance#Null:C1517)
		$email.setImportance($emailParams_o.importance)
	End if 
	
	If ($emailParams_o.attachments#Null:C1517)
		$email.addAttachments($emailParams_o.attachments)
	End if 
	
	$sendResult:=$email.send($smtpSettings)
	
	If ($sendResult.success)
		$result:=1
	Else 
		ALERT:C41($sendResult.message)
		$result:=0
	End if 
End if 
