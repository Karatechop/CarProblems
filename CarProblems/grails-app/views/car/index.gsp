
<%@ page import="cscie56.fp.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<g:if test="${isAdminLoggedin == 'yes'}">
		<div class="col-md-4">
			<h1>Manage cars</h1>
		</div>


			<div class="col-md-8">
				<g:link class="btn btn-lg btn-primary pull-right" action="create" >Create a new car</g:link>
			</div>
		</g:if>
		<g:else>
			<h1>All cars</h1>
		</g:else>
		<br><br><br><hr>

		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
					
						<g:sortableColumn property="manufacturer" title="${message(code: 'car.manufacturer.label', default: 'Manufacturer')}" />
					
						<g:sortableColumn property="carModel" title="${message(code: 'car.carModel.label', default: 'Car Model')}" />
					
						<g:sortableColumn property="year" title="${message(code: 'car.year.label', default: 'Year')}" />
					
						<g:sortableColumn property="fuel" title="${message(code: 'car.fuel.label', default: 'Fuel')}" />
					
						<g:sortableColumn property="doors" title="${message(code: 'car.doors.label', default: 'Doors')}" />

						<g:if test="${isAdminLoggedin == 'yes'}">
						<th>Edit</th>

						<th>Delete</th>
						</g:if>

					</tr>
				</thead>
				<tbody>
				<g:each in="${carInstanceList}" status="i" var="carInstance">
					<tr>
						<sec:ifLoggedIn>
						<g:if test="${isAdminLoggedin == 'yes'}">
							<td><g:link action="show" id="${carInstance.id}">${fieldValue(bean: carInstance, field: "manufacturer")}</g:link></td>
						</g:if>

						<g:else>
							<td><g:link action="carProfile" id="${carInstance.id}">${fieldValue(bean: carInstance, field: "manufacturer")}</g:link></td>
						</g:else>
						</sec:ifLoggedIn>

						<sec:ifNotLoggedIn>
						<td>${fieldValue(bean: carInstance, field: "manufacturer")}</td>
						</sec:ifNotLoggedIn>

						<td>${fieldValue(bean: carInstance, field: "carModel")}</td>
					
						<td>${carInstance.year}</td>
					
						<td>${fieldValue(bean: carInstance, field: "fuel")}</td>
					
						<td>${fieldValue(bean: carInstance, field: "doors")}</td>

						<g:if test="${isAdminLoggedin == 'yes'}">
							<td><g:link class="edit btn btn-warning" action="edit" resource="${carInstance}">Edit car</g:link></td>

							<td>
								<g:form url="[resource:carInstance, action:'delete']" method="DELETE">
									<fieldset class="buttons">
										<g:actionSubmit class="delete btn btn-danger" action="delete" value="Delete car" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
									</fieldset>
								</g:form>
							</td>
						</g:if>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carInstanceCount ?: 0}" />
			</div>

	</body>
</html>
