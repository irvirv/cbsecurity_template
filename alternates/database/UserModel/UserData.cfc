component output="false" singleton {
    
    
    property name="BCrypt" inject="BCrypt@BCrypt";

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

    
    /**
    * check if password/username entered is a match with perm storage
    * Doing BCrypt password match here as part of data lookup ensures that no function 
    *   could end up calling this by mistake and have the password returned with the recordset
    *
    * @username The username
    * @password The password
    **/
    public boolean function CheckCredentials( required username, required password ){
        var rsData = queryExecute(
            "SELECT [password]
            FROM [demoapp].[AppUser].[tbl_user]
            WHERE username = :username", 
            {
                username = {value=arguments.username, CFSQLType='cf_sql_varchar'}
            },
            {datasource = datasources.demouser} 
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

    
    /**
    * get full user recordset based on ID
    *
    * @ID the userID
    **/
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