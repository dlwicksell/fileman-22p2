DIPR104	;SFISC/SO,GFT-PRE INSTALL ROUTINE FOR PATCH DI*22.0*104 ;04:14 PM  31 May 2002
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	; Add field 'EDIT FIELDS' (#1620) to Input Template File (#.402)
	; Set new field's Zeroth node
	S ^DD(.402,1620,0)="EDIT FIELDS^Cm^^ ; ^D EN^DIET"
	; Set new field's 'B' xref
	S ^DD(.402,"B","EDIT FIELDS",1620)=""
	F DIA=0:0 S DIA=$O(^DIA(DIA)) Q:'DIA  D
	.S DATE=2700000 F  S DATE=$O(^DIA(DIA,"C",DATE)) Q:'DATE  I DATE?8N D
	..F IEN=0:0 S IEN=$O(^DIA(DIA,"C",DATE,IEN)) Q:'IEN  K ^(IEN) D
	...I $P($G(^DIA(DIA,IEN,0)),"^",2)=DATE S $P(^(0),"^",2)=$E(DATE,1,7),^DIA(DIA,"C",$E(DATE,1,7),IEN)=""
