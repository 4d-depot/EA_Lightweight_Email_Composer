C_BOOLEAN:C305($missing_b)
$missing_b:=False:C215

C_LONGINT:C283($port_l)

If (Form:C1466.host="")
	OBJECT SET RGB COLORS:C628(*;"r1";0x00FF0000;0x00FFFFFF)
	$missing_b:=True:C214
Else 
	OBJECT SET RGB COLORS:C628(*;"r1";0x00CCCCCC;0x00FFFFFF)
End if 

If (Value type:C1509(Form:C1466.port)=Is text:K8:3)
	$port_l:=Num:C11(Form:C1466.port)
Else 
	$port_l:=Form:C1466.port
End if 
If ($port_l=0)
	OBJECT SET RGB COLORS:C628(*;"r2";0x00FF0000;0x00FFFFFF)
	$missing_b:=True:C214
Else 
	OBJECT SET RGB COLORS:C628(*;"r2";0x00CCCCCC;0x00FFFFFF)
End if 

If (Form:C1466.user="")
	OBJECT SET RGB COLORS:C628(*;"r3";0x00FF0000;0x00FFFFFF)
	$missing_b:=True:C214
Else 
	OBJECT SET RGB COLORS:C628(*;"r3";0x00CCCCCC;0x00FFFFFF)
End if 

If (Form:C1466.password="")
	OBJECT SET RGB COLORS:C628(*;"r4";0x00FF0000;0x00FFFFFF)
	$missing_b:=True:C214
Else 
	OBJECT SET RGB COLORS:C628(*;"r4";0x00CCCCCC;0x00FFFFFF)
End if 

If (Form:C1466.from="")
	OBJECT SET RGB COLORS:C628(*;"r5";0x00FF0000;0x00FFFFFF)
	$missing_b:=True:C214
Else 
	OBJECT SET RGB COLORS:C628(*;"r5";0x00CCCCCC;0x00FFFFFF)
End if 

If (Not:C34($missing_b))
	C_OBJECT:C1216($options_o;$transporter_o;$status_o)
	$options_o:=New object:C1471
	$options_o.host:=Form:C1466.host
	$options_o.user:=Form:C1466.user
	$options_o.password:=Form:C1466.password
	$options_o.port:=$port_l
	$transporter_o:=SMTP New transporter:C1608($options_o)
	$status_o:=$transporter_o.checkConnection()
	If ($status_o.success=True:C214)
		ACCEPT:C269
	Else 
		ALERT:C41("Error # "+String:C10($status_o.status)+", "+$status_o.statusText+"\n\nPlease check the highlighted settings again.")
		Case of 
			: ($status_o.status=0)
				OBJECT SET RGB COLORS:C628(*;"r1";0x00FF0000;0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*;"r2";0x00FF0000;0x00FFFFFF)
			: ($status_o.status=535)
				OBJECT SET RGB COLORS:C628(*;"r3";0x00FF0000;0x00FFFFFF)
				OBJECT SET RGB COLORS:C628(*;"r4";0x00FF0000;0x00FFFFFF)
		End case 
	End if 
	
End if 