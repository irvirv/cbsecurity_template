/** 
In this sample handler we're using the rules JSON in coldbox.cfc to secure
**/

component extends="coldbox.system.EventHandler"{

	
    
    // Default Action (not secured per security.json.cfm)
	function index(event,rc,prc){
	}


    // generic secured action
	/** oUser is set here (per event) rather than prehandler as that would require a user for whole handler 
		which we might not want.  For instance, 'index' above doesn't require a user logged in but we'd be getting one 
		so would throw an error. 
	**/
    function test1(event,rc,prc){
		prc.oUser = auth().getuser();
	}

    // secured action additionally requires "modify" permission
    function test2(event,rc,prc) secured="modify"{
        prc.oUser = auth().getuser();
	}




}