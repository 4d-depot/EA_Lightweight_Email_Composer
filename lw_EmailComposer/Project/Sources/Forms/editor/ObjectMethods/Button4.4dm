Case of 
	: (Form event code:C388=On Mouse Enter:K2:33)
		OBJECT SET VISIBLE:C603(*;"bgr1";True:C214)
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		OBJECT SET VISIBLE:C603(*;"bgr1";False:C215)
		
	Else 
		
		C_LONGINT:C283($color_l;$fColor;$bColor_l)
		OBJECT GET RGB COLORS:C1074(*;"bgRect";$fColor;$bColor_l)
		$color_l:=Select RGB color:C956($bColor_l)
		If ($color_l>0)
			C_OBJECT:C1216($range_o)
			$range_o:=WP Selection range:C1340(*;"WriteProArea")
			WP SET ATTRIBUTES:C1342($range_o;wk background color:K81:20;$color_l)
			OBJECT SET RGB COLORS:C628(*;"bgRect";$fColor;$color_l)
		End if 
		
End case 