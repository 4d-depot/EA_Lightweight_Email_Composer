Case of
	: (Form event code=On Mouse Enter)
		OBJECT SET VISIBLE(*; "bgr2"; True)

	: (Form event code=On Mouse Leave)
		OBJECT SET VISIBLE(*; "bgr2"; False)

	Else

		var $color_l; $fColor; $bColor_l : Integer
		OBJECT GET RGB COLORS(*; "fontColor"; $fColor; $bColor_l)

		var $range_o : Object
		$range_o:=WP Selection range(*; "WriteProArea")
		WP SET ATTRIBUTES($range_o; wk text color; $bColor_l)

End case 