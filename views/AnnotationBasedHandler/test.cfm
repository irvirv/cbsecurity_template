<cfoutput>
#getInstance( "messagebox@cbmessagebox" ).renderIt()#

<br /> 

<dl>
    <dt>user</dt><dd>#getInstance( 'requestStorage@cbstorages' ).get('cbauth__user').getusername()#</dd>
    <dt>roles</dt><dd>#getInstance( 'requestStorage@cbstorages' ).get('cbauth__user').getroles()#</dd>
    <dt>permissions</dt><dd>#getInstance( 'requestStorage@cbstorages' ).get('cbauth__user').getpermissions()#</dd>
</dl>

<cfdump var=#rc# label="rc"/>

<br /><br />

<cfdump var=#prc# label="prc"/>

<br /><br />


<ul>
    <li><a href="#event.buildlink("security.logout")#">log out</a></li>
</ul>
</cfoutput>