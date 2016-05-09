
<%@ page import="cscie56.fp.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${params.carSaved}">
			<div class="alert alert-success">
				<strong>Success!</strong> Car has been successfully saved.
			</div>
		</g:if>
		<g:if test="${params.carUpdated}">
			<div class="alert alert-success">
				<strong>Success!</strong> Car has been successfully updated.
			</div>
		</g:if>

		<div class="col-md-4">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
		</div>

		<div class="col-md-8">
			<g:link class="btn btn-lg btn-primary pull-right" action="create" >Create a new car</g:link>
		</div>
		<br><br><br><hr>

		<g:if test="${carInstance}">
			<table class="table table-reflow">
				<thead>
				<tr>
					<th><g:message code="car.manufacturer.label" default="Manufacturer" /></th>
					<th><g:message code="car.carModel.label" default="Car Model" /></th>
					<th><g:message code="car.year.label" default="Year" /></th>
					<th><g:message code="car.fuel.label" default="Fuel" /></th>
					<th><g:message code="car.doors.label" default="Doors" /></th>
					<th><g:message code="car.problems.label" default="Problems" /></th>
					<th><g:message code="car.users.label" default="Users" /></th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><g:fieldValue bean="${carInstance}" field="manufacturer"/></td>

					<td><g:fieldValue bean="${carInstance}" field="carModel"/></td>

					<td>${carInstance.year}</td>

					<td><g:fieldValue bean="${carInstance}" field="fuel"/></td>

					<td><g:fieldValue bean="${carInstance}" field="doors"/></td>

					<td>
						<ul>
						<g:each in="${carInstance.problems}" var="p">
							<li><g:link controller="problem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
						</g:each>
						</ul>
					</td>

					<td>
						<ul>
							<g:each in="${carInstance.users}" var="u">
								<li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
							</g:each>
						</ul>
					</td>
				</tr>
				</tbody>
			</table>
		</g:if>


	<g:form url="[resource:carInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="btn btn-warning" action="edit" resource="${carInstance}">Edit car</g:link>
			<g:actionSubmit class="btn btn-danger" action="delete" value="Delete car" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			<g:link class="btn btn-default" action="carProfile" resource="${carInstance}">View profile</g:link>
		</fieldset>
	</g:form>

	</body>
</html>
