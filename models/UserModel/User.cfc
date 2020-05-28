component scope="session" accessors="true" implements="cbsecurity.interfaces.IAuthUser"{

	property name="memberID";
	property name="username";
	property name="roles";
	property name="permissions";
	property name="firstName";
	property name="lastName";
	property name="email";
	property name="IPAddr";
	property name="arrRoles" type="array" default="[]"; // note default is not true array but rather a string. Be sure to check if array when using.
	property name="arrPermissions" type="array" default="[]"; // note default is not true array but rather a string. Be sure to check if array when using.
    
	
	/**
	* init
	**/
	function init(){
		return this;
	}

	/**
    * Return the unique identifier for the user
    **/
	public function getId(){
		return getMemberID();
	}

    /**
    * Verify if the user has passed in permission
    *
    * @permission permission to check for access
    *
    **/
    public boolean function hasPermission( required permission ){
		// if is boolean then nothing really to check as we've already checked if logged in.  This is simple "secured" vs not (no roles or permissions).
		//TODO fix check for boolean if they change passing in a boolean value for permission when event handler is simply "secured"
		// any named permissions come in as a list so match that list with list user has
		if( IsBoolean( arguments.permission ) ){
			if( arguments.permission ){
                return true;
            }else{
                return false;
            }
		}
		// if user has permissions check for existence of one passed in.
		if( len( getPermissions() ) ){
			// array of permissions user has
			var arrUserPerms = ListToArray(getPermissions());
			// array of a list of permissions, one of which is needed
			var arrNeededPerms = ListToArray(arguments.permission);
			// any matches?
			arrNeededPerms.retainAll(arrUserPerms);
			// 1+ is success / 0 false
			return arrayLen(arrNeededPerms);
		}else{
			// no user permissions so not possible they have the one desired 
			return false;
		}	
	}

    /**
    * Shortcut to verify if the user is logged in or not.
    **/
    public boolean function isLoggedIn(){
		if( isValid("integer",getMemberID()) ){
			return true;
		}else{
			return false;
		}
	}

	
}