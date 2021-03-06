DIFROMS3	;SFISC/DCL,TKW- DATA TO DISTRIBUTION ARRAY ;5/14/98  12:30
	;;22.2V2;VA FILEMAN;;Mar 08, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
	Q
EN	;
	I '$D(@DIFRFIA) D ERR(2) Q
	G:$G(DIFRFILE) FILE
	S DIFRFILE=0 F  S DIFRFILE=$O(@DIFRFIA@(DIFRFILE)) Q:DIFRFILE'>0  D FILE
	Q
FCHK	I '$D(@DIFRFIA@(DIFRFILE)) D ERR(5) Q  ;  * * * * PHASING OUT * * * *
FILE	N DIFRS,DIFRSCR,DIFRDA,DIFROOT,DIFRRLR,DIFR01,DIFRPR,DIFRDNSC,DIFRFRV,DIFRFRVX
	N DIFRQ,DIFRTART,DIFRK,R,R1,R2,R3,C,F,G,I,DIFR2DD,DIFRNODE,DIFRFELD,DIFRPCE,DIFRIENS,DIFRDD0
	S DIFR01=$G(@DIFRFIA@(DIFRFILE,0,1)),DIFRPR=$TR($P(DIFR01,"^",5),"Y","y")="y"
	I $TR($P(DIFR01,"^",7),"Y","y")'="y" Q
	I DIFRPR D PGL^DIFROMSP(DIFRFILE,"",DIFRTA)
	S DIFRS=$G(@DIFRFIA@(DIFRFILE,0,11))]"",DIFRSCR=$G(^(11))
	S DIFROOT=$NA(@($$ROOT^DILFD(DIFRFILE,"",1))),DIFRDA=0  ;$NA/trans gbl $Q
	S DIFRRLR=$G(@DIFRFIA@(DIFRFILE,0,"RLRO"))
	S:DIFRRLR="" DIFRRLR=DIFROOT
	I $D(@DIFRRLR)'>9 D ERR(4) Q
	N Y
	F  S DIFRDA=$O(@DIFRRLR@(DIFRDA)) Q:DIFRDA'>0  D
	.I '$D(@DIFROOT@(DIFRDA,0)) D  Q
	..N DIFRERR S DIFRERR(1)=DIFRDA,DIFRERR(2)=DIFRFILE
	..D BLD^DIALOG(9513,.DIFRERR)
	..Q
	.I DIFRS,$D(@DIFRRLR@(DIFRDA,0)) S Y=DIFRDA X DIFRSCR Q:'$T  ;set *NAKED* and *Y*
	.M @DIFRTA@("DATA",DIFRFILE,DIFRDA)=@DIFROOT@(DIFRDA)
	.Q
	S DIFRQ=$NA(@DIFRTA@("DATA",DIFRFILE))  ;$NA/trans gbl/$Q
	S DIFRTART=$$OREF^DILF(DIFRQ)
	F  S DIFRQ=$Q(@DIFRQ) Q:$P(DIFRQ,DIFRTART)]""!(DIFRQ="")  D:$P(DIFRQ,DIFRTART,2,99)[""""!(DIFRPR)
	.K R1
	.S DIFRK=1
	.S R2=$P(DIFRQ,DIFRTART,2,99),$E(R2,$L(R2))="",C=$L(R2,","),F=1,R1=0
	.F I=1:1 Q:I>C  S G=$P(R2,",",F,I) Q:G=""  I G'[""""!($L(G,"""")#2&($E(G)="""")&($E(G,$L(G))="""")) S F=F+$L(G,","),I=F-1,R1(R1)=G,R1=R1+1,C=C+($L(G,",")-1) I 'G,G'?1"0".E,R1#2 S DIFRK=DIFRTART_$P(R2,",",1,I)_")" Q
	.I DIFRPR,DIFRK,'(R1#2) D  Q  ;RESOLVE POINTERS
	..D  Q:DIFR2DD'>0
	...I R1'>3 S DIFR2DD=DIFRFILE Q
	...S R3=""
	...F I=0:1:R1-3 S R3=R3_R1(I)_","
	...S DIFR2DD=+$P($G(@(DIFRTART_R3_"0)")),"^",2)
	...Q
	..S DIFRNODE=R1($O(R1(""),-1)),DIFRDNSC=R2
	..Q:'$D(@DIFRTA@("PGL",DIFR2DD,DIFRNODE))
	..S DIFRPCE=0
	..F  S DIFRPCE=$O(@DIFRTA@("PGL",DIFR2DD,DIFRNODE,DIFRPCE)) Q:DIFRPCE=""  D:DIFRPCE>0
	...Q:$P(@DIFRQ,"^",DIFRPCE)=""
	...S DIFRFELD=$O(@DIFRTA@("PGL",DIFR2DD,DIFRNODE,DIFRPCE,"")),(I,DIFRIENS)=""
	...;CREATE IENS * * * * * * * * * * * * * * * * *
	...F  S I=$O(R1(I),-1) Q:I=""  S:'(I#2) DIFRIENS=DIFRIENS_R1(I)_","
	...S DIFRDD0=^DD(DIFR2DD,DIFRFELD,0)
	...D DIERR
	...S DIFRFRV=$$GET1^DIQ(DIFR2DD,DIFRIENS,DIFRFELD)
	...D DIERR
	...I DIFRFRV']"" D  Q
	....N DIFRERR
	....S DIFRERR(1)=DIFR2DD,DIFRERR(2)=DIFRIENS,DIFRERR(3)=DIFRFELD
	....D BLD^DIALOG(9514,.DIFRERR)
	....D DIERR
	....Q
	...S DIFRFRVX="FRV1"
	...; If .01 field on file level is a pointer use "FRV0" subscript
	...;I R1'>3,DIFRPCE=1,DIFRNODE=0 S DIFRFRVX="FRV0"
	...S @DIFRTA@(DIFRFRVX,DIFRFILE,DIFRDNSC,DIFRPCE)=DIFRFRV
	...S @DIFRTA@(DIFRFRVX,DIFRFILE,DIFRDNSC,DIFRPCE,"F")=$S($P(DIFRDD0,"^",2)["P":";"_$P(DIFRDD0,"^",3),$P(DIFRDD0,"^",2)["V":"1;"_$P($P(@DIFRQ,"^",DIFRPCE),";",2),1:"")
	...D KEYVAL
	...Q
	..Q
	..;Q:IF HEADER NODE OR IF NOT DATA NODE THEN FIND DD AND CHECK
	..;  IF DD#,"PGL",DATA NODE EXIST IF SO GET PIECE AND FIELD
	..;  AND SET IT UP INTO A STRUCTURE ; ALL RESOLVED; .01,IDs AND PTR.
	..;IT WAS DECIDED NOT TO RESOLVE .01 AND ID POINTERS
	..Q
	.Q:DIFRK
	.K @DIFRK
	.Q
	Q
	;
KEYVAL	; Send KEY values if pointed-to file has a primary KEY
	N DIFL S DIFL=$P(DIFRDD0,"^",2)
	I DIFL["P" S DIFL=+$P(DIFL,"P",2)
	E  D
	. S DIFL=$P($P(@DIFRQ,"^",DIFRPCE),";",2)
	. S DIFL=+$P($G(@("^"_DIFL_"0)")),"^",2) Q
	Q:'DIFL
	N DIKEY S DIKEY=$O(^DD("KEY","AP",DIFL,"P",0)) Q:'DIKEY
	N X,DIOUT S DIOUT=0 D  Q:DIOUT
	. S X=$P(^DD("KEY",DIKEY,0),U,4) I 'X S DIOUT=1 Q
	. S X=$P($G(^DD("IX",X,0)),U,2) I X="" S DIOUT=1 Q
	. S @DIFRTA@("FRV1K",DIFRFILE,DIFRDNSC,DIFRPCE)=X Q
	N DIFLD,DIVAL,DIPTR,DIER,DIERR,DIFLDDA,DISEQ
	S DIPTR=+$P(@DIFRQ,"^",DIFRPCE),DIFLDDA=0,DIOUT=0
	F  S DIFLDDA=$O(^DD("KEY",DIKEY,2,DIFLDDA)) Q:'DIFLDDA  S X=$G(^(DIFLDDA,0)) D  Q:DIOUT
	. S DIFLD=$P(X,U),DISEQ=$P(X,U,3) I 'DISEQ S DIOUT=1 Q
	. I $P(X,U,2)'=DIFL S DIOUT=1 Q
	. I DIFLD=.01 S DIVAL=DIFRFRV
	. E  S DIVAL=$$GET1^DIQ(DIFL,DIPTR_",",DIFLD,"","","DIER")
	. I $D(DIER) K DIER S DIOUT=1 Q
	. S @DIFRTA@("FRV1K",DIFRFILE,DIFRDNSC,DIFRPCE,DISEQ)=DIVAL
	. Q
	I DIOUT K @DIFRTA@("FRV1K",DIFRFILE,DIFRDNSC,DIFRPCE)
	Q
	;
DIERR	I $G(DIERR) S DIFRERRC=$$ERRC($G(DIFRERRC),DIERR) K DIERR
	Q
	;
ERRC(X,Y)	;
	S X=$G(X),Y=$G(Y)
	S $P(X,"^")=+X+Y,$P(X,"^",2)=$P(X,"^",2)+$P(Y,"^",2)
	Q X
	;
ERR(X)	N Y S Y=$P($T(ERR+X),";",5) Q:'Y  D BLD^DIALOG(Y) Q
	;;FIA Node Is Set To "No Data";1;9509
	;;FIA Array Does Not Exist;2;9501
	;;;3;
	;;Records Do Not Exist;4;9510
	;;FIA File Number Invalid;5;9502
