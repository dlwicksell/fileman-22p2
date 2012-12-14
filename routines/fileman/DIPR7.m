DIPR7	;SFISC/TKW-PRE INSTALL ROUTINE FOR PATCH DI*22.0*7 ;8/6/99  08:51
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
	; Change second piece of field 20 DEVELOPER in file 1 FILE
	; so that LAYGO is not allowed to file 200 NEW PERSON.
	S $P(^DD(1,20,0),"^",2)="P200'"
	Q
