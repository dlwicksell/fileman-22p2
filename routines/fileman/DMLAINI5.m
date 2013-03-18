DMLAINI5	; ; 06-DEC-2012
	;;22.2V2;VA FILEMAN;;Mar 08, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	K ^UTILITY("DIF",$J) S DIFRDIFI=1 F I=1:1:2 S ^UTILITY("DIF",$J,DIFRDIFI)=$T(IXF+I),DIFRDIFI=DIFRDIFI+1
	Q
IXF	;;
	;;.85I;LANGUAGE;^DI(.85,;0;y;y;;n;;;y;o;n
	;;
