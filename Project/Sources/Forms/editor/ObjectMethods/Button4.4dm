Case of
	: (Form event code=On Mouse Enter)
		OBJECT SET VISIBLE(*; "bgr1"; True)

	: (Form event code=On Mouse Leave)
		OBJECT SET VISIBLE(*; "bgr1"; False)

	Else

		var $color_l; $fColor; $bColor_l : Integer
		OBJECT GET RGB COLORS(*; "bgRect"; $fColor; $bColor_l)
		$color_l:=Select RGB color($bColor_l)
		If ($color_l>0)
			var $range_o : Object
			$range_o:=WP Selection range(*; "WriteProArea")
			WP SET ATTRIBUTES($range_o; wk background color; $color_l)
			OBJECT SET RGB COLORS(*; "bgRect"; $fColor; $color_l)
		End if

End case 