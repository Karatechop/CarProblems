<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="create-user" class="" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>

			<g:if test="${params.invalidParams}">
				<div class="alert alert-warning">
					<strong>Warning!</strong> You have entered invalid parameters. Please try again.
				</div>
			</g:if>

			<g:form class="form-horizontal"  url="[resource:userInstance, action:'save']" >
				<fieldset>
					<g:render template="form"/>

					<div class="form-group ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
						<label class="control-label col-md-4" for="passwordExpired">
							Create
						</label>

						<div class="col-md-8">
							<g:submitButton class="btn btn-success" name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</div>
					</div>

				</fieldset>
			</g:form>

		</div>
	</body>
</html>
