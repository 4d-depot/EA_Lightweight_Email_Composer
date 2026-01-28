//%attributes = {"invisible":true,"executedOnServer":true}
//Updated by Soukaina BACHIKH

#DECLARE($smtp_o : Object)

var $settings : cs:C1710.SMTPSettings

If (Count parameters:C259>=1)
	// Ensure port is numeric
	If (Value type:C1509($smtp_o.port)=Is text:K8:3)
		$smtp_o.port:=Num:C11($smtp_o.port)
	End if 
	
	// Create settings object and save
	$settings:=cs:C1710.SMTPSettings.new($smtp_o.host; $smtp_o.port; $smtp_o.from; $smtp_o.user; $smtp_o.password; $smtp_o.log)
	$settings.save()
End if 
