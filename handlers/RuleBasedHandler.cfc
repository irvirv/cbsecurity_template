/** 
In this sample handler we're using the rules JSON in coldbox.cfc to secure
**/

component extends="coldbox.system.EventHandler"{

	
    
    // Default Action (secured)
	function index(event,rc,prc){
		prc.welcomeMessage = "Welcome to ColdBox!";
		event.setView("rolebasedhandler/index");
	}


    // generic secured action
	/** oUser is set here (per event) rather than prehandler as that would require a user for whole handler 
		which we might not want.  For instance, 'index' above doesn't require a user logged in but we'd be getting one 
		so would throw an error. 
	**/
    function test1(event,rc,prc){
		prc.oUser = auth().getuser();
		event.setView("rolebasedhandler/test");
	}

    // secured action requires "admin" permission
    function test2(event,rc,prc) secured="admin"{
        prc.oUser = auth().getuser();
		event.setView("rolebasedhandler/test");
	}




}