<br />
<p>
    This handler uses rules set in coldbox.cfc.  Also uses an additional annotation for the 2nd event just to show they 
    can be mixed.  Note "rulebasedhandler.index" (this page) is whitelisted so you see this while not logged in.  Clicking on of the links 
    below will send you to login if not logged in.
</p>
<p>
Rules can be viewed at <a href="/cbsecurity">/cbsecurity</a>
</p>



<cfoutput>
    #getInstance( "messagebox@cbmessagebox" ).renderIt()#
    <ul>
        <li><a href="#event.buildlink("rulebasedhandler.test1")#">view permission</a> (student, professor or super admin)</li>
        <li><a href="#event.buildlink("rulebasedhandler.test2")#">admin permission</a> (admin or super admin)</li>
    </ul>
    <ul>
        <li><a href="#event.buildlink("security.logout")#">log out</a></li>
    </ul>
</cfoutput>