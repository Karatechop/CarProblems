



<div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label class="control-label col-md-4" for="username">
		<g:message code="user.username.label" default="Username" /> (must be unique, max 30 char)
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-8">
		<g:textField name="username" maxlength="30" pattern="${userInstance.constraints.username.matches}" required="" value="${userInstance?.username}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label class="control-label col-md-4" for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-8">
		<g:textField name="password" required="" value="${userInstance?.password}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label class="control-label col-md-4" for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<div class="col-md-8">
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label class="control-label col-md-4" for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<div class="col-md-8">
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label class="control-label col-md-4" for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<div class="col-md-8">
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
	</div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label class="control-label col-md-4" for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<div class="col-md-8">
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
	</div>
</div>