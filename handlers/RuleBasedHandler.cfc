/** 
In this sample handler we're using the rules JSON in coldbox.cfc to secure
**/

component extends="coldbox.system.EventHandler"{

	
    /**
	* prehandler 
	**/
	public function preHandler(event,rc,prc,action){
		// get user object and set in prc
		// catch not logged in here since rules based validation doesn't redir on its own like annotation based does
        try{
			prc.oUser = auth().getuser();
		}catch( "NoUserLoggedIn" e){
			relocate("security.loginform");
		}
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