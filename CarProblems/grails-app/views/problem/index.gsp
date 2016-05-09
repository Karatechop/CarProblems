
<%@ page import="cscie56.fp.Problem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problem.label', default: 'Problem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="col-md-4">
			<h1>Manage problems</h1>
		</div>
		<div class="col-md-8">
			<g:link class="btn btn-lg btn-primary pull-right" action="create" >Create a new problem</g:link>
		</div>
		<br><br><br><hr>

			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
							<tr>

								<g:sortableColumn property="system" title="${message(code: 'problem.system.label', default: 'System')}" />

								<g:sortableColumn property="description" title="${message(code: 'problem.description.label', default: 'Description')}" />

								<g:sortableColumn property="mileage" title="${message(code: 'problem.mileage.label', default: 'Mileage')}" />

								<g:sortableColumn property="approved" title="${message(code: 'problem.approved.label', default: 'Approved')}" />

								<g:sortableColumn property="car" title="Car" />

								<g:sortableColumn property="dateSubmitted" title="${message(code: 'problem.dateSubmitted.label', default: 'Date Submitted')}" />

								<g:sortableColumn property="dateSubmitted" title="${message(code: 'problem.dateSubmitted.label', default: 'Submitted by')}" />

								<th>Edit</th>

								<th>Delete</th>

							</tr>
					</thead>
					<tbody>
						<g:each in="${problemInstanceList}" status="i" var="problemInstance">
							<tr>

								<td><g:link action="show" id="${problemInstance.id}">${fieldValue(bean: problemInstance, field: "system")}</g:link></td>

								<td>${fieldValue(bean: problemInstance, field: "description")}</td>

								<td>${fieldValue(bean: problemInstance, field: "mileage")}</td>

								<td><g:formatBoolean boolean="${problemInstance.approved}" /></td>

								<td>${fieldValue(bean: problemInstance, field: "car")}</td>

								<td><g:formatDate date="${problemInstance.dateSubmitted}" /></td>

								<g:if test="${problemInstance.user == null}">
									<td>User deleted</td>
								</g:if>
								<g:else>
								<td><g:link controller="user" action="userProfile" id="${problemInstance.user?.id}">${fieldValue(bean: problemInstance, field: "user")}</g:link></td>
								</g:else>
								<td><g:link class="edit btn btn-warning" action="edit" resource="${problemInstance}">Edit problem</g:link></td>

								<td>
									<g:form url="[resource:problemInstance, action:'delete']" method="DELETE">
										<fieldset class="buttons">
											<g:actionSubmit class="delete btn btn-danger" action="delete" value="Delete problem" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
										</fieldset>
									</g:form>
								</td>

							</tr>
						</g:each>
					</tbody>
			</table>
		</div>
	<div class="pagination">
		<g:paginate total="${problemInstanceCount ?: 0}" />
	</div>

	</body>
</html>
