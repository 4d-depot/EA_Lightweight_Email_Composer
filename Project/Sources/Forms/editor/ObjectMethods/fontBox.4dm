Case of 
	: (Form event code:C388=On Clicked:K2:4) | (Form event code:C388=On Selection Change:K2:29)
		
		C_POINTER:C301($ptr)
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"fontFamily")
		$ptr->:=font_at{font_at}
		OBJECT SET FONT:C164(*;"fontFamily";font_at{font_at})
		
		C_OBJECT:C1216($range_o)
		$range_o:=WP Selection range:C1340(*;"WriteProArea")
		WP SET ATTRIBUTES:C1342($range_o;wk font family:K81:65;font_at{font_at})
		
		OBJECT SET VISIBLE:C603(*;"fontBox";False:C215)
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		OBJECT SET VISIBLE:C603(*;"fontBox";False:C215)
		
End case 