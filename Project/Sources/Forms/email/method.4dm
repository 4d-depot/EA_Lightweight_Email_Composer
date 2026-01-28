//Updated by Soukaina BACHIKH
var $l; $t; $r; $b : Integer

Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.cc:=""
		
		// Attachments now in Storage.emailComposer.attachments (shared collection)
		OBJECT SET ENABLED:C1123(*; "delAttachment"; False:C215)
		
		SET WINDOW TITLE:C213("Untitled - "+Form:C1466.from)
		
		Form:C1466.toSubform:=New object:C1471("height"; 32)
		Form:C1466.ccSubform:=New object:C1471("height"; 32)
		
		If (Form:C1466.to#"")
			EXECUTE METHOD IN SUBFORM:C1085("to"; "setInitialToEmail"; *; Form:C1466.to)
		End if 
		
	: (Form event code:C388=On Resize:K2:27)
		OBJECT GET COORDINATES:C663(*; "sendButton"; $l; $t; $r; $b)
		EXECUTE METHOD IN SUBFORM:C1085("to"; "resizeToForm"; *; $l)
		EXECUTE METHOD IN SUBFORM:C1085("cc"; "resizeCcForm"; *; $l)
		adjustUI
End case 