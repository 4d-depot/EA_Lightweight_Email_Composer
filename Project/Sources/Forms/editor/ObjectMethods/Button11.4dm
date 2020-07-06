Case of 
	: (Form event code:C388=On Mouse Enter:K2:33)
		OBJECT SET VISIBLE:C603(*;"bgr";True:C214)
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		OBJECT SET VISIBLE:C603(*;"bgr";False:C215)
		
	Else 
		
		C_LONGINT:C283($color_l;$fColor;$bColor_l)
		OBJECT GET RGB COLORS:C1074(*;"bgRect";$fColor;$bColor_l)
		
		C_OBJECT:C1216($range_o)
		$range_o:=WP Selection range:C1340(*;"WriteProArea")
		WP SET ATTRIBUTES:C1342($range_o;wk background color:K81:20;$bColor_l)
		
End case 