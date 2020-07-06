Case of 
	: (Form event code:C388=On Mouse Enter:K2:33)
		OBJECT SET VISIBLE:C603(*;"bgr2";True:C214)
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		OBJECT SET VISIBLE:C603(*;"bgr2";False:C215)
		
	Else 
		
		C_LONGINT:C283($color_l;$fColor;$bColor_l)
		OBJECT GET RGB COLORS:C1074(*;"fontColor";$fColor;$bColor_l)
		
		C_OBJECT:C1216($range_o)
		$range_o:=WP Selection range:C1340(*;"WriteProArea")
		WP SET ATTRIBUTES:C1342($range_o;wk text color:K81:64;$bColor_l)
		
End case 