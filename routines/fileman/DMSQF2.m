DMSQF2	;SFISC/JHM-BUILD INDEX AND PARENT FOREIGN KEYS ;7/28/97  11:10
	;;22.2T0;VA FILEMAN;;Dec 03, 2012
	;Per VHA Directive 10-93-142, this routine should not be modified.
	Q
PFK(TI)	;BUILD FOREIGN KEYS FOR PARENT TABLES
	N T,GL,FL,PEI,S,TE,TC
	D INIT F I=1:1:$O(TE(""),-1)-1 D BFK(I)
	Q
BFK(L)	;BUILD A LEVEL L FOREIGN KEY FOR TABLE PRIMARY KEYS
	N I,FF,FTI,FT,FTN,FKN,FPEI,FPE,IEN,TT,FDA,ERR,FIEN,PI
	S FF=$P(FL,",",L),FTI=$O(^DMSQ("T","C",FF,"")) Q:FTI=""
	S FT=^DMSQ("T",FTI,0),FTN=$P(FT,U),FKN=FTN_"_PFK"
	S FPEI=$O(^DMSQ("E","F",FTI,"P","")) Q:FPEI=""
	S FPE=^DMSQ("E",FPEI,0),FDI=$P(FPE,U,2)
	;BUILD FOREIGN KEY TABLE ELEMENT
	S IEN=$O(^DMSQ("E","G",TI,FKN,"")),TT=1.5216,IEN=$S(IEN:IEN,1:"+1")_","
	S FDA(TT,IEN,.01)=FKN ; FOREIGN KEY NAME
	S FDA(TT,IEN,1)=FDI ; DOMAIN OF FOREIGN TABLE
	S FDA(TT,IEN,2)=TI ; FOREIGN KEY IS IN THIS TABLE
	S FDA(TT,IEN,3)="F" ; TYPE F FOR FOREIGN KEY
	S FDA(TT,IEN,4)="Foreign key to ancestor "_FTN ; COMMENT
	S FIEN=$$PUT^DMSQU(IEN,"FDA","ERR")
	I $D(ERR)!'FIEN D ERR^DMSQU(F,L,"FOREIGN KEY: ANCESTOR FOREIGN KEY INSERT FAILED") Q
	S (IENL,FKI)=""
	F I=1:1:L S FKI=$O(^DMSQ("F","B",FIEN,FKI)) Q:FKI=""  D
	. S $P(IENL,U,I)=FKI
	F I=1:1:L D BFKI(I)
	Q
BFKI(L)	;BUILD FOREIGN KEY COLUMN ELEMENT
	S CEI=$P(TC(L),U),CI=$O(^DMSQ("C","B",CEI,""))
	I 'CI D ERR^DMSQU(F,L,"FOREIGN KEY: NO POINTED-TO COLUMN AT LEVEL") Q
	S PI=$O(^DMSQ("P","C",FPEI,L,""))
	I 'PI D ERR^DMSQU(F,L,"FOREIGN KEY: NO ANCESTOR PRIMARY KEY") Q
	;BUILD FK COLUMN
	S FI=$P(IENL,U,I),TT=1.5219,IEN=$S(FI:FI,1:"+1")_","
	S FDA(TT,IEN,.01)=FIEN ; FK TABLE ELEMENT ID
	S FDA(TT,IEN,1)=PI ; FOREIGN PRIMARY KEY ID
	S FDA(TT,IEN,2)=CI ; LOCAL PRIMARY KEY COLUMN ID
	S FI=$$PUT^DMSQU(IEN,"FDA","ERR")
	I $D(ERR)!'FI D ERR^DMSQU(F,L,"FOREIGN KEY: ANCESTOR FOREIGN KEY COLUMN INSERT FAILED")
	Q
INIT	;SET PRIMARY KEY VARIABLES FOR TABLE TI
	N S,P,PI,K,KCI,KC,PEI
	S S=0,T=^DMSQ("T",TI,0),GL=^(1),(F,P,FL)=$P(T,U,7)
	F  S P=$G(^DD(P,0,"UP")) Q:P=""  S FL=P_","_FL
	S PEI=$O(^DMSQ("E","F",TI,"P","")),PI=""
	F  S PI=$O(^DMSQ("P","B",PEI,PI)) Q:PI=""  D
	. S K=^DMSQ("P",PI,0),S=$P(K,U,3),KCI=$P(K,U,2),KC=^DMSQ("C",KCI,0)
	. S TE(S)=$P(^DMSQ("E",$P(KC,U),0),U,1,2),TC(S)=KC
	Q
