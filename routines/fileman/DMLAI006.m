DMLAI006 ; ; 20-NOV-2012 ; 11/20/12 1:06pm
 ;;22.2;LANGUAGE FILE INITS;;NOV 20, 2012
 I DSEC F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
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
