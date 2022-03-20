component output="false" singleton {

    property name="BCrypt" inject="BCrypt@BCrypt";
    
    /** some queries with test data ***/
    // password is "test" for all
    // our users
    tbl_user = queryNew("ID,firstname,lastname,username,password","Integer,Varchar,Varchar,Varchar,Varchar", 
        [ 
                {ID=1,firstname="Joe",lastname="The Student",username="joe_student",password="$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6"}, 
                {ID=2,firstname="Sally",lastname="The Professor",username="sally_prof",password="$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6"}, 
                {ID=3,firstname="Billy",lastname="The Tech Support Guy",username="billy_tech",password="$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6"},
                {ID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",password="$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6"}
        ]
    ); 

    // our roles
    tbl_role = queryNew("RoleID,RoleName,RoleDescription","Integer,Varchar,Varchar", 
        [ 
                {RoleID=1,RoleName="student",RoleDescription="student"}
                ,{RoleID=2,RoleName="professor",RoleDescription="professor"}
                ,{RoleID=3,RoleName="tech",RoleDescription="tech"}
        ]
    );

    // our permissions
    tbl_permission = queryNew("PermissionID,PermissionName,PermissionDescription","Integer,Varchar,Varchar", 
        [ 
                {PermissionID=1,PermissionName="view",PermissionDescription="view test results"}
                ,{PermissionID=2,PermissionName="update",PermissionDescription="update test results"}
                ,{PermissionID=3,PermissionName="create",PermissionDescription="create test results"}
                ,{PermissionID=4,PermissionName="modify",PermissionDescription="app administrative stuff"}
        ]
    );

    // match roles to one or more permissions
    tbl_role_permission = queryNew("RoleID,PermissionID","Integer,Integer", 
        [ 
                {RoleID=1,PermissionID=1} // student gets view
                ,{RoleID=2,PermissionID=1} // professor gets view
                ,{RoleID=2,PermissionID=2} // professor gets update
                ,{RoleID=2,PermissionID=3} // professor gets create
                ,{RoleID=3,PermissionID=4}  // tech gets modify
                //,{RoleID=3,PermissionID=1}  // tech gets view?  uncomment and reinit
        ]
    );

    // match user to one or more roles
    // each below - note Jane is a super user and gets all roles
    tbl_user_role = queryNew("ID,RoleID","Integer,Integer", 
        [ 
                {ID=1,RoleID=1} // Joe has student role
                ,{ID=2,RoleID=2} // Sally has professor role
                ,{ID=3,RoleID=3} // Billy has tech role
                ,{ID=4,RoleID=1} // Jane has student role
                ,{ID=4,RoleID=2} // ... Jane has professor role
                ,{ID=4,RoleID=3}  // ... Jane has tech role
        ]
    );
    
  
    
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
            "SELECT u.ID,u.[firstname],u.[lastname],u.[username],r.[roleName]
                ,r.[roleDescription],p.[permissionName],p.[permissionDescription]
            FROM tbl_user [u],
                tbl_user_role [ur],
                tbl_role [r],
                tbl_role_permission [rp],
                tbl_permission [p]
            WHERE (u.[username] = :username)
                AND (u.[ID] = ur.[ID]) 
                AND (ur.[RoleID] = r.[RoleID]) 
                AND (r.[RoleID] = rp.[RoleID]) 
                AND (rp.[PermissionID] = p.[PermissionID])", 
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
            "SELECT u.ID,u.[firstname],u.[lastname],u.[username],r.[roleName]
                ,r.[roleDescription],p.[permissionName],p.[permissionDescription]
            FROM tbl_user [u],
                tbl_user_role [ur],
                tbl_role [r],
                tbl_role_permission [rp],
                tbl_permission [p]
            WHERE (u.[ID] = :ID)
                AND (u.[ID] = ur.[ID]) 
                AND (ur.[RoleID] = r.[RoleID]) 
                AND (r.[RoleID] = rp.[RoleID]) 
                AND (rp.[PermissionID] = p.[PermissionID])", 
            {
                ID = {value=arguments.ID, CFSQLType='cf_sql_integer'}
            },
            {dbtype = "query"} 
        );
        return rsData;
    }



}