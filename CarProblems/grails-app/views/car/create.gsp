<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

			<h1><g:message code="default.create.label" args="[entityName]" /></h1>

				<g:if test="${params.invalidParams}">
					<div class="alert alert-warning">
						<strong>Warning!</strong> You have entered invalid parameters. Please try again.
					</div>
				</g:if>


				<g:form class="form-horizontal"  url="[resource:carProblem, action:'save']" >
					<fieldset>
						<g:render template="form"/>
						<div class="form-group required">
							<label class="control-label col-md-4" for="create">
								Create
							</label>
							<div class="col-md-8">
								<g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create car')}" />
							</div>
						</div>
					</fieldset>
				</g:form>

	</body>
</html>
