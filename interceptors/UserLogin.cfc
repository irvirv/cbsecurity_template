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
	

	
}

