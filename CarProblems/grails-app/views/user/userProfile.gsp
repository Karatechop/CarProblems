<%@ page import="cscie56.fp.Car" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>${userInstance}</title>
</head>
<body>

<div class="btn-group" role="group">
    <a class="btn btn-default"  href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    <a class="btn btn-default" href="${createLink(uri: '/car/index')}">All cars</a>
</div>

<g:if test="${isAdminLoggedin == 'yes'}">
<h1>Hello admin, this profile belongs to ${userInstance}</h1>


        <g:form url="[resource:userInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit btn btn-warning" action="edit" resource="${userInstance}">Edit user</g:link>
                <g:actionSubmit class="delete btn btn-danger" action="delete" value="Delete user" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>


</g:if>
<g:elseif test="${profileOwnerIsLoggedin == 'yes'}">
    <h1>Hello ${userInstance}!</h1>
</g:elseif>
<g:else>
    <h1>${userInstance}'s profile</h1>
</g:else>


<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<hr>

<g:render template="userCars"/>


</body>
</html>