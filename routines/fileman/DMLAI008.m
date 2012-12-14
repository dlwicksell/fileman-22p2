DMLAI008	; ; 06-DEC-2012
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	I DSEC F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^DIC(.85,0,"AUDIT")
	;;=
	;;^DIC(.85,0,"DD")
	;;=^
	;;^DIC(.85,0,"DEL")
	;;=^
	;;^DIC(.85,0,"LAYGO")
	;;=^
	;;^DIC(.85,0,"RD")
	;;=
	;;^DIC(.85,0,"WR")
	;;=^