INDEX(TI)	;BUILD ALL REGULAR INDICIES FOR TABLE TI
	I '$G(DIFM) D ENV^DMSQU
	N T,GL,FL,PI,K,TE,TC,KC,KCI,IN,FI,CI,IC,IE,I,IF,IX,C,CEI,L,TN,CN,INM,IEI,IEN,FDA,ERR,TIEN,PIEN,DIEN,CIEN
	D INIT S FI=0
FI	S FI=$O(^DD(F,FI)) Q:'FI  S IN=0
IN	S IN=$O(^DD(F,FI,1,IN)) G FI:'IN D IDX(F,FI,IN,.TC,.TE) G IN
	;
IDX(F,FI,IN,TC,TE)	;BUILD INDEX
	N P,S,IGL,IC,IE,I,IF,IX,CI,ITI,CEI,CE,L,TN,GF,INM1,INM2,TN1,TN2
	S I=$G(^DD(F,FI,1,IN,0)) I $P(I,U,3)]"" Q
	I I="" D ERR^DMSQU(F,FI,"INDEX: MISSING DATA DICTIONARY DATA") Q
	S IF=+I,IX=$P(I,U,2) I IX=""!'IF Q
	I $G(^DD(F,FI,1,IN,1))'[",DA)" D  Q
	. D ERR^DMSQU(F,FI,"INDEX: IRREGULAR FORMAT")
	S CI=$O(^DMSQ("C","D",F,FI,"")),ITI=$$T(IF)
	I 'CI D ERR^DMSQU(F,FI,"INDEX: NO ASSOCIATED COLUMN RECORD") Q
	F L=$L(FL,","):-1:1 Q:$P(FL,",",L)=IF
	M IC=TC,IE=TE
	S C=^DMSQ("C",CI,0),CEI=$P(C,U),CE=^DMSQ("E",CEI,0)
	S IC(L-.5)=C,IE(L-.5)=CE
	;S TN=$P(T,U),CN=$P(CE,U),INM=$$SQLI^DMSQU(TN_"_X"_IX_"_"_CN,30)
	S TN=$P(T,U),TN1=$E(TN,1,$L(TN)-1),TN2=$E(TN,$L(TN)),CN=$P(CE,U)
	S INM1=$$SQLI^DMSQU(TN1,18),INM2=$$SQLI^DMSQU("X"_IX_"_"_CN,10)
	S INM=INM1_TN2_"_"_INM2
	S IGL=GL,GF=$P(IGL,"{K}",L)_$C(34)_IX_$C(34)_",{K},"
	S $P(IGL,"{K}",L)=GF F I=L+1:1:$L(GL,"{K}") S $P(IGL,"{K}",I)=","
	S IEI=$O(^DMSQ("T","B",INM,""))
	;BUILD TABLE
	S TT=1.5215,IEN=$S(IEI:IEI,1:"+1")_","
	S FDA(TT,IEN,.01)=INM ; INDEX TABLE NAME
	S FDA(TT,IEN,1)=1 ; SCHEMA SQLI
	S FDA(TT,IEN,2)="Index of "_TN_" by "_CN ;COMMENT
	S FDA(TT,IEN,3)=TI ; MASTER TABLE ID
	S FDA(TT,IEN,4)=1 ; VERSION NUMBER
	S FDA(TT,IEN,7)=DT ; UPDATE DATE
	S FDA(TT,IEN,8)=IGL ; GLOBAL NAME
	S TIEN=$$PUT^DMSQU(IEN,"FDA","ERR")
	I $D(ERR) D ERR^DMSQU(F,FI,"INDEX: TABLE INSERT FAILED") Q
	S DIEN=$O(^DMSQ("DM","C",TIEN,""))
	; BUILD TABLE DOMAIN
	S TT=1.5212,IEN=$S(DIEN:DIEN,1:"+1")_","
	S FDA(TT,IEN,.01)=$$SQLI^DMSQU(INM_"_ID",30) ; DOMAIN NAME
	S FDA(TT,IEN,1)=1 ; TYPE = PRIMARY KEY
	S FDA(TT,IEN,2)="Domain of table "_INM ; COMMENT
	S FDA(TT,IEN,3)=TIEN ; TABLE ID
	S DIEN=$$PUT^DMSQU(IEN,"FDA","ERR")
	I $D(ERR) D ERR^DMSQU(F,FI,"INDEX: TABLE DOMAIN INSERT FAILED") Q
	S PIEN=$O(^DMSQ("E","F",TIEN,"P",""))
	;BUILD PRIMARY KEY HEADER ELEMENT
	S TT=1.5216,IEN=$S(PIEN:PIEN,1:"+1")_","
	S FDA(TT,IEN,.01)=$$SQLI^DMSQU(INM_"_PK",30) ; PRIMARY KEY NAME
	S FDA(TT,IEN,1)=DIEN ; TABLE DOMAIN
	S FDA(TT,IEN,2)=TIEN ; TABLE ID
	S FDA(TT,IEN,3)="P" ; TYPE = P FOR PRIMARY KEY
	S FDA(TT,IEN,4)="Primary key header for "_INM ; COMMENT
	S PIEN=$$PUT^DMSQU(IEN,"FDA","ERR")
	I $D(ERR) D ERR^DMSQU(F,FI,"INDEX: PRIMARY KEY ELEMENT INSERT FAILED") Q
	S S=0,(K,P)="" F  S K=$O(IE(K)) Q:K=""  D
	. S S=S+1 D PKI(S,PIEN,$P(IGL,"{K}",S),IE(K),IC(K),.P)
	Q
