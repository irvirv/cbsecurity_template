<cfoutput>


	#html.doctype()#
	<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<title>Sign In to some secure app</title>


		<!-- Bootstrap core CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

		<meta name="theme-color" content="##7952b3">


		<style>
			.bd-placeholder-img {
				font-size: 1.125rem;
				text-anchor: middle;
				-webkit-user-select: none;
				-moz-user-select: none;
				user-select: none;
			}

			@media (min-width: 768px) {
				.bd-placeholder-img-lg {
					font-size: 3.5rem;
				}
			}
		</style>


		<!-- Custom styles for this template -->
		<link href="/includes/css/signin.css" rel="stylesheet">
	</head>

	<body class="text-center">

		<main class="form-signin">
			<form class="form-signin" action="#event.buildLink( prc.xe_LoginAction )#" role="form" autocomplete="off"
				method="POST">
				<input type="hidden" name="_securedUrl" value="#rc._securedUrl#" />
				<img class="mb-4" src="/includes/images/bootstrap-logo.svg" alt="" width="72" height="57">
				<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
				#getInstance( "messagebox@cbmessagebox" ).renderIt()#
				<div class="form-floating">
					<input name="username" type="text" class="form-control" id="floatingInput" placeholder="username">
					<label for="floatingInput">User Name</label>
				</div>
				<div class="form-floating">
					<input name="password" type="password" class="form-control" id="floatingPassword"
						placeholder="Password">
					<label for="floatingPassword">Password</label>
				</div>

				<button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
			</form>
			<p>
				<h5>The example users to log in with are below (all passwords are "test")</h5>
				<ul class="list-group">
					<li class="list-group-item">joe_student (has view permission)</li>
					<li class="list-group-item">sally_prof (has view, update and create permissions)</li>
					<li class="list-group-item">billy_tech (has modify permission)</li>
					<li class="list-group-item">jane_admin (has all permissions - view, create, update, and modify)</li>
				</ul>
			</p>
		</main>

	</body>

	</html>


</cfoutput>