DDGLIBP	;SFISC/MKO-PRINT FROM WITHIN SCREEN TOOLS ;7:56 AM  5 Dec 2012
	;;22.2T1;VA FILEMAN;;Dec 14, 2012;Build 19
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
PT(DDGLROOT,DDGLHDR)	;Prompt for device and print
	N POP,DDGLFLAG,DDGLI,DDGLPHDR,DDGLWRAP,DX,DY
	N %,%A,%B,%B1,%B2,%B3,%BA,%C,%E,%G,%H,%I,%J,%K,%M,%N
	N %P,%S,%T,%W,%X,%Y
	N %A0,%D1,%D2,%DT,%J1,%W0
	;
	;Write info, and clear rest of screen
	S DDGLFLAG=""
	S DY=IOTM-1,DX=0 X IOXY
	S:$G(DDGLHDR)="" DDGLHDR="Print document"
	W $P(DDGLVID,DDGLDEL)_"Print: "_DDGLHDR_$P(DDGLVID,DDGLDEL,10)_$P(DDGLCLR,DDGLDEL)
	F DDGLI=1:1:IOBM-IOTM W $C(13,10)_$P(DDGLCLR,DDGLDEL)
	S DY=IOTM+1,DX=0 X IOXY
	;
	;Set terminal characterstics for scroll mode
	X DDGLZOSF("EON"),DDGLZOSF("TRMOFF")
	S X=$G(IOM,80) X DDGLZOSF("RM")
	W $P(DDGLVID,DDGLDEL,9)
	;
	;Prompt whether to print a header
	S DDGLPHDR=$$YNREAD("Print a header on each page")
	I DDGLPHDR=-1 D FINISH("Report canceled.") Q
	S:DDGLPHDR DDGLFLAG=DDGLFLAG_"H"
	;
	;Prompt whether to wrap text
	S DDGLWRAP=$$YNREAD("Wrap text and interpret word processing (|) windows")
	I DDGLWRAP=-1 D FINISH("Report canceled.") Q
	S:'DDGLWRAP DDGLFLAG=DDGLFLAG_"N"
	;
DEVICE	;Device prompt
	N IOF,IOSL
	S IOF="#",IOSL=IOBM-IOTM+1 ;In case help frames are invoked
	S %ZIS=$S($D(^%ZTSK):"Q",1:""),%ZIS("B")=""
	S %ZIS("S")="I $TR($P(^(0),U),""browse"",""BROWSE"")'[""BROWSE"""
	D ^%ZIS K %ZIS
	;
	I POP D FINISH("Report canceled!") Q
	;
	;Queue report
	I $D(IO("Q")),$D(^%ZTSK) D
	. N I,ZTRTN,ZTDESC,ZTSAVE,ZTSK
	. S ZTRTN="PRINT^DDGLIBP"
	. S ZTDESC=DDGLHDR
	. F I="DDGLROOT","DDGLHDR","DDGLFLAG" S ZTSAVE(I)=""
	. D ^%ZTLOAD
	. I $D(ZTSK)#2 W !,"Report queued!",!,"Task number: "_ZTSK,!
	. E  W !,"Report canceled!",!
	. S IOP="HOME" D ^%ZIS
	;
	E  I $E(IOST,1,2)="C-" D  Q
	. W !,$C(7)_"You cannot print the document on a CRT.",!
	. H 2
	;
	;Non-queued report
	E  D
	. W !,"Printing ..."
	. D PRINT
	. X $G(^%ZIS("C"))
	. W !,"Done."
	;
	;Allow time to see messages
	D FINISH()
	Q
	;
PRINT	;Print the document in DDGLROOT, Header text in DDGLHDR
	N DDGLDT,DDGLI,DDGLPAGE,DDGLREF,DDGLZN
	S DDGLREF=$$CREF^DILF($G(DDGLROOT))
	Q:DDGLREF=""  Q:'$D(@DDGLREF)
	;
	S DDGLZN=$D(@DDGLREF@($O(@DDGLREF@(0)),0))#2
	S DDGLFLAG=$G(DDGLFLAG)
	;
	;Format the text, if DDGLFLAG contains neither N nor X
	I DDGLFLAG'["N" D
	. D FORMAT(DDGLREF,DDGLZN,DDGLFLAG)
	. S DDGLZN=1
	. S DDGLREF=$NA(^UTILITY($J,"W",1))
	;
	;Write the report from the original location or from ^UTILITY
	U IO
	I DDGLFLAG["H" D
	. ;Get current date/time and write first header
	. N %,%H,X,Y
	. S %H=$H D YX^%DTC
	. S DDGLDT=$E(Y,1,18)
	. D HDR
	;
	;Print each line
	S DDGLI=0 F  S DDGLI=$O(@DDGLREF@(DDGLI)) Q:'DDGLI  D
	. I DDGLFLAG["H",$Y+6>IOSL W @IOF D HDR
	. W !,$S(DDGLZN:$G(@DDGLREF@(DDGLI,0)),1:$G(@DDGLREF@(DDGLI)))
	;
	K:$G(DDGLFLAG)'["N" ^UTILITY($J,"W")
	S:$D(ZTQUEUED) ZTREQ="@"
	Q
	;
HDR	;Print the header DDGLHDR; increment DDGLPAGE
	N DDGLCOL,DDGLPSTR
	S DDGLPAGE=$G(DDGLPAGE)+1
	S DDGLPSTR=DDGLDT_"    Page: "_DDGLPAGE
	S DDGLCOL=IOM-$L(DDGLPSTR)-1
	W DDGLHDR
	W:$X+2'<DDGLCOL !
	W ?DDGLCOL,DDGLPSTR
	W !,$TR($J("",IOM-1)," ","-")
	Q
	;
YNREAD(DDGLPROM,DDGLDEF)	;Issue a Yes/No Read
	N DIR,DTOUT,DUOUT,DIRUT,DIROUT,X,Y
	S DIR(0)="Y"
	S DIR("B")=$S("Ny"[$E($G(DDGLDEF)):"NO",1:"YES")
	S:$G(DDGLPROM)]"" DIR("A")=DDGLPROM
	D ^DIR
	Q $S($D(DIRUT):-1,1:Y)
	;
FORMAT(DDGLREF,DDGLZN,DDGLFLAG)	;Use ^DIWP to format the text
	N DIWL,DIWR,DIWF,X
	K ^UTILITY($J,"W")
	S DIWL=1,DIWR=IOM-1,DIWF=$E("N",DDGLFLAG["N")
	S DDGLI=0 F  S DDGLI=$O(@DDGLREF@(DDGLI)) Q:'DDGLI  D
	. S X=$S($G(DDGLZN):@DDGLREF@(DDGLI,0),1:$G(@DDGLREF@(DDGLI)))
	. D ^DIWP
	Q
	;
FINISH(DDGLMSG)	;Print message and reset terminal characteristics
	W:$G(DDGLMSG)]"" !,DDGLMSG
	H 2
	;
	;Reset terminal characteristics for screen handling
	X DDGLZOSF("EOFF"),DDGLZOSF("TRMON")
	S X=0 X DDGLZOSF("RM")
	W $P(DDGLVID,DDGLDEL,8)
	Q
