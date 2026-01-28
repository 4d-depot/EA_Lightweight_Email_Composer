Case of
	: (Form event code=On Mouse Enter)
		OBJECT SET VISIBLE(*; "bgr3"; True)

	: (Form event code=On Mouse Leave)
		OBJECT SET VISIBLE(*; "bgr3"; False)

	Else
		var $color_l; $bColor_l : Integer
		var $range_o : Object
		$range_o:=WP Selection range(*; "WriteProArea")
		WP GET ATTRIBUTES($range_o; wk text color; $bColor_l)

		$color_l:=Select RGB color($bColor_l)
		If ($color_l#$bColor_l) & ($color_l>0)
			WP SET ATTRIBUTES($range_o; wk text color; $color_l)
			OBJECT SET RGB COLORS(*; "fontColor"; 0x00FFFFFF; $color_l)
		End if

End case 