
<%@ page import="cscie56.fp.Car" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>${carInstance.manufacturer + " - " + carInstance.carModel}</title>
</head>
<body>

<div class="btn-group" role="group">
    <a class="btn btn-default"  href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    <a class="btn btn-default" href="${createLink(uri: '/car/index')}">All cars</a>
</div>

<div id="greetingAndCars">
    <h1>${carInstance.manufacturer + " - " + carInstance.carModel}

            <g:if test="${carInstance == userInstance?.cars.find{c-> c == carInstance}}">
                - this is one of your cars
            </g:if>

    </h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:render template="carDetails"/>

        <sec:ifLoggedIn>
            <g:if test="${isAdminLoggedin == 'yes'}">
            <g:form url="[resource:carInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit btn btn-warning" action="edit" resource="${carInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
            </g:if>
            <g:elseif test="${carInstance != userInstance?.cars.find{c-> c == carInstance}}">
                <g:remoteLink class="btn btn-primary" controller="user" action="addCarToUserProfile" asynchronous="false" params="[car: carInstance.id]" onComplete="location.reload()">Add this car to your profile</g:remoteLink>
            </g:elseif>
        </sec:ifLoggedIn>
</div>
<hr>

        <g:if test="${carInstance?.problems}">
            <g:render template="carProblemsSummary"/>


<hr>
            <g:render template="allCarProblems"/>
        </g:if>

</body>
</html>
