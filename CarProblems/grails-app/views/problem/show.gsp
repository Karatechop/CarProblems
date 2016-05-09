
<%@ page import="cscie56.fp.Problem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problem.label', default: 'Problem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<g:if test="${params.problemSaved}">
			<div class="alert alert-success">
				<strong>Success!</strong> Problem has been successfully saved.
			</div>
		</g:if>
		<g:if test="${params.problemUpdated}">
			<div class="alert alert-success">
				<strong>Success!</strong> Problem has been successfully updated.
			</div>
		</g:if>

		<div class="col-md-4">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
		</div>

		<div class="col-md-8">
			<g:link class="btn btn-lg btn-primary pull-right" action="create" >Create a new problem</g:link>
		</div>
		<br><br><br><hr>

<g:if test="${problemInstance}">
	<table class="table table-reflow">
		<thead>
		<tr>
			<th><g:message code="problem.system.label" default="Car" /></th>
			<th><g:message code="problem.system.label" default="Mileage" /></th>
			<th><g:message code="problem.system.label" default="System" /></th>
			<th><g:message code="problem.system.label" default="Description" /></th>
			<th><g:message code="problem.system.label" default="Approved" /></th>
			<th><g:message code="problem.system.label" default="Date submitted" /></th>
			<th><g:message code="problem.system.label" default="Submitted by" /></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td><g:link controller="car" action="show" id="${problemInstance?.car?.id}">${problemInstance?.car?.encodeAsHTML()}</g:link></td>

			<td><g:fieldValue bean="${problemInstance}" field="mileage"/></td>

			<td><g:fieldValue bean="${problemInstance}" field="system"/></td>

			<td><g:fieldValue bean="${problemInstance}" field="description"/></td>

			<td><g:formatBoolean boolean="${problemInstance?.approved}" /></td>

			<td><g:formatDate date="${problemInstance?.dateSubmitted}" /></td>

			<td><g:link controller="user" action="show" id="${problemInstance?.user?.id}">${problemInstance?.user?.encodeAsHTML()}</g:link></td>

		</tr>
		</tbody>
	</table>
	</g:if>

			<g:form url="[resource:problemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-warning" action="edit" resource="${problemInstance}">Edit problem</g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="Delete problem" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

					<g:if test="${problemInstance.approved == null}">
						<g:remoteLink class="btn btn-success" controller="user" action="adminApproveProblem" asynchronous="false" params="[problemId: problemInstance.id]" onComplete="location.reload()">Approve</g:remoteLink>
						<g:remoteLink class="btn btn-danger" controller="user" action="adminRejectProblem" asynchronous="false" params="[problemId: problemInstance.id]" onComplete="location.reload()">Reject</g:remoteLink>
					</g:if>

				</fieldset>
			</g:form>


	</body>
</html>
