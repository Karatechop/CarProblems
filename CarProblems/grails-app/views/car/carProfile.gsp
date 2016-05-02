
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

    <h1>${carInstance.manufacturer + " - " + carInstance.carModel}</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:render template="carDetails"/>

        <g:if test="${isAdminLoggedin == true}">
        <g:form url="[resource:carInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit btn btn-warning" action="edit" resource="${carInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
        </g:if>
        <sec:ifLoggedIn>
            <g:link class="btn btn-primary" action="addToProfile" resource="${carInstance}">Add this car to your profile</g:link> <-- does not work yet
        </sec:ifLoggedIn>

<hr>

        <g:if test="${carInstance?.problems}">
            <g:render template="carProblemsSummary"/>


<hr>
            <g:render template="allCarProblems"/>
        </g:if>

</body>
</html>
