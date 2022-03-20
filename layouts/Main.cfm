<cfoutput>
	<!doctype html>
	<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<meta name="description" content="security demo using Coldbox cbsecurity module">
		<title>some title</title>

		<!-- Bootstrap core CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


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

	</head>

	<body>
		<header>
			<div class="collapse bg-dark" id="navbarHeader">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 col-md-7 py-4">
							<h4 class="text-white">About</h4>
							<p class="text-muted">
								Just a note to say that this is a demo I put together mainly to understand the Coldbox
								cbSecurity module and have a template of sorts that I can start an app with easily. I am not
								associated with the Coldbox team in any way but rather a big fan of their work. To see the definitive
								information on Coldbox and CbSecurity go to <a href="https://forgebox.io/view/cbsecurity">https://forgebox.io/view/cbsecurity</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="navbar navbar-dark bg-dark shadow-sm">
				<div class="container">
					<a href="/" class="navbar-brand d-flex align-items-center">
						<span class="h4">Demo Using CBSecurity in Coldbox</span>
					</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
						data-bs-target="##navbarHeader" aria-controls="navbarHeader" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
			</div>
		</header>

		<main>

			<div class="px-4 my-5 text-center">

				<h1 class="display-5 fw-bold">Some Secure App</h1>
				<div class="col-lg-6 mx-auto">
					<p class="lead mb-4">Use links below to play around with security structure</p>
					<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">

						<ul class="nav nav-tabs">
							<li class="nav-item">
								<cfif rc.event eq "main.index">
									<a class="nav-link active" aria-current="page" href="/">Home</a>
									<cfelse>
										<a class="nav-link" aria-current="page" href="/">Home</a>
								</cfif>
							</li>
							<li class="nav-item dropdown">
								<cfif left(rc.event,22) eq "annotationbasedhandler">
									<a class="nav-link dropdown-toggle active" data-bs-toggle="dropdown" href="##"
										role="button" aria-expanded="false">Annotation Based</a>
									<cfelse>
										<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="##"
											role="button" aria-expanded="false">Annotation Based</a>
								</cfif>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
											href="#event.buildLink('annotationbasedhandler.index')#">default (annotationbasedhandler.index)</a></li>
									<li><a class="dropdown-item"
											href="#event.buildLink('annotationbasedhandler.test1')#">simply logged in</a></li>
									<li><a class="dropdown-item"
											href="#event.buildLink('annotationbasedhandler.test2')#">view permission</a>
									</li>
									<li><a class="dropdown-item"
											href="#event.buildLink('annotationbasedhandler.test3')#">update permission</a></li>
									<li><a class="dropdown-item"
											href="#event.buildLink('annotationbasedhandler.test4')#">create permission</a></li>
									<li><a class="dropdown-item"
											href="#event.buildLink('annotationbasedhandler.test5')#">create or update permission</a></li>
									<li><a class="dropdown-item"
											href="#event.buildLink('annotationbasedhandler.test6')#">modify permission</a></li>
								</ul>
							</li>
							<li class="nav-item dropdown">
								<cfif left(rc.event,16) eq "rulebasedhandler">
									<a class="nav-link dropdown-toggle active" data-bs-toggle="dropdown" href="##"
										role="button" aria-expanded="false">Rules Based</a>
									<cfelse>
										<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="##"
											role="button" aria-expanded="false">Rules Based</a>
								</cfif>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
											href="#event.buildLink('rulebasedhandler.index')#">default (rulebasedhandler.index)</a></li>
									<li><a class="dropdown-item" 
                      href="#event.buildLink('rulebasedhandler.test1')#">test one</a></li>
									<li><a class="dropdown-item"
											href="#event.buildLink('rulebasedhandler.test2')#">modify</a></li>
								</ul>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/cbsecurity">Security Visualizer</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="container">

				<!--- render main view --->
				#renderView()#
				<!--- /render main view --->

			</div><!-- /.container -->

			<!-- FOOTER -->
			<footer class="container">
			</footer>
		</main>


		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
		</script>

	</body>

	</html>
</cfoutput>
