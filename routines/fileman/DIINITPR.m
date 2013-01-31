DIINITPR ; VEN/SMH - Fileman 22.2 Post-Init; 31-JAN-2013
 ;;22.2V0;VA FILEMAN;
 ;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 W !!,"Executing the Pre-Init for Fileman 22.2",!!
 ;
 ; We will postpone this to 22.3 and move it over to DINIT.
 ; Kill data dictionary audit nodes as they are no longer used in FM 22.2
 ; W "Deleting the now no longer used ^DD(FN,0,""DDA"") nodes",!
 ; N I F I=-1:0 S I=$O(^DD(I)) Q:+I'=I  K ^DD(I,0,"DDA")
 ;
 ; Remove old now not used DIAUDIT DD menu option
 ; Unfortunately, Fileman doesn't have an API to do this. We have to 
 ; sneak into KIDS.
 W "Deleting the DIAUDIT DD menu option, no longer used in FM 22.2",!
 N OPTIEN S OPTIEN=$O(^DIC(19,"B","DIAUDIT DD","")) ; Get Option IEN
 QUIT:OPTIEN=""
 K ^TMP($J,"XPDEL") ; Kill data container
 S ^TMP($J,"XPDEL",OPTIEN)="" ; Put the options to delete
 D OPTDEL^XPDIA ; KIDS private API.
 QUIT
