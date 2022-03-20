/** 
In this sample handler we're using the rules JSON in coldbox.cfc to secure
**/

component extends="coldbox.system.EventHandler"{

	
    
    // Default Action (not secured per security.json.cfm)
	function index(event,rc,prc){
	}


    // generic secured action based on rule in security.json.cfm
    function test1(event,rc,prc){
		prc.oUser = auth().getuser();
	}

    // secured action additionally requires "modify" permission
    function test2(event,rc,prc) secured="modify"{
        prc.oUser = auth().getuser();
	}




}