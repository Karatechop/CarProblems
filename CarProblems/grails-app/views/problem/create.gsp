<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problem.label', default: 'Problem')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="create-problem" class="" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${problemInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${problemInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<sec:ifLoggedIn>
				<g:if test="${isAdminLoggedin == 'yes'}">
					<g:form class="form-horizontal"  url="[resource:problemInstance, action:'save']" >
						<fieldset>
							<g:render template="form"/>
						</fieldset>
					</g:form>
				</g:if>
				<g:else>
					<g:form class="form-horizontal"  url="[resource:problemInstance, action:'save']" >
						<fieldset>
							<g:render template="userProblemSubmitForm"/>
						</fieldset>
					</g:form>
				</g:else>
			</sec:ifLoggedIn>
		</div>

	</body>
</html>
