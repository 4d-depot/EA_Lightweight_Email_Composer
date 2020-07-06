Case of 
	: (Form event code:C388=-3001)
		Form:C1466.subject:=Get edited text:C655
		If (Get edited text:C655="")
			SET WINDOW TITLE:C213("Untitled - "+Form:C1466.from)
		Else 
			SET WINDOW TITLE:C213(Form:C1466.subject+" - "+Form:C1466.from)
		End if 
		
End case 