PKI(S,PEI,G,E,C,P)	;BUILD COLUMN ELEMENT, COLUMN AND PRIMARY KEY ELEMENT
	N ICN,CI,CEI,PI,W,KFI S (CI,CEI,PI,KFI)="",W=$P(C,U,2)
	I W>30 S KFI=$O(^DMSQ("KF","B","LONG_CHARACTER",""))
	S PI=$O(^DMSQ("P","C",PEI,S,""))
	I PI S CI=$P($G(^DMSQ("P",PI,0)),U,2)
	I CI S CEI=$P($G(^DMSQ("C",CI,0)),U)
	S ICN=$P(E,U)
	;BUILD COLUMN ELEMENT
	S TT=1.5216,IEN=$S(CEI:CEI,1:"+1")_","
	S FDA(TT,IEN,.01)=ICN ; COLUMN NAME
	S FDA(TT,IEN,1)=$P(E,U,2) ; DOMAIN ID
	S FDA(TT,IEN,2)=TIEN ; TABLE ID
	S FDA(TT,IEN,3)="C" ; TYPE = COLUMN
	S FDA(TT,IEN,4)="Index Primary Key #"_S_" for "_INM_"."_ICN
	S CEI=$$PUT^DMSQU(IEN,"FDA","ERR")
	I $D(ERR)!'CEI D ERR^DMSQU(F,FI,"INDEX: COLUMN ELEMENT INSERT FAILED") Q
	;BUILD COLUMN
	S TT=1.5217,IEN=$S(CI:CI,1:"+1")_","
	S FDA(TT,IEN,.01)=CEI ; COLUMN ELEMENT ID
	I P S FDA(TT,IEN,8)=P ; PARENT POINTER
	S FDA(TT,IEN,9)=G ; GLOBAL FRAGMENT
	S CI=$$PUT^DMSQU(IEN,"FDA","ERR")
	I $D(ERR)!'CI D ERR^DMSQU(F,FI,"INDEX: COLUMN INSERT FAILED")
	;BUILD PRIMARY KEY
	S TT=1.5218,IEN=$S(PI:PI,1:"+1")_","
	S FDA(TT,IEN,.01)=PEI ; PRIMARY KEY HEADER ID
	S FDA(TT,IEN,1)=CI ; COLUMN ID
	S FDA(TT,IEN,2)=S ; KEY SEQUENCE
	I KFI S FDA(TT,IEN,7)=KFI ; KEY FORMAT
	S PI=$$PUT^DMSQU(IEN,"FDA","ERR")
	I $D(ERR)!'PI D ERR^DMSQU(F,FI,"INDEX: PRIMARY KEY INSERT FAILED")
	S P=CI
	Q
T(F)	Q $O(^DMSQ("T","C",F,""))
