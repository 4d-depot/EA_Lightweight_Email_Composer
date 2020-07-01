C_OBJECT:C1216($range_o)
$range_o:=WP Selection range:C1340(*;"WriteProArea")

If (Form event code:C388=On Load:K2:1)
	WriteProArea:=WP New:C1317
End if 

C_POINTER:C301($ptr)
C_TEXT:C284($fontFamily_t)
C_LONGINT:C283($fontSize_l;$align_l)

WP GET ATTRIBUTES:C1345($range_o;wk font family:K81:65;$fontFamily_t)
$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"fontFamily")
$ptr->:=$fontFamily_t
OBJECT SET FONT:C164(*;"fontFamily";$fontFamily_t)

WP GET ATTRIBUTES:C1345($range_o;wk font size:K81:66;$fontSize_l)
$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"fontSize")
$ptr->:=Num:C11($fontSize_l)

WP GET ATTRIBUTES:C1345($range_o;wk text align:K81:49;$align_l)
Case of 
	: ($align_l=wk left:K81:95)
		OBJECT Get pointer:C1124(Object named:K67:5;"alignL")->:=1
		OBJECT Get pointer:C1124(Object named:K67:5;"alignR")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignC")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignJ")->:=0
	: ($align_l=wk right:K81:96)
		OBJECT Get pointer:C1124(Object named:K67:5;"alignL")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignR")->:=1
		OBJECT Get pointer:C1124(Object named:K67:5;"alignC")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignJ")->:=0
	: ($align_l=wk center:K81:99)
		OBJECT Get pointer:C1124(Object named:K67:5;"alignL")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignR")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignC")->:=1
		OBJECT Get pointer:C1124(Object named:K67:5;"alignJ")->:=0
	: ($align_l=wk justify:K81:100)
		OBJECT Get pointer:C1124(Object named:K67:5;"alignL")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignR")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignC")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignJ")->:=1
	Else 
		OBJECT Get pointer:C1124(Object named:K67:5;"alignL")->:=1
		OBJECT Get pointer:C1124(Object named:K67:5;"alignR")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignC")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5;"alignJ")->:=0
End case 

