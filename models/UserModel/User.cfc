component scope="session" accessors="true" implements="cbsecurity.interfaces.IAuthUser"{

	property name="userID";
	property name="username";
	property name="roles";
	property name="permissions";
	property name="firstName";
	property name="lastName";
	property name="email";
	property name="IPAddr";
	property name="arrRoles" type="array"; 
	property name="arrPermissions" type="array";
    
	
	/**
	* init
	**/
	function init(){
		variables.arrRoles = [];
		variables.arrPermissions = [];

		return this;
	}


	/**
    * Return the unique identifier for the user
    **/
	public function getId(){
		return variables.userID;
	}

    /**
    * Verify if the user has passed in permission
    *
    * @permission permission to check for access
    *
    **/
    public boolean function hasPermission( required permission ){
		// if is boolean then nothing really to check as we've already checked if logged in.  This is simple "secured" vs not (no roles or permissions).
		if( IsBoolean( arguments.permission ) ){
			return arguments.permission;
		}
		// any named permissions come in as a list so match that list with list user has
		// if user has permissions check for existence of one passed in.
		if( len( variables.permissions ) ){
			// array of permissions user has
			if ( isSimpleValue( arguments.permission ) ) {
				// array of a list of permissions, one of which is needed
				arguments.permission = listToArray( arguments.permission );
			}
			return arguments.permission
				.filter( function( item ) {
					return ( variables.permissions.ListFindNoCase( item ) );
				} )
				.len();
		}else{
			// no user permissions so not possible they have the one desired 
			return false;
		}	
	}

    /**
    * in example userIDs are non-zero integers
    **/
    public boolean function isLoggedIn(){
		if( isValid("integer", variables.userID ) && variables.userID ){
			return true;
		}else{
			return false;
		}
	}

	
}