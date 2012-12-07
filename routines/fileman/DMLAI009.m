DMLAI009 ; ; 06-DEC-2012
 ;;22.2T0;VA FILEMAN;;DEC 06, 2012
 F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,"SBF",.85,.85)
 ;;=
 ;;^UTILITY(U,$J,"SBF",.85,.8501)
 ;;=
 ;;^UTILITY(U,$J,"SBF",.85,.8502)
 ;;=
