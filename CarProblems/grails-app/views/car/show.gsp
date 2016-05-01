
<%@ page import="cscie56.fp.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-car" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list car">
			
				<g:if test="${carInstance?.manufacturer}">
				<li class="fieldcontain">
					<span id="manufacturer-label" class="property-label"><g:message code="car.manufacturer.label" default="Manufacturer" /></span>
					
						<span class="property-value" aria-labelledby="manufacturer-label"><g:fieldValue bean="${carInstance}" field="manufacturer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.carModel}">
				<li class="fieldcontain">
					<span id="carModel-label" class="property-label"><g:message code="car.carModel.label" default="Car Model" /></span>
					
						<span class="property-value" aria-labelledby="carModel-label"><g:fieldValue bean="${carInstance}" field="carModel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="car.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label">${carInstance.year}</span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.fuel}">
				<li class="fieldcontain">
					<span id="fuel-label" class="property-label"><g:message code="car.fuel.label" default="Fuel" /></span>
					
						<span class="property-value" aria-labelledby="fuel-label"><g:fieldValue bean="${carInstance}" field="fuel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.doors}">
				<li class="fieldcontain">
					<span id="doors-label" class="property-label"><g:message code="car.doors.label" default="Doors" /></span>
					
						<span class="property-value" aria-labelledby="doors-label"><g:fieldValue bean="${carInstance}" field="doors"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.problems}">
				<li class="fieldcontain">
					<span id="problems-label" class="property-label"><g:message code="car.problems.label" default="Problems" /></span>
					
						<g:each in="${carInstance.problems}" var="p">
						<span class="property-value" aria-labelledby="problems-label"><g:link controller="problem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="car.users.label" default="Users" /></span>

						<g:each in="${carInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:carInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${carInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
