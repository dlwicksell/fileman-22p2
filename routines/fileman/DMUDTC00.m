DMUDTC00 ; VEN/SMH - Unit Test Driver for %DTC Utilities; 28-DEC-2012
 ;;22.2;VA FILEMAN;;
 ;
 S IO=$PRINCIPAL
 N DIQUIET S DIQUIET=1
 D DT^DICRW
 D EN^XTMUNIT($T(+0),1)
 QUIT
 ;
 ;STARTUP  ; Not used
 ;SHUTDOWN ; Not used
 ;SETUP    ; Not used
 ;TEARDOWN ; Not used
 ;
%DTC ; @TEST - %DTC - Returns the number of days between two dates
 ; Input: X1 and X2
 ; Output: X (days difference) and %Y (1=valid dates; 0=invalid dates)
 N X1,X2,X,%Y
 S X1=3101112.22,X2=3101116.08
 D ^%DTC
 D CHKEQ^XTMUNIT(X,-4,"Difference between X1=3101112.22 and X2=3101116.08 is 4 days")
 D CHKEQ^XTMUNIT(%Y,1,"Dates are supposed to be valid")
 ;
 N X1,X2,X,%Y
 S X1=3101100,X2=3101116.08
 D ^%DTC
 D CHKEQ^XTMUNIT(%Y,0,"This difference of dates is uncomputable as an inexact date is used")
 ;
 N X1,X2,X,%Y
 S X1=3001231,X2=2991231
 D ^%DTC
 D CHKEQ^XTMUNIT(X,366,"Millenium year has 366 days")
 ;
 N X1,X2,X,%Y
 S X1=3011231,X2=3001231
 D ^%DTC
 D CHKEQ^XTMUNIT(X,365,"2001 has 365 days")
 ;
 N X1,X2,X,%Y
 S X1=3041231,X2=3031231
 D ^%DTC
 D CHKEQ^XTMUNIT(X,366,"2004 has 366 days")
 ;
 N X1,X2,X,%Y
 S X1=4001231,X2=3991231
 D ^%DTC
 D CHKEQ^XTMUNIT(X,365,"2100 has 365 days")
 ;
 N X1,X2,X,%Y
 S X1=4501231,X2=2991231 ; 151 years. Check for numeric overflows.
 D ^%DTC
 D CHKEQ^XTMUNIT(X,365.24*151\1+1,"Numeric overflow")
 ;
 QUIT
 ;
C ; @TEST - C^%DTC - Adds and subtracts dates
 ; Input: X1 = Start Date, X2= Number of days to add or remove
 ; X is the output. %H -> Horolog value
 N X,X1,X2,%H
 S X1=3101229.103139,X2=-2
 D C^%DTC
 D CHKEQ^XTMUNIT(X,3101227.103139,"2 days weren't subtracted correctly")
 N LASTH S LASTH=%H
 N %H,%T,%Y
 D H^%DTC ; Input is X
 D CHKEQ^XTMUNIT(%H,LASTH,"Horolog conversion failed")
 D CHKEQ^XTMUNIT(%T,(10*60*60)+(31*60)+39,"Seconds since mid conversion failed")
 ;
 N X,X1,X2,%H
 S X1=3101229.103139,X2=3
 D C^%DTC
 D CHKEQ^XTMUNIT(X,3110101.103139,"3 days weren't added correctly")
 N LASTH S LASTH=%H
 N %H,%T,%Y
 D H^%DTC ; Input is X
 D CHKEQ^XTMUNIT(%H,LASTH,"Horolog conversion failed")
 D CHKEQ^XTMUNIT(%T,(10*60*60)+(31*60)+39,"Seconds since mid conversion failed")
 QUIT
