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

<hr>

<h3>Your problem submissions</h3>

    <ul class="nav nav-tabs nav-justified">
        <li><a data-toggle="tab" href="#approvedProblems">Approved</a></li>

        <g:if test="${profileOwnerIsLoggedin == 'yes'}">
            <li class="active"><a data-toggle="tab" href="#unapprovedProblems">Waiting for approval</a></li>
            <li><a data-toggle="tab" href="#rejectedProblems">Rejected</a></li>
        </g:if>
    </ul>

    <div class="tab-content">

            <div id="approvedProblems"
                <g:if test="${profileOwnerIsLoggedin == 'yes'}">class="tab-pane fade in"</g:if>
                <g:else>class="tab-pane fade in active"</g:else> >

                <g:render template="userApProblemsTable"/>
            </div>

        <g:if test="${profileOwnerIsLoggedin == 'yes'}">
            <div id="unapprovedProblems" class="tab-pane fade in active">
                <g:render template="userUnProblemsTable"/>
            </div>

            <div id="rejectedProblems" class="tab-pane fade in">
                <g:render template="userRejProblemsTable"/>
            </div>
        </g:if>
    </div>


</body>
</html>