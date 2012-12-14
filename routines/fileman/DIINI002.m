DIINI002	; ; 13-DEC-2012
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,"OPT",1347,20)
	;;=S DI=9 G EN^DIU
	;;^UTILITY(U,$J,"OPT",1347,"U")
	;;=UNEDITABLE DATA
	;;^UTILITY(U,$J,"OPT",1348,0)
	;;=DI SET MUMPS OS^Set Type of Mumps Operating System^^R^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1348,1,0)
	;;=^^3^3^2880712^
	;;^UTILITY(U,$J,"OPT",1348,1,1,0)
	;;=This option allows the user to set the Type of Mumps Operating System.
	;;^UTILITY(U,$J,"OPT",1348,1,2,0)
	;;=VA FileMan uses this to perform operating system specific functions
	;;^UTILITY(U,$J,"OPT",1348,1,3,0)
	;;=such as determining routine existence or filing routines.
	;;^UTILITY(U,$J,"OPT",1348,25)
	;;=OS^DINIT
	;;^UTILITY(U,$J,"OPT",1348,"U")
	;;=SET TYPE OF MUMPS OPERATING SY
	;;^UTILITY(U,$J,"OPT",1349,0)
	;;=DI MGMT MENU^VA FileMan Management^^M^^XUMGR^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1349,10,0)
	;;=^19.01PI^7^7
	;;^UTILITY(U,$J,"OPT",1349,10,1,0)
	;;=1348^^6
	;;^UTILITY(U,$J,"OPT",1349,10,1,"^")
	;;=DI SET MUMPS OS
	;;^UTILITY(U,$J,"OPT",1349,10,2,0)
	;;=1350^^5
	;;^UTILITY(U,$J,"OPT",1349,10,2,"^")
	;;=DI REINITIALIZE
	;;^UTILITY(U,$J,"OPT",1349,10,3,0)
	;;=1353^^1
	;;^UTILITY(U,$J,"OPT",1349,10,3,"^")
	;;=DI DD COMPILE
	;;^UTILITY(U,$J,"OPT",1349,10,4,0)
	;;=1351^^3
	;;^UTILITY(U,$J,"OPT",1349,10,4,"^")
	;;=DI PRINT COMPILE
	;;^UTILITY(U,$J,"OPT",1349,10,5,0)
	;;=1352^^2
	;;^UTILITY(U,$J,"OPT",1349,10,5,"^")
	;;=DI INPUT COMPILE
	;;^UTILITY(U,$J,"OPT",1349,10,6,0)
	;;=1371^^7
	;;^UTILITY(U,$J,"OPT",1349,10,6,"^")
	;;=DIWF
	;;^UTILITY(U,$J,"OPT",1349,10,7,0)
	;;=1392^^4
	;;^UTILITY(U,$J,"OPT",1349,10,7,"^")
	;;=DI SORT COMPILE
	;;^UTILITY(U,$J,"OPT",1349,99)
	;;=57909,41932
	;;^UTILITY(U,$J,"OPT",1349,99.1)
	;;=55799,10811
	;;^UTILITY(U,$J,"OPT",1349,"U")
	;;=VA FILEMAN MANAGEMENT
	;;^UTILITY(U,$J,"OPT",1350,0)
	;;=DI REINITIALIZE^Re-Initialize VA FileMan^^R^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1350,25)
	;;=DINIT
	;;^UTILITY(U,$J,"OPT",1350,"U")
	;;=RE-INITIALIZE VA FILEMAN
	;;^UTILITY(U,$J,"OPT",1351,0)
	;;=DI PRINT COMPILE^Print Template Compile/Uncompile^^R^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1351,1,0)
	;;=^^1^1^2930715^^
	;;^UTILITY(U,$J,"OPT",1351,1,1,0)
	;;=This option allows the user to compile or uncompile a print template.
	;;^UTILITY(U,$J,"OPT",1351,25)
	;;=EN1^DIPZ
	;;^UTILITY(U,$J,"OPT",1351,"U")
	;;=PRINT TEMPLATE COMPILE/UNCOMPI
	;;^UTILITY(U,$J,"OPT",1352,0)
	;;=DI INPUT COMPILE^Input Template Compile/Uncompile^^A^^^^^^^^^^1^^
	;;^UTILITY(U,$J,"OPT",1352,1,0)
	;;=^^1^1^2930715^^^^
	;;^UTILITY(U,$J,"OPT",1352,1,1,0)
	;;=This option allows the user to compile or uncompile an Input Template.
	;;^UTILITY(U,$J,"OPT",1352,20)
	;;=D EN1^DIEZ K DNM
	;;^UTILITY(U,$J,"OPT",1352,"U")
	;;=INPUT TEMPLATE COMPILE/UNCOMPI
	;;^UTILITY(U,$J,"OPT",1353,0)
	;;=DI DD COMPILE^Data Dictionary Cross-reference Compile/Uncompile^^R^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1353,1,0)
	;;=^^3^3^2930715^^^^
	;;^UTILITY(U,$J,"OPT",1353,1,1,0)
	;;=This option allows the user to compile or uncompile a Data Dictionary's
	;;^UTILITY(U,$J,"OPT",1353,1,2,0)
	;;=cross-references into routines which are run whenever an entry
	;;^UTILITY(U,$J,"OPT",1353,1,3,0)
	;;=is indexed or deleted.
	;;^UTILITY(U,$J,"OPT",1353,25)
	;;=EN1^DIKZ
	;;^UTILITY(U,$J,"OPT",1353,"U")
	;;=DATA DICTIONARY CROSS-REFERENC
	;;^UTILITY(U,$J,"OPT",1354,0)
	;;=DIAUDIT^Audit Menu^^M^^XUAUDITING^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1354,1,0)
	;;=^19.06^2^2^3021204^^^^
	;;^UTILITY(U,$J,"OPT",1354,1,1,0)
	;;=This menu contains the options which show which files and fields are
	;;^UTILITY(U,$J,"OPT",1354,1,2,0)
	;;=being audited as well as the options which purge audit trails.
	;;^UTILITY(U,$J,"OPT",1354,10,0)
	;;=^19.01IP^5^5
	;;^UTILITY(U,$J,"OPT",1354,10,1,0)
	;;=1355^^1
	;;^UTILITY(U,$J,"OPT",1354,10,1,"^")
	;;=DIAUDITED FIELDS
	;;^UTILITY(U,$J,"OPT",1354,10,2,0)
	;;=1356^^2
	;;^UTILITY(U,$J,"OPT",1354,10,2,"^")
	;;=DIAUDIT DD
	;;^UTILITY(U,$J,"OPT",1354,10,3,0)
	;;=1357^^3
	;;^UTILITY(U,$J,"OPT",1354,10,3,"^")
	;;=DIAUDIT PURGE DATA
	;;^UTILITY(U,$J,"OPT",1354,10,4,0)
	;;=1358^^4
	;;^UTILITY(U,$J,"OPT",1354,10,4,"^")
	;;=DIAUDIT PURGE DD
	;;^UTILITY(U,$J,"OPT",1354,10,5,0)
	;;=1370^^5
	;;^UTILITY(U,$J,"OPT",1354,10,5,"^")
	;;=DIAUDIT TURN ON/OFF
	;;^UTILITY(U,$J,"OPT",1354,99)
	;;=62802,64488
	;;^UTILITY(U,$J,"OPT",1354,"U")
	;;=AUDIT MENU
	;;^UTILITY(U,$J,"OPT",1355,0)
	;;=DIAUDITED FIELDS^Fields Being Audited^^R^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1355,1,0)
	;;=^^2^2^2930125^^^
	;;^UTILITY(U,$J,"OPT",1355,1,1,0)
	;;=This options lists all the fields that are being audited.  One can
	;;^UTILITY(U,$J,"OPT",1355,1,2,0)
	;;=see all the fields or just those in a particular file range.
	;;^UTILITY(U,$J,"OPT",1355,25)
	;;=1^DIAU
	;;^UTILITY(U,$J,"OPT",1355,"U")
	;;=FIELDS BEING AUDITED
	;;^UTILITY(U,$J,"OPT",1356,0)
	;;=DIAUDIT DD^Data Dictionaries Being Audited^NO LONGER FUNCTIONAL -- ALL DATA DICTIONARIES ARE NOW AUDITED^R^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1356,1,0)
	;;=^^2^2^2890803^
	;;^UTILITY(U,$J,"OPT",1356,1,1,0)
	;;=This option lists the data dictionaries being audited within a selected
	;;^UTILITY(U,$J,"OPT",1356,1,2,0)
	;;=range.
	;;^UTILITY(U,$J,"OPT",1356,25)
	;;=2^DIAU
	;;^UTILITY(U,$J,"OPT",1356,"U")
	;;=DATA DICTIONARIES BEING AUDITE
	;;^UTILITY(U,$J,"OPT",1357,0)
	;;=DIAUDIT PURGE DATA^Purge Data Audits^^R^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1357,1,0)
	;;=^^3^3^2890804^^
	;;^UTILITY(U,$J,"OPT",1357,1,1,0)
	;;=This option purges the audited data from a particular file.  Either all
	;;^UTILITY(U,$J,"OPT",1357,1,2,0)
	;;=of the audits may be purged or the audits may be deleted based on a
	;;^UTILITY(U,$J,"OPT",1357,1,3,0)
	;;=field in the audit file, e.g., date, user, field.
	;;^UTILITY(U,$J,"OPT",1357,25)
	;;=3^DIAU
	;;^UTILITY(U,$J,"OPT",1357,99.1)
	;;=56123,39787
	;;^UTILITY(U,$J,"OPT",1357,"U")
	;;=PURGE DATA AUDITS
	;;^UTILITY(U,$J,"OPT",1358,0)
	;;=DIAUDIT PURGE DD^Purge DD Audits^^R^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1358,25)
	;;=4^DIAU
	;;^UTILITY(U,$J,"OPT",1358,"U")
	;;=PURGE DD AUDITS
	;;^UTILITY(U,$J,"OPT",1359,0)
	;;=DIOTHER^Other Options^^M^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1359,1,0)
	;;=^^3^3^2960724^^^^
	;;^UTILITY(U,$J,"OPT",1359,1,1,0)
	;;=This menu contains a series of menus which lead to enhancements in current
	;;^UTILITY(U,$J,"OPT",1359,1,2,0)
	;;=and coming versions.  These include auditing, filegrams, and FileMan 
	;;^UTILITY(U,$J,"OPT",1359,1,3,0)
	;;=management.
	;;^UTILITY(U,$J,"OPT",1359,10,0)
	;;=^19.01PI^9^9
	;;^UTILITY(U,$J,"OPT",1359,10,1,0)
	;;=1349^^5
	;;^UTILITY(U,$J,"OPT",1359,10,1,"^")
	;;=DI MGMT MENU
	;;^UTILITY(U,$J,"OPT",1359,10,2,0)
	;;=1354^^2
	;;^UTILITY(U,$J,"OPT",1359,10,2,"^")
	;;=DIAUDIT
	;;^UTILITY(U,$J,"OPT",1359,10,3,0)
	;;=1334^^4
	;;^UTILITY(U,$J,"OPT",1359,10,3,"^")
	;;=DISTATISTICS
	;;^UTILITY(U,$J,"OPT",1359,10,4,0)
	;;=1368^^1
	;;^UTILITY(U,$J,"OPT",1359,10,4,"^")
	;;=DIFG
	;;^UTILITY(U,$J,"OPT",1359,10,5,0)
	;;=1361^^3
	;;^UTILITY(U,$J,"OPT",1359,10,5,"^")
	;;=DDS SCREEN MENU
	;;^UTILITY(U,$J,"OPT",1359,10,6,0)
	;;=1380^^6
	;;^UTILITY(U,$J,"OPT",1359,10,6,"^")
	;;=DDXP EXPORT MENU
	;;^UTILITY(U,$J,"OPT",1359,10,7,0)
	;;=1381^^7
	;;^UTILITY(U,$J,"OPT",1359,10,7,"^")
	;;=DIAX EXTRACT MENU
	;;^UTILITY(U,$J,"OPT",1359,10,8,0)
	;;=1393^^9
	;;^UTILITY(U,$J,"OPT",1359,10,8,"^")
	;;=DDBROWSER
	;;^UTILITY(U,$J,"OPT",1359,10,9,0)
	;;=7716^^8
	;;^UTILITY(U,$J,"OPT",1359,10,9,"^")
	;;=DDMP IMPORT
	;;^UTILITY(U,$J,"OPT",1359,99)
	;;=59229,43587
	;;^UTILITY(U,$J,"OPT",1359,"U")
	;;=OTHER OPTIONS
	;;^UTILITY(U,$J,"OPT",1360,0)
	;;=DDS EDIT/CREATE A FORM^Edit/Create a Form^^R^^^^^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1360,1,0)
	;;=^^2^2^2940630^
	;;^UTILITY(U,$J,"OPT",1360,1,1,0)
	;;=An option for editing and creating ScreenMan Forms.  This option calls the
	;;^UTILITY(U,$J,"OPT",1360,1,2,0)
	;;=Form Editor.
	;;^UTILITY(U,$J,"OPT",1360,20)
	;;=
	;;^UTILITY(U,$J,"OPT",1360,25)
	;;=DDGF
	;;^UTILITY(U,$J,"OPT",1360,99)
	;;=54872,31063
	;;^UTILITY(U,$J,"OPT",1360,"U")
	;;=EDIT/CREATE A FORM
	;;^UTILITY(U,$J,"OPT",1361,0)
	;;=DDS SCREEN MENU^ScreenMan^^M^^XUSCREENMAN^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1361,10,0)
	;;=^19.01PI^4^4
	;;^UTILITY(U,$J,"OPT",1361,10,1,0)
	;;=1360^^1^Enter/Edit Screen Definition
	;;^UTILITY(U,$J,"OPT",1361,10,1,"^")
	;;=DDS EDIT/CREATE A FORM
	;;^UTILITY(U,$J,"OPT",1361,10,2,0)
	;;=1374^^2
	;;^UTILITY(U,$J,"OPT",1361,10,2,"^")
	;;=DDS RUN A FORM
	;;^UTILITY(U,$J,"OPT",1361,10,3,0)
	;;=1394^^3
	;;^UTILITY(U,$J,"OPT",1361,10,3,"^")
	;;=DDS DELETE A FORM
	;;^UTILITY(U,$J,"OPT",1361,10,4,0)
	;;=1395^^4
	;;^UTILITY(U,$J,"OPT",1361,10,4,"^")
	;;=DDS PURGE UNUSED BLOCKS
	;;^UTILITY(U,$J,"OPT",1361,99)
	;;=57909,41932
	;;^UTILITY(U,$J,"OPT",1361,"U")
	;;=SCREENMAN
	;;^UTILITY(U,$J,"OPT",1362,0)
	;;=DIFG CREATE^Create/Edit Filegram Template^^A^^XUFILEGRAM^^^^^^^^1^^
	;;^UTILITY(U,$J,"OPT",1362,1,0)
	;;=^^4^4^2900124^
	;;^UTILITY(U,$J,"OPT",1362,1,1,0)
	;;=Use this option to create a filegram template or edit an existing
	;;^UTILITY(U,$J,"OPT",1362,1,2,0)
	;;=filegram template.  This option is the first step in developing a
	;;^UTILITY(U,$J,"OPT",1362,1,3,0)
	;;=filegram and is very important since there won't be filegrams without
	;;^UTILITY(U,$J,"OPT",1362,1,4,0)
	;;=this template.
	;;^UTILITY(U,$J,"OPT",1362,20)
	;;=S DI=1 D EN^DIFGO
	;;^UTILITY(U,$J,"OPT",1362,"U")
	;;=CREATE/EDIT FILEGRAM TEMPLATE
	;;^UTILITY(U,$J,"OPT",1363,0)
	;;=DIFG DISPLAY^Display Filegram Template^^A^^XUFILEGRAM^^^^^^^^1^^
	;;^UTILITY(U,$J,"OPT",1363,1,0)
	;;=^^2^2^2900124^
	;;^UTILITY(U,$J,"OPT",1363,1,1,0)
	;;=Use this option to display the filegram template in a two-column
	;;^UTILITY(U,$J,"OPT",1363,1,2,0)
	;;=format (similar to FileMan's Inquire to File Entries option).
	;;^UTILITY(U,$J,"OPT",1363,20)
	;;=S DI=2 D EN^DIFGO
	;;^UTILITY(U,$J,"OPT",1363,"U")
	;;=DISPLAY FILEGRAM TEMPLATE
	;;^UTILITY(U,$J,"OPT",1364,0)
	;;=DIFG GENERATE^Generate Filegram^^A^^XUFILEGRAM^^^^^^^^1^^
	;;^UTILITY(U,$J,"OPT",1364,1,0)
	;;=^^3^3^2900124^
	;;^UTILITY(U,$J,"OPT",1364,1,1,0)
	;;=Use this option to generate a filegram into a MailMan message after
	;;^UTILITY(U,$J,"OPT",1364,1,2,0)
	;;=selecting the file, filegram template and an entry.  It's a good idea
	;;^UTILITY(U,$J,"OPT",1364,1,3,0)
	;;=to know that information before using this option.
	;;^UTILITY(U,$J,"OPT",1364,20)
	;;=S DI=3 D EN^DIFGO
	;;^UTILITY(U,$J,"OPT",1364,"U")
	;;=GENERATE FILEGRAM
	;;^UTILITY(U,$J,"OPT",1365,0)
	;;=DIFG VIEW^View Filegram^^A^^^^^^^^^^1^^
	;;^UTILITY(U,$J,"OPT",1365,1,0)
	;;=^^1^1^2900124^
	;;^UTILITY(U,$J,"OPT",1365,1,1,0)
	;;=Use this option to view the filegram in filegram format.
	;;^UTILITY(U,$J,"OPT",1365,20)
	;;=S DI=4 D EN^DIFGO
	;;^UTILITY(U,$J,"OPT",1365,"U")
	;;=VIEW FILEGRAM
	;;^UTILITY(U,$J,"OPT",1366,0)
	;;=DIFG SPECIFIERS^Specifiers^^A^^XUFILEGRAM^^^^^^^^1^^
	;;^UTILITY(U,$J,"OPT",1366,1,0)
	;;=^^6^6^2900124^
	;;^UTILITY(U,$J,"OPT",1366,1,1,0)
	;;=Use this option to identify a particular field in the file as a
	;;^UTILITY(U,$J,"OPT",1366,1,2,0)
	;;=reference point for FileMan to use when installing the filegram.
	;;^UTILITY(U,$J,"OPT",1366,1,3,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",1366,1,4,0)
	;;=Specifiers can be compared to FileMan's identifier, unlike identifiers
	;;^UTILITY(U,$J,"OPT",1366,1,5,0)
	;;=which are used for interaction purposes...specifiers are used for
	;;^UTILITY(U,$J,"OPT",1366,1,6,0)
	;;=transaction purposes.
	;;^UTILITY(U,$J,"OPT",1366,20)
	;;=S DI=5 D EN^DIFGO
	;;^UTILITY(U,$J,"OPT",1366,"U")
	;;=SPECIFIERS
	;;^UTILITY(U,$J,"OPT",1367,0)
	;;=DIFG INSTALL^Install/Verify Filegram^^A^^XUFILEGRAM^^^^^^^^1^^
	;;^UTILITY(U,$J,"OPT",1367,1,0)
	;;=^^2^2^2900124^^
	;;^UTILITY(U,$J,"OPT",1367,1,1,0)
	;;=Use this option to install the filegram in a FileMan file
	;;^UTILITY(U,$J,"OPT",1367,1,2,0)
	;;=from a MailMan message format.  A message of verification should return.
	;;^UTILITY(U,$J,"OPT",1367,20)
	;;=S DI=6 D EN^DIFGO
	;;^UTILITY(U,$J,"OPT",1367,"U")
	;;=INSTALL/VERIFY FILEGRAM
	;;^UTILITY(U,$J,"OPT",1368,0)
	;;=DIFG^Filegrams^^M^^XUFILEGRAM^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1368,1,0)
	;;=^^1^1^2900124^^^
	;;^UTILITY(U,$J,"OPT",1368,1,1,0)
	;;=This is a menu of the Filegram options.
	;;^UTILITY(U,$J,"OPT",1368,10,0)
	;;=^19.01PI^6^6
	;;^UTILITY(U,$J,"OPT",1368,10,1,0)
	;;=1362^^1
	;;^UTILITY(U,$J,"OPT",1368,10,1,"^")
	;;=DIFG CREATE
	;;^UTILITY(U,$J,"OPT",1368,10,2,0)
	;;=1363^^2
	;;^UTILITY(U,$J,"OPT",1368,10,2,"^")
	;;=DIFG DISPLAY
	;;^UTILITY(U,$J,"OPT",1368,10,3,0)
	;;=1364^^3
	;;^UTILITY(U,$J,"OPT",1368,10,3,"^")
	;;=DIFG GENERATE
	;;^UTILITY(U,$J,"OPT",1368,10,4,0)
	;;=1365^^4
	;;^UTILITY(U,$J,"OPT",1368,10,4,"^")
	;;=DIFG VIEW
	;;^UTILITY(U,$J,"OPT",1368,10,5,0)
	;;=1366^^5
	;;^UTILITY(U,$J,"OPT",1368,10,5,"^")
	;;=DIFG SPECIFIERS
	;;^UTILITY(U,$J,"OPT",1368,10,6,0)
	;;=1367^^6
	;;^UTILITY(U,$J,"OPT",1368,10,6,"^")
	;;=DIFG INSTALL
	;;^UTILITY(U,$J,"OPT",1368,99)
	;;=57909,41931
	;;^UTILITY(U,$J,"OPT",1368,99.1)
	;;=54674,36753
	;;^UTILITY(U,$J,"OPT",1368,"U")
	;;=FILEGRAMS
	;;^UTILITY(U,$J,"OPT",1369,0)
	;;=DIFIELD CHECK^Mandatory/Required Field Check^^A^^^^^^^^^^1
	;;^UTILITY(U,$J,"OPT",1369,1,0)
	;;=^^1^1^2901205^
	;;^UTILITY(U,$J,"OPT",1369,1,1,0)
	;;=Kernel option to emulate the VA FileMan option to check fields for required data.
	;;^UTILITY(U,$J,"OPT",1369,20)
	;;=S DI=10 G EN^DIU
	;;^UTILITY(U,$J,"OPT",1369,"U")
	;;=MANDATORY/REQUIRED FIELD CHECK
	;;^UTILITY(U,$J,"OPT",1370,0)
	;;=DIAUDIT TURN ON/OFF^Turn Data Audit On/Off^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1370,1,0)
	;;=^^4^4^2901206^
	;;^UTILITY(U,$J,"OPT",1370,1,1,0)
	;;=This option allows the user to start or stop an audit on a particular
	;;^UTILITY(U,$J,"OPT",1370,1,2,0)
	;;=data field.  The user must have audit access to the file in order to turn
	;;^UTILITY(U,$J,"OPT",1370,1,3,0)
	;;=an audit on or off.  No other attributes in the field definition can 
	;;^UTILITY(U,$J,"OPT",1370,1,4,0)
	;;=be affected by this option.
	;;^UTILITY(U,$J,"OPT",1370,25)
	;;=5^DIAU
	;;^UTILITY(U,$J,"OPT",1370,"U")
	;;=TURN DATA AUDIT ON/OFF
	;;^UTILITY(U,$J,"OPT",1371,0)
	;;=DIWF^Forms Print^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",1371,1,0)
	;;=^^7^7^2901206^
	;;^UTILITY(U,$J,"OPT",1371,1,1,0)
	;;=This VA FileMan routine asks first for a 'document' file, which must be
