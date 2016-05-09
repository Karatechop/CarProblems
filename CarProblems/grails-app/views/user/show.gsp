
<%@ page import="cscie56.fp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${params.userSaved}">
			<div class="alert alert-success">
				<strong>Success!</strong> User has been successfully saved.
			</div>
		</g:if>
		<g:if test="${params.userUpdated}">
			<div class="alert alert-success">
				<strong>Success!</strong> User has been successfully updated.
			</div>
		</g:if>

		<div class="col-md-4">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
		</div>

		<div class="col-md-8">
			<g:link class="btn btn-lg btn-primary pull-right" action="create" >Create a new user</g:link>
		</div>
		<br><br><br><hr>


	<g:if test="${userInstance}">
		<table class="table table-reflow">
			<thead>
			<tr>
				<th><g:message code="user.username.label" default="Username" /></th>
				<th><g:message code="user.password.label" default="Password" /></th>
				<th><g:message code="user.accountExpired.label" default="Account Expired" /></th>
				<th><g:message code="user.accountLocked.label" default="Account Locked" /></th>
				<th><g:message code="user.enabled.label" default="Enabled" /></th>
				<th><g:message code="user.passwordExpired.label" default="Password Expired" /></th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><g:fieldValue bean="${userInstance}" field="username"/></td>

				<td><g:fieldValue bean="${userInstance}" field="password"/></td>

				<td><g:formatBoolean boolean="${userInstance?.accountExpired}" /></td>

				<td><g:formatBoolean boolean="${userInstance?.accountLocked}" /></td>

				<td><g:formatBoolean boolean="${userInstance?.enabled}" /></td>

				<td><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></td>

			</tr>
			</tbody>
		</table>
	</g:if>

	<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="btn btn-warning" action="edit" resource="${userInstance}">Edit user</g:link>
			<g:actionSubmit class="btn btn-danger" action="delete" value="Delete user" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			<g:link class="btn btn-default" action="userProfile" resource="${userInstance}">View profile</g:link>
		</fieldset>
	</g:form>

	</body>
</html>
