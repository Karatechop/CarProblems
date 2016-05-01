<%@ page import="cscie56.fp.Car" %>



<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'manufacturer', 'error')} required">
	<label for="manufacturer">
		<g:message code="car.manufacturer.label" default="Manufacturer" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="manufacturer" maxlength="50" pattern="${carInstance.constraints.manufacturer.matches}" required="" value="${carInstance?.manufacturer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carModel', 'error')} required">
	<label for="carModel">
		<g:message code="car.carModel.label" default="Car Model" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="carModel" maxlength="50" pattern="${carInstance.constraints.carModel.matches}" required="" value="${carInstance?.carModel}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="car.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${carInstance.year}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'fuel', 'error')} required">
	<label for="fuel">
		<g:message code="car.fuel.label" default="Fuel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="fuel" from="${carInstance.constraints.fuel.inList}" required="" value="${carInstance?.fuel}" valueMessagePrefix="car.fuel"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'doors', 'error')} required">
	<label for="doors">
		<g:message code="car.doors.label" default="Doors" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="doors" type="number" value="${carInstance.doors}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'problems', 'error')} ">
	<label for="problems">
		<g:message code="car.problems.label" default="Problems" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${carInstance?.problems?}" var="p">
    <li><g:link controller="problem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="problem" action="create" params="['car.id': carInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'problem.label', default: 'Problem')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="car.users.label" default="Users" />
		
	</label>
	

</div>

