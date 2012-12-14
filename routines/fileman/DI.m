DI	;SFISC/GFT-DIRECT ENTRY TO VA FILEMAN ;2OCT2012
V	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
	G QQ:$G(^DI(.84,0))']""
C	G QQ:$G(^DI(.84,0))']"" K (DTIME,DUZ) G ^DII
D	G QQ:$G(^DI(.84,0))']"" G ^DII
P	G QQ:$G(^DI(.84,0))']"" K (DTIME,DUZ)
Q	G QQ:$G(^DI(.84,0))']"" S DUZ(0)="@" G ^DII
VERSION	;
	S VERSION=$P($T(V),";",3),X=$P($T(V),";",4)_" "_VERSION Q
	;
QQ	;
	W $C(7),!!,"You must run ^DINIT first."
	Q
