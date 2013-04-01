xwLogin ;VEN/DPR & V4W/DLW - EWD/ExtJS Utilities ;2013-03-31  8:24 PM
 ;;0.1.0;EWD Utils;****LOCL RTN**;
 ;
 ; Written by DP Roberts <rdreadpirate@gmail.com>
 ;         and David Wicksell <dlw@linux.com>
 ; Copyright © 2012,2013 VISTA Expertise Network and Fourth Watch Software
 ;
 ; Licensed under the Apache License, Version 2.0 (the "License");
 ; you may not use this file except in compliance with the License.
 ; You may obtain a copy of the License at
 ;
 ;     http://www.apache.org/licenses/LICENSE-2.0
 ;
 ; Unless required by applicable law or agreed to in writing, software
 ; distributed under the License is distributed on an "AS IS" BASIS,
 ; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 ; See the License for the specific language governing permissions and
 ; limitations under the License.
 ;
 ;
login(inputs,results)
 ;
 n %,accessCode,accver,DILOCKTM,displayPersonName,DISYS,%DT,DT,DTIME,DUZ,%H
 n %I,I,IO,IOF,IOM,ION,IOS,IOSL,IOST,IOT,J,personDuz,personName
 n POP,termReason,U,user,VCC,CVMSG
 n X,XOPT,XPARSYS,XQVOL,XQXFLG,XUCI,XUDEV,XUENV,XUEOFF,XUEON
 n XUF,XUFAC,XUIOP,XUVOL,XWBSTATE,XWBTIME,Y,verifyCode
 ;
 s accessCode=$g(inputs("accessCode"))
 i accessCode="" s accessCode=$g(inputs("username"))
 i accessCode="" quit "Please enter your Access Code"
 ;
 s verifyCode=$g(inputs("verifyCode"))
 i verifyCode="" s verifyCode=$g(inputs("pwd"))
 i verifyCode="" quit "Please enter your Verify Code"
 ;
 k results
 s U="^"
 d NOW^%DTC
 s DT=X
 s (IO,IO(0),IOF,IOM,ION,IOS,IOSL,IOST,IOT)=""
 s POP=0
 ;
 s accver=accessCode_";"_verifyCode
 s accver=$$ENCRYP^XUSRB1(accver)
 d SETUP^XUSRB()
 d VALIDAV^XUSRB(.user,accver)
 s personDuz=user(0)
 ;
 ;0 = VC does not need to be changed
 ;1 = VC needs to be changed
 s VCC=$g(user(2))
 s CVMSG=$g(user(3)) ;sign in message
 ;
 ;termination reason
 s termReason=""
 i 'personDuz,$G(DUZ) s termReason=": "_$$GET1^DIQ(200,DUZ_",",9.4)
 i 'personDuz quit user(3)_termReason
 ;
 s personName=$$GET1^DIQ(200,personDuz_",",.01,"E")
 s displayPersonName=$p(personName,",",2)_" "_$p(personName,",")
 ;
 s results("DT")=DT
 s results("DUZ")=personDuz
 s results("username")=personName
 s results("displayName")=displayPersonName
 s results("greeting")=$g(user(7))
 quit ""
 ;
error ;Call the VISTA error trap and then display the error on the screen
 s $ec="" ;reset to empty to avoid infinite recursive trap
 ;
 d ^%ZTER ;VISTA error trap
 ;
 zg $zl:prePageError^%zewdPHP ;EWD prePage error trap
 ;
 quit
