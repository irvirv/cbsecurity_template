component {
	
    // services
	// settings
	property name="maxPasswordLength" inject="coldbox:setting:maxPasswordLength";
	property name="maxUserNameLength" inject="coldbox:setting:maxUserNameLength";

    
	/**
	* login form
	**/
	public function loginform(event,rc,prc){
		event.paramValue("_securedUrl","");
		prc.xe_LoginAction = "security.loginaction";
		event.setView( view="security/loginform", noLayout=true );
	}


    /**
	* login form action
	**/
	public function loginaction(event,rc,prc){
		for( var item in rc ){
            if( IsSimpleValue(rc[item]) ){
                rc[item] = trim(rc[item]);
            }
        }
		var badFormValues = 0;
    	var loginFailed = 0;
		var arrValidationMsgs = []; // array that holds the validation messages
		// check user inputs
		if ( !len(rc.userName) ){
      		badFormValues = 1;
      		ArrayAppend(arrValidationMsgs, "The username field is required but was not provided." ); 
      	}
      	if ( !len(rc.password) ){
      		badFormValues = 1;
      		ArrayAppend(arrValidationMsgs, "The Password field is required but was not provided." );
      	}
		if( badFormValues ){
			// some bad input - send back
			getInstance("messagebox@cbmessagebox").error( messageArray=arrValidationMsgs );
			redirectBack( persist="_securedUrl" );
		}else{
      		// try authenticating now using cbauth
			try{
				auth().authenticate(
					username = left(rc.userName,maxUserNameLength),
					password = left(rc.password,maxPasswordLength)
				);
				if ( !auth().check() ){
					//something failed
					loginFailed = 1;
					ArrayAppend(arrValidationMsgs, "Login Failed. Please try again." );
				}
			}catch( InvalidCredentials e ){
				//invalid credentials
				loginFailed = 1;
				ArrayAppend(arrValidationMsgs, e.message );
			}
      	}
      	if (loginFailed){
      		
			getInstance("messagebox@cbmessagebox").error( messageArray=arrValidationMsgs );
			redirectBack( persist="_securedUrl" );

      	}else{
			getInstance("messagebox@cbmessagebox").success( "You have successfully logged in!" );
			if( len(rc._securedUrl) ){
				relocate(url=rc._securedUrl, SSL=false);
			}else{
				relocate(event="main/index", SSL=false);
			}
      	}
	}


	/**
	* signout
	**/
	public function logout(event,rc,prc){
		event.paramValue("_securedUrl","main/index");
		auth().logout();
		relocate(event="main/index", SSL=false);
       
	}


}