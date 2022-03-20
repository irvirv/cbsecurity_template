<cfoutput>
#getInstance( "messagebox@cbmessagebox" ).renderIt()#

#getInstance( "messagebox@cbmessagebox" ).renderMessage("success","Congratulations, you can see this page since you have the ""update"" permission.")#

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
      <dd class="col-sm-8">"Update" &ndash; this event requires the "update" permission since the event function itself is annotated with '<em>secured="update"</em>'</dd>
    </dl>
  </dd>
</dl>

<p>Use the logout below to hit the app 'fresh' without already being logged in.</p>

<a href="#event.buildlink("security.logout")#">logout</a>

</cfoutput>