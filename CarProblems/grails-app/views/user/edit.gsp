<%@ page import="cscie56.fp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${params.invalidParams}">
			<div class="alert alert-warning">
				<strong>Warning!</strong> You have entered invalid parameters. Please try again.
			</div>
		</g:if>
		<g:form class="form-horizontal" url="[resource:userInstance, action:'update']" method="PUT" >
			<g:hiddenField name="version" value="${userInstance?.version}" />
			<fieldset>
				<g:render template="form"/>
				<div class="form-group required">
					<label class="control-label col-md-4" for="update">
						Edit
					</label>
					<div class="col-md-8">
						<g:actionSubmit name="update" class="btn btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</div>
				</div>
			</fieldset>
		</g:form>
	</body>
</html>
