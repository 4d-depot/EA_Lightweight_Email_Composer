C_LONGINT:C283($sel)
C_POINTER:C301($ptr)
$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"fontSize")
$sel:=Pop up menu:C542("10;12;14;16;18;20;22;24;28;32")
Case of 
	: ($sel=1)
		$ptr->:=10
	: ($sel=2)
		$ptr->:=12
	: ($sel=3)
		$ptr->:=14
	: ($sel=4)
		$ptr->:=16
	: ($sel=5)
		$ptr->:=18
	: ($sel=6)
		$ptr->:=20
	: ($sel=7)
		$ptr->:=22
	: ($sel=8)
		$ptr->:=24
	: ($sel=9)
		$ptr->:=28
	: ($sel=10)
		$ptr->:=32
End case 

setFontSize ($ptr->)