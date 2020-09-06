<cfoutput>

#html.doctype()#
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!---<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">--->

        <title>Sign In to some secure app</title>


        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!-- Custom styles for this template -->
        <link href="/includes/css/signin.css" rel="stylesheet">
    </head>

    <body class="text-center">
        <div>
            <form class="form-signin" action="#event.buildLink( prc.xe_LoginAction )#" role="form" autocomplete="off" method="POST">
                <input type="hidden" name="_securedUrl" value="#rc._securedUrl#" />
                <img class="mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
                <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
                #getInstance( "messagebox@cbmessagebox" ).renderIt()#
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="text" name="username" id="inputEmail" class="form-control" placeholder="username" required autofocus>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <!---
                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" name="rememberme" value="yes"> Remember me
                    </label>
                </div>
                --->
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
            <p>
                <h5>The example users to log in with are below (all passwords are "test")</h5>
                <ul class="list-group">
                    <li class="list-group-item">joe_student (has view permission)</li>
                    <li class="list-group-item">sally_prof (has view, update and create permissions)</li>
                    <li class="list-group-item">billy_tech (has admin permission)</li>
                    <li class="list-group-item">jane_admin (has all permissions - view, create, update, and admin)</li>
                </ul>
            </p>
        </div>    
    </body>
</html>

</cfoutput>