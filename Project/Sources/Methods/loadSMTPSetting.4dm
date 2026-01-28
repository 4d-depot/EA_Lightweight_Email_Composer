//%attributes = {"invisible":true,"executedOnServer":true}
// ----------------------------------------------------
// User name (OS): Add Komoncharoensiri
// Date and time: 05-15-20, 11:08:51
// Updated by Soukaina BACHIKH 
// ----------------------------------------------------
// Method: loadSMTPSetting
// Description
//    Load and return the SMTP Settings from the SMTPSettings class
//
// ----------------------------------------------------

#DECLARE()->$smtp_o : Object

// Modern approach: Use SMTPSettings class
var $settings : cs:C1710.SMTPSettings
$settings:=cs:C1710.SMTPSettings.new()
$smtp_o:=$settings.toObject()
