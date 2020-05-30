component output="false" singleton {
    
    // this will need set up to match your sql server database.
    datasources["demouser"] = {
        class: 'com.microsoft.sqlserver.jdbc.SQLServerDriver'
        , bundleName: 'org.lucee.mssql'
        , bundleVersion: '7.2.2.jre8'
        , connectionString: 'jdbc:sqlserver://localhost:1433;Initial Catalog=master;'
        , username: 'cf_demo_test'
        , password: 'Hello1234$'
        // optional settings
        , connectionLimit:100 // default:-1
        , validate:false // default: false
    };
    
    
    /**
	* init
	**/
	public function init(){

		return this;
	}	

    
    public query function checkCredentials( required loginUsername, required loginPassword ){
        try{
            var rsData = queryExecute(
                "SELECT [ID]
                FROM [demoapp].[AppUser].[tbl_user]
                WHERE username = :username AND password = :password", 
                {
                    username = {value=arguments.loginUsername, CFSQLType='cf_sql_varchar'}, 
                    password = {value=arguments.loginPassword, CFSQLType='cf_sql_varchar'}
                },
                {datasource = datasources.demouser} 
            );
            return rsData;
        }catch( any e){
            writedump(e); abort;
        }
        
    }


    public query function GetByUserName( required username ){
        var rsData = queryExecute(
            "SELECT [ID]
                ,[firstname]
                ,[lastname]
                ,[username]
                ,[roleName]
                ,[roleDescription]
                ,[permissionName]
                ,[permissionDescription]
                ,[password]
            FROM [demoapp].[AppUser].[v_User]
            WHERE [username] = :username", 
            {
                username = {value=arguments.username, CFSQLType='cf_sql_varchar'}
            },
            {datasource = datasources.demouser} 
        );
        return rsData;
    }

     public query function GetByID( required ID ){
        var rsData = queryExecute(
        "SELECT [ID]
                ,[firstname]
                ,[lastname]
                ,[username]
                ,[roleName]
                ,[roleDescription]
                ,[permissionName]
                ,[permissionDescription]
                ,[password]
            FROM [demoapp].[AppUser].[v_User]
            WHERE ID = :userID", 
            {
                userID = {value=arguments.ID, CFSQLType='cf_sql_integer'}
            },
            {datasource = datasources.demouser} 
        );
        return rsData;
    }



}