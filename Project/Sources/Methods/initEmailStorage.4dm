//%attributes = {"shared":true}
// ----------------------------------------------------
// User name (OS): Soukaina BACHIKH
// Date and time: 01/08/26, 18:10:34
// ----------------------------------------------------
// Method: initEmailStorage
// Description
//     Initialize/reset email composer storage for new email composition
//     Replaces legacy process variables and arrays with modern Storage
//
// ----------------------------------------------------


// Create root storage object if doesn't exist
If (Storage:C1525.emailComposer=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.emailComposer:=New shared object:C1526("version"; "1.0")
	End use 
End if 

// Reset for new email composition
Use (Storage:C1525.emailComposer)
	Storage:C1525.emailComposer.to:=New shared collection:C1527
	Storage:C1525.emailComposer.cc:=New shared collection:C1527
	Storage:C1525.emailComposer.attachments:=New shared collection:C1527
	Storage:C1525.emailComposer.fonts:=New shared collection:C1527
	
	Storage:C1525.emailComposer.toAddressText:=""
	Storage:C1525.emailComposer.ccAddressText:=""
	Storage:C1525.emailComposer.clickedToButton:=""
	Storage:C1525.emailComposer.clickedCcButton:=""
	Storage:C1525.emailComposer.importance:=""
	
	Storage:C1525.emailComposer.dupToCount:=0
	Storage:C1525.emailComposer.dupCcCount:=0
	
End use 
