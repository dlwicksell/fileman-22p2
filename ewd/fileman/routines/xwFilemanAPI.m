xwFilemanAPI ;VEN/DPR & V4W/DLW - EWD Fileman APIs ;2013-03-31  8:11 PM
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
checkKernel() ;check if Kernel is installed
 n check,xus
 ;
 s check=0 ;default to no kernel
 s xus=$t(+1^XUS) ;first line of XUS routine
 ;
 i $d(xus) s check=1
 ;
 quit check ;end of checkKernel
 ;
 ;
kernelFAS() ;checks Kernel File Access Security
 ;returns:
 ; 10 = Kernel File Access Security implemented
 ; 0 = Kernel File Access Security not implemented
 ;
 n kfas
 ;
 s kfas=$d(^VA(200,"AFOF"))
 ;
 quit kfas ;end of kernelFAS
 ;
 ;
getIntroMessage(introMessage) ;returns intro message for login
 ;
 d INTRO^XUSRB(.introMessage)
 ;
 quit  ;end of getIntroMessage
 ;
 ;
duzArray(inputs)
 ;
 n dilocktm,dt,dtime,DUZ,env,file,files,key,keys,lang,menu,menus
 n personClass,pm,serviceSec,serviceSecPtr,sessid,sm,U,uci,vol,X,Y
 ;
 s U="^"
 s DUZ=$g(inputs("vista.DUZ"))
 s sessid=$g(inputs("sessid"))
 ;
 d NOW^%DTC s dt=X
 d GETENV^%ZOSV
 ;
 s env=Y
 s vol=$p(env,U,2) ;volume
 s uci=$p(env,U) ;UCI
 ;
 d setSessionValue^%zewdAPI("vista.XUVOL",vol,sessid) ;volume to session
 d setSessionValue^%zewdAPI("vista.XUCI",uci,sessid) ;UCI to session
 d setSessionValue^%zewdAPI("vista.$H",$H,sessid)
 d setSessionValue^%zewdAPI("vista.$ZV",$ZV,sessid) ;version of MUMPS
 d setSessionValue^%zewdAPI("vista.U",U,sessid) ;set U in session array
 d setSessionValue^%zewdAPI("vista.$J",$J,sessid) ;set $JOB in session array
 d setSessionValue^%zewdAPI("vista.DT",dt,sessid) ;current date in FM form
 d DUZ^XUP(DUZ) ;call XUP to setup user
 ;
 s dtime=$$DTIME^XUP(DUZ) ;set DTIME for user info
 ;
 d setSessionValue^%zewdAPI("vista.DTIME",dtime,sessid) ;set DTIME in seesion
 ;
 s dilocktm=$G(^DD("DILOCKTM"),1)
 ;
 d setSessionValue^%zewdAPI("vista.DILOCKTM",dilocktm,sessid) ;DI lock timeout
 d setSessionValue^%zewdAPI("vista.DUZ(0)",$g(DUZ(0)),sessid) ;FM access
 d setSessionValue^%zewdAPI("vista.DUZ(1)",$g(DUZ(1)),sessid) ;??
 d setSessionValue^%zewdAPI("vista.DUZ(2)",$g(DUZ(2)),sessid) ;Division
 d setSessionValue^%zewdAPI("vista.DUZ(""AG"")",$g(DUZ("AG")),sessid) ;org
 ;
 ;user prefered language spoken
 s lang=$g(DUZ("LANG"))
 ;
 i '$l(lang) s lang=$$GET1^DIQ(200,DUZ_",","200.07","E",)
 ;
 d setSessionValue^%zewdAPI("vista.DUZ(""LANG"")",lang,sessid)
 ;
 ;primary menu
 s pm=+$g(^VA(200,DUZ,201)) ;pointer to option file(#19)
 s menu=$p($g(^DIC(19,pm,0)),U) ;name of menu option
 ;
 d setSessionValue^%zewdAPI("vista.primaryMenu",menu,sessid)
 ;
 ;secondary menu(s)
 s sm=""
 f i=1:1 d  q:'sm
 . s sm=$O(^VA(200,DUZ,203,"B",sm)) ;secondary menu option
 . q:'sm
 . n smenu s smenu=$p($g(^DIC(19,sm,0)),U) ;name of menu option
 . s menus(i)=smenu ;build array of secondary menus
 d mergeArrayToSession^%zewdAPI(.menus,"vista.secondaryMenu",sessid)
 ;
 ;service section
 s serviceSecPtr=$p($g(^VA(200,DUZ,5)),U) ;ptr service section(#49)
 s serviceSec=$p($g(^DIC(49,serviceSecPtr,0)),U) ;name of service section
 ;
 d setSessionValue^%zewdAPI("vista.serviceSection",serviceSec,sessid)
 ;
 ;person class
 s classIen=""
 f i=1:1  d  q:'classIen
 . s classIen=$o(^VA(200,DUZ,"USC1","B",classIen)) ;ien of person class
 . q:'classIen
 . s personClass(i)=$p($g(^USC(8932.1,classIen,0)),U)
 d mergeArrayToSession^%zewdAPI(.personClass,"vista_personClass",sessid)
 ;
 ;assigned security keys
 s key=""
 f i=1:1 d  q:'key
 . s key=$o(^VA(200,DUZ,51,"B",key)) ;pointer to key file(#19.1)
 . q:'key
 . n keyName s keyName=$p($g(^DIC(19.1,key,0)),U) ;name of key
 . s keys(i)=keyName
 d mergeArrayToSession^%zewdAPI(.keys,"vista_securityKey",sessid)
 ;
 ;assigned file acess
 s file=""
 f i=1:1 d  q:'file
 . s file=$o(^VA(200,DUZ,"FOF","B",file)) ;file number
 . q:'file
 . s files(i)=file ;build array of files
 d mergeArrayToSession^%zewdAPI(.files,"vista_fileAccess",sessid)
 ;
 quit ;end of duzArray
 ;
getFilemanMenu(diRoutine,menuList) ;build a list of Fileman menus from ^DOPT
 ;
 n menuOrder s menuOrder=0
 f  d  q:'menuOrder
 . s menuOrder=$o(^DOPT(diRoutine,menuOrder))
 . q:'menuOrder
 . n menuName s menuName=$p($g(^DOPT(diRoutine,menuOrder)),U)
 . n entyPoint s entryPoint=$p($g(^DOPT(diRoutine,menuOrder)),U,2)
 . n calledRoutine s calledRoutine=$p($g(^DOPT(diRoutine,menuOrder)),U,3)
 . s menuList(diRoutine,menuOrder)=menu
 ;
 quit  ;end of getMenus
 ;
 ;
filemanMenu(menu) ;
 ;
 ;$TEXT table from ^DII
 ;;ENTER OR EDIT FILE ENTRIES^^DIB
 ;;PRINT FILE ENTRIES^^DIP
 ;;SEARCH FILE ENTRIES^^DIS
 ;;MODIFY FILE ATTRIBUTES^^DICATT
 ;;INQUIRE TO FILE ENTRIES^INQ^DII
 ;;UTILITY FUNCTIONS^^DIU
 ;;OTHER OPTIONS^^DII1
 ;;DATA DICTIONARY UTILITIES^^DDU
 ;;TRANSFER ENTRIES^^DIT
 ;
 s menu(1,"text")="Enter or Edit File Entries"
 s menu(1,"nextPage")="fmEnterEditForm"
 s menu(1,"addTo")="westPanel"
 s menu(1,"replacePreviousPage")="true"
 s menu(1,"nvp")="item=1"
 s menu(2,"text")="Print File Entries"
 s menu(2,"nextPage")="fmPrintForm"
 s menu(2,"addTo")="westPanel"
 s menu(2,"replacePreviousPage")="true"
 s menu(2,"nvp")="item=2"
 s menu(3,"text")="Search File Entries"
 s menu(3,"nextPage")="fmSearchForm"
 s menu(3,"addTo")="westPanel"
 s menu(3,"replacePreviousPage")="true"
 s menu(3,"nvp")="item=3"
 s menu(4,"text")="Modify File Attributes"
 s menu(4,"nextPage")="fmModifyAttributesForm"
 s menu(4,"addTo")="westPanel"
 s menu(4,"replacePreviousPage")="true"
 s menu(4,"nvp")="item=4"
 s menu(5,"text")="Inquire to File Entries"
 s menu(5,"nextPage")="fmInquireForm"
 s menu(5,"addTo")="westPanel"
 s menu(5,"replacePreviousPage")="true"
 s menu(5,"nvp")="item=5"
 s menu(6,"text")="Utility Functions"
 s menu(6,"nextPage")="fmUtilityForm"
 s menu(6,"addTo")="westPanel"
 s menu(6,"replacePreviousPage")="true"
 s menu(6,"nvp")="item=6"
 s menu(7,"text")="Other Options"
 s menu(7,"nextPage")="fmOptionsForm"
 s menu(7,"addTo")="westPanel"
 s menu(7,"replacePreviousPage")="true"
 s menu(7,"nvp")="item=7"
 s menu(8,"text")="Data Dictionary Utilities"
 s menu(8,"nextPage")="fmDataDictionaryForm"
 s menu(8,"addTo")="westPanel"
 s menu(8,"replacePreviousPage")="true"
 s menu(8,"nvp")="item=8"
 s menu(9,"text")="Transfer Entries"
 s menu(9,"nextPage")="fmTransferForm"
 s menu(9,"addTo")="westPanel"
 s menu(9,"replacePreviousPage")="true"
 s menu(9,"nvp")="item=9"
 ;
 quit  ;end of buildFMMenu
 ;
getOrigMenu(sessid)
 ;
 n count,data,menuName,pageName
 s pageName=$$getSessionValue^%zewdAPI("ewd_pageName",sessid)
 d mergeArrayFromSession^%zewdAPI(.data,"filemanMenus",sessid)
 s count=0
 f  d  q:'count
 . s count=$o(data(count))
 . q:'count
 . n menuPage s menuPage=$g(data(count,"nextPage"))
 . q:menuPage'=pageName
 . s menuName=$g(data(count,"text"))
 quit menuName
 ;
 ;
list(inputs,results)
 n cnt,fileNumber,list,tempList
 s fileNumber=$g(inputs("fileNumber"))
 i 'fileNumber s fileNumber=1
 d LIST^DIC(fileNumber,"","","","","","","","","","tempList")
 m list=tempList("DILIST")
 s cnt=0
 f  d  q:'cnt
 . s cnt=$o(list(1,cnt))
 . q:'cnt
 . n name s name=$g(list(1,cnt))
 . n ien s ien=$g(list(2,cnt))
 . i fileNumber'=1&$d(list("ID",ien)) d
 . . n id s id=""
 . . n idIen s idIen=0
 . . f  d  q:'idIen
 . . . s idIen=$o(list("ID",ien,idIen))
 . . . q:'idIen
 . . . s id=id_" "_list("ID",ien,idIen)
 . . . ;DLW - Test with files 2 - numeric, 5 - numeric, 1009 - both
 . . . ;n wrId s wrId=""
 . . . ;i $d(list("ID","WRITE",ien)) d
 . . . ;. n wrIdIen s wrIdIen=0
 . . . ;. f  d  q:'wrIdIen
 . . . ;. . s wrIdIen=$o(list("ID","WRITE",ien,wrIdIen))
 . . . ;. . q:'wrIdIen
 . . . ;. . s wrId=wrId_" "_list("ID","WRITE",ien,wrIdIen)
 . . . ;s id=id_wrId
 . . . s results(cnt,"ien")=ien
 . . . s results(cnt,"name")=name_id
 . e  d
 . . s results(cnt,"ien")=ien
 . . s results(cnt,"name")=name
 quit
 ;
listFileBySecurity(inputs,results) ;user list of files by File Access Security
 ;This enty point gets called if Kernel File Access Security is implemeted.
 ;
 n count,duz,fileList,i
 s duz=$g(inputs("DUZ"))
 d LIST^DIC(200.032,","_duz_",",".01;1;2;3;4;5;6","","","","","","","","fileList")
 s count=0
 f i=1:1  d  q:'count
 . s count=$o(fileList("DILIST",1,count))
 . q:'count
 . n fileName s fileName=$g(fileList("DILIST",1,count))
 . n fileNumber s fileNumber=$g(fileList("DILIST",2,count))
 . n readAccess s readAccess=$g(fileList("DILIST","ID",count,4))
 . q:readAccess'="YES"
 . s results(i,"ien")=fileNumber
 . s results(i,"name")=fileName
 ;
 quit
 ;
getListOfRecords(filenumber,listOfRecords) ;return list of records in a file
 ;
 n list d LIST^DIC(filenumber,,,,,,,,,,.list)
 ;
 n count s count=0
 f  d  q:'count
 . s count=$o(^TMP("DILIST",$J,1,count))
 . q:'count
 . n entryName s entryName=$g(^TMP("DILIST",$J,1,count))
 . n entryIen s entryIen=$g(^TMP("DILIST",$J,2,count))
 . s listOfRecords(count)=entryName_U_entryIen
 ;
 quit  ;end of getListOfRecords
 ;
 ;
getFieldAttr(filenumber,return) ;return field level attributes for a file
 ;public;procedure;silent,clean;not sac
 ;
 ; input:
 ;   filenumber = ien of file to inspect
 ; output:
 ;   .return = output array, passed by refernce
 ;
 n attrList d FIELDLST^DID("attrList")
 n attrs s attrs=""
 n name s name=""
 f  d  q:name=""
 . s name=$o(attrList(name))
 . q:name=""
 . s attrs=attrs_";"_name
 s attrs=$e(attrs,2,$l(attrs))
 ;
 n i ;counter for return array
 n gbl s gbl=$NA(^DD(filenumber))
 n fieldnumber s fieldnumber=0
 f i=1:1 d  q:'fieldnumber
 . s fieldnumber=$o(@gbl@(fieldnumber))
 . q:'fieldnumber
 . n fieldAttr d FIELD^DID(filenumber,fieldnumber,"",attrs,"fieldAttr")
 . n attrName s attrName=""
 . f  d  q:attrName=""
 . . s attrName=$o(fieldAttr(attrName))
 . . q:attrName=""
 . . i attrName="DESCRIPTION" d
 . . . n descAttr s descAttr=0
 . . . f  d  q:'descAttr
 . . . . s descAttr=$o(fieldAttr("DESCRIPTION",descAttr))
 . . . . q:'descAttr
 . . . . n value s value=$g(fieldAttr("DESCRIPTION",descAttr))
 . . . . s return(i,fieldnumber,attrName,descAttr)=value
 . . e  d
 . . . n value s value=$g(fieldAttr(attrName))
 . . . s return(i,fieldnumber,attrName)=value
 ;
 quit  ;end of getFieldAttr
 ;
 ;
filemanVersion()
 ;
 n VERSION,X
 ;
 d VERSION^DI
 ;
 quit X
 ;
 ;
lastFile(duz)
 ;
 n lastFileName,lastFileNumber
 s lastFileNumber=$g(^DISV(duz,"^DIC("))
 s lastFileName=$$GET1^DIQ(1,lastFileNumber_",",".01","E")
 quit lastFileName
 ;
 ;
lastRecord(inputs,results)
 n fileNumber,recordIen,recordName
 ;
 s fileNumber=$g(inputs("fileNumber"))
 s duz=$g(inputs("duz"))
 s recordIen=$g(^DISV(duz,"^DIC("_fileNumber_","))
 s recordName=$$GET1^DIQ(fileNumber,recordIen_",",".01","E")
 s results("recordIen")=recordIen
 s results("recordName")=recordName
 ;
 quit
 ;
 ;
enDiq ;
 ;
 n IOST,IOSL,IOM
 ;
 s DT=$$DT^XLFDT
 s IOST="P-OTHER"
 s IOSL=999999999
 s IOM=80
 ;
 s cmd=$zcmd
 s DIC=$p(cmd," ")
 s DA=$p(cmd," ",2)
 s DIQ(0)=$p(cmd," ",3)
 ;
 d EN^DIQ
 ;
 quit
 ;
fieldList(inputs,results)
 ;
 n count,fieldList,i
 s fileNumber=$g(inputs("fileNumber"))
 d ddFieldList(fileNumber,.fieldList)
 s count=0
 f i=1:1 d  q:'count
 . s count=$o(fieldList(count))
 . q:'count
 . n fieldNumber s fieldNumber=$p(fieldList(count),U)
 . n fieldName s fieldName=$p(fieldList(count),U,2)
 . s results(i,"ien")=fieldNumber
 . s results(i,"name")=fieldName
 ;
 quit
 ;
auditDetail(inputs,results)
 ;
 n count,field,file,flag,i,ien,return
 s field=$g(inputs("fieldNumber"))
 s file=$g(inputs("fileNumber"))
 s flag=$g(inputs("flag"))
 s ien=$g(inputs("ien"))
 ;
 d AUDITDTL^DIAUTL(file,ien,field,flag,"return",)
 i '$d(return) s results(0)="" q
 s count=0
 f i=1:1  d  q:'count
 . s count=$o(return(count))
 . q:'count
 . n date s date=$g(return(count,"DATE/TIME RECORDED"))
 . n user s user=$p($g(return(count,"USER")),U)
 . n name s name=$$GET1^DIQ(200,user_",",".01","E",)
 . n option s option=$p($g(return(count,"MENU OPTION USED")),U,2)
 . s results(i)="  Created on "_date_" by User #"_user_"["_name_"] ("_option_" Option)"
 ;
 quit
 ;
formBuilder(inputs,results)
 ;
 n fieldNumber,file,fileName,fileDef,flags,in
 s file=$g(inputs("fileNumber"))
 s fileName=$$GET1^DIQ(1,file_",",.01,"E")
 ;
 s in("fileNumber")=file
 s in("attrs")="LABEL;TYPE;FIELD LENGTH;"
 d fieldAttributes(.in,.fileDef)
 ;
 s count=0
 f  d  q:'count
 . s count=$o(fileDef(count))
 . q:'count
 . n fileField s fileField=""
 . f  d  q:fileField=""
 . . s fileField=$o(fileDef(count,fileField))
 . . q:fileField=""
 . . n label s label=$g(fileDef(count,fileField,"LABEL"))
 . . n type s type=$g(fileDef(count,fileField,"TYPE"))
 . . n typeIen s typeIen=$$FIND1^DIC(8995,,"X",type,,)
 . . n labelAttr s labelAttr=$$GET1^DIQ(8995,typeIen_",",.07)
 . . n xtype s xtype=$$GET1^DIQ(8995,typeIen_",",.02)
 . . n maxAttr s maxAttr=$$GET1^DIQ(8995,typeIen_",",.03)
 . . n minAttr s minAttr=$$GET1^DIQ(8995,typeIen_",",.04)
 . . n length s length=$g(fileDef(count,fileField,"FIELD LENGTH"))
 . . s results(count,labelAttr)=label
 . . s results(count,"xtype")=xtype
 . . s results(count,"id")=$$LOW^XLFSTR($tr(label," "))
 . . s results(count,"value")="*"
 . . i maxAttr'="" d
 . . . s results(count,maxAttr)=length
 . . . s results(count,minAttr)=1
 . . i type="DATE/TIME" d
 . . . n format s format=$$GET1^DIQ(8995,typeIen_",",.05)
 . . . n submitFormat s submitFormat=$$GET1^DIQ(8995,typeIen_",",.06)
 . . . s results(count,"format")=format
 . . . s results(count,"submitFormat")=submitFormat
 s count=$o(results(""),-1),count=count+1
 s results(count,"xtype")="form"
 s results(count,"height")=250
 s results(count,"width")=400
 s results(count,"title")=fileName_" Enter/Edit Form"
 ;
 quit
 ;
ddFieldList(number,results)
 n count,field
 ;
 s field=0
 s count=0
 f  d  q:+field'>0!(field?1U.U)
 . s field=$o(^DD(number,field))
 . q:field'>0
 . n name s name=$p(^DD(number,field,0),U)
 . s count=count+1
 . s results(count)=number_";"_field_U_name
 . n multiple s multiple=+$p(^DD(number,field,0),U,2)
 . i multiple d ddFieldMultiple(multiple)
 ;
 quit
 ;
ddFieldMultiple(number)
 ;
 n field s field=0
 f  d  q:'field
 . s field=$o(^DD(number,field))
 . q:'field
 . s count=count+1
 . n name s name=$p(^DD(number,field,0),U)
 . s results(count)=number_";"_field_U_name
 . n multiple s multiple=+$p(^DD(number,field,0),U,2)
 . s count=count+1
 . i multiple d
 . . d ddFieldMultiple(multiple)
 quit
 ;
fieldAttributes(inputs,results)
 ;
 n fileNumber,fileList
 ;
 s attrs=$g(inputs("attrs"))
 s fileNumber=$g(inputs("fileNumber"))
 d ddFieldList(fileNumber,.fileList)
 ;
 i attrs="**" s attrs="" d
 . n attrList d FIELDLST^DID("attrList")
 . n attr s attr=""
 . f  d  q:attr=""
 . . s attr=$o(attrList(attr))
 . . q:attr=""
 . . s attrs=attrs_";"_attr
 . s attrs=$e(attrs,2,$l(attrs))
 ;
 n count s count=0
 f  d  q:'count
 . s count=$o(fileList(count))
 . q:'count
 . n fileField s fileField=$p($g(fileList(count)),U)
 . n file s file=$p(fileField,";")
 . n field s field=$p(fileField,";",2)
 . n list d FIELD^DID(file,field,"",attrs,"list")
 . n ddAttr s ddAttr=""
 . f  d  q:ddAttr=""
 . . s ddAttr=$o(list(ddAttr))
 . . q:ddAttr=""
 . . i ddAttr="DESCRIPTION" d
 . . . n descNum s descNum=0
 . . . f  d  q:'descNum
 . . . . s descNum=$o(list(ddAttr,descNum))
 . . . . q:'descNum
 . . . . n attrValue s attrValue=$g(list(ddAttr,descNum))
 . . . . s results(count,fileField,ddAttr,descNum)=attrValue
 . . e  d
 . . . n attrValue s attrValue=$g(list(ddAttr))
 . . . s results(count,fileField,ddAttr)=attrValue
 ;
 k attrs
 ;
 quit
 ;
globalMap(inputs,results)
 n fileNum,fldNum
 ;
 s fileNum=$g(inputs("fileNumber"))
 s fldNum=0
 ;
 f  s fldNum=$o(^DD(fileNum,fldNum)) q:+fldNum'>0!(fldNum?1U.U)  d
 . n fldName,gl,subname
 . ;
 . s fldName=$p(^DD(fileNum,fldNum,0),U)
 . s results(fileNum,fldNum,"name")=fldName
 . s gl=$p(^DD(fileNum,fldNum,0),U,4)
 . s results(fileNum,fldNum,"gl")=gl
 . s results=fileNum_","_fldNum
 . ;
 . s subNum=+$p(^DD(fileNum,fldNum,0),U,2)
 . i subNum d
 . . s results=results_","_subNum
 . . d multiple(subNum,.results)
 ;
 quit
 ;
multiple(subNum,results)
 n subFld
 ;
 s subFld=0
 f  s subFld=$o(^DD(subNum,subFld)) q:subFld'>0  d
 . n gl,number,merge,subFldName
 . ;
 . s subFldName=$p(^DD(subNum,subFld,0),U)
 . s merge(subFld,"name")=subFldName
 . s gl=$p(^DD(subNum,subFld,0),U,4)
 . s merge(subFld,"gl")=gl
 . ;
 . s temp=$tr($na(results(results)),"""","")
 . m @temp=merge
 . ;
 . s number=+$p(^DD(subNum,subFld,0),U,2)
 . i number d
 . . s results=results_","_subNum
 . . d multiple(number,.results)
 ;
 quit
 ;
 ;
 ;
 ;S M(0)=0 F K1=0:0 S M(0)=$O(^DD(N(0),M(0))),K=0 Q:+M(0)'>0!(M(0)?1U.U) X X Q:DM["^"  W !,M(0),?10,$P(^DD(N(0),M(0),0),U,1)," " D M I J S K=K+1 D MO Q:DM["^"
  ; Q
 ;MO X X Q:DM["^"  S N(K)=+$P(^DD(N(K-1),M(K-1),0),U,2) S M(K)=0
  ; F L=0:0 S M(K)=$O(^DD(N(K),M(K))) Q:M(K)'>0  X X Q:DM["^"  W !,?10+((K-1)*5),M(K),?15+((K-1)*5),$P(^DD(N(K),M(K),0),U,1)," " D M I J S K=K+1 D MO Q:DM["^"
   ;Q:DM["^"  X X Q:DM["^"  S K=K-1 Q
 ;M  S J=$P(^(0),U,2) W $S(+J:"(Multiple-"_+J,1:"("_J),"), [",$P(^(0),U,4),"]"
 ;
listFileAttr(number,results)
 n count,field
 ;
 s field=0
 s count=0
 f  s field=$o(^DD(number,field)) q:+field'>0!(field?1U.U)  d
 . n gl,name,type
 . ;
 . s name=$p(^DD(number,field,0),U)
 . s gl=$p(^DD(number,field,0),U,4)
 . s type=$p(^DD(number,field,0),U,2)
 . i type["S" n set  d
 . . s set=$p(^DD(number,field,0),U,3)
 . s count=count+1
 . s $p(results(number,field),U)=name
 . s $p(results(number,field),U,2)=gl
 . s $p(results(number,field),U,3)=type
 . s:$g(set)'="" $p(results(number,field),U,4)=set
 . ;
 . n multiple s multiple=+$p(^DD(number,field,0),U,2)
 . n topNum s topNum=number
 . n topField s topField=field
 . i multiple d listFileMult(multiple)
 ;
 quit
 ;
listFileMult(number)
 ;
 n field s field=0
 f  s field=$o(^DD(number,field)) q:'field  d
 . n gl,name,type
 . ;
 . s count=count+1
 . s name=$p(^DD(number,field,0),U)
 . s gl=$p(^DD(number,field,0),U,4)
 . s type=$p(^DD(number,field,0),U,2)
 . i type["S" n set d
 . . s set=$p(^DD(number,field,0),U,3)
 . i +$g(flag) d
 . . s $p(results(topNum,topField,sub,subField,topSub,field),U)=name
 . . s $p(results(topNum,topField,sub,subField,topSub,field),U,2)=gl
 . . s $p(results(topNum,topField,sub,subField,topSub,field),U,3)=type
 . . s:$g(set)'="" $p(results(topNum,topField,sub,subField,topSub,field),U,4)=set
 . e  d
 . . s $p(results(topNum,topField,number,field),U)=name
 . . s $p(results(topNum,topField,number,field),U,2)=gl
 . . s $p(results(topNum,topField,number,field),U,3)=type
 . . s:$g(set)'="" $p(results(topNum,topField,number,field),U,4)=set
 . . ;
 . n multiple,subField,sub,topSub
 . ;
 . s multiple=+$p(^DD(number,field,0),U,2)
 . s count=count+1
 . s subField=field
 . s sub=number
 . s topSub=multiple
 . i multiple n flag s flag=1 d
 . . d listFileMult(multiple)
 ;
 quit
