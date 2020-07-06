Case of 
	: (Form event code:C388=On Mouse Enter:K2:33)
		OBJECT SET VISIBLE:C603(*;"bgr3";True:C214)
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		OBJECT SET VISIBLE:C603(*;"bgr3";False:C215)
		
	Else 
		C_LONGINT:C283($color_l;$bColor_l)
		C_OBJECT:C1216($range_o)
		$range_o:=WP Selection range:C1340(*;"WriteProArea")
		WP GET ATTRIBUTES:C1345($range_o;wk text color:K81:64;$bColor_l)
		
		$color_l:=Select RGB color:C956($bColor_l)
		If ($color_l#$bColor_l) & ($color_l>0)
			WP SET ATTRIBUTES:C1342($range_o;wk text color:K81:64;$color_l)
			OBJECT SET RGB COLORS:C628(*;"fontColor";0x00FFFFFF;$color_l)
		End if 
		
End case 