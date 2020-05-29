component singleton implements="cbsecurity.interfaces.IUserService" {
	
    
    property name="UserData" inject="id:UserModel.UserData";
	property name="idleTimeout" inject="coldbox:setting:idleTimeout";
	property name="wirebox" inject="wirebox";
	property name="populator" inject="wirebox:populator";
	
	
    /**
	* init
	**/
	public function init(){
		return this;
	}


	/**
    * Verify if the incoming username/password are valid credentials.
	* $$$$$$ This needs to use bcrypt in real life! 
    *
    * @username The username
    * @password The password
    **/
    boolean function isValidCredentials( required username, required password ){
		var rsUserID = UserData.checkCredentials(
    		loginUsername = arguments.userName,
    		loginPassword = arguments.password 
		);
		if(  rsUserID.recordcount ){
			// populate user object
			populateUserByID( rsUserID.memberID );
			return true;
		}else{
			return false;
		}
	}


    /**
    * Retrieve a user by unique identifier
    *
    * @id The unique identifier
    *
    * @return User that implements JWTSubject and/or IAuthUser
    **/
    function retrieveUserById( required id ){
		var oUser = wirebox.getInstance("usermodel.User");
		if( oUser.getID() != arguments.id ){
			throw( type = "NoUserLoggedIn", message = "No user is currently logged in." );
		}
		return oUser;
	}

	/**
    * Retrieve a user by username
    *
    * @return User that implements JWTSubject and/or IAuthUser
    **/
    function retrieveUserByUsername( required username ){
		var oUser = wirebox.getInstance("usermodel.User");
		if( oUser.getUserName() != arguments.username ){
			throw( type = "NoUserLoggedIn", message = "No user is currently logged in." );
		}
		return oUser;
	}

	/**
	* @username The unique username
	* populates user object
	**/
	private function populateUserByUsername( required username ){
		var oUser = wirebox.getInstance("usermodel.User");
		var rsUserInfo = UserData.GetByUserName(
			username = arguments.username
		);
		var strUser = {
			memberID = rsUserInfo.memberID,
			username = rsUserInfo.username,
			firstName = rsUserInfo.firstname,
			lastName = rsUserInfo.lastname,
			roles = ListRemoveDuplicates(valuelist(rsUserInfo.roles),",",true),
			permissions = ListRemoveDuplicates(valuelist(rsUserInfo.permissions),",",true)
		}
		populator.populateFromStruct( target=oUser, memento=strUser, ignoreEmpty=true );
	}

	/**
	* @ID The unique identifier
	* populates user object
	**/
	private function populateUserByID( required numeric ID ){
		var oUser = wirebox.getInstance("usermodel.User");
		var rsUserInfo = UserData.GetByID(
			ID = arguments.ID
		);
		var strUser = {
			memberID = rsUserInfo.memberID,
			username = rsUserInfo.username,
			firstName = rsUserInfo.firstname,
			lastName = rsUserInfo.lastname,
			roles = ListRemoveDuplicates(valuelist(rsUserInfo.roles),",",true),
			permissions = ListRemoveDuplicates(valuelist(rsUserInfo.permissions),",",true)
		}
		populator.populateFromStruct( target=oUser, memento=strUser, ignoreEmpty=true );
	}




}