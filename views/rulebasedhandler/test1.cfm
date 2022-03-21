<cfoutput>
#getInstance( "messagebox@cbmessagebox" ).renderIt()#

#getInstance( "messagebox@cbmessagebox" ).renderMessage("success","Congratulations, you can see this page based on having ""view"" permission.")#

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
but is in the securelist of "rulebasedhandler.*".  The permission required is "view". Note the rule allows the use of 
permission values and/or role values.  Both are lists. Also note that if you use a permission AND a role BOTH must match.  
You can try this by changing security.json.cfm first rule to "roles": "student","permissions": "modify" and then 
logging in as "joe_student".  Joe is in the "student" role so passes that one but does not have "modify" permission 
so fails that one. Access will be denied.
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