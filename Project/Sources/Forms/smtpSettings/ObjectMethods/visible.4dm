Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.visible:="SHOW"
		
	: (Form event code:C388=On Clicked:K2:4)
		If (Form:C1466.visible="SHOW")
			Form:C1466.visible:="HIDE"
			OBJECT SET FONT:C164(*;"password";"Helvetica Neue")
		Else 
			Form:C1466.visible:="SHOW"
			OBJECT SET FONT:C164(*;"password";"%Password")
		End if 
		
End case 