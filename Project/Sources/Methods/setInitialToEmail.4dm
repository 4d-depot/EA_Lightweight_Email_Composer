//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Add Komoncharoensiri
// Date and time: 02/27/19, 08:49:20
// Updated By Soukaina BACHIKH
// ----------------------------------------------------
// Method: setInitialToEmail
// Description
//     This method is called from the email editor once during On Load event.
//     From the given email addresses, they are broken up and each email is
//     placed as a selectable token in the the TO field. It then 
//     resizes the the token (button) and rectangle objects to fit
//     the viewable area.
//
// Parameters
//    $1    -    Email address(es)
//
//     Input email addresses must be separated by ";"
// ----------------------------------------------------

#DECLARE($emailAddresses : Text)

var $objName_t; $curObject_t; $address : Text
var $l; $t; $r; $b; $l2; $t2; $r2; $b2; $bestW; $bestH; $i; $ll; $tt; $level : Integer

var $email_c : Collection
$email_c:=Split string:C1554($emailAddresses; ";")

// Populate Storage collection instead of array
Use (Storage:C1525.emailComposer)
	Storage:C1525.emailComposer.to:=New shared collection:C1527
	For each ($address; $email_c)
		If ($address#"")
			Storage:C1525.emailComposer.to.push($address)
		End if 
	End for each 
	Storage:C1525.emailComposer.dupToCount:=0
	Storage:C1525.emailComposer.toAddressText:=""
End use 

OBJECT GET COORDINATES:C663(*; "toRect"; $l; $t; $r; $b)
$ll:=$l
$tt:=$t
$level:=1

OBJECT SET VISIBLE:C603(*; "addrToButton@"; False:C215)

$curObject_t:="toField"

Use (Storage:C1525.emailComposer)
	For ($i; 0; Storage:C1525.emailComposer.to.length-1)
		$address:=Storage:C1525.emailComposer.to[$i]
		
		If (($i+1)>Storage:C1525.emailComposer.dupToCount)
			Storage:C1525.emailComposer.dupToCount:=Storage:C1525.emailComposer.dupToCount+1
			$objName_t:="addrToButton"+String:C10($i+1)
			OBJECT DUPLICATE:C1111(*; "addrToButton0"; $objName_t)
		Else 
			$objName_t:="addrToButton"+String:C10($i+1)
		End if 
		
		OBJECT SET VISIBLE:C603(*; $objName_t; True:C214)
		OBJECT SET TITLE:C194(*; $objName_t; $address)
		OBJECT Get pointer:C1124(Object named:K67:5; $objName_t)->:=0
		OBJECT GET BEST SIZE:C717(*; $objName_t; $bestW; $bestH)
		
		If (($l+$bestW+4)>$r)
			$l:=$ll
			$t:=$t+30
			$level:=$level+1
			OBJECT SET COORDINATES:C1248(*; "toRect"; $l; $tt; $r; $tt+(30*$level))
			
		End if 
		
		OBJECT SET COORDINATES:C1248(*; $objName_t; $l+4; $t+4; $l+$bestW+4; $t+$bestH+4)
		
		$l:=$l+$bestW+4
		
		Storage:C1525.emailComposer.toAddressText:=Storage:C1525.emailComposer.toAddressText+$address+";"
	End for 
End use 

OBJECT GET COORDINATES:C663(*; $curObject_t; $l2; $t2; $r2; $b2)
OBJECT SET COORDINATES:C1248(*; $curObject_t; $l+4; $t+8; $r2; $t+24)
If (($t+$bestH+8)-$tt<30)
	OBJECT SET COORDINATES:C1248(*; "toRect"; $ll; $tt; $r; $tt+30)
Else 
	OBJECT SET COORDINATES:C1248(*; "toRect"; $ll; $tt; $r; $t+$bestH+8)
End if 

Form:C1466.to:=""
GOTO OBJECT:C206(*; $curObject_t)

OBJECT GET COORDINATES:C663(*; "toRect"; $l; $t; $r; $b)
Form:C1466.height:=(30*$level)+($level*2)-$level+1

CALL FORM:C1391(Current form window:C827; "adjustUI")
