xwFilemanAPI ;dpr/dpr & KBAW/DLW - EWD Fileman APIs ; 11/16/12 2:16pm
 ;
 ;
checkKernel() ;check if Kernel is installed
 ;
 n check s check=0 ;default to no kernel
 n xus s xus=$t(+1^XUS) ;first line of XUS routine
 i $d(xus) s check=1
 ;
 quit check
 ;
 ;
getIntroMessage(introMessage) ;returns intro message for login
 ;
 d INTRO^XUSRB(.introMessage)
 quit  ;end of getIntroMessage
 ;
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
buildFMTreeMenu(menu) ;
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
 ; "text" = menu text
 ; "nvp" = entry point for menu item
 ;
 s menu(1,"text")="Enter or Edit File Entries"
 s menu(1,"nvp")="DIB"
 s menu(2,"text")="Print File Entries"
 s menu(2,"nvp")="DIP"
 s menu(3,"text")="Search File Entries"
 s menu(3,"nvp")="DIS"
 s menu(4,"text")="Modify File Attributes"
 s menu(4,"nvp")="DICATT"
 s menu(5,"text")="Inquire to File Entries"
 s menu(5,"nvp")="INQ^DII"
 s menu(6,"text")="Utility Functions"
 s menu(6,"nvp")="DIU"
 s menu(7,"text")="Other Options"
 s menu(7,"nvp")="DII1"
 s menu(8,"text")="Data Dictionary Utilities"
 s menu(8,"nvp")="DDU"
 s menu(9,"text")="Transfer Entries"
 s menu(9,"nvp")="DIT"
 ;
 quit  ;end of buildFMTreeMenu
 ;
 ;
getFileList(list) ;return a list of all files
 ;
 n filename s filename=""
 f i=1:1  d  q:filename=""
 . s filename=$o(^DIC("B",filename))
 . q:filename=""
 . n filenumber s filenumber=0
 . f  d  q:'filenumber
 . . s filenumber=$o(^DIC("B",filename,filenumber))
 . . q:'filenumber
 . . s list(i)=filename_U_filenumber
 ;
 quit  ;end of getFileList
 ;
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
endOfRoutine ;end of routine xwFilemanAPI
