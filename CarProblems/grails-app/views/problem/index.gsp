
<%@ page import="cscie56.fp.Problem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problem.label', default: 'Problem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-problem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-problem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="system" title="${message(code: 'problem.system.label', default: 'System')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'problem.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="mileage" title="${message(code: 'problem.mileage.label', default: 'Mileage')}" />
					
						<g:sortableColumn property="approved" title="${message(code: 'problem.approved.label', default: 'Approved')}" />
					
						<th><g:message code="problem.car.label" default="Car" /></th>
					
						<g:sortableColumn property="dateSubmitted" title="${message(code: 'problem.dateSubmitted.label', default: 'Date Submitted')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${problemInstanceList}" status="i" var="problemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${problemInstance.id}">${fieldValue(bean: problemInstance, field: "system")}</g:link></td>
					
						<td>${fieldValue(bean: problemInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: problemInstance, field: "mileage")}</td>
					
						<td><g:formatBoolean boolean="${problemInstance.approved}" /></td>
					
						<td>${fieldValue(bean: problemInstance, field: "car")}</td>
					
						<td><g:formatDate date="${problemInstance.dateSubmitted}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${problemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
