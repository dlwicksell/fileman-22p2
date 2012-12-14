DIINI003	; ; 13-DEC-2012
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,"OPT",1371,1,2,0)
	;;=a file that contains a word processing field at the first level.  It then
	;;^UTILITY(U,$J,"OPT",1371,1,3,0)
	;;=asks the user to choose an entry in that file for which the word
	;;^UTILITY(U,$J,"OPT",1371,1,4,0)
	;;=processing field has some text on file.  It then uses that text as a 
	;;^UTILITY(U,$J,"OPT",1371,1,5,0)
	;;='print template' for a file.  If the chosen document entry has a pointer
	;;^UTILITY(U,$J,"OPT",1371,1,6,0)
	;;=to a file, that file is automatically the one from which the printing
	;;^UTILITY(U,$J,"OPT",1371,1,7,0)
	;;=is done.
	;;^UTILITY(U,$J,"OPT",1371,25)
	;;=DIWF
	;;^UTILITY(U,$J,"OPT",1371,"U")
	;;=FORMS PRINT
	;;^UTILITY(U,$J,"OPT",1372,0)
	;;=DI DDUCHK^Check/Fix DD Structure^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1372,1,0)
	;;=^^4^4^2930125^
	;;^UTILITY(U,$J,"OPT",1372,1,1,0)
	;;=This option looks at the internal structure of files and subfiles
	;;^UTILITY(U,$J,"OPT",1372,1,2,0)
	;;=and determines if there are inconsistencies or conflicts between the
	;;^UTILITY(U,$J,"OPT",1372,1,3,0)
	;;=information in the data dictionary and the structure of the file's global
	;;^UTILITY(U,$J,"OPT",1372,1,4,0)
	;;=nodes.  This option will note them and fix or delete the incorrect nodes.
	;;^UTILITY(U,$J,"OPT",1372,25)
	;;=DDUCHK
	;;^UTILITY(U,$J,"OPT",1372,"U")
	;;=CHECK/FIX DD STRUCTURE
	;;^UTILITY(U,$J,"OPT",1373,0)
	;;=DI DDU^Data Dictionary Utilities^^M^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1373,10,0)
	;;=^19.01PI^3^3
	;;^UTILITY(U,$J,"OPT",1373,10,1,0)
	;;=1335^^1
	;;^UTILITY(U,$J,"OPT",1373,10,1,"^")
	;;=DILIST
	;;^UTILITY(U,$J,"OPT",1373,10,2,0)
	;;=1338^^2
	;;^UTILITY(U,$J,"OPT",1373,10,2,"^")
	;;=DI DDMAP
	;;^UTILITY(U,$J,"OPT",1373,10,3,0)
	;;=1372^^3
	;;^UTILITY(U,$J,"OPT",1373,10,3,"^")
	;;=DI DDUCHK
	;;^UTILITY(U,$J,"OPT",1373,99)
	;;=59229,43587
	;;^UTILITY(U,$J,"OPT",1373,"U")
	;;=DATA DICTIONARY UTILITIES
	;;^UTILITY(U,$J,"OPT",1374,0)
	;;=DDS RUN A FORM^Run a Form^^A^^^^^^^^^^1
	;;^UTILITY(U,$J,"OPT",1374,1,0)
	;;=^^1^1^2940701^^
	;;^UTILITY(U,$J,"OPT",1374,1,1,0)
	;;=Option to run a form.
	;;^UTILITY(U,$J,"OPT",1374,20)
	;;=D ^DDSRUN
	;;^UTILITY(U,$J,"OPT",1374,99.1)
	;;=56123,39787
	;;^UTILITY(U,$J,"OPT",1374,"U")
	;;=RUN A FORM
	;;^UTILITY(U,$J,"OPT",1375,0)
	;;=DIFG-SRV-HISTORY^Server to Load a Message into the FG History File^^S^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1375,1,0)
	;;=^^2^2^2920420^
	;;^UTILITY(U,$J,"OPT",1375,1,1,0)
	;;=This option is a SERVER that will take a message and add it to the 
	;;^UTILITY(U,$J,"OPT",1375,1,2,0)
	;;=Filegram History file so that it can be installed.
	;;^UTILITY(U,$J,"OPT",1375,3.91,0)
	;;=^19.391^^0
	;;^UTILITY(U,$J,"OPT",1375,25)
	;;=HIST^DIFGSRV
	;;^UTILITY(U,$J,"OPT",1375,220)
	;;=^R^^N^N^N
	;;^UTILITY(U,$J,"OPT",1375,"U")
	;;=SERVER TO LOAD A MESSAGE INTO 
	;;^UTILITY(U,$J,"OPT",1376,0)
	;;=DDXP DEFINE FORMAT^Define Foreign File Format^^A^^DDXP-DEFINE^^^^^^^^1
	;;^UTILITY(U,$J,"OPT",1376,1,0)
	;;=^^5^5^2930108^
	;;^UTILITY(U,$J,"OPT",1376,1,1,0)
	;;=Use this option to define formats.  Formats are entries in the Foreign
	;;^UTILITY(U,$J,"OPT",1376,1,2,0)
	;;=Format file.  They are used to control the exporting of data to a
	;;^UTILITY(U,$J,"OPT",1376,1,3,0)
	;;=non-MUMPS application.  You can alter an existing format only before it has
	;;^UTILITY(U,$J,"OPT",1376,1,4,0)
	;;=been used to create an Export template.  After it has been used, you can
	;;^UTILITY(U,$J,"OPT",1376,1,5,0)
	;;=clone a format.  This option is locked with the DDXP-DEFINE key.
	;;^UTILITY(U,$J,"OPT",1376,20)
	;;=D 1^DDXP
	;;^UTILITY(U,$J,"OPT",1376,"U")
	;;=DEFINE FOREIGN FILE FORMAT
	;;^UTILITY(U,$J,"OPT",1377,0)
	;;=DDXP SELECT EXPORT FIELDS^Select Fields for Export^^A^^^^^^^^^^1
	;;^UTILITY(U,$J,"OPT",1377,1,0)
	;;=^^1^1^2921207^^
	;;^UTILITY(U,$J,"OPT",1377,1,1,0)
	;;=Use this option to choose fields to be exported.
	;;^UTILITY(U,$J,"OPT",1377,20)
	;;=D 2^DDXP
	;;^UTILITY(U,$J,"OPT",1377,"U")
	;;=SELECT FIELDS FOR EXPORT
	;;^UTILITY(U,$J,"OPT",1378,0)
	;;=DDXP CREATE EXPORT TEMPLATE^Create Export Template^^A^^^^^^^^^^1
	;;^UTILITY(U,$J,"OPT",1378,1,0)
	;;=^^2^2^2940519^^^
	;;^UTILITY(U,$J,"OPT",1378,1,1,0)
	;;=This option creates an Export template by applying the specifications in a
	;;^UTILITY(U,$J,"OPT",1378,1,2,0)
	;;=Foreign Format with the fields in a Selected Fields for Export template.
	;;^UTILITY(U,$J,"OPT",1378,20)
	;;=D 3^DDXP
	;;^UTILITY(U,$J,"OPT",1378,"U")
	;;=CREATE EXPORT TEMPLATE
	;;^UTILITY(U,$J,"OPT",1379,0)
	;;=DDXP EXPORT DATA^Export Data^^A^^^^^^^^^^1
	;;^UTILITY(U,$J,"OPT",1379,1,0)
	;;=^^4^4^2921207^^
	;;^UTILITY(U,$J,"OPT",1379,1,1,0)
	;;=This option sends data to a specified device for export to a foreign
	;;^UTILITY(U,$J,"OPT",1379,1,2,0)
	;;=application.  You have the opportunity to choose entries for export with
	;;^UTILITY(U,$J,"OPT",1379,1,3,0)
	;;=VA FileMan's Search dialogue.  You use an Export template to control the
	;;^UTILITY(U,$J,"OPT",1379,1,4,0)
	;;=export.
	;;^UTILITY(U,$J,"OPT",1379,20)
	;;=D 4^DDXP
	;;^UTILITY(U,$J,"OPT",1379,"U")
	;;=EXPORT DATA
	;;^UTILITY(U,$J,"OPT",1380,0)
	;;=DDXP EXPORT MENU^Data Export to Foreign Format^^M^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1380,1,0)
	;;=^^1^1^2960722^^
	;;^UTILITY(U,$J,"OPT",1380,1,1,0)
	;;=Submenu for the Export tool.
	;;^UTILITY(U,$J,"OPT",1380,10,0)
	;;=^19.01PI^5^5
	;;^UTILITY(U,$J,"OPT",1380,10,1,0)
	;;=1376^^1
	;;^UTILITY(U,$J,"OPT",1380,10,1,"^")
	;;=DDXP DEFINE FORMAT
	;;^UTILITY(U,$J,"OPT",1380,10,2,0)
	;;=1377^^2
	;;^UTILITY(U,$J,"OPT",1380,10,2,"^")
	;;=DDXP SELECT EXPORT FIELDS
	;;^UTILITY(U,$J,"OPT",1380,10,3,0)
	;;=1378^^3
	;;^UTILITY(U,$J,"OPT",1380,10,3,"^")
	;;=DDXP CREATE EXPORT TEMPLATE
	;;^UTILITY(U,$J,"OPT",1380,10,4,0)
	;;=1379^^4
	;;^UTILITY(U,$J,"OPT",1380,10,4,"^")
	;;=DDXP EXPORT DATA
	;;^UTILITY(U,$J,"OPT",1380,10,5,0)
	;;=1391^^5
	;;^UTILITY(U,$J,"OPT",1380,10,5,"^")
	;;=DDXP FORMAT DOCUMENTATION
	;;^UTILITY(U,$J,"OPT",1380,99)
	;;=57909,41932
	;;^UTILITY(U,$J,"OPT",1380,"U")
	;;=DATA EXPORT TO FOREIGN FORMAT
	;;^UTILITY(U,$J,"OPT",1381,0)
	;;=DIAX EXTRACT MENU^Extract Data To Fileman File^^M^^DIEXTRACT^^^^^^^^^1^^
	;;^UTILITY(U,$J,"OPT",1381,1,0)
	;;=^^2^2^2921222^^^^
	;;^UTILITY(U,$J,"OPT",1381,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1381,1,2,0)
	;;=This is a menu of the tool for extracting data to Fileman file.
	;;^UTILITY(U,$J,"OPT",1381,10,0)
	;;=^19.01PI^9^9
	;;^UTILITY(U,$J,"OPT",1381,10,1,0)
	;;=1382^^1
	;;^UTILITY(U,$J,"OPT",1381,10,1,"^")
	;;=DIAX SELECT
	;;^UTILITY(U,$J,"OPT",1381,10,2,0)
	;;=1383^^2
	;;^UTILITY(U,$J,"OPT",1381,10,2,"^")
	;;=DIAX ADD/DELETE
	;;^UTILITY(U,$J,"OPT",1381,10,3,0)
	;;=1384^^3
	;;^UTILITY(U,$J,"OPT",1381,10,3,"^")
	;;=DIAX PRINT
	;;^UTILITY(U,$J,"OPT",1381,10,4,0)
	;;=1385^^4
	;;^UTILITY(U,$J,"OPT",1381,10,4,"^")
	;;=DIAX MODIFY
	;;^UTILITY(U,$J,"OPT",1381,10,5,0)
	;;=1386^^5
	;;^UTILITY(U,$J,"OPT",1381,10,5,"^")
	;;=DIAX CREATE
	;;^UTILITY(U,$J,"OPT",1381,10,6,0)
	;;=1387^^6
	;;^UTILITY(U,$J,"OPT",1381,10,6,"^")
	;;=DIAX UPDATE
	;;^UTILITY(U,$J,"OPT",1381,10,7,0)
	;;=1388^^7
	;;^UTILITY(U,$J,"OPT",1381,10,7,"^")
	;;=DIAX PURGE
	;;^UTILITY(U,$J,"OPT",1381,10,8,0)
	;;=1389^^7
	;;^UTILITY(U,$J,"OPT",1381,10,8,"^")
	;;=DIAX CANCEL
	;;^UTILITY(U,$J,"OPT",1381,10,9,0)
	;;=1390^^8
	;;^UTILITY(U,$J,"OPT",1381,10,9,"^")
	;;=DIAX VALIDATE
	;;^UTILITY(U,$J,"OPT",1381,15)
	;;=K DIAX
	;;^UTILITY(U,$J,"OPT",1381,99)
	;;=57909,41931
	;;^UTILITY(U,$J,"OPT",1381,"U")
	;;=EXTRACT DATA TO FILEMAN FILE
	;;^UTILITY(U,$J,"OPT",1382,0)
	;;=DIAX SELECT^Select Entries to Extract^^A^^DIEXTRACT^^^^^^^^1^^^
	;;^UTILITY(U,$J,"OPT",1382,1,0)
	;;=^^5^5^2921222^
	;;^UTILITY(U,$J,"OPT",1382,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1382,1,2,0)
	;;=Use this option to specify the criteria that would select Fileman entries
	;;^UTILITY(U,$J,"OPT",1382,1,3,0)
	;;=to extract.  This is the first step in developing an extract activity and
	;;^UTILITY(U,$J,"OPT",1382,1,4,0)
	;;=is important since there cannot be any extract process without the search
	;;^UTILITY(U,$J,"OPT",1382,1,5,0)
	;;=template created in this option.
	;;^UTILITY(U,$J,"OPT",1382,20)
	;;=S DI=1 D EN^DIAX
	;;^UTILITY(U,$J,"OPT",1382,"U")
	;;=SELECT ENTRIES TO EXTRACT
	;;^UTILITY(U,$J,"OPT",1383,0)
	;;=DIAX ADD/DELETE^Add/Delete Selected Entries^^A^^DIEXTRACT^^^^^^^^1^^^
	;;^UTILITY(U,$J,"OPT",1383,1,0)
	;;=^^3^3^2921222^
	;;^UTILITY(U,$J,"OPT",1383,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1383,1,2,0)
	;;=Use this option to edit the list of selected entries to extract by adding
	;;^UTILITY(U,$J,"OPT",1383,1,3,0)
	;;=needed entries or by deleting undesired ones.
	;;^UTILITY(U,$J,"OPT",1383,20)
	;;=S DI=2 D EN^DIAX
	;;^UTILITY(U,$J,"OPT",1383,"U")
	;;=ADD/DELETE SELECTED ENTRIES
	;;^UTILITY(U,$J,"OPT",1384,0)
	;;=DIAX PRINT^Print Selected Entries^^A^^DIEXTRACT^^^^^^^^1^^^
	;;^UTILITY(U,$J,"OPT",1384,1,0)
	;;=^^3^3^2921222^
	;;^UTILITY(U,$J,"OPT",1384,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1384,1,2,0)
	;;=Use this option to display the list of entries selected for extract.  This
	;;^UTILITY(U,$J,"OPT",1384,1,3,0)
	;;=option uses the standard VA Fileman interface for printing.
	;;^UTILITY(U,$J,"OPT",1384,20)
	;;=S DI=3 D EN^DIAX
	;;^UTILITY(U,$J,"OPT",1384,"U")
	;;=PRINT SELECTED ENTRIES
	;;^UTILITY(U,$J,"OPT",1385,0)
	;;=DIAX MODIFY^Modify Destination File^^A^^DIEXTRACT^^^^^^^^1^^^
	;;^UTILITY(U,$J,"OPT",1385,1,0)
	;;=^^3^3^2921222^
	;;^UTILITY(U,$J,"OPT",1385,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1385,1,2,0)
	;;=Use this option to create a destination file that will hold the data
	;;^UTILITY(U,$J,"OPT",1385,1,3,0)
	;;=extracted from the source entries.
	;;^UTILITY(U,$J,"OPT",1385,20)
	;;=S DI=4 D EN^DIAX
	;;^UTILITY(U,$J,"OPT",1385,"U")
	;;=MODIFY DESTINATION FILE
	;;^UTILITY(U,$J,"OPT",1386,0)
	;;=DIAX CREATE^Create Extract Template^^A^^DIEXTRACT^^^^^^^^1^^^
	;;^UTILITY(U,$J,"OPT",1386,1,0)
	;;=^^4^4^2930104^
	;;^UTILITY(U,$J,"OPT",1386,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1386,1,2,0)
	;;=Use this option to identify the fields to be extracted from the source
	;;^UTILITY(U,$J,"OPT",1386,1,3,0)
	;;=file and the fields in the destination file where the extracted data will
	;;^UTILITY(U,$J,"OPT",1386,1,4,0)
	;;=be stored.
	;;^UTILITY(U,$J,"OPT",1386,20)
	;;=S DI=5 D EN^DIAX
	;;^UTILITY(U,$J,"OPT",1386,"U")
	;;=CREATE EXTRACT TEMPLATE
	;;^UTILITY(U,$J,"OPT",1387,0)
	;;=DIAX UPDATE^Update Destination File^^A^^DIEXTRACT^^^^^^^^1^^^
	;;^UTILITY(U,$J,"OPT",1387,1,0)
	;;=^^3^3^2921222^
	;;^UTILITY(U,$J,"OPT",1387,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1387,1,2,0)
	;;=Use this option to extract data from the source file and move it to the
	;;^UTILITY(U,$J,"OPT",1387,1,3,0)
	;;=destination file.
	;;^UTILITY(U,$J,"OPT",1387,20)
	;;=S DI=6 D EN^DIAX
	;;^UTILITY(U,$J,"OPT",1387,"U")
	;;=UPDATE DESTINATION FILE
	;;^UTILITY(U,$J,"OPT",1388,0)
	;;=DIAX PURGE^Purge Extracted Entries^^A^^DIEXTRACT^^^^^^^^1^^^
	;;^UTILITY(U,$J,"OPT",1388,1,0)
	;;=^^2^2^2921222^
	;;^UTILITY(U,$J,"OPT",1388,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1388,1,2,0)
	;;=Use this option to delete the extracted data from the primary file.
	;;^UTILITY(U,$J,"OPT",1388,20)
	;;=S DI=7 D EN^DIAX
	;;^UTILITY(U,$J,"OPT",1388,"U")
	;;=PURGE EXTRACTED ENTRIES
	;;^UTILITY(U,$J,"OPT",1389,0)
	;;=DIAX CANCEL^Cancel Extract Selection^^A^^DIEXTRACT^^^^^^^^1^^^
	;;^UTILITY(U,$J,"OPT",1389,1,0)
	;;=^^3^3^2921222^
	;;^UTILITY(U,$J,"OPT",1389,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1389,1,2,0)
	;;=Use this option to cancel an extract activity any time before the selected
	;;^UTILITY(U,$J,"OPT",1389,1,3,0)
	;;=entries in the primary file are purged.
	;;^UTILITY(U,$J,"OPT",1389,20)
	;;=S DI=8 D EN^DIAX
	;;^UTILITY(U,$J,"OPT",1389,"U")
	;;=CANCEL EXTRACT SELECTION
	;;^UTILITY(U,$J,"OPT",1390,0)
	;;=DIAX VALIDATE^Validate Extract Template^^A^^DIEXTRACT^^^^^^^^1^^^
	;;^UTILITY(U,$J,"OPT",1390,1,0)
	;;=^^3^3^2930104^
	;;^UTILITY(U,$J,"OPT",1390,1,1,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1390,1,2,0)
	;;=Use this option to verify the compatibility between fields to be extracted
	;;^UTILITY(U,$J,"OPT",1390,1,3,0)
	;;=and their corresponding destination fields in the destination file.
	;;^UTILITY(U,$J,"OPT",1390,20)
	;;=S DI=9 D EN^DIAX
	;;^UTILITY(U,$J,"OPT",1390,"U")
	;;=VALIDATE EXTRACT TEMPLATE
	;;^UTILITY(U,$J,"OPT",1391,0)
	;;=DDXP FORMAT DOCUMENTATION^Print Format Documentation^^A^^^^^^^^^^1
	;;^UTILITY(U,$J,"OPT",1391,1,0)
	;;=^^2^2^2921207^^
	;;^UTILITY(U,$J,"OPT",1391,1,1,0)
	;;=Use this option ot print documentation for existing entries in the Foreign
	;;^UTILITY(U,$J,"OPT",1391,1,2,0)
	;;=Format file.
	;;^UTILITY(U,$J,"OPT",1391,20)
	;;=D 5^DDXP
	;;^UTILITY(U,$J,"OPT",1391,"U")
	;;=PRINT FORMAT DOCUMENTATION
	;;^UTILITY(U,$J,"OPT",1392,0)
	;;=DI SORT COMPILE^Sort Template Compile/Uncompile^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1392,1,0)
	;;=^^3^3^2930715^^
	;;^UTILITY(U,$J,"OPT",1392,1,1,0)
	;;=This option allows the user to mark a Sort Template compiled or uncompiled.
	;;^UTILITY(U,$J,"OPT",1392,1,2,0)
	;;=The actual routine compilation occurs when the template is used during
	;;^UTILITY(U,$J,"OPT",1392,1,3,0)
	;;=FileMan Sort/Print.
	;;^UTILITY(U,$J,"OPT",1392,25)
	;;=EN1^DIOZ
	;;^UTILITY(U,$J,"OPT",1392,"U")
	;;=SORT TEMPLATE COMPILE/UNCOMPIL
	;;^UTILITY(U,$J,"OPT",1393,0)
	;;=DDBROWSER^Browser^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1393,1,0)
	;;=^^3^3^2940519^
	;;^UTILITY(U,$J,"OPT",1393,1,1,0)
	;;=Prompts user to select file, word processing field and entry.
	;;^UTILITY(U,$J,"OPT",1393,1,2,0)
	;;=The text is then displayed to the screen, allowing the user to
	;;^UTILITY(U,$J,"OPT",1393,1,3,0)
	;;=navigate through the document.
	;;^UTILITY(U,$J,"OPT",1393,25)
	;;=DDBR
	;;^UTILITY(U,$J,"OPT",1393,99.1)
	;;=56123,39787
	;;^UTILITY(U,$J,"OPT",1393,"U")
	;;=BROWSER
	;;^UTILITY(U,$J,"OPT",1394,0)
	;;=DDS DELETE A FORM^Delete a Form^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1394,1,0)
	;;=^^1^1^2940630^^
	;;^UTILITY(U,$J,"OPT",1394,1,1,0)
	;;=An option to delete a form.
	;;^UTILITY(U,$J,"OPT",1394,25)
	;;=DDSDFRM
	;;^UTILITY(U,$J,"OPT",1394,99.1)
	;;=56123,39787
	;;^UTILITY(U,$J,"OPT",1394,"U")
	;;=DELETE A FORM
	;;^UTILITY(U,$J,"OPT",1395,0)
	;;=DDS PURGE UNUSED BLOCKS^Purge Unused Blocks^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1395,1,0)
	;;=^^3^3^2940630^
