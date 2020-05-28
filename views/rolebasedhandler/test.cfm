<cfoutput>
#getInstance( "messagebox@cbmessagebox" ).renderIt()#

<br /> 

<cfdump var=#rc# label="rc"/>

<br /><br />

<cfdump var=#prc# label="prc"/>

<br /><br />


<ul>
    <li><a href="#event.buildlink("security.logout")#">log out</a></li>
</ul>
</cfoutput>