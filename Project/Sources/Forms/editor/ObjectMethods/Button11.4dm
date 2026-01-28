Case of
	: (Form event code=On Mouse Enter)
		OBJECT SET VISIBLE(*; "bgr"; True)

	: (Form event code=On Mouse Leave)
		OBJECT SET VISIBLE(*; "bgr"; False)

	Else

		var $color_l; $fColor; $bColor_l : Integer
		OBJECT GET RGB COLORS(*; "bgRect"; $fColor; $bColor_l)

		var $range_o : Object
		$range_o:=WP Selection range(*; "WriteProArea")
		WP SET ATTRIBUTES($range_o; wk background color; $bColor_l)

End case 