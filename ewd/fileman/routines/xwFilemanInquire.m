xwFilemanInquire ;VEN/DPR & V4W/DLW - EWD/openMDWS methods ;2013-03-31  8:25 PM
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
initialize(sessid)
 d setSessionValue^%zewdAPI("vista.systemId","FLAP Development Server",sessid)
 d setSessionValue^%zewdAPI("mdws.host","localhost",sessid)
 d setSessionValue^%zewdAPI("mdws.facade","FilemanService",sessid)
 d setSessionValue^%zewdAPI("mdws.version","openMDWS",sessid)
 d setSessionValue^%zewdAPI("mdws.path","/dev/",sessid) 
 d setSessionValue^%zewdAPI("vista.host","localhost",sessid)
 d setSessionValue^%zewdAPI("vista.sslProxyPort","89",sessid)
 d setSessionValue^%zewdAPI("fm_sessid",sessid,sessid)
 ;
 ;testing intro message
 n introMessage,displayMessage,fmVersion,kernelFAS,menu
 s displayMessage=""
 d getIntroMessage^xwFilemanAPI(.introMessage)
 n num s num=0
 f  s num=$o(introMessage(num)) q:num=""  d
 . i introMessage(num)=" " d
 . . s displayMessage=displayMessage_"<br /><br />"
 . e  d
 . . s displayMessage=displayMessage_" "_introMessage(num)
 d setSessionValue^%zewdAPI("introMessage",displayMessage,sessid)
 ;
 ;new fileman menu
 d filemanMenu^xwFilemanAPI(.menu)
 d mergeArrayToSession^%zewdAPI(.menu,"filemanMenus",sessid)
 ;
 ;fileman version
 s fmVersion=$$filemanVersion^xwFilemanAPI()
 d setSessionValue^%zewdAPI("fm.version",fmVersion,sessid)
 ;
 ;check Kernel File Access Security
 s kernelFAS=$$kernelFAS^xwFilemanAPI()
 d setSessionValue^%zewdAPI("kernel.FAS",kernelFAS,sessid)
 ;
 quit ""
 ;
login(sessid)
 n data,inputs,nvps,ok,results,vaSystem
 ;
 s vaSystem=$$getSessionValue^%zewdAPI("vista.systemId",sessid)
 ;
 s nvps("sitelist")=vaSystem
 s ok=$$request^%zewdMDWSClient("connect",.nvps,.results,sessid)
 i '$$isConnected^%zewdMDWSClient(.results) quit "Unable to connect to VA system "_vaSystem_": "_$$getFaultMessage^%zewdMDWSClient(.results)
 ;
 s nvps("username")=$$getSessionValue^%zewdAPI("accessCode",sessid)
 s nvps("pwd")=$$getSessionValue^%zewdAPI("verifyCode",sessid)
 s nvps("context")=""
 s ok=$$request^%zewdMDWSClient("login",.nvps,.results,sessid)
 i '$$isLoggedIn^%zewdMDWSClient(.results) quit $$getFaultMessage^%zewdMDWSClient(.results)
 s ok=$$getLoginData^%zewdMDWSClient(.results,.data)
 ;
 d setSessionValue^%zewdAPI("vista.DUZ",data("DUZ"),sessid)
 d setSessionValue^%zewdAPI("vista.name",data("name"),sessid)
 ;
 s inputs("sessid")=sessid
 s inputs("vista.DUZ")=$g(data("DUZ"))
 d duzArray^xwFilemanAPI(.inputs)
 ;
 quit ""
 ;
inquire(sessid)
 n nvps,ok
 s nvps("target")=""
 s ok=$$request^%zewdMDWSClient("inquire",.nvps,.results,sessid)
 i $$isFault^%zewdMDWSClient(.results) quit $$getFaultMessage^%zewdMDWSClient(.results)
 s ok=$$getInquireData^%zewdMDWSClient(.results,.inquire)
 d mergeArrayToSession^%zewdAPI(.inquire,"vista.inquire",sessid)
 quit ""
 ;
