
<%@ page import="cscie56.fp.Problem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problem.label', default: 'Problem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-problem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-problem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list problem">
			
				<g:if test="${problemInstance?.system}">
				<li class="fieldcontain">
					<span id="system-label" class="property-label"><g:message code="problem.system.label" default="System" /></span>
					
						<span class="property-value" aria-labelledby="system-label"><g:fieldValue bean="${problemInstance}" field="system"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${problemInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="problem.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${problemInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${problemInstance?.mileage}">
				<li class="fieldcontain">
					<span id="mileage-label" class="property-label"><g:message code="problem.mileage.label" default="Mileage" /></span>
					
						<span class="property-value" aria-labelledby="mileage-label"><g:fieldValue bean="${problemInstance}" field="mileage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${problemInstance?.approved}">
				<li class="fieldcontain">
					<span id="approved-label" class="property-label"><g:message code="problem.approved.label" default="Approved" /></span>
					
						<span class="property-value" aria-labelledby="approved-label"><g:formatBoolean boolean="${problemInstance?.approved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${problemInstance?.car}">
				<li class="fieldcontain">
					<span id="car-label" class="property-label"><g:message code="problem.car.label" default="Car" /></span>
					
						<span class="property-value" aria-labelledby="car-label"><g:link controller="car" action="show" id="${problemInstance?.car?.id}">${problemInstance?.car?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${problemInstance?.dateSubmitted}">
				<li class="fieldcontain">
					<span id="dateSubmitted-label" class="property-label"><g:message code="problem.dateSubmitted.label" default="Date Submitted" /></span>
					
						<span class="property-value" aria-labelledby="dateSubmitted-label"><g:formatDate date="${problemInstance?.dateSubmitted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${problemInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="problem.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${problemInstance?.user?.id}">${problemInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:problemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${problemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
