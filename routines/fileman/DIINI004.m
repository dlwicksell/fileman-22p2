DIINI004	; ; 13-DEC-2012
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,"OPT",1395,1,1,0)
	;;=An option to delete blocks that aren't used on any forms.  This option
	;;^UTILITY(U,$J,"OPT",1395,1,2,0)
	;;=prompts for file, and searches the Block File for all blocks that are
	;;^UTILITY(U,$J,"OPT",1395,1,3,0)
	;;=associated with that file and that aren't used on any forms.
	;;^UTILITY(U,$J,"OPT",1395,25)
	;;=DDSDBLK
	;;^UTILITY(U,$J,"OPT",1395,99.1)
	;;=56123,39787
	;;^UTILITY(U,$J,"OPT",1395,"U")
	;;=PURGE UNUSED BLOCKS
	;;^UTILITY(U,$J,"OPT",7716,0)
	;;=DDMP IMPORT^Import Data^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",7716,1,0)
	;;=^^2^2^2960724^^^^
	;;^UTILITY(U,$J,"OPT",7716,1,1,0)
	;;=This option gathers specification from the user for the import of data from 
	;;^UTILITY(U,$J,"OPT",7716,1,2,0)
	;;=a host ascii file.  The import is done and a report generated.
	;;^UTILITY(U,$J,"OPT",7716,25)
	;;=EN^DDMPU
	;;^UTILITY(U,$J,"OPT",7716,"U")
	;;=IMPORT DATA
	;;^UTILITY(U,$J,"OPT",8012,0)
	;;=DMSQ PROJECT^Regenerate SQLI Projection^^R^^XUPROGMODE^^^^^^VA FILEMAN^^1^1
	;;^UTILITY(U,$J,"OPT",8012,1,0)
	;;=^^17^17^2971026^^^^
	;;^UTILITY(U,$J,"OPT",8012,1,1,0)
	;;=Regenerates the SQLI projection of VA FileMan data dictionaries. The
	;;^UTILITY(U,$J,"OPT",8012,1,2,0)
	;;=regeneration process:
	;;^UTILITY(U,$J,"OPT",8012,1,3,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",8012,1,4,0)
	;;=  1. Purges existing information in SQLI data files.
	;;^UTILITY(U,$J,"OPT",8012,1,5,0)
	;;=  2. Projects the data dictionaries for all VA FileMan files.
	;;^UTILITY(U,$J,"OPT",8012,1,6,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",8012,1,7,0)
	;;=Before running this option, the SQLI_KEY_WORD file should be populated
	;;^UTILITY(U,$J,"OPT",8012,1,8,0)
	;;=with all SQL, ODBC, and vendor-specific keywords that should not be used
	;;^UTILITY(U,$J,"OPT",8012,1,9,0)
	;;=in SQLI entity naming.
	;;^UTILITY(U,$J,"OPT",8012,1,10,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",8012,1,11,0)
	;;=This option requires programmer mode as well as the progmode key.
	;;^UTILITY(U,$J,"OPT",8012,1,12,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",8012,1,13,0)
	;;=This option may also be used as a skeleton for one that you may want
	;;^UTILITY(U,$J,"OPT",8012,1,14,0)
	;;=to create locally.  Your local option could include the vendor's
	;;^UTILITY(U,$J,"OPT",8012,1,15,0)
	;;=keyword call in the Entry Action and the vendor's mapping call in the
	;;^UTILITY(U,$J,"OPT",8012,1,16,0)
	;;=Exit Action.  A status variable could be used to confirm that the
	;;^UTILITY(U,$J,"OPT",8012,1,17,0)
	;;=SQLI projection completes before the vendor mapping is initiated.
	;;^UTILITY(U,$J,"OPT",8012,15)
	;;=;vendor's mapper call could go here
	;;^UTILITY(U,$J,"OPT",8012,20)
	;;=;vendor's keyword call could go here
	;;^UTILITY(U,$J,"OPT",8012,25)
	;;=SETUP^DMSQ
	;;^UTILITY(U,$J,"OPT",8012,200.9)
	;;=y
	;;^UTILITY(U,$J,"OPT",8012,"U")
	;;=REGENERATE SQLI PROJECTION
	;;^UTILITY(U,$J,"OPT",8013,0)
	;;=DMSQ MENU^SQLI (VA FileMan)^^M^^^^^^^^VA FILEMAN
	;;^UTILITY(U,$J,"OPT",8013,1,0)
	;;=^^1^1^2970806^^^^
	;;^UTILITY(U,$J,"OPT",8013,1,1,0)
	;;=This is the main menu for all VA FileMan SQLI (SQL Interface) options.
	;;^UTILITY(U,$J,"OPT",8013,10,0)
	;;=^19.01IP^8^7
	;;^UTILITY(U,$J,"OPT",8013,10,1,0)
	;;=8012^RUN^10
	;;^UTILITY(U,$J,"OPT",8013,10,1,"^")
	;;=DMSQ PROJECT
	;;^UTILITY(U,$J,"OPT",8013,10,2,0)
	;;=8014^X^30
	;;^UTILITY(U,$J,"OPT",8013,10,2,"^")
	;;=DMSQ PURGE
	;;^UTILITY(U,$J,"OPT",8013,10,4,0)
	;;=8015^ERR^20
	;;^UTILITY(U,$J,"OPT",8013,10,4,"^")
	;;=DMSQ PRINT ERRORS
	;;^UTILITY(U,$J,"OPT",8013,10,5,0)
	;;=8016^CNTS^50
	;;^UTILITY(U,$J,"OPT",8013,10,5,"^")
	;;=DMSQ PS MENU
	;;^UTILITY(U,$J,"OPT",8013,10,6,0)
	;;=8034^DD^40
	;;^UTILITY(U,$J,"OPT",8013,10,6,"^")
	;;=DMSQ TS MENU
	;;^UTILITY(U,$J,"OPT",8013,10,7,0)
	;;=8035^GRP^60
	;;^UTILITY(U,$J,"OPT",8013,10,7,"^")
	;;=DMSQ SUGGEST TABLE GROUPINGS
	;;^UTILITY(U,$J,"OPT",8013,10,8,0)
	;;=8037^WHY^15
	;;^UTILITY(U,$J,"OPT",8013,10,8,"^")
	;;=DMSQ DIAGNOSTICS
	;;^UTILITY(U,$J,"OPT",8013,99)
	;;=57909,41933
	;;^UTILITY(U,$J,"OPT",8013,99.1)
	;;=57215,42037
	;;^UTILITY(U,$J,"OPT",8013,"U")
	;;=SQLI (VA FILEMAN)
	;;^UTILITY(U,$J,"OPT",8014,0)
	;;=DMSQ PURGE^Purge SQLI Data^^R^^XUPROGMODE^^^^^^VA FILEMAN
	;;^UTILITY(U,$J,"OPT",8014,1,0)
	;;=^^23^23^2970806^^^^
	;;^UTILITY(U,$J,"OPT",8014,1,1,0)
	;;=This option purges the SQLI projection of VA FileMan data dictionaries.
	;;^UTILITY(U,$J,"OPT",8014,1,2,0)
	;;=Use this option if you have previously projected your VA FileMan data
	;;^UTILITY(U,$J,"OPT",8014,1,3,0)
	;;=dictionaries for use by an M-to-SQL product, but no longer wish to. All
	;;^UTILITY(U,$J,"OPT",8014,1,4,0)
	;;=data in the following files are purged:
	;;^UTILITY(U,$J,"OPT",8014,1,5,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",8014,1,6,0)
	;;=  SQLI_COLUMN
	;;^UTILITY(U,$J,"OPT",8014,1,7,0)
	;;=  SQLI_DATA_TYPE
	;;^UTILITY(U,$J,"OPT",8014,1,8,0)
	;;=  SQLI_DOMAIN
	;;^UTILITY(U,$J,"OPT",8014,1,9,0)
	;;=  SQLI_ERROR_LOG
	;;^UTILITY(U,$J,"OPT",8014,1,10,0)
	;;=  SQLI_ERROR_TEXT
	;;^UTILITY(U,$J,"OPT",8014,1,11,0)
	;;=  SQLI_FOREIGN_KEY
	;;^UTILITY(U,$J,"OPT",8014,1,12,0)
	;;=  SQLI_KEY_FORMAT
	;;^UTILITY(U,$J,"OPT",8014,1,13,0)
	;;=  SQLI_OUTPUT_FORMAT
	;;^UTILITY(U,$J,"OPT",8014,1,14,0)
	;;=  SQLI_PRIMARY_KEY
	;;^UTILITY(U,$J,"OPT",8014,1,15,0)
	;;=  SQLI_SCHEMA
	;;^UTILITY(U,$J,"OPT",8014,1,16,0)
	;;=  SQLI_TABLE
	;;^UTILITY(U,$J,"OPT",8014,1,17,0)
	;;=  SQLI_TABLE_ELEMENT
	;;^UTILITY(U,$J,"OPT",8014,1,18,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",8014,1,19,0)
	;;=Data is not purged from the following SQLI file, however:
	;;^UTILITY(U,$J,"OPT",8014,1,20,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",8014,1,21,0)
	;;=  SQLI_KEY_WORD
	;;^UTILITY(U,$J,"OPT",8014,1,22,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",8014,1,23,0)
	;;=This option requires programmer mode as well as the progmode key.
	;;^UTILITY(U,$J,"OPT",8014,25)
	;;=PURGE^DMSQ
	;;^UTILITY(U,$J,"OPT",8014,99)
	;;=57167,30963
	;;^UTILITY(U,$J,"OPT",8014,"U")
	;;=PURGE SQLI DATA
	;;^UTILITY(U,$J,"OPT",8015,0)
	;;=DMSQ PRINT ERRORS^Print Errors from Last Projection^^R^^^^^^^^VA FILEMAN
	;;^UTILITY(U,$J,"OPT",8015,1,0)
	;;=^^2^2^2970718^^
	;;^UTILITY(U,$J,"OPT",8015,1,1,0)
	;;=Lists errors, sorted by category, generated by the most recent SQLI
	;;^UTILITY(U,$J,"OPT",8015,1,2,0)
	;;=projection run.
	;;^UTILITY(U,$J,"OPT",8015,25)
	;;=MAIN^DMSQE
	;;^UTILITY(U,$J,"OPT",8015,"U")
	;;=PRINT ERRORS FROM LAST PROJECT
	;;^UTILITY(U,$J,"OPT",8016,0)
	;;=DMSQ PS MENU^Site Statistics Reports^^M^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8016,1,0)
	;;=^^2^2^2970805^
	;;^UTILITY(U,$J,"OPT",8016,1,1,0)
	;;=This is a menu of reports that show counts of tables and columns for
	;;^UTILITY(U,$J,"OPT",8016,1,2,0)
	;;=this site (where SQLI is installed).
	;;^UTILITY(U,$J,"OPT",8016,10,0)
	;;=^19.01IP^9^9
	;;^UTILITY(U,$J,"OPT",8016,10,1,0)
	;;=8017^TBL^10
	;;^UTILITY(U,$J,"OPT",8016,10,1,"^")
	;;=DMSQ PS TOTAL TABLES
	;;^UTILITY(U,$J,"OPT",8016,10,2,0)
	;;=8018^1C^20
	;;^UTILITY(U,$J,"OPT",8016,10,2,"^")
	;;=DMSQ PS TOTAL COLUMNS
	;;^UTILITY(U,$J,"OPT",8016,10,3,0)
	;;=8019^INDX^30
	;;^UTILITY(U,$J,"OPT",8016,10,3,"^")
	;;=DMSQ PS TOTAL INDEXES
	;;^UTILITY(U,$J,"OPT",8016,10,4,0)
	;;=8020^ELEM^40
	;;^UTILITY(U,$J,"OPT",8016,10,4,"^")
	;;=DMSQ PS TOTAL TABLE ELEMENTS
	;;^UTILITY(U,$J,"OPT",8016,10,5,0)
	;;=8021^2C^50
	;;^UTILITY(U,$J,"OPT",8016,10,5,"^")
	;;=DMSQ PS TOTAL TABLE COLS
	;;^UTILITY(U,$J,"OPT",8016,10,6,0)
	;;=8022^3C^60
	;;^UTILITY(U,$J,"OPT",8016,10,6,"^")
	;;=DMSQ PS TOTAL TABLE COLS A
	;;^UTILITY(U,$J,"OPT",8016,10,7,0)
	;;=8024^FLDS^80
	;;^UTILITY(U,$J,"OPT",8016,10,7,"^")
	;;=DMSQ PS COLUMNS REG NOID
	;;^UTILITY(U,$J,"OPT",8016,10,8,0)
	;;=8023^4C^70
	;;^UTILITY(U,$J,"OPT",8016,10,8,"^")
	;;=DMSQ PS TOTAL COLUMNS REG
	;;^UTILITY(U,$J,"OPT",8016,10,9,0)
	;;=8036^DOM^90
	;;^UTILITY(U,$J,"OPT",8016,10,9,"^")
	;;=DMSQ PS COLUMNS BY DOMAIN
	;;^UTILITY(U,$J,"OPT",8016,99)
	;;=57909,41933
	;;^UTILITY(U,$J,"OPT",8016,"U")
	;;=SITE STATISTICS REPORTS
	;;^UTILITY(U,$J,"OPT",8017,0)
	;;=DMSQ PS TOTAL TABLES^Table Total (Excluding Index Tables)^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8017,1,0)
	;;=^^4^4^2970805^^
	;;^UTILITY(U,$J,"OPT",8017,1,1,0)
	;;=This report comes back with one number, the total number of tables, not
	;;^UTILITY(U,$J,"OPT",8017,1,2,0)
	;;=counting ones based on indexes.  This corresponds with the number of
	;;^UTILITY(U,$J,"OPT",8017,1,3,0)
	;;=files and subfiles, with word-processing fields also projected as separate
	;;^UTILITY(U,$J,"OPT",8017,1,4,0)
	;;=tables (just as subfiles).
	;;^UTILITY(U,$J,"OPT",8017,25)
	;;=EN1^DMSQP1
	;;^UTILITY(U,$J,"OPT",8017,"U")
	;;=TABLE TOTAL (EXCLUDING INDEX T
	;;^UTILITY(U,$J,"OPT",8018,0)
	;;=DMSQ PS TOTAL COLUMNS^Column Total (All Tables)^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8018,1,0)
	;;=^^3^3^2970805^^
	;;^UTILITY(U,$J,"OPT",8018,1,1,0)
	;;=This report calculates one number, the total number of columns in the
	;;^UTILITY(U,$J,"OPT",8018,1,2,0)
	;;=SQLI Column file.  This includes columns from tables based on indexes
	;;^UTILITY(U,$J,"OPT",8018,1,3,0)
	;;=as well as columns automatically created internal record numbers.
	;;^UTILITY(U,$J,"OPT",8018,25)
	;;=EN2^DMSQP1
	;;^UTILITY(U,$J,"OPT",8018,"U")
	;;=COLUMN TOTAL (ALL TABLES)
	;;^UTILITY(U,$J,"OPT",8019,0)
	;;=DMSQ PS TOTAL INDEXES^Index Table Total^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8019,1,0)
	;;=^^3^3^2970805^^
	;;^UTILITY(U,$J,"OPT",8019,1,1,0)
	;;=This report shows one number, the total number of tables that are
	;;^UTILITY(U,$J,"OPT",8019,1,2,0)
	;;=built from indexes.  (All regular cross-references, either for files
	;;^UTILITY(U,$J,"OPT",8019,1,3,0)
	;;=or subfiles, are projected as tables.)
	;;^UTILITY(U,$J,"OPT",8019,25)
	;;=EN3^DMSQP1
	;;^UTILITY(U,$J,"OPT",8019,"U")
	;;=INDEX TABLE TOTAL
	;;^UTILITY(U,$J,"OPT",8020,0)
	;;=DMSQ PS TOTAL TABLE ELEMENTS^Table Element Totals, By Type^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8020,1,0)
	;;=^^3^3^2970805^^
	;;^UTILITY(U,$J,"OPT",8020,1,1,0)
	;;=This report shows the total number of table elements along with
	;;^UTILITY(U,$J,"OPT",8020,1,2,0)
	;;=subtotals for the three types:  columns, foreign keys, and primary
	;;^UTILITY(U,$J,"OPT",8020,1,3,0)
	;;=keys.  
	;;^UTILITY(U,$J,"OPT",8020,25)
	;;=EN4^DMSQP1
	;;^UTILITY(U,$J,"OPT",8020,"U")
	;;=TABLE ELEMENT TOTALS, BY TYPE
	;;^UTILITY(U,$J,"OPT",8021,0)
	;;=DMSQ PS TOTAL TABLE COLS^Column Totals, by Table^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8021,1,0)
	;;=^^3^3^2970805^^
	;;^UTILITY(U,$J,"OPT",8021,1,1,0)
	;;=This is a long listing of all tables along with a count of the number
	;;^UTILITY(U,$J,"OPT",8021,1,2,0)
	;;=of columns in each one.  It is sorted by the file/subfile number
	;;^UTILITY(U,$J,"OPT",8021,1,3,0)
	;;=associated with the table.
	;;^UTILITY(U,$J,"OPT",8021,25)
	;;=EN5^DMSQP1
	;;^UTILITY(U,$J,"OPT",8021,"U")
	;;=COLUMN TOTALS, BY TABLE
	;;^UTILITY(U,$J,"OPT",8022,0)
	;;=DMSQ PS TOTAL TABLE COLS A^Column Totals, by Table (Ordered by # of Columns)^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8022,1,0)
	;;=^^3^3^2970805^^
	;;^UTILITY(U,$J,"OPT",8022,1,1,0)
	;;=This is a listing of tables by column count.  It shows the table with
	;;^UTILITY(U,$J,"OPT",8022,1,2,0)
	;;=the most columns first, so you can easily see which tables have the
	;;^UTILITY(U,$J,"OPT",8022,1,3,0)
	;;=most columns.
	;;^UTILITY(U,$J,"OPT",8022,25)
	;;=EN6^DMSQP1
	;;^UTILITY(U,$J,"OPT",8022,"U")
	;;=COLUMN TOTALS, BY TABLE (ORDER
	;;^UTILITY(U,$J,"OPT",8023,0)
	;;=DMSQ PS TOTAL COLUMNS REG^Columns in Regular Tables Total^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8023,1,0)
	;;=^^2^2^2970805^^
	;;^UTILITY(U,$J,"OPT",8023,1,1,0)
	;;=This report shows one number, the number of columns based on regular
	;;^UTILITY(U,$J,"OPT",8023,1,2,0)
	;;=tables.  It excludes columns based on tables created from indexes.
	;;^UTILITY(U,$J,"OPT",8023,25)
	;;=EN7^DMSQP1
	;;^UTILITY(U,$J,"OPT",8023,"U")
	;;=COLUMNS IN REGULAR TABLES TOTA
	;;^UTILITY(U,$J,"OPT",8024,0)
	;;=DMSQ PS COLUMNS REG NOID^Columns in Regular Tables, Excluding ID Columns^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8024,1,0)
	;;=^^7^7^2970805^^
	;;^UTILITY(U,$J,"OPT",8024,1,1,0)
	;;=This report shows one number, the number of columns that correspond
	;;^UTILITY(U,$J,"OPT",8024,1,2,0)
	;;=with regular fields in files.  It excludes columns based on tables
	;;^UTILITY(U,$J,"OPT",8024,1,3,0)
	;;=created from indexes.  It also excludes the automatically created
	;;^UTILITY(U,$J,"OPT",8024,1,4,0)
	;;=columns based on the internal entry numbers of files and subfiles.
	;;^UTILITY(U,$J,"OPT",8024,1,5,0)
	;;= 
	;;^UTILITY(U,$J,"OPT",8024,1,6,0)
	;;=It is the number of fields in the FileMan database, assuming all files
	;;^UTILITY(U,$J,"OPT",8024,1,7,0)
	;;=have been projected as tables.
	;;^UTILITY(U,$J,"OPT",8024,25)
	;;=EN8^DMSQP1
	;;^UTILITY(U,$J,"OPT",8024,"U")
	;;=COLUMNS IN REGULAR TABLES, EXC
	;;^UTILITY(U,$J,"OPT",8025,0)
	;;=DMSQ TS PTR PARENT BRIEF^List Pointer and Parent Links (Brief)^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8025,1,0)
	;;=^^4^4^2970805^^
	;;^UTILITY(U,$J,"OPT",8025,1,1,0)
	;;=This lists pointed-to files given a file number.  The pointed-to files
	;;^UTILITY(U,$J,"OPT",8025,1,2,0)
	;;=may either be connected via a regular pointer or via a subfile link to
	;;^UTILITY(U,$J,"OPT",8025,1,3,0)
	;;=a parent file.  The list of file numbers may then be used in other
	;;^UTILITY(U,$J,"OPT",8025,1,4,0)
	;;=options to find out more about the table build from that number.
	;;^UTILITY(U,$J,"OPT",8025,25)
	;;=EN2^DMSQP2
	;;^UTILITY(U,$J,"OPT",8025,"U")
	;;=LIST POINTER AND PARENT LINKS 
	;;^UTILITY(U,$J,"OPT",8026,0)
	;;=DMSQ TS PTR PARENT FULL^List Pointer and Parent Links (Full)^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8026,1,0)
	;;=^^4^4^2970805^^
	;;^UTILITY(U,$J,"OPT",8026,1,1,0)
	;;=This option shows the pointer and subfile links that reach outward from
	;;^UTILITY(U,$J,"OPT",8026,1,2,0)
	;;=a selected table.  Regular pointers (foreign keys or FKs) as well as
	;;^UTILITY(U,$J,"OPT",8026,1,3,0)
	;;=subfile links out and up to parent files (parent foreign keys or PFKs)
	;;^UTILITY(U,$J,"OPT",8026,1,4,0)
	;;=are shown.
	;;^UTILITY(U,$J,"OPT",8026,25)
	;;=EN2^DMSQP
	;;^UTILITY(U,$J,"OPT",8026,"U")
	;;=LIST POINTER AND PARENT LINKS 
	;;^UTILITY(U,$J,"OPT",8027,0)
	;;=DMSQ TS SUBFILE BRIEF^List Subfile Links (Brief)^^R^^^^^^^^
	;;^UTILITY(U,$J,"OPT",8027,1,0)
	;;=^^3^3^2970805^^
