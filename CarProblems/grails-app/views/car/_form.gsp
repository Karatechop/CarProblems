<%@ page import="cscie56.fp.Car" %>



<div class="form-group ${hasErrors(bean: carInstance, field: 'manufacturer', 'error')} required">
	<label class="control-label col-md-4" for="manufacturer">
		<g:message code="car.manufacturer.label" default="Manufacturer" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-8">
		<g:textField name="manufacturer" maxlength="50" pattern="${carInstance.constraints.manufacturer.matches}" required="" value="${carInstance?.manufacturer}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: carInstance, field: 'carModel', 'error')} required">
	<label class="control-label col-md-4" for="carModel">
		<g:message code="car.carModel.label" default="Car Model" /> (must include year eg. '2002 Civic')
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-8">
		<g:textField name="carModel" maxlength="50" pattern="${carInstance.constraints.carModel.matches}" required="" value="${carInstance?.carModel}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: carInstance, field: 'year', 'error')} required">
	<label class="control-label col-md-4" for="year">
		<g:message code="car.year.label" default="Year" /> (must match car model year)
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-8">
		<g:field name="year" type="number" value="${carInstance.year}" required=""/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: carInstance, field: 'fuel', 'error')} required">
	<label class="control-label col-md-4" for="fuel">
		<g:message code="car.fuel.label" default="Fuel" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-8">
		<g:select name="fuel" from="${carInstance.constraints.fuel.inList}" required="" value="${carInstance?.fuel}" valueMessagePrefix="car.fuel"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: carInstance, field: 'doors', 'error')} required">
	<label class="control-label col-md-4" for="doors">
		<g:message code="car.doors.label" default="Doors" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-md-8">
		<g:field name="doors" type="number" value="${carInstance.doors}" required=""/>
	</div>
</div>


