/**
* I am a new interceptor
*/
component{
	
	void function configure(){
	
	}


	/**
	 * Listen to module loadings, so we can do module rule registrations
	 *
	 * @event
	 * @data
	 * @rc
	 * @prc
	 * @buffer
	 */
	boolean function postAuthentication(
		event,
		data,
		rc,
		prc,
		buffer
	){
		var hello = "hi";
		//writedump(hello);
		//writedump(data); abort;
		return 1;
	}
	

	/**
	* called by cbsecurity if a user is logged in but authorization has failed (wrong permission)
	*  uncomment and reinit to see it fire
	**/
	function cbSecurity_onInvalidAuthorization(
		event,
		data,
		rc,
		prc,
		buffer
	){
		//writedump(arguments); abort;
	}

	/**
	* called by cbsecurity if a user's login attempt fails
	*  uncomment and reinit to see it fire
	**/
	function cbSecurity_onInvalidAuthentication(
		event,
		data,
		rc,
		prc,
		buffer
	){
		//writedump(arguments); abort;
	}

	
}

