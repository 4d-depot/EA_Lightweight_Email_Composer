//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// User name (OS): Add Komoncharoensiri
// Date and time: 02/27/19, 08:54:52
// Updated by Soukaina BACHIKH 
// ----------------------------------------------------
// Method: setObjectBestSize
// Description
//     For a given form object name, make sure it is being
//     displayed with the best size (no cut off from the bottom)
//
// Parameters
//    $objectName    -    Object name
// ----------------------------------------------------

#DECLARE($objectName : Text)

var $l; $t; $r; $b; $bw; $bh : Integer
If (Count parameters:C259>=1)
	OBJECT GET COORDINATES:C663(*; $objectName; $l; $t; $r; $b)
	OBJECT GET BEST SIZE:C717(*; $objectName; $bw; $bh; $r-$l)
	OBJECT SET COORDINATES:C1248(*; $objectName; $l; $t; $r; $t+$bh)
End if 