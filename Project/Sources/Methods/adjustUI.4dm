//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // User name (OS): Add Komoncharoensiri
  // Date and time: 02/27/19, 08:42:09
  // ----------------------------------------------------
  // Method: adjustUI
  // Description
  //     This method make sure the subform objects in the main
  //     window is adjusted to line up perfectly
  //
  // ----------------------------------------------------

C_LONGINT:C283($tt;$l;$t;$r;$b)

OBJECT GET COORDINATES:C663(*;"to";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"to";$l;$t;$r;$t+Form:C1466.toSubform.height)

$tt:=$t+Form:C1466.toSubform.height+2
OBJECT GET COORDINATES:C663(*;"cc";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"cc";$l;$tt;$r;$tt+Form:C1466.ccSubform.height)

$tt:=$tt+Form:C1466.ccSubform.height+2
OBJECT GET COORDINATES:C663(*;"subject";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"subject";$l;$tt;$r;$tt+($b-$t))

$tt:=$tt+($b-$t)+2
OBJECT GET COORDINATES:C663(*;"attachments";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"attachments";$l;$tt;$r;$tt+($b-$t))

$tt:=$tt+($b-$t)+4
OBJECT GET COORDINATES:C663(*;"editor";$l;$t;$r;$b)
OBJECT SET COORDINATES:C1248(*;"editor";$l;$tt;$r;$b)