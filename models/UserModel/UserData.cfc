component output="false" singleton {
	
	
    /** some queries with test data ***/
    tbl_member = queryNew("memberID,firstname,lastname,username,password","Integer,Varchar,Varchar,Varchar,Varchar", 
        [ 
                {memberID=1,firstname="Joe",lastname="The Student",username="joe_student",password="test"}, 
                {memberID=2,firstname="Sally",lastname="The Professor",username="sally_prof",password="test"}, 
                {memberID=3,firstname="Billy",lastname="The Tech Support Guy",username="billy_tech",password="test"},
                {memberID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",password="test"}
        ]); 

    tbl_role = queryNew("roleID,roleName,roleDescription","Integer,Varchar,Varchar", 
         [ 
                {roleID=101,roleName="student",roleDescription="student"}, 
                {roleID=102,roleName="professor",roleDescription="professor"},  
                {roleID=103,roleName="tech",roleDescription="tech support"}
        ]);

    tbl_permission = queryNew("permissionID,permissionName,permissionDescription","Integer,Varchar,Varchar", 
         [ 
                {permissionID=1001,permissionName="view",permissionDescription="view test results"}, 
                {permissionID=1002,permissionName="update",permissionDescription="update test results"},  
                {permissionID=1003,permissionName="create",permissionDescription="create test results"},
                {permissionID=1004,permissionName="admin",permissionDescription="app administrative stuff"}
        ]);

    tbl_role_permission = queryNew("memberID,roleID","Integer,Integer", 
         [ 
                {roleID=101,permissionID=1001}, 
                {roleID=102,permissionID=1001}, 
                {roleID=102,permissionID=1002}, 
                {roleID=102,permissionID=1003}, 
                {roleID=103,permissionID=1004}, 
                {roleID=104,permissionID=1001}, 
                {roleID=104,permissionID=1002}, 
                {roleID=104,permissionID=1003}, 
                {roleID=104,permissionID=1004}
        ]);

    tbl_member_role = queryNew("memberID,roleID","Integer,Integer", 
         [ 
                {memberID=1,roleID=101},
                {memberID=2,roleID=102},  
                {memberID=3,roleID=103},
                {memberID=4,roleID=101},
                {memberID=4,roleID=102},
                {memberID=4,roleID=103}

        ]);

    tbl_resulting_member_perm_match = queryNew("memberID,firstname,lastname,username,roleName,roleDescription,permissionName,permissionDescription","Integer,Varchar,Varchar,Varchar,Varchar,Varchar,Varchar,Varchar", 
        [ 
                // 1st user (student)
                {memberID=1,firstname="Joe",lastname="The Student",username="joe_student",roleName="student",roleDescription="student",permissionName="view",permissionDescription="view test results"}, 
                // 2nd user (professor)
                {memberID=2,firstname="Sally",lastname="The Professor",username="sally_prof",roleName="professor",roleDescription="professor",permissionName="view",permissionDescription="view test results"},
                {memberID=2,firstname="Sally",lastname="The Professor",username="sally_prof",roleName="professor",roleDescription="professor",permissionName="update",permissionDescription="update test results"},
                {memberID=2,firstname="Sally",lastname="The Professor",username="sally_prof",roleName="professor",roleDescription="professor",permissionName="create",permissionDescription="create test results"}, 
                // 3rd user (tech support)
                {memberID=3,firstname="Billy",lastname="The Tech Support Guy",username="billy_tech",roleName="tech",roleDescription="tech support",permissionName="admin",permissionDescription="app administrative stuff"}, 
                // 4th user (super admin - all roles)
                {memberID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="student",roleDescription="student",permissionName="view",permissionDescription="view test results"},
                {memberID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="professor",roleDescription="professor",permissionName="view",permissionDescription="view test results"}, 
                {memberID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="professor",roleDescription="professor",permissionName="update",permissionDescription="update test results"},
                {memberID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="professor",roleDescription="professor",permissionName="create",permissionDescription="create test results"}, 
                {memberID=4,firstname="Jane",lastname="Super Admin Person",username="jane_admin",roleName="tech",roleDescription="tech support",permissionName="admin",permissionDescription="app administrative stuff"}
        ]); 

    
  
    
    /**
	* init
	**/
	public function init(){
		return this;
	}	

    
    public query function checkCredentials( required loginUsername, required loginPassword ){
        var rsData = queryExecute(
            "SELECT memberID 
            FROM tbl_member
            WHERE username = :username AND password = :password", 
            {
                username = {value=arguments.loginUsername, CFSQLType='cf_sql_varchar'}, 
                password = {value=arguments.loginPassword, CFSQLType='cf_sql_varchar'}
            },
            {dbtype = "query"} 
        );
        return rsData;
        /**
        writeDump(rsData);
        writeDump(tbl_member); 
        writeDump(tbl_role);
        writedump(tbl_permission);
        writedump(tbl_role_permission);
        writedump(tbl_member_role); abort;
        **/
    }


    public query function GetByUserName( required username ){
        /** can't use this as QofQ does not support JOINS
        var rsData = queryExecute(
            "SELECT M.memberID, M.firstname, M.lastname, M.username, R.roleName, R.roleDescription, P.permissionName, P.permissionDescription
            FROM tbl_member M INNER JOIN 
                tbl_member_role MR ON MR.memberID = M.memberID INNER JOIN 
                tbl_role R ON R.roleID = MR.roleID INNER JOIN 
                tbl_role_permission RP ON RP.roleID = R.roleID INNER JOIN 
                tbl_permission P ON P.permissionID = RP.permissionID
            WHERE M.username = :username", 
            {
                username = {value=arguments.username, CFSQLType='cf_sql_varchar'}
            },
            {dbtype = "query"} 
        );
        **/
        var rsData = queryExecute(
            "SELECT memberID, firstname, lastname, username, roleName [roles], roleDescription, permissionName [permissions], permissionDescription
            FROM tbl_resulting_member_perm_match
            WHERE username = :username", 
            {
                username = {value=arguments.username, CFSQLType='cf_sql_varchar'}
            },
            {dbtype = "query"} 
        );
        return rsData;
    }

     public query function GetByID( required memberID ){
        /** can't use this as QofQ does not support JOINS
        var rsData = queryExecute(
            "SELECT M.memberID, M.firstname, M.lastname, M.username, R.roleName, R.roleDescription, P.permissionName, P.permissionDescription
            FROM tbl_member M INNER JOIN 
                tbl_member_role MR ON M.memberID = MR.memberID INNER JOIN 
                tbl_role R ON MR.roleID = R.roleID INNER JOIN 
                tbl_role_permission RP ON R.roleID = RP.roleID INNER JOIN 
                tbl_permission P ON RP.permissionID = P.permissionID
            WHERE M.username = :username", 
            {
                memberID = {value=arguments.memberID, CFSQLType='cf_sql_integer'}
            },
            {dbtype = "query"} 
        );
        **/
        var rsData = queryExecute(
            "SELECT memberID, firstname, lastname, username, roleName, roleDescription, permissionName, permissionDescription
            FROM tbl_resulting_member_perm_match
            WHERE memberID = :memberID", 
            {
                memberID = {value=arguments.memberID, CFSQLType='cf_sql_integer'}
            },
            {dbtype = "query"} 
        );
        return rsData;
    }



}