menuSelected(sessid)
 n item,menuArray,menuSelected
 s item=$$getRequestValue^%zewdAPI("item",sessid)
 d mergeArrayFromSession^%zewdAPI(.menuArray,"filemanMenus",sessid)
 s menuSelected=$g(menuArray(item,"text"))
 i $g(menuSelected)="" s menuSelected=$$getOrigMenu^xwFilemanAPI(sessid)
 d setSessionValue^%zewdAPI("menuSelected",menuSelected,sessid)
 ;
 ;fileLookup(sessid)
 n count,duz,dicFileList,fileNumber,inputs,kernelFAS,lastFile,results
 ;
 d clearList^%zewdAPI("fileSelect",sessid)
 ;
 s duz=$$getSessionValue^%zewdAPI("vista_DUZ",sessid)
 s lastFile=$$lastFile^xwFilemanAPI(duz)
 s fileNumber=$$getSessionValue^%zewdAPI("fileNumber",sessid)
 s inputs("fileNumber")=fileNumber
 ;
 s inputs("DUZ")=duz
 s kernelFAS=$$getSessionValue^%zewdAPI("kernelFAS",sessid)
 i kernelFAS d
 . d listFileBySecurity^xwFilemanAPI(.inputs,.results)
 ;
 e  d list^xwFilemanAPI(.inputs,.results)
 s count=0
 f  d  q:'count
 . s count=$o(results(count))
 . q:'count
 . n name s name=$g(results(count,"name"))
 . s name=$$replaceAll^%zewdAPI(name,"&","&amp;")
 . s name=$$replaceAll^%zewdAPI(name,"'","&amp;apos;")
 . s name=$$replaceAll^%zewdAPI(name,"<","&amp;lt;")
 . n ien s ien=$g(results(count,"ien"))
 . ;s dicFileList(name)=ien
 . d appendToList^%zewdAPI("fileSelect",name,name,sessid)
 d setSessionValue^%zewdAPI("fileSelect",lastFile,sessid)
 ;d mergeArrayToSession^%zewdAPI(.dicFileList,"dicFileList",sessid)
 quit ""
 ;
 ;
recordSelect(sessid)
 n count,duz,fileName,fileNumber,lastRecord,inputs,results
 ;
 d clearList^%zewdAPI("recordList",sessid)
 d deleteFromSession^%zewdAPI("recordList",sessid)
 d initialiseMultipleSelect^%zewdAPI("recordList",sessid)
 ;
 d clearList^%zewdAPI("fieldList",sessid)
 d deleteFromSession^%zewdAPI("fieldList",sessid)
 d initialiseMultipleSelect^%zewdAPI("fieldList",sessid)
 ;
 d deleteFromSession^%zewdAPI("stdCapO",sessid)
 d setSessionValue^%zewdAPI("stdCapO","yes",sessid)
 ;
 s duz=$$getSessionValue^%zewdAPI("vista_DUZ",sessid)
 s fileName=$$getSessionValue^%zewdAPI("fileSelect",sessid)
 s fileName=$$UP^XLFSTR(fileName)
 s fileNumber=$$FIND1^DIC(1,,"X",fileName,)
 ;
 ;save space bar recall
 d RECALL^DILFD(1,fileNumber_",",duz)
 ;
 s inputs("fileNumber")=fileNumber
 s inputs("duz")=duz
 d list^xwFilemanAPI(.inputs,.results)
 s count=0
 f  d  q:'count
 . s count=$o(results(count))
 . q:'count
 . n recordEntry s recordEntry=$g(results(count,"name"))
 . n recordIen s recordIen=$g(results(count,"ien"))
 . s recordEntry=$$replaceAll^%zewdAPI(recordEntry,"&","&amp;")
 . s recordEntry=$$replaceAll^%zewdAPI(recordEntry,"'","&apos;")
 . s recordEntry=$$replaceAll^%zewdAPI(recordEntry,"<","&lt;")
 . d appendToList^%zewdAPI("recordList",recordEntry,recordIen,sessid)
 ;
 ;DLW - use this if Fileman doesn't allow space bar recall for multiselect
 ;      or if we have to make it work differently than singleselect
 ;i $$isMultipleSelectOn^%zewdAPI(recordEntry,recordEntry,sessid)
 ;
 ;d lastRecord^xwFilemanAPI(.inputs,.results)
 ;s lastRecord=$g(results("recordName"))
 ;d setSessionValue^%zewdAPI("recordList",lastRecord,sessid)
 ;
 ;buid list of fields for non-captioned output
 n count,fieldList,results
 d fieldList^xwFilemanAPI(.inputs,.results)
 s count=0
 f  d  q:'count
 . s count=$o(results(count))
 . q:'count
 . n fieldName s fieldName=$g(results(count,"name"))
 . n fieldNumber s fieldNumber=$g(results(count,"ien"))
 . s fieldName=$$replaceAll^%zewdAPI(fieldName,"&","&amp;")
 . s fieldName=$$replaceAll^%zewdAPI(fieldName,"'","&amp;apos;")
 . s fieldName=$$replaceAll^%zewdAPI(fieldName,"<","&lt;")
 . s fieldList(fieldName,fieldNumber)=fieldNumber
 . ;s fieldName=fieldName_" ("_$p(fieldNumber,";",2)_")"
 . d appendToList^%zewdAPI("fieldList",fieldName,fieldNumber,sessid)
 d mergeArrayToSession^%zewdAPI(.fieldList,"listOfFields",sessid)
 ;
 quit ""
 ;
