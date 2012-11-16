xwLogin ;FWSLC/DLW-EWD/ExtJS 4.x Utilities; 11/16/12 3:00pm
 ;;0.1;EWD UTILS;****LOCL RTN**;
 ;
 ; Written by David Wicksell <dlw@linux.com>
 ; Copyright © 2010 Fourth Watch Software, LC
 ; 
 ; This program is free software: you can redistribute it and/or modify
 ; it under the terms of the GNU Affero General Public License (AGPL)
 ; as published by the Free Software Foundation, either version 3 of
 ; the License, or (at your option) any later version.
 ; 
 ; This program is distributed in the hope that it will be useful,
 ; but WITHOUT ANY WARRANTY; without even the implied warranty of
 ; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 ; GNU Affero General Public License for more details.
 ;
 ; You should have received a copy of the GNU Affero General Public License
 ; along with this program. If not, see http://www.gnu.org/licenses/.
 ;
 ; Utilities to allow EWD to be a front end for VISTA
 ;
 ;
init(sessid) ;Initialize an EWD/Redirect session
 ;s userName=$p(^VA(200,DUZ,0),"^")
 ;s displayName=$p(userName,",",2)_" "_$p(userName,",")
 ;;
 ;d setSessionValue^%zewdAPI("DUZ",DUZ,sessid)
 ;d setSessionValue^%zewdAPI("userName",userName,sessid)
 ;d setSessionValue^%zewdAPI("displayName",displayName,sessid)
 ;d setSessionValue^%zewdAPI("DFN",DFN,sessid)
 ;d setSessionValue^%zewdAPI("nextPage","portal",sessid)
 ;q ""
 ;
login(sessid) ;Durable EWD/Sencha VISTA access script
 ;Added a bit more smarts to it, it now deals with inactive or disabled users
 ;Still more work to be done, however
 n U s U="^"
 n X d NOW^%DTC s DT=X
 n IO,IOF,IOM,ION,IOS,IOSL,IOST,IOT,POP
 s (IO,IO(0),IOF,IOM,ION,IOS,IOSL,IOST,IOT)="",POP=0
 ;Look at calling DT^DICRW to set up this environment by hand
 ;DIQUIET=1 before 
 ;
 n accessCode s accessCode=$$getRequestValue^%zewdAPI("accessCode",sessid)
 ;Sam recommends using the dialog file, rather than hard coding the strings
 q:accessCode="" "Please enter your Access Code"
 ;
 n verifyCode s verifyCode=$$getRequestValue^%zewdAPI("verifyCode",sessid)
 q:verifyCode="" "Please enter your Verify Code"
 n AccVer s AccVer=accessCode_";"_verifyCode,AccVer=$$ENCRYP^XUSRB1(AccVer)
 ;
 d SETUP^XUSRB()
 n DUZ,user d VALIDAV^XUSRB(.user,AccVer)
 s DUZCode=user(0)
 ;
 n termReason s termReason=""
 ;Termination reason
 i 'DUZCode,$G(DUZ) s termReason=": "_$$GET1^DIQ(200,DUZ_",",9.4)
 q:'DUZCode user(3)_termReason
 ;
 n userName,displayName
 s userName=$p(^VA(200,DUZCode,0),U)
 s displayName=$p(userName,",",2)_" "_$p(userName,",")
 ;
 ;Sam and Rick recommend passing DUZCode array, rather than scalar
 d setSessionValue^%zewdAPI("DUZ",DUZCode,sessid)
 d setSessionValue^%zewdAPI("userName",userName,sessid)
 d setSessionValue^%zewdAPI("displayName",displayName,sessid)
 q ""
 ;
error ;Call the VISTA error trap and then display the error on the screen
 s $zt="h" ;If we have an error in here, abandon all hope and kill the process
 d ^%ZTER ;VISTA error trap
 zg $zl:prePageError^%zewdPHP ;EWD prePage error trap
 q  ;We'll never get here
 ;
