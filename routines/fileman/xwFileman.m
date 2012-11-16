xwFileman ;dpr/dpr & KBAW/DLW - EWD Fileman ; 11/16/12 3:59pm
 ;
 ;
introMessage(sessid) ;build intro message for login window
 ;
 n xtvIntroMessage d getIntroMessage^xwFilemanAPI(.xtvIntroMessage)
 n introMessage,num s introMessage="",num=0
 f  s num=$o(xtvIntroMessage(num)) q:num=""  d
 . s introMessage=introMessage_"<br />"_xtvIntroMessage(num)
 s introMessage=$p(introMessage,"<br />",2,$l(introMessage,"<br />"))
 d setSessionValue^%zewdAPI("introMessage",introMessage,sessid)
 ;
 quit "" ;end of IntroMessage
 ;
 ;
mainMenu(sessid) ;return the main Fileman menu
 ;
 n filemanMenu d buildFMTreeMenu^xwFilemanAPI(.filemanMenu)
 d mergeArrayToSession^%zewdAPI(.filemanMenu,"filemanMenu",sessid)
 quit ""
 ;
 ;
fileList(sessid) ;return a list of all fileman files
 ;
 n U s U="^"
 n fileList d getFileList^xwFilemanAPI(.fileList)
 ;
 k ^xwFileman("fileList",sessid)
 d clearList^%zewdAPI("fileList",sessid)
 n count s count=0
 f  d  q:'count
 . s count=$o(fileList(count))
 . q:'count
 . n filename s filename=$p(fileList(count),U)
 . n filenumber s filenumber=$p(fileList(count),U,2)
 . s ^xwFileman("fileList",sessid,count)=filenumber_U_filename
 . d appendToList^%zewdAPI("fileList",filename,count,sessid)
 ;
 quit "" ;end of fileList
 ;
 ;
recordList(sessid) ;return a list of all records in a file
 ;
 n selected s selected=$$getRequestValue^%zewdAPI("fileList",sessid)
 n fileSelected s fileSelected=$g(^xwFileman("fileList",sessid,selected))
 n filenumber s filenumber=$p($g(fileSelected),U)
 d setSessionValue^%zewdAPI("fileSelected",filenumber,sessid)
 n filename s filename=$p($g(fileSlected),U,2)
 n records d getListOfRecords^xwFilemanAPI(filenumber,.records)
 k ^xwFileman("recordList",sessid)
 n count s count=0
 f  d  q:'count
 . s count=$o(records(count))
 . q:'count
 . n entryName s entryName=$p($g(records(count)),U)
 . n entryIen s entryIen=$p($g(records(count)),U,2)
 . s ^xwFileman("recordList",sessid,count)=entryIen_U_entryName
 . s recordList(count,"entryIen")=entryIen
 . s recordList(count,"entryName")=entryName
 d deleteFromSession^%zewdAPI("recordList",sessid)
 d mergeArrayToSession^%zewdAPI(.recordList,"recordList",sessid)
 ;
 quit "" ;end of recordList
 ;
 ;
recordDetail(sessid) ;return the contents of one selected record
 ;
 n filenumber s filenumber=$$getSessionValue%$zewdAPI("fileSelected",sessid)
 n selectedRecord s selectedRecord=$$getRequestValue^%zewdAPI("row",sessid)
 n record s record=$g(^xwFileman("recordList",sessid,count))
 n recordIen s recordIen=$p($g(record),U)
 n iens s iens=""_recordIen_","
 d GETS^DIQ(filenumber,iens,"**","","recordDetail")
 ;
 quit "" ;end of recordDetail
 ;
 ;
endOfRoutine ;end of routine xwFileman
