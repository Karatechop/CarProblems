

	<div class="form-group required">
	<label class="control-label col-md-4" for="system">System</label>
	<div class="col-md-8">
		<g:select name="system" from="${problemInstance.constraints.system.inList}" required="" value="${problemInstance?.system}" valueMessagePrefix="problem.system"/>
	</div>
</div>

<div class="form-group required">
	<label class="control-label col-md-4" for="description">Description (max 500 ch.)</label>
	<div class="col-md-8">
		<g:textArea name="description" maxlength="500" required="" value="${problemInstance?.description}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: problemInstance, field: 'mileage', 'error')} required">
	<label class="control-label col-md-4" for="mileage">
		<g:message code="problem.mileage.label" default="Mileage" /> (max 549000 mi.)
		<span class="required-indicator">*</span>
	</label>
<div class="col-md-8">
	<g:field name="mileage" type="number" value="${problemInstance.mileage}" required=""/>
</div>
</div>

<div class="form-group ${hasErrors(bean: problemInstance, field: 'approved', 'error')} ">
	<label class="control-label col-md-4" for="approved">
		<g:message code="problem.approved.label" default="Approved" />
		
	</label>
<div class="col-md-8">
	<g:checkBox name="approved" value="${problemInstance?.approved}" />
</div>
</div>

<div class="form-group ${hasErrors(bean: problemInstance, field: 'car', 'error')} required">
	<label class="control-label col-md-4" for="car">
		<g:message code="problem.car.label" default="Car" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-md-8">
	<g:select id="car" name="car.id" from="${cscie56.fp.Car.list()}" optionKey="id" required="" value="${problemInstance?.car?.id}" class="many-to-one"/>
</div>
</div>

<div class="form-group ${hasErrors(bean: problemInstance, field: 'dateSubmitted', 'error')} required">
	<label class="control-label col-md-4" for="dateSubmitted">
		<g:message code="problem.dateSubmitted.label" default="Date Submitted" /> (max. current date)
		<span class="required-indicator">*</span>
	</label>
<div class="col-md-8">
	<g:datePicker name="dateSubmitted" precision="day"  value="${problemInstance?.dateSubmitted}"  />
</div>
</div>

<div class="form-group ${hasErrors(bean: problemInstance, field: 'user', 'error')} required">
	<label class="control-label col-md-4" for="user">
		<g:message code="problem.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-md-8">
	<g:select id="user" name="user.id" from="${cscie56.fp.User.list()}" optionKey="id" required="" value="${problemInstance?.user?.id}" class="many-to-one"/>
</div>
</div>

