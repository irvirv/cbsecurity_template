/** 
In this sample handler the component itself is marked as secured so all events are secured, meaning must be logged in. In 
addition events test2 thru test5 require additional permission(s) in order to display 
**/

component extends="coldbox.system.EventHandler" secured{

	
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
		event.setView("annotationbasedhandler/index");
	}

    // generic secured action
    function test1(event,rc,prc){
        event.setView("annotationbasedhandler/test");
	}

    // secured action requires "view" permission
    function test2(event,rc,prc) secured="view"{
        event.setView("annotationbasedhandler/test");
	}

    // secured action requires "update" permission
    function test3(event,rc,prc) secured="update"{
        event.setView("annotationbasedhandler/test");
	}

    // secured action requires "create" permission
    function test4(event,rc,prc) secured="create"{
        event.setView("annotationbasedhandler/test");
	}

    // secured action requires "create" or "update" permission
    function test5(event,rc,prc) secured="create,update"{
        event.setView("annotationbasedhandler/test");
	}

    // secured action requires "admin" permission
    function test6(event,rc,prc) secured="admin"{
        event.setView("annotationbasedhandler/test");
	}


}