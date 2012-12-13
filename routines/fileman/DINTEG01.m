DINTEG01	;ISC/XTSUMBLD KERNEL - Package checksum checker ;3121212.184524
	;;0.0;
	;;7.3;3121212.184524
	S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT	F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
	G CONT^DINTEG02
	K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE	S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
	W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
	W ! G CONT
ROU	;;
DIEVS	;;2361740
DIEZ	;;10335535
DIEZ0	;;11969014
DIEZ1	;;9399279
DIEZ2	;;15888961
DIEZ3	;;1411089
DIEZ4	;;4949942
DIFG	;;9620802
DIFG0	;;9271581
DIFG0A	;;4953135
DIFG0B	;;3277889
DIFG1	;;6466432
DIFG2	;;6268614
DIFG3	;;11191749
DIFG3A	;;5426591
DIFG4	;;11076453
DIFG4A	;;4158452
DIFG5	;;11716060
DIFG6	;;12531183
DIFG7	;;3502068
DIFGA	;;10149588
DIFGA1	;;1674663
DIFGB	;;7602021
DIFGG	;;5089070
DIFGG2	;;9806486
DIFGG4	;;5207113
DIFGGI	;;5710645
DIFGGSB	;;483886
DIFGGSB1	;;8206690
DIFGGSB2	;;5150555
DIFGGU	;;5525512
DIFGO	;;3226616
DIFGSRV	;;1145738
DIFROM	;;11032661
DIFROM0	;;9499981
DIFROM1	;;12432103
DIFROM11	;;9004800
DIFROM12	;;6412655
DIFROM2	;;9418009
DIFROM3	;;7738215
DIFROM4	;;4141771
DIFROM41	;;14320255
DIFROM42	;;3818444
DIFROM5	;;13318228
DIFROM6	;;8014990
DIFROM7	;;5885905
DIFROMH	;;8930417
DIFROMH1	;;7701962
DIFROMS	;;1767005
DIFROMS1	;;7099006
DIFROMS2	;;9830153
DIFROMS3	;;8999406
DIFROMS4	;;4164646
DIFROMS5	;;4436363
DIFROMS6	;;868273
DIFROMSB	;;1316407
DIFROMSC	;;1542160
DIFROMSD	;;3813216
DIFROMSE	;;5059847
DIFROMSF	;;8096661
DIFROMSI	;;8209247
DIFROMSK	;;1707783
DIFROMSL	;;371524
DIFROMSO	;;1615788
DIFROMSP	;;7375587
DIFROMSR	;;4932510
DIFROMSS	;;3490849
DIFROMSU	;;5222720
DIFROMSV	;;89285
DIFROMSX	;;4398560
DIFROMSY	;;4367849
DIG	;;15662043
DIH	;;5663726
DII	;;7517633
DII1	;;468832
DIINI001	;;24494464
DIINI002	;;22265516
DIINI003	;;23950386
DIINI004	;;24999034
DIINI005	;;29744363
DIINI006	;;20204779
DIINIS	;;2127703
DIINIT	;;10270984
DIINIT1	;;6591924
DIINIT2	;;5232051
DIINIT3	;;16989229
DIINIT4	;;3363161
DIINIT5	;;364747
DIIS	;;417740
DIISC	;;7520
DIISS	;;2408793
DIK	;;15947474
DIK1	;;7678804
DIKC	;;12762190
DIKC1	;;4996781
DIKC2	;;5734020
DIKCBLD	;;7934562
DIKCDD	;;598101
DIKCFORM	;;11173576
DIKCP	;;4146288
DIKCP1	;;7824170
DIKCP2	;;2304021
DIKCP3	;;4532184
DIKCR	;;10409315
DIKCU	;;3210281
DIKCU1	;;3896028
DIKCU2	;;4020096
DIKCUTL	;;3445028
DIKCUTL1	;;6521169
DIKCUTL2	;;7148124
DIKCUTL3	;;7743356
DIKD	;;3791818
DIKD1	;;2907868
DIKD2	;;2209576
DIKK	;;8668460
DIKK1	;;2999261
DIKK2	;;7020127
DIKKDD	;;619322
DIKKFORM	;;4020610
DIKKP	;;4960174
DIKKUTL	;;8683522
DIKKUTL1	;;7444359
DIKKUTL2	;;3321012
DIKKUTL3	;;5832605
DIKKUTL4	;;5542445
DIKZ	;;10440605
DIKZ0	;;10502041
DIKZ1	;;9595553
DIKZ11	;;4558086
DIKZ2	;;5244243
DIL	;;5906383
DIL0	;;6316517
DIL1	;;5786492
DIL11	;;6690394
DIL2	;;8492299
DILF	;;2353909
DILFD	;;231253
DILIBF	;;7332737
DILL	;;6979553
DIM	;;2383633
DIM1	;;6143520
DIM2	;;4719801
DIM3	;;4402867
DIM4	;;3292224
DINIT	;;17645149
DINIT0	;;6843141
DINIT001	;;14519921
DINIT002	;;13586309
DINIT003	;;1581370
DINIT004	;;11018014
DINIT005	;;10186263
DINIT006	;;11577960
DINIT007	;;10157790
DINIT008	;;10934076
DINIT009	;;10025795
DINIT00A	;;10964723
DINIT00B	;;10114739
DINIT00C	;;11848580
DINIT00D	;;9602595
DINIT00E	;;9691716
DINIT00F	;;10461606
DINIT00G	;;11627134
DINIT00H	;;8865487
DINIT00I	;;8471256
DINIT00J	;;7135523