display(sessid)
 n inputs,results,selected,valeChecked
 s valueChecked=$$getSessionValue^%zewdAPI("stdCapO",sessid)
 s inputs("sessid")=sessid
 i valueChecked="yes" d stdCaptionO(.inputs,.results)
 i valueChecked="no" d printFields(.inputs,.results)
 ;
 n sub s sub=""
 n diqMessage s diqMessage=""
 f i=1:1 s sub=$o(results(sub)) q:sub=""  d
 . s diqMessage(i)=results(sub) 
 . s diqMessage(i)=$$replaceAll^%zewdAPI(diqMessage(i),"&","&amp;")
 . s diqMessage(i)=$$replaceAll^%zewdAPI(diqMessage(i),"'","&apos;")
 . s diqMessage(i)=$$replaceAll^%zewdAPI(diqMessage(i),"<","&lt;")
 ;
 d clearTextArea^%zewdAPI("captionOutput",sessid)
 d setTextAreaValue^%zewdExt4Code(.diqMessage,"captionOutput",sessid)
 ;
 quit ""
 ;
printFields(inputs,results)
 ;
 n array,count,fields,fieldMap,fieldName,fileName,fileNumber
 n out,recordName,selectFields,selectRecords,sessid
 ;
 s sessid=$g(inputs("sessid"))
 s duz=$$getSessionValue^%zewdAPI("vista_DUZ",sessid)
 s fileName=$$getSessionValue^%zewdAPI("fileSelect",sessid)
 s fileName=$$UP^XLFSTR(fileName)
 s fileNumber=$$FIND1^DIC(1,,"X",fileName,)
 d mergeArrayFromSession^%zewdAPI(.fieldMap,"listOfFields",sessid)
 ;
 d getMultipleSelectValues^%zewdAPI("recordList",.selectRecords,sessid)
 d getMultipleSelectValues^%zewdAPI("fieldList",.selectFields,sessid)
 m ^dpr(sessid)=selectFields
 ;
 s count=0
 s recordIen=0
 s fields=""
 f  d  q:'recordIen
 . s recordIen=$o(selectRecords(recordIen))
 . q:'recordIen
 . ;n recordIen s recordIen=$$FIND1^DIC(fileNumber,,"X",recordName,)
 . n recordName s recordName=$$GET1^DIQ(fileNumber,recordIen_",",.01,"E",)
 . s count=count+1
 . s array(count,"recordName")=recordName
 . s array(count,"recordIen")=recordIen
 . n fields s fields=""
 . n fieldName s fieldName=""
 . f i=1:1 d  q:fieldName=""
 . . s fieldName=$o(selectFields(fieldName))
 . . q:fieldName=""
 . . n fieldNumber s fieldNumber=$g(fieldMap(fieldName))
 . . s fields=fields_";"_fieldNumber
 . s $e(fields)=""
 . s array(count,"fields")=fields
 ;
 n count,rtn,sub
 s count=0
 s sub=0
 d getCheckboxValues^%zewdAPI("a_flags",.avalue,sessid)
 f  d  q:'sub
 . s sub=$o(array(sub))
 . q:'sub
 . n ien s ien=$g(array(sub,"recordIen"))
 . n name s name=$g(array(sub,"recordName"))
 . n fields s fields=$g(array(sub,"fields"))
 . d GETS^DIQ(fileNumber,ien_",",fields,"ENZ","out",)
 . n field s field=""
 . f  d  q:field=""
 . . s field=$o(out(fileNumber,ien_",",field))
 . . q:field=""
 . . n fldName d FIELD^DID(fileNumber,field,"","LABEL","label","")
 . . s fldName=$g(label("LABEL"))
 . . n value s value=""
 . . i $d(out(fileNumber,ien_",",field,1)) d
 . . . n sub s sub=0
 . . . f  d  q:'sub
 . . . . s sub=$o(out(fileNumber,ien_",",field,sub))
 . . . . q:'sub
 . . . . s value=$g(out(fileNumber,ien_",",field,sub,0))
 . . . . i sub=1 s results(count)=fldName_":",count=count+1
 . . . . s results(count)=" "_value
 . . . . s count=count+1
 . . e  d
 . . . s value=$g(out(fileNumber,ien_",",field,"E"))
 . . . s count=count+1
 . . . s results(count)=fldName_": "_value
 . . i $g(avalue("A"))="A" d
 . . . s in("fieldNumber")=field
 . . . s in("fileNumber")=fileNumber
 . . . s in("flag")="N"
 . . . s in("ien")=ien
 . . . d auditDetail^xwFilemanAPI(.in,.rtn)
 . . . n nsub s nsub=""
 . . . f  s nsub=$o(rtn(nsub)) q:nsub=0!(nsub="")  d
 . . . . s count=count+1
 . . . . s results(count)=rtn(nsub)
 . . . k in,rtn
 . s count=count+1
 . s results(count)=""
 ;
 quit
 ;
