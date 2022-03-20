<cfoutput>
    #getInstance( "messagebox@cbmessagebox" ).renderIt()#
</cfoutput>
<div class="row">
    <div class="col-lg-12">
  		<h2>readme:</h2>
        <p>
            This demo app is based on my limited knowledge of how the cbsecurity module works.  Mainly I put this together so I 
            can quickly set up a new app and have the basics at hand. I find that if I install the cbsecurity module directly I 
            have quite a learning curve to use it even if I've used the module fairly recently. Figured maybe this might help 
            others as well but is definitely offered "as is".  
        </p>
        <p>
            The definitive guides from the originators of CBSecurity can be found at 
            <a href="https://forgebox.io/view/cbsecurity">https://forgebox.io/view/cbsecurity</a> and 
            <a href="https://coldbox-security.ortusbooks.com/getting-started/overview">https://coldbox-security.ortusbooks.com/getting-started/overview</a>. 
            Another excellent source and one I've used a lot to actually get things running is at 
            <a href="https://shiftinsert.nl/category/cbsecurity/">https://shiftinsert.nl/category/cbsecurity/</a>. 
            I've found all his info to be VERY helpful in getting things going.  I'm still learning from both of the above and will change this 
            demo as I learn new things.
        </p>
        <p>
            As to CBSecurity there are two main pathways to securing an app. One is to annotate a handler with "secured" type annotations that 
            are either generic (any permission or role) or specific (stated permissions/roles only). With this approach you can also simply leave 
            a handler and its functions unannotated for "no permission/role needed" (public access without login). 
        </p>
        <p>
            The other method is to use a rules based approach where the rules are most likely in json format in the config folder or 
            perhaps stored in a database. The module allows for other methods of defining as well (XML for instance) but I doubt 
            they're as popular as the first two mentioned. In the "rules" method you're matching an incoming url or event to one of the 
            defined rules rather than relying on annotation of the handler itself. I used the "event" type rule matching here for all rules based 
            security as it seems more useful and easier to me. To try either annotation or rules based out just select the appropriate link  from 
            any above. The available test users will show in the login screen as soon as you get kicked to it.
        </p>
        <p>
            Lastly, if you're going to just create a Coldbox app and then install cbsecurity there are a couple of things you're going to need to 
            use it which is really what this whole demo is about.  This is not to say that what I have added is the proper way to do things or even one 
            of a collection of proper ways but you'll need "something".  The pertinent items needed are basically everything in this demo's Model folder 
            (I used a subfolder of UserModel as it's just my habit) plus the config entries in Coldbox.cfc under "moduleSettings". I also moved the rules 
            json to its own file.  CBSecurity also uses interceptors and I do have a cfc with a few just stubbed out that could be useful certainly.  You 
            can uncomment them and see how they fire. Again, these items (and maybe one or two I'm forgetting) do not get created by simply installing 
            CBSecurity module in an existing app.  Probably easiest to see what was added to make this app work is to create this one and then add the 
            CBSecurity module to another newly created app and compare. Hope this helps!
        </p>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->