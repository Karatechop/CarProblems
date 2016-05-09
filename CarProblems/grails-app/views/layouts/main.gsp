<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->

<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<g:layoutHead/>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="center-block col-md-10" style="float: none;">

			<g:if test="${request.forwardURI == '/CarProblems/'}">
				<sec:ifLoggedIn>
					<hr>
					<a class="btn btn-default" href="${createLink(uri: '/car/index')}">All cars</a>
				</sec:ifLoggedIn>
			</g:if>
			<g:if test="${request.forwardURI != '/CarProblems/'}">
				<hr>
				<div class="btn-group" role="group">
						<a class="btn btn-default"  href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
					<g:if test="${isAdminLoggedin == 'no'}">
						<a class="btn btn-default" href="${createLink(uri: '/car/index')}">All cars</a>
					</g:if>
					<g:if test="${isAdminLoggedin == 'yes' && request.forwardURI != '/CarProblems/user/adminDashboard'}">
						<a class="btn btn-default" href="/CarProblems/user/index">Users</a>
						<a class="btn btn-default" href="/CarProblems/car/index">Cars</a>
						<a class="btn btn-default" href="/CarProblems/problem/index">Problems</a>
					</g:if>
				</div>
			</g:if>


			<div class="pull-right">
				<sec:ifLoggedIn>
					<p>Logged in as <span class="badge"><sec:username/></span>
				<g:if test="${isAdminLoggedin == 'yes'}">
					<g:link class="btn btn-success btn-sm" controller="user" action="adminDashboard">Admin dashboard</g:link>
				</g:if>
				<g:elseif test="${isAdminLoggedin == 'no' && loggedInUser}">
					<g:link class="btn btn-success btn-sm" controller="user" action="userProfile" id="${loggedInUser.id}">User profile</g:link>
				</g:elseif>
					<g:remoteLink class="logout btn btn-warning btn-sm" controller="logout" method="post" asynchronous="false" onSuccess="location.href = '/CarProblems'">Logout</g:remoteLink></p>
				</sec:ifLoggedIn>
			</div>
		<br><br><hr>

		<g:layoutBody/>
		</div>
	</div>
</div>
</body>
</html>
