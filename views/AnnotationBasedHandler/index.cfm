 <cfoutput>
 #getInstance( "messagebox@cbmessagebox" ).renderIt()#
<br />
    <p>
        This handler has an annotation of "secured" at the handler level.  All events in handler are secured via a simple yes/no 
        of whether or not you are logged in. You can see this in AnnotationBasedHandler.cfc in the component creation 
        (" <strong><em>component extends="coldbox.system.EventHandler" <mark>secured</mark>{</em></strong> "). The links below 
        are either secured as above (eg the "simply logged in" link) or have additional permissions/roles needed.  In parentheses are 
        the roles that map to these permissions so you know who you need to log in as. Note to keep things uniform I used permissions 
        as my annotations with the idea that "roles have permissions and permissions are what's required to access things". You could easily 
        do away with that second layer and just assign access based on a role by annotating with role names.  You wouldn't even need the permission 
        tables in that case.  
    </p>


    <ul>
        <li><a href="#event.buildlink("annotationbasedhandler.test1")#">simply logged in</a> (anyone logged in - handler annotation of "secured" requires you to be logged in)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test2")#">view permission</a> (student, professor or super admin)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test3")#">update permission</a> (professor or super admin)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test4")#">create permission</a> (professor or super admin)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test5")#">create or update permission</a> (professor or super admin)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test6")#">modify permission</a> (admin or super admin)</li>
    </ul>
    <ul>
        <li><a href="#event.buildlink("security.logout")#">logout</a></li>
    </ul>
</cfoutput>