component output="false" singleton {

     /** some queries with test data ***/
    tbl_user = queryNew("ID,firstname,lastname,username,password","Integer,Varchar,Varchar,Varchar,Varchar", 
        [ 
                {ID=1,firstname="Joe",lastname="The Student",username="joe_student",password="test"}, 
                {ID=2,firstname="Sally",lastname="The Professor",username="sally_prof",password="test"}, 
                {ID=3,firstname="Billy",lastname="The Tech Support Guy",username="billy_tech",password="test"},
                {ID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",password="test"}
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

    
    public query function checkCredentials( required loginUsername, required loginPassword ){
        var rsData = queryExecute(
            "SELECT ID 
            FROM tbl_user
            WHERE username = :username AND password = :password", 
            {
                username = {value=arguments.loginUsername, CFSQLType='cf_sql_varchar'}, 
                password = {value=arguments.loginPassword, CFSQLType='cf_sql_varchar'}
            },
            {dbtype = "query"} 
        );
        return rsData;
    }


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