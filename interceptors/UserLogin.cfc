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
	 * @interceptData
	 * @rc
	 * @prc
	 * @buffer
	 */
	boolean function postAuthentication(
		event,
		interceptData,
		rc,
		prc,
		buffer
	){
		var hello = "hi";
		//writedump(hello);
		//writedump(interceptData); abort;
		return 1;
	}
	

	
}

