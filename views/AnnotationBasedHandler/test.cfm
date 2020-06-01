<cfoutput>
#getInstance( "messagebox@cbmessagebox" ).renderIt()#

<br /> 

<dl>
    <dt>user</dt><dd>#prc.oUser.getusername()#</dd>
    <dt>roles</dt><dd>#prc.oUser.getroles()#</dd>
    <dt>permissions</dt><dd>#prc.oUser.getpermissions()#</dd>
</dl>

<cfdump var=#rc# label="rc"/>

<br /><br />

<cfdump var=#prc# label="prc"/>

<br /><br />


<ul>
    <li><a href="#event.buildlink("security.logout")#">log out</a></li>
</ul>
</cfoutput>