//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	  // Open Mail Editor
	lw_MailEditor 
End if 

If (True:C214)
	  // Open Mail Editor with a pre-defined email addresses to send to
	lw_MailEditor ("john.smith@email.com;mbanner@domain.com;andersonsimson@nowhere.com")
End if 
