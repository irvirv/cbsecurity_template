component{

	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= getSystemSetting( "APPNAME", "Your app name here" ),
			eventName 				= "event",

			//Development Settings
			reinitPassword			= "",
			handlersIndexAutoReload = true,

			//Implicit Events
			defaultEvent			= "",
			requestStartHandler		= "Main.onRequestStart",
			requestEndHandler		= "",
			applicationStartHandler = "Main.onAppInit",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",

			//Extension Points
			applicationHelper 			= "includes/helpers/ApplicationHelper.cfm",
			viewsHelper					= "",
			modulesExternalLocation		= [],
			viewsExternalLocation		= "",
			layoutsExternalLocation 	= "",
			handlersExternalLocation  	= "",
			requestContextDecorator 	= "",
			controllerDecorator			= "",

			//Error/Exception Handling
			invalidHTTPMethodHandler 	= "",
			exceptionHandler			= "main.onException",
			invalidEventHandler			= "",
			customErrorTemplate			= "/coldbox/system/exceptions/Whoops.cfm",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			viewCaching				= false,
			// Will automatically do a mapDirectory() on your `models` for you.
			autoMapModels			= true
		};

		// custom settings
		settings = {
			idleTimeout = 30,
			maxPasswordLength = 32,
			maxUserNameLength = 50
		};
		
		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "localhost,^127\.0\.0\.1"
		};

		// Module Directives
		modules = {
			// An array of modules names to load, empty means all of them
			include = [],
			// An array of modules names to NOT load, empty means none
			exclude = []
		};

		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxTracer = { class="coldbox.system.logging.appenders.ConsoleAppender" }
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};

		//Layout Settings
		layoutSettings = {
			defaultLayout = "",
			defaultView   = ""
		};

		//Interceptor Settings
		interceptorSettings = {
			customInterceptionPoints = ""
		};

		//Register interceptors as an array, we need order
		interceptors = [
			{
				class="interceptors.UserLogin",
				properties={}
			}
		];
		
		// module setting overrides
		moduleSettings = {
			cbAuth: {
				userServiceClass: "Usermodel.UserService"
			},
			// CB Security
			cbSecurity : {
				// The global invalid authentication event or URI or URL to go if an invalid authentication occurs
				"invalidAuthenticationEvent"    : "security.loginform",
				// Default Auhtentication Action: override or redirect when a user has not logged in
				//"defaultAuthenticationAction"	: "redirect",
				// The global invalid authorization event or URI or URL to go if an invalid authorization occurs
				"invalidAuthorizationEvent"		: "main.onInvalidAuthorization",
				// Default Authorization Action: override or redirect when a user does not have enough permissions to access something
				//"defaultAuthorizationAction"	: "redirect",
				// You can define your security rules here or externally via a source
				"rulesSource" : "json",
				"rulesFile" : "config/security.json.cfm",
				// The validator is an object that will validate rules and annotations and provide feedback on either authentication or authorization issues.
				"validator"						: "CBAuthValidator@cbsecurity",
				// The WireBox ID of the authentication service to use in cbSecurity which must adhere to the cbsecurity.interfaces.IAuthService interface.
				"authenticationService"  		: "authenticationService@cbauth",
				// WireBox ID of the user service to use
				//"userService"             		: "",
				// The name of the variable to use to store an authenticated user in prc scope if using a validator that supports it.
				//"prcUserVariable"         		: "oCurrentUser",
				// Use regular expression matching on the rule match types
				"useRegex" 						: true,
				// Force SSL for all relocations
				"useSSL"						: false,
				// Auto load the global security firewall
				"autoLoadFirewall"				: true,
				// Activate handler/action based annotation security
				"handlerAnnotationSecurity"		: true,
				// Activate security rule visualizer, defaults to false by default
				"enableSecurityVisualizer"		: true
			}
		};

		/*
		
		// flash scope configuration
		flash = {
			scope = "session,client,cluster,ColdboxCache,or full path",
			properties = {}, // constructor properties for the flash scope implementation
			inflateToRC = true, // automatically inflate flash data into the RC scope
			inflateToPRC = false, // automatically inflate flash data into the PRC scope
			autoPurge = true, // automatically purge flash data for you
			autoSave = true // automatically save flash scopes at end of a request and on relocations.
		};

		//Register Layouts
		layouts = [
			{ name = "login",
		 	  file = "Layout.tester.cfm",
			  views = "vwLogin,test",
			  folders = "tags,pdf/single"
			}
		];

		//Conventions
		conventions = {
			handlersLocation = "handlers",
			viewsLocation 	 = "views",
			layoutsLocation  = "layouts",
			modelsLocation 	 = "models",
			eventAction 	 = "index"
		};
		*/

	}

	/**
	* Development environment
	*/
	function development(){
		coldbox.customErrorTemplate = "/coldbox/system/exceptions/Whoops.cfm";
	}

}