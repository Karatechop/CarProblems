<%@ page import="cscie56.fp.Problem" %>



<div class="fieldcontain ${hasErrors(bean: problemInstance, field: 'system', 'error')} required">
	<label for="system">
		<g:message code="problem.system.label" default="System" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="system" maxlength="50" pattern="${problemInstance.constraints.system.matches}" required="" value="${problemInstance?.system}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: problemInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="problem.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="250" pattern="${problemInstance.constraints.description.matches}" required="" value="${problemInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: problemInstance, field: 'approved', 'error')} ">
	<label for="approved">
		<g:message code="problem.approved.label" default="Approved" />
		
	</label>
	<g:checkBox name="approved" value="${problemInstance?.approved}" />

</div>

<div class="fieldcontain ${hasErrors(bean: problemInstance, field: 'car', 'error')} required">
	<label for="car">
		<g:message code="problem.car.label" default="Car" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="car" name="car.id" from="${cscie56.fp.Car.list()}" optionKey="id" required="" value="${problemInstance?.car?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: problemInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="problem.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${cscie56.fp.User.list()}" optionKey="id" required="" value="${problemInstance?.user?.id}" class="many-to-one"/>

</div>

