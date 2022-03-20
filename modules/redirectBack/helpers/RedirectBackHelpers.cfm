<cfscript>

function redirectBack() {
    var moduleSettings = wirebox.getInstance( dsl = "coldbox:moduleSettings:redirectBack" );
    var flash = wirebox.getInstance( dsl = "coldbox:flash" );
    arguments.event = flash.get( moduleSettings.key, "" );
    relocate( argumentCollection = arguments );
}

</cfscript>
