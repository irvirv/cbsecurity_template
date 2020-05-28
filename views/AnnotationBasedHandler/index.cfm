<br />
<p>
    This handler has an annotation of "secured" at the handler level.  All events in handler are secured via a simple yes/no 
    of whether or not you are logged in.  If we wanted to be role based we could change to secured="somepermission" with one or more permissions. Try coming here 
    or one of the links below without being logged in.
</p>



<cfoutput>
    #getInstance( "messagebox@cbmessagebox" ).renderIt()#
    <ul>
        <li><a href="#event.buildlink("annotationbasedhandler.test1")#">simply logged in</a> (anyone logged in - handler annotation of "secured" requires you to be logged in)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test2")#">view permission</a> (student, professor or super admin)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test3")#">update permission</a> (professor or super admin)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test4")#">create permission</a> (professor or super admin)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test5")#">create or update permission</a> (professor or super admin)</li>
        <li><a href="#event.buildlink("annotationbasedhandler.test6")#">admin permission</a> (admin or super admin)</li>
    </ul>
    <ul>
        <li><a href="#event.buildlink("security.logout")#">log out</a></li>
    </ul>
</cfoutput>