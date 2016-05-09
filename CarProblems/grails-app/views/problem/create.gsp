<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problem.label', default: 'Problem')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

		<h1><g:message code="default.create.label" args="[entityName]" /></h1>

			<g:if test="${params.invalidParams}">
				<div class="alert alert-warning">
					<strong>Warning!</strong> You have entered invalid parameters. Please try again.
				</div>
			</g:if>



					<g:form class="form-horizontal"  url="[resource:problemInstance, action:'save']" >
						<fieldset>
						<g:if test="${isAdminLoggedin == 'yes'}">
							<g:render template="form"/>
						</g:if>
						<g:else>
							<g:render template="userProblemSubmitForm"/>
						</g:else>

							<div class="form-group required">
								<label class="control-label col-md-4" for="create">
									Submit problem
								</label>
								<div class="col-md-8">
									<g:submitButton name="create" class="btn btn-success" value="Submit problem" />
								</div>
							</div>
						</fieldset>
					</g:form>




	</body>
</html>
