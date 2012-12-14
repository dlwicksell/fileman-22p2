DIPR50W	;SFCIOFO/S0,TKW-REPORT DUPLICATE 'NM' NODES ;8/5/98  08:30
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	N DDFILE S DDFILE=1.99999
	;
FIX	; FIX DUPLICATE 'NM' NODES
	N DDNAME,DDNEW
	F  S DDFILE=$O(^DD(DDFILE)) Q:'DDFILE  D CHK
	Q
	;
CHK	; Check and repair duplicate "NM" nodes
	S DDNAME=$O(^DD(DDFILE,0,"NM","")) Q:DDNAME=""
	I $O(^DD(DDFILE,0,"NM",DDNAME))="" Q
	W !!,"File/Subfile: "_DDFILE_" has duplicate 'NM' nodes."
	W !?5,"Duplicate name: "_DDNAME F  S DDNAME=$O(^DD(DDFILE,0,"NM",DDNAME)) Q:DDNAME=""  W !?5,"Duplicate name: "_DDNAME
	S DDNEW=$S($D(^DIC(DDFILE,0))#2:$P(^(0),U),1:$P(^DD(DDFILE,0)," SUB-FIELD"))
	Q:DDNEW=""
	W !?8,"=>'NM' node will be set to: "_DDNEW
	Q
