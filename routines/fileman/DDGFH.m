DDGFH	;SFISC/MKO-HELP SCREENS ;09:20 AM  7 Jul 1994
	;;22.2V2;VA FILEMAN;;Mar 08, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
HLP	;Print help screens, refresh screen
	D HLP^DDGLIBH(9251,9259,"DDGFH")
	D REFRESH^DDGF,RC(DY,DX)
	Q
	;
RC(DDGFY,DDGFX)	;Update status line, reset DX and DY, move cursor
	N DDGFS
	I DDGFR D
	. S DY=IOSL-6,DX=IOM-9,DDGFS="R"_(DDGFY+1)_",C"_(DDGFX+1)
	. X IOXY W DDGFS_$J("",7-$L(DDGFS))
	S DY=DDGFY,DX=DDGFX X IOXY
	Q
