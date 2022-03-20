<br />
<cfoutput>
	#getInstance( "messagebox@cbmessagebox" ).renderIt()#
	<p>
		This handler uses rules set in \config\security.json.cfm which is referenced in Coldbox.cfc. Also uses an
		additional
		annotation for the 2nd event just to show they can be mixed. Note "rulebasedhandler.index" (this page) is
		whitelisted
		so you see this while not logged in. Clicking one of the links below will send you to login if not logged in.
	</p>
	<p>
		Rules can be viewed at <a href="/cbsecurity">/cbsecurity</a>
	</p>

	<ul>
		<li><a href="#event.buildlink(" rulebasedhandler.test1")#">view permission</a> (student, professor or super
			admin)</li>
		<li><a href="#event.buildlink(" rulebasedhandler.test2")#">modify and view permissions</a> (admin or super
			admin)</li>
	</ul>
	<p><small>Note that the second one uses BOTH our rules json AND an annotation in the handler.</small>
		<ul>
			<li><a href="#event.buildlink(" security.logout")#">logout</a></li>
	</p>
	</ul>
</cfoutput>