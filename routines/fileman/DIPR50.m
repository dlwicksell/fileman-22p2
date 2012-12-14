DIPR50	;SFCIOFO/S0,TKW-FIX DUPLICATE 'NM' NODES ; 31 Jul 98  12:24 PM
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
	S X="File/Subfile: "_DDFILE_" has duplicate 'NM' nodes." D MES^XPDUTL(X)
	S DDNEW=$S($D(^DIC(DDFILE,0))#2:$P(^(0),U),1:$P(^DD(DDFILE,0)," SUB-FIELD"))
	Q:DDNEW=""
	K ^DD(DDFILE,0,"NM")
	S ^DD(DDFILE,0,"NM",DDNEW)=""
	D MES^XPDUTL($J("",5)_"Duplicate 'NM' node(s) were deleted and fixed.")
	Q
