DMLAI003	; ; 06-DEC-2012
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	Q:'DIFQ(.85)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY("KX",$J,"IX",.85,.85,"E",11.1,0)
	;;=^.114IA^1^1
	;;^UTILITY("KX",$J,"IX",.85,.85,"E",11.1,1,0)
	;;=1^F^.85^.05^^1^F
	;;^UTILITY("KX",$J,"KEY",.85,.85,"A",0)
	;;=.85^A^P^1046
	;;^UTILITY("KX",$J,"KEY",.85,.85,"A",2,0)
	;;=^.312IA^1^1
	;;^UTILITY("KX",$J,"KEY",.85,.85,"A",2,1,0)
	;;=.01^.85^1
	;;^UTILITY("KX",$J,"KEY",.85,.85,"B",0)
	;;=.85^B^S^1048
	;;^UTILITY("KX",$J,"KEY",.85,.85,"B",2,0)
	;;=^.312IA^1^1
	;;^UTILITY("KX",$J,"KEY",.85,.85,"B",2,1,0)
	;;=.03^.85^1
	;;^UTILITY("KX",$J,"KEYPTR",.85,.85,"A")
	;;=.85^B
	;;^UTILITY("KX",$J,"KEYPTR",.85,.85,"B")
	;;=.85^D
