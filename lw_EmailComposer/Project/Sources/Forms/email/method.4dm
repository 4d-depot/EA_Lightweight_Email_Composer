Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.cc:=""
		
		ARRAY TEXT:C222(attachedPath_at;0)
		OBJECT SET ENABLED:C1123(*;"delAttachment";False:C215)
		
		SET WINDOW TITLE:C213("Untitled - "+Form:C1466.from)
		
		Form:C1466.toSubform:=New object:C1471("height";32)
		Form:C1466.ccSubform:=New object:C1471("height";32)
		
		If (Form:C1466.to#"")
			EXECUTE METHOD IN SUBFORM:C1085("to";"setInitialToEmail";*;Form:C1466.to)
		End if 
		
	: (Form event code:C388=On Resize:K2:27)
		C_LONGINT:C283($l;$t;$r;$b)
		OBJECT GET COORDINATES:C663(*;"sendButton";$l;$t;$r;$b)
		EXECUTE METHOD IN SUBFORM:C1085("to";"resizeToForm";*;$l)
		EXECUTE METHOD IN SUBFORM:C1085("cc";"resizeCcForm";*;$l)
		adjustUI 
End case 