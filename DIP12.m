DIP12 ;SFISC/TKW-PROCESS FROM-TO (CONT.) ;08:02 PM  9 Dec 2002
 ;;22.0;VA FileMan;**97,999**;Mar 30, 1999
OPT ;Build code to extract field & test sort criteria, build sort description.
 N S,F,X,%,F1,F2,F3,T1,T2,T3,N,DIRANGE
 S S=$P(DPP(DJ),U),F=$P(DPP(DJ),U,2),N=$P(DPP(DJ),U,3) S:N["""" N=$$CONVQQ^DILIBF(N),DIRANGE=""
 S X="DISX("_DJ_")",DPP(DJ,"GET")=""
EGP I +$P(S,"E")=S,F D GET^DIOU(S,F,X,.%) S DPP(DJ,"GET")=% I N=$P($G(^DD(S,F,0)),U) S %=$$LABEL^DIALOGZ(S,F) I %]"" S DPP(DJ,"LANG")=N,(DPP(DJ,"LANG",+$G(DUZ("LANG"))),N)=%,$P(DPP(DJ),U,3)=N ;**CCO/NI FIELD LABEL
 I $D(DPP(DJ,"CM")) S DPP(DJ,"GET")=DPP(DJ,"CM")
 I $G(DPP(DJ,"SRTTXT"))="SORT" S DPP(DJ,"GET")=DPP(DJ,"GET")_" S:"_X_"]"""" "_X_"="_""" ""_"_X
 I +$P(S,"E")=S,F,$P(DPP(DJ),U,10)=2 D
 . N % S %=$P($G(^DD(S,F,0)),U,2) I %'["C",%'["N" Q
 . S DPP(DJ,"GET")=DPP(DJ,"GET")_" S:"_X_"]"""" "_X_"=+"_X
 . Q
 I $P(DPP(DJ),U,4)["@B" S %=X,DPP(DJ,"TXT")=N G O2
 I S,F=0 D BIJ^DIOU(S,.01,.%,.F) S X="D"_$G(%(S)) K %,F
NOTNULL I '$D(DPP(DJ,"F")) S %=$$NULL^DIOC(X,"'"),DPP(DJ,"TXT")=$$EZBLD^DIALOG(7093,N) G O2 ;**CCO/NI 'NOT NULL'
RANGE D FT S DIRANGE="" S:$G(DPP(DJ,"SRTTXT"))="RANGE" DIRANGE=""" ""_"
 S %=""
 I F1="?z" D  G O2
ALL . I T1="z" S %="1",DPP(DJ,"TXT")="All "_N_$$EZBLD^DIALOG(7094) Q  ;**CCO/NI  'INCLUDES NULLS'
NULL . I T1="@" S %=$$NULL^DIOC(X),DPP(DJ,"TXT")=$$EZBLD^DIALOG(7092,N) Q  ;**CCO/NI 'IS NULL'
 . S %=$$AFT^DIOC(DIRANGE_X,T1,"'")
NULLPLUS . S DPP(DJ,"TXT")=N_$S(T3]"":" to "_T3,1:"")_$$EZBLD^DIALOG(7094) ;**CCO/NI 'INCLUDES NULLS'
 . Q
 S DPP(DJ,"TXT")=N_$S(F3]"":" from "_F3,1:"")
 I T1="@"!(T1="z") D  G O2
 . S %="" I T1="@" S DPP(DJ,"TXT")=DPP(DJ,"TXT")_$$EZBLD^DIALOG(7094),%=$$NULL^DIOC(X)_"!("
 . S %=%_$$AFT^DIOC(DIRANGE_X,F1) S:T1="@" %=%_")"
 . Q
 I F3]"",F3=T3 S %=$$EQ^DIOC(X,T1),DPP(DJ,"TXT")=N_" equals "_F3 G O2
 S %=$$BTWI^DIOC(DIRANGE_X,F1,T1,"","SORT")
 I T3]"" S DPP(DJ,"TXT")=DPP(DJ,"TXT")_" to "_T3
O2 S DPP(DJ,"QCON")="I "_%
 K DITYP Q
 ;
FT ;ALSO CALLED BY DIP1
 S %=$G(DPP(DJ,"F")) I %="" S %=$G(DIPP(+$G(DIJ),"F"))
 S F1=$P(%,U),F2=$P(%,U,2),F3=$P(%,U,3) S:F3="" F3=F2 S:$E(F1)="""" F1=""""_F1
 S %=$G(DPP(DJ,"T")) I %="" S %=$G(DIPP(+$G(DIJ),"T"))
 S T1=$P(%,U),T2=$P(%,U,2),T3=$P(%,U,3) S:T3="" T3=T2
 Q 
 ;
CK ;VALIDATE FIELDS/DATA
 G QQ:X[U I X="@" S Y=X K DPP(DJ,"IX"),DPP(DJ,"PTRIX") Q
 I DITYP=1 D  G:Y=-1 QQ Q  ;**CCO/NI   ASK FOR A DATE
 .N %DT S %DT=""
 .S:$G(DITYP("D"))["T" %DT="T"
 .S:$G(DITYP("D"))["S" %DT=%DT_"S"
 .S %DT=%DT_$E("E",(DIFRTO="?"))
 .D ^%DT I Y>0 D  S Y(0)=%DT
 ..S %DT=Y N Y S Y=%DT X ^DD("DD") S %DT=Y
 I DITYP=3 D  G:Y=-1 QQ Q  ;**CCO/NI  ASK FOR A 'SET' VALUE
 . S Y=$G(DITYP("S","E",X)) I Y]"" S Y(0)=Y_" ("_X_")" W:DIFRTO="?" "    ",$$EZBLD^DIALOG(8146,Y) Q  ;**CCO/NI
 . I $D(DITYP("S","I",X)) S Y=X,Y(0)=X_" ("_DITYP("S","I",X)_")" W:DIFRTO="?" "  "_DITYP("S","I",X) Q
 . S D=$O(DITYP("S","E",X)) I D]"",$P(D,X)="" S Y=DITYP("S","E",D),Y(0)=Y_" ("_D_")" W:DIFRTO="?" $P(D,X,2,9)_"    ",$$EZBLD^DIALOG(8146,Y) Q  ;**CCO/NI 'USES INTERNAL CODE SUCH&SUCH'
 . I DIFRTO'="?" S Y=X Q
 . S Y=-1 Q
 I +$P(X,"E")=X!(DITYP'=2) S Y=X Q
QQ S Y=-1 D  Q:$G(DIQUIET)
 .N I S I(1)=X,I(2)=$P($G(^DI(.81,DITYP,0)),U),DIERR=$$EZBLD^DIALOG(330,.I) ;*CCO/NI 'INVALID ENTRY'
 W $C(7),"??",!?8,DIERR Q
