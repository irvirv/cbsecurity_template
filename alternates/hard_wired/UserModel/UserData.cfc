component output="false" singleton {

    property name="BCrypt" inject="BCrypt@BCrypt";
    
    /** some queries with test data ***/
    // password is "test" for all
    tbl_user = queryNew("ID,firstname,lastname,username,password","Integer,Varchar,Varchar,Varchar,Varchar", 
        [ 
                {ID=1,firstname="Joe",lastname="The Student",username="joe_student",password="$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6"}, 
                {ID=2,firstname="Sally",lastname="The Professor",username="sally_prof",password="$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6"}, 
                {ID=3,firstname="Billy",lastname="The Tech Support Guy",username="billy_tech",password="$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6"},
                {ID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",password="$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6"}
        ]); 
    
    
    tbl_resulting_user_perm_match = queryNew("ID,firstname,lastname,username,roleName,roleDescription,permissionName,permissionDescription","Integer,Varchar,Varchar,Varchar,Varchar,Varchar,Varchar,Varchar", 
        [ 
                // 1st user (student)
                {ID=1,firstname="Joe",lastname="The Student",username="joe_student",roleName="student",roleDescription="student",permissionName="view",permissionDescription="view test results"}, 
                // 2nd user (professor)
                {ID=2,firstname="Sally",lastname="The Professor",username="sally_prof",roleName="professor",roleDescription="professor",permissionName="view",permissionDescription="view test results"},
                {ID=2,firstname="Sally",lastname="The Professor",username="sally_prof",roleName="professor",roleDescription="professor",permissionName="update",permissionDescription="update test results"},
                {ID=2,firstname="Sally",lastname="The Professor",username="sally_prof",roleName="professor",roleDescription="professor",permissionName="create",permissionDescription="create test results"}, 
                // 3rd user (tech support)
                {ID=3,firstname="Billy",lastname="The Tech Support Guy",username="billy_tech",roleName="tech",roleDescription="tech support",permissionName="admin",permissionDescription="app administrative stuff"}, 
                // 4th user (super admin - all roles)
                {ID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="student",roleDescription="student",permissionName="view",permissionDescription="view test results"},
                {ID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="professor",roleDescription="professor",permissionName="view",permissionDescription="view test results"}, 
                {ID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="professor",roleDescription="professor",permissionName="update",permissionDescription="update test results"},
                {ID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="professor",roleDescription="professor",permissionName="create",permissionDescription="create test results"}, 
                {ID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="tech",roleDescription="tech support",permissionName="admin",permissionDescription="app administrative stuff"}
        ]); 

    
  
    
    /**
	* init
	**/
	public function init(){
		return this;
	}	

    
    /**
    * check if password/username entered is a match with perm storage
    * Doing BCrypt password match here as part of data lookup ensures that no function 
    *   could end up calling this by mistake and have the password returned with the recordset
    *
    * @username The username
    * @password The password
    **/
    public boolean function CheckCredentials( required username, required password ){
        // get user's password based on username entered
        var rsData = queryExecute(
            "SELECT password
            FROM tbl_user
            WHERE username = :username", 
            {
                username = {value=arguments.username, CFSQLType='cf_sql_varchar'}
            },
            {dbtype = "query"} 
        );
        if( rsData.recordcount ){
            // user found - return match success/fail on password entered
            try{
                return BCrypt.checkPassword( arguments.password, rsData.password );
            }catch(any){
                // this is here because if the value stored in database isn't a valid bcrypt hash then BCrypt.checkPassword throws an error rather 
                // than returning false. For instance an empty string or something....
                // probably should log this
                return false;
            }
        }else{
            // no user with that username found - regardless of password
            return false;
        }
    }


    /**
    * get full user recordset based on username
    *
    * @username The username
    **/
    public query function GetByUserName( required username ){
        var rsData = queryExecute(
            "SELECT ID, firstname, lastname, username, roleName, roleDescription, permissionName, permissionDescription
            FROM tbl_resulting_user_perm_match
            WHERE username = :username", 
            {
                username = {value=arguments.username, CFSQLType='cf_sql_varchar'}
            },
            {dbtype = "query"} 
        );
        return rsData;
    }

    
    /**
    * get full user recordset based on ID
    *
    * @ID the userID
    **/
    public query function GetByID( required ID ){
        var rsData = queryExecute(
            "SELECT ID, firstname, lastname, username, roleName, roleDescription, permissionName, permissionDescription
            FROM tbl_resulting_user_perm_match
            WHERE ID = :ID", 
            {
                ID = {value=arguments.ID, CFSQLType='cf_sql_integer'}
            },
            {dbtype = "query"} 
        );
        return rsData;
    }



}