COMMA ; @TEST - COMMA^%DTC - Format the number with a comma
 ; Input: X - Number you want to format. X2 = Number of decimal digits.
 ; Append $ to X2 to output a dollar amount.
 ; Input: X3 - Length of desired output. 12 characters if not specified.
 ; Output: X
 ;
 N X,X2,X3
 S X="123332.229" D COMMA^%DTC
 D CHKEQ^XTMUNIT($L(X),12,"Default length is wrong")
 D CHKEQ^XTMUNIT(X," 123,332.23 ","Comma value is wrong")
 ;
 N X,X2,X3
 S X="123332.229",X2=1 D COMMA^%DTC
 D CHKEQ^XTMUNIT($L(X),12,"Default length is wrong 2")
 D CHKEQ^XTMUNIT(X,"  123,332.2 ","Comma value is wrong 2")
 ;
 N X,X2,X3
 S X="123332.2291",X2="3$" D COMMA^%DTC
 D CHKEQ^XTMUNIT($L(X),13,"Default length is wrong 3")
 D CHKEQ^XTMUNIT(X,"$123,332.229 ","Comma value is wrong 3")
 ;
 N X,X2,X3
 S X="123332.2291",X2="3$",X3=15 D COMMA^%DTC
 D CHKEQ^XTMUNIT($L(X),15,"Length isn't 15")
 D CHKEQ^XTMUNIT(X,"  $123,332.229 ","Comma value is wrong 4")
 ;
 N X,X2,X3
 S X="123.22",X2="3$" D COMMA^%DTC
 D CHKEQ^XTMUNIT($L(X),12,"Default length is wrong 5")
 D CHKEQ^XTMUNIT(X,"   $123.220 ","Comma value is wrong 5")
 ;
 N X,X2,X3
 S X="ABCDEDFGHIJK",X2=1 D COMMA^%DTC
 D CHKEQ^XTMUNIT($L(X),12,"Default length is wrong 6")
 D CHKEQ^XTMUNIT(X,"        0.0 ","Comma value is wrong 6")
 QUIT
 ;
DW ; @TEST - DW^%DTC - Return the day of week
 ; Input: X - FM Date
 ; Output: %H - $H date, %T - Seconds since midnight,
 ;   %Y: Numeric Day of Week, X: Alpha day of week
 N X,%H,%T,%Y
 S X="3121228.224422" D DW^%DTC
 D CHKEQ^XTMUNIT(X,"FRIDAY","28DEC2012 is a Friday")
 D CHKEQ^XTMUNIT(%H,"62819","Horolog not correctly translated")
 D CHKEQ^XTMUNIT(%T,(22*60*60)+(44*60)+22,"Number of seconds since midnight incorrect")
 D CHKEQ^XTMUNIT(%Y,5,"Should be 5 for Friday")
 ;
 N X,%H,%T,%Y
 S X="3100000" D DW^%DTC
 D CHKEQ^XTMUNIT(X,"","Imprecise date - should be null")
 D CHKEQ^XTMUNIT(%H,"61727","Horolog not correctly translated 2")
 D CHKEQ^XTMUNIT(%T,0,"Imprecise date - seconds should be zero")
 D CHKEQ^XTMUNIT(%Y,-1,"Imprecise date - %Y should be -1")
 ;
 N X,%H,%T,%Y
 S X="ABCDEF" D DW^%DTC
 D CHKEQ^XTMUNIT(X,"","Invalid input - empty string expected")
 D CHKEQ^XTMUNIT(%H,0,"Invalid input - %H should be 0")
 D CHKEQ^XTMUNIT(%T,0,"Invalid input - %T should be 0")
 D CHKEQ^XTMUNIT(%Y,-1,"Invalid input - %Y should be -1")
 ;
 N X,%H,%T,%Y
 S X=5 D DW^%DTC
 D CHKEQ^XTMUNIT(X,"","Invalid input - empty string expected")
 D CHKEQ^XTMUNIT(%H,0,"Invalid input - %H should be 0")
 D CHKEQ^XTMUNIT(%T,0,"Invalid input - %T should be 0")
 D CHKEQ^XTMUNIT(%Y,-1,"Invalid input - %Y should be -1")
 QUIT
 ;
H ; @TEST - H^%DTC - Convert an FM Date to a $H format date/time
 ;
XTENT ; List of Unit Tests (This will be deprecated when Joel gives me the new version of the routine)
 ;;%DTC; ^%DTC - Returns the number of days between two dates
 ;;C; C^%DTC - Adds and subtracts dates
 ;;COMMA; COMMA^%DTC - Formats numbers with commas
 ;;DW; DW^%DTC - Return the day of week
 ;
INTWRAP(CMD,ARR) ; Interactive Prompt Wrapper. Write prompt to file and read back.
 ; CMD is command to execute by value
 ; ARR Return Array pass by reference. New before passing as we only add contents here.
 N F S F="test"_$J_".txt"
 D OPEN^%ZISH("FILE",$$DEFDIR^%ZISH(),F,"W") ; Write mode
 U IO
 X CMD
 D CLOSE^%ZISH("FILE")
 D OPEN^%ZISH("FILE",$$DEFDIR^%ZISH(),F,"R") ; Read mode
 U IO
 N I F I=1:1 R ARR(I):0 Q:$$STATUS^%ZISH()   ; Read until $ZEOF
 D CLOSE^%ZISH("FILE")
 N DELARR S DELARR(F)=""
 N % S %=$$DEL^%ZISH($$DEFDIR^%ZISH(),$NA(DELARR)) ; Delete file
 U $P
 QUIT