stdCaptionO(inputs,results)
 n count,diqArray,duz,fileName,fileNumber,multiArray
 n recordName,recordSelect,selected,sessid,values
 ;
 s sessid=$g(inputs("sessid"))
 ;setup inquire flags
 d getCheckboxValues^%zewdAPI("a_flags",.avalue,sessid)
 d getCheckboxValues^%zewdAPI("c_flags",.cvalue,sessid)
 d getCheckboxValues^%zewdAPI("r_flags",.rvalue,sessid)
 s flags=$g(avalue("A"))_$g(cvalue("C"))_$g(rvalue("R"))
 ;
 ;get user and file information
 s duz=$$getSessionValue^%zewdAPI("vista_DUZ",sessid)
 s fileName=$$getSessionValue^%zewdAPI("fileSelect",sessid)
 s fileName=$$UP^XLFSTR(fileName)
 s fileNumber=$$FIND1^DIC(1,,"X",fileName,)
 ;
 d getMultipleSelectValues^%zewdAPI("recordList",.selected,sessid)
 ;
 s recordIen=0
 f  d  q:'recordIen
 . s recordIen=$o(selected(recordIen))
 . q:'recordIen
 . s entryName=$$GET1^DIQ(fileNumber,recordIen_",",".01","E")
 . s global=$g(^DIC(fileNumber,0,"GL"))
 . s ien=recordIen
 . d RUN^XVOU("mumps -r enDiq^xwFilemanAPI '"_global_" "_ien_" "_flags_"'","diqArray")
 . n nextSub s nextSub=$o(diqArray(""),-1)+1
 . s diqArray(nextSub)=""
 . s diqArray(nextSub+1)=""
 . m values(ien)=diqArray
 ;
 n count,ien,sub
 s count=0
 s ien=""
 f  d  q:ien=""
 . s ien=$o(values(ien))
 . q:ien=""
 . s sub=""
 . f  d  q:sub=""
 . . s sub=$o(values(ien,sub))
 . . q:sub=""
 . . s count=count+1
 . . s results(count)=$g(values(ien,sub))
 ;
 quit
 ;
enterEdit(sessid)
 ;
 n duz,fileName,fileNumber,inputs,record,results,selected
 s duz=$$getSessionValue^%zewdAPI("vista_DUZ",sessid)
 s fileName=$$getSessionValue^%zewdAPI("fileSelect",sessid)
 s fileName=$$UP^XLFSTR(fileName)
 s fileNumber=$$FIND1^DIC(1,,"X",fileName,)
 d getMultipleSelectValues^%zewdAPI("recordList",.selected,sessid)
 s recordIen=$g(selected(1))
 s record=$$GET1^DIQ(fileNumber,recordIen_",",.01,"E")
 ;
 s inputs("fileNumber")=fileNumber
 s inputs("attrs")="**"
 d formBuilder^xwFilemanAPI(.inputs,.results)
 k ^dpr
 m ^dpr=results
 d mergeArrayToSession^%zewdAPI(.results,"enterEditForm",sessid)
 ;
 d setSessionValue^%zewdAPI("zzFileName",fileName,sessid)
 d setSessionValue^%zewdAPI("zzFileNumber",fileNumber,sessid)
 d setSessionValue^%zewdAPI("zzRecord",record,sessid)
 ;
 quit ""
 ;
error ;Call the VISTA error trap and then display the error on the screen
 s $zt="h" ;If we have an error in here, abandon all hope and kill the process
 d ^%ZTER ;VISTA error trap
 zg $zl:prePageError^%zewdPHP ;EWD prePage error trap
 q  ;We'll never get here
 ;
endOfRoutine ;end of xwFilemanInquire
