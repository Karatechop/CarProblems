
<%@ page import="cscie56.fp.User" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>All users</title>
	</head>
	<body>


			<div class="col-md-4">
				<h1>Manage users</h1>
			</div>
			<div class="col-md-8">
			<g:link class="btn btn-lg btn-primary pull-right" action="create" >Create a new user</g:link>
			</div>
			<br><br><br><hr>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
	<div class="table-responsive">
	<table class="table table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: userInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${userInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.passwordExpired}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	<ul class="pagination">
				<boots:paginate total="${userInstanceCount ?: 0}" />
			</ul>

	</body>
</html>
