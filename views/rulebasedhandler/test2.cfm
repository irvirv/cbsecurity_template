<cfoutput>
#getInstance( "messagebox@cbmessagebox" ).renderIt()#

#getInstance( "messagebox@cbmessagebox" ).renderMessage("success","Congratulations, you can see this page based on having both the ""view"" and ""modify"" permissions.")#

<br /> 

<dl class="row">
  <dt class="col-sm-3"><em>User</em></dt>
  <dd class="col-sm-9">
    <dl class="row">
      <dt class="col-sm-4">User Name:</dt>
      <dd class="col-sm-8">#prc.oUser.getusername()#</dd>
      <dt class="col-sm-4">User Roles:</dt>
      <dd class="col-sm-8">#prc.oUser.getroles()#</dd>
      <dt class="col-sm-4">User Permissions (from role(s)):</dt>
      <dd class="col-sm-8">#prc.oUser.getpermissions()#</dd>
    </dl>
  </dd>
</dl>

<dl class="row">
  <dt class="col-sm-3"><em>Event</em></dt>
  <dd class="col-sm-9">
    <dl class="row">
      <dt class="col-sm-4">Event Requested:</dt>
      <dd class="col-sm-8">#rc.event#</dd>
      <dt class="col-sm-4">Permision(s) Required:</dt>
      <dd class="col-sm-8">View</dd>
    </dl>
  </dd>
</dl>
<p>
This matches because the event is not in the whitelist, in this case the single event "rulebasedhandler.index" 
but is in the securelist of "rulebasedhandler.*".  The permission required is "view". Additionally this particular 
event function has the "modify" annotation &ndash; <em>function test2(event,rc,prc) secured="modify"{</em>. This means to 
view this page we need to pass the rules based security AND the annotation added within the handler.  I'm not really 
sure when I would use something like this in real life but it seems like it could be handy. The rule that kicked in is below 
</p>

<p>

    {
        "whitelist": "rulebasedhandler\b.index",
        "securelist": "^rulebasedhandler\b..*",
        "match": "event",
        "roles": "",
        "permissions": "view",
        "redirect": "security.loginform",
        "useSSL": false
    }
</p>

<p>Use the logout below to hit the app 'fresh' without already being logged in.</p>

<a href="#event.buildlink("security.logout")#">logout</a>

</cfoutput>