component {

	// Module Properties
	this.title 				= "redirectBack";
	this.author 			= "Eric Peterson";
	this.webURL 			= "https://github.com/elpete/redirectBack";
	this.description 		= "Caches the last request in the flash scope to give easy redirects back";
	this.version			= "1.0.1";

	function configure() {
		settings = {
            "key" = "last_url",
            "includeAjax" = false,
            "includeUDF" = javacast( "null", "" )
		};

        interceptors = [{
            class = "#moduleMapping#/interceptors/RedirectBack",
            name = "RedirectBack",
            properties = {}
        }];
	}

	function onLoad() {
        var helpers = controller.getSetting( "applicationHelper" );
        arrayAppend(
            helpers,
            "#moduleMapping#/helpers/RedirectBackHelpers.cfm"
        );
        controller.setSetting( "applicationHelper", helpers );
    }

    function onUnload() {
        controller.setSetting(
            "applicationHelper",
            arrayFilter( controller.getSetting( "applicationHelper" ), function( helper ) {
                return helper != "#moduleMapping#/helpers/RedirectBackHelpers.cfm";
            } )
        );
    }

}
