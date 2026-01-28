// ----------------------------------------------------
// User name (OS): Soukaina BACHIKH
// Date and time: 12/18/25, 14:28:41
// ----------------------------------------------------
// Method: SMTPSettings Class
// Description
//       SMTP Configuration Management 
//
// ----------------------------------------------------

property host : Text
property port : Integer
property from : Text
property user : Text
property password : Text
property log : Boolean

Class constructor($host : Text; $port : Integer; $from : Text; $user : Text; $password : Text; $log : Boolean)
	// Initialize properties
	This:C1470.host:=$host
	This:C1470.port:=$port
	This:C1470.from:=$from
	This:C1470.user:=$user
	This:C1470.password:=$password
	This:C1470.log:=$log
	
	If (Count parameters:C259=0)
		This:C1470._loadFromFile()
	End if 
	
	
Function _loadFromFile()
	
	var $path_t; $smtp_t : Text
	var $foundat_l : Integer
	var $smtp_o : Object
	
	ARRAY TEXT:C222($unames_at; 0)
	ARRAY LONGINT:C221($unums_al; 0)
	
	$path_t:=Get 4D folder:C485(Database folder:K5:14; *)+"smtp"+Folder separator:K24:12
	If (Test path name:C476($path_t)#Is a folder:K24:2)
		CREATE FOLDER:C475($path_t)
	End if 
	
	GET USER LIST:C609($unames_at; $unums_al)
	$foundat_l:=Find in array:C230($unames_at; Current user:C182)
	$path_t:=$path_t+String:C10($unums_al{$foundat_l})+".json"
	
	If (Test path name:C476($path_t)=Is a document:K24:1)
		var Error : Integer
		Error:=0
		$smtp_t:=Document to text:C1236($path_t)
		ON ERR CALL:C155("onSmtpErr")
		$smtp_o:=JSON Parse:C1218($smtp_t)
		ON ERR CALL:C155("")
		If (Error=0) && ($smtp_o#Null:C1517)
			This:C1470.host:=$smtp_o.host
			This:C1470.port:=$smtp_o.port
			This:C1470.from:=$smtp_o.from
			This:C1470.user:=$smtp_o.user
			This:C1470.password:=$smtp_o.password
			This:C1470.log:=$smtp_o.log
		Else 
			This:C1470._setDefaults()
		End if 
	Else 
		This:C1470._setDefaults()
	End if 
	
	
Function _setDefaults()
	// Internal: Set default values
	This:C1470.host:=""
	This:C1470.port:=25
	This:C1470.from:=""
	This:C1470.user:=""
	This:C1470.password:=""
	This:C1470.log:=False:C215
	
	
Function save()
	// Save current SMTP settings to JSON file for the current user
	
	var $path_t : Text
	var $foundat_l : Integer
	var $smtp_o : Object
	ARRAY TEXT:C222($unames_at; 0)
	ARRAY LONGINT:C221($unums_al; 0)
	
	$path_t:=Get 4D folder:C485(Database folder:K5:14; *)+"smtp"+Folder separator:K24:12
	If (Test path name:C476($path_t)#Is a folder:K24:2)
		CREATE FOLDER:C475($path_t)
	End if 
	
	GET USER LIST:C609($unames_at; $unums_al)
	$foundat_l:=Find in array:C230($unames_at; Current user:C182)
	$path_t:=$path_t+String:C10($unums_al{$foundat_l})+".json"
	
	// Convert to object for JSON serialization
	$smtp_o:=This:C1470.toObject()
	
	// Ensure port is numeric
	If (Value type:C1509($smtp_o.port)=Is text:K8:3)
		$smtp_o.port:=Num:C11($smtp_o.port)
	End if 
	
	TEXT TO DOCUMENT:C1237($path_t; JSON Stringify:C1217($smtp_o; *); "UTF-8")
	
	
Function toObject()->$object : Object
	// Convert settings to plain object
	
	$object:=New object:C1471
	$object.host:=This:C1470.host
	$object.port:=This:C1470.port
	$object.from:=This:C1470.from
	$object.user:=This:C1470.user
	$object.password:=This:C1470.password
	$object.log:=This:C1470.log
	
	
Function createTransporter()->$transporter : 4D:C1709.SMTPTransporter
	// Create an SMTP transporter with current settings
	
	var $smtp_o : Object
	
	If (This:C1470.isValid())
		$smtp_o:=New object:C1471("host"; This:C1470.host; "port"; This:C1470.port)
		
		// Add authentication if provided
		If (This:C1470.user#"") & (This:C1470.password#"")
			$smtp_o.user:=This:C1470.user
			$smtp_o.password:=This:C1470.password
			If (This:C1470.log)
				$smtp_o.logFile:=Get 4D folder:C485(Logs folder:K5:19)+"smtpLog.txt"
			End if 
		End if 
		
		$transporter:=SMTP New transporter:C1608($smtp_o)
	End if 
	
	
Function isValid()->$valid : Boolean
	// Check if settings have minimum required fields
	
	$valid:=(This:C1470.host#"") & (This:C1470.port#Null:C1517) & (This:C1470.port>0)
	
	