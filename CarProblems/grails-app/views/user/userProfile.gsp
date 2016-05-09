<%@ page import="cscie56.fp.Car" %>
<!DOCTYPE html>
<html>
<head>

    <meta name="layout" content="main">
    <title>${userInstance}</title>
</head>
<body>

<g:if test="${params.problemSaved}">
    <div class="alert alert-success">
        <strong>Success!</strong> We have received your problem submission. Please wait for admin approval.
    </div>
</g:if>

<g:if test="${isAdminLoggedin == 'yes'}">
<h1>Hello admin, this profile belongs to ${userInstance}</h1>
</g:if>

<g:elseif test="${profileOwnerIsLoggedin == 'yes'}">
    <h1>Hello ${userInstance}!</h1>
</g:elseif>
<g:else>
    <h1>${userInstance}'s profile</h1>
</g:else>

<hr>

<g:render template="userCars"/>

<hr>



<g:if test="${profileOwnerIsLoggedin == 'yes'}">
    <div class="col-md-4"><h3>Your problem submissions</h3></div>

    <div class="col-md-8">
        <g:link class="btn btn-lg btn-primary pull-right" action="create" resource="${problemInstance}">Submit a new car problem</g:link>
    </div>
    <br><br><br><br>
</g:if>

<g:else>
    <h3>${userInstance}'s problem submissions</h3>
</g:else>


<div class="col-md-12">
    <ul class="nav nav-tabs nav-justified">
        <li><a data-toggle="tab" href="#approvedProblems">Approved</a></li>

        <g:if test="${profileOwnerIsLoggedin == 'yes' || isAdminLoggedin == 'yes'}">
            <li class="active"><a data-toggle="tab" href="#unapprovedProblems">Waiting for approval</a></li>
            <li><a data-toggle="tab" href="#rejectedProblems">Rejected</a></li>
        </g:if>
    </ul>

    <div class="tab-content">

            <div id="approvedProblems"
                <g:if test="${profileOwnerIsLoggedin == 'yes' || isAdminLoggedin == 'yes'}">class="tab-pane fade in"</g:if>
                <g:else>class="tab-pane fade in active"</g:else> >

                <g:render template="userApProblemsTable"/>
            </div>

        <g:if test="${profileOwnerIsLoggedin == 'yes' || isAdminLoggedin == 'yes'}">
            <div id="unapprovedProblems" class="tab-pane fade in active">
                <g:render template="userUnProblemsTable"/>
            </div>

            <div id="rejectedProblems" class="tab-pane fade in">
                <g:render template="userRejProblemsTable"/>
            </div>
        </g:if>
    </div>


</div>


</body>
</html>