/** 
In this sample handler we're using the rules JSON in coldbox.cfc to secure
**/

component extends="coldbox.system.EventHandler"{

	
    /**
	* prehandler 
	**/
	public function preHandler(event,rc,prc,action){
		// get user object and set in prc
        prc.oUser = auth().getuser();
	}
    
    
    // Default Action (secured)
	function index(event,rc,prc){
		prc.welcomeMessage = "Welcome to ColdBox!";
		event.setView("rolebasedhandler/index");
	}


     // generic secured action
    function test1(event,rc,prc){
        event.setView("rolebasedhandler/test");
	}

    // secured action requires "admin" permission
    function test2(event,rc,prc) secured="admin"{
        event.setView("rolebasedhandler/test");
	}




}