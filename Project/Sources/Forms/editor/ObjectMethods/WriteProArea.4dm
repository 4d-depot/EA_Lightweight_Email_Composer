var $range_o : Object
$range_o:=WP Selection range(*; "WriteProArea")

If (Form event code=On Load)
	WriteProArea:=WP New
End if

var $ptr : Pointer
var $fontFamily_t : Text
var $fontSize_l; $align_l : Integer

WP GET ATTRIBUTES($range_o; wk font family; $fontFamily_t)
$ptr:=OBJECT Get pointer(Object named; "fontFamily")
$ptr->:=$fontFamily_t
OBJECT SET FONT(*; "fontFamily"; $fontFamily_t)

WP GET ATTRIBUTES($range_o; wk font size; $fontSize_l)
$ptr:=OBJECT Get pointer(Object named; "fontSize")
$ptr->:=Num($fontSize_l)

WP GET ATTRIBUTES($range_o; wk text align; $align_l)
Case of
	: ($align_l=wk left)
		OBJECT Get pointer(Object named; "alignL")->:=1
		OBJECT Get pointer(Object named; "alignR")->:=0
		OBJECT Get pointer(Object named; "alignC")->:=0
		OBJECT Get pointer(Object named; "alignJ")->:=0
	: ($align_l=wk right)
		OBJECT Get pointer(Object named; "alignL")->:=0
		OBJECT Get pointer(Object named; "alignR")->:=1
		OBJECT Get pointer(Object named; "alignC")->:=0
		OBJECT Get pointer(Object named; "alignJ")->:=0
	: ($align_l=wk center)
		OBJECT Get pointer(Object named; "alignL")->:=0
		OBJECT Get pointer(Object named; "alignR")->:=0
		OBJECT Get pointer(Object named; "alignC")->:=1
		OBJECT Get pointer(Object named; "alignJ")->:=0
	: ($align_l=wk justify)
		OBJECT Get pointer(Object named; "alignL")->:=0
		OBJECT Get pointer(Object named; "alignR")->:=0
		OBJECT Get pointer(Object named; "alignC")->:=0
		OBJECT Get pointer(Object named; "alignJ")->:=1
	Else
		OBJECT Get pointer(Object named; "alignL")->:=1
		OBJECT Get pointer(Object named; "alignR")->:=0
		OBJECT Get pointer(Object named; "alignC")->:=0
		OBJECT Get pointer(Object named; "alignJ")->:=0
End case 

