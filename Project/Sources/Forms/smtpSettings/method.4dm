If (Value type:C1509(Form:C1466.log)=Is real:K8:4)
	If (Form:C1466.log=1)
		Form:C1466.log:=True:C214
	Else 
		Form:C1466.log:=False:C215
	End if 
End if 

setObjectBestSize ("host")
setObjectBestSize ("port")
setObjectBestSize ("user")
setObjectBestSize ("password")
setObjectBestSize ("from")

OBJECT SET FONT:C164(*;"password";"%Password")
