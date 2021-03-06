
<%@ page import="cscie56.fp.Car" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>${carInstance.manufacturer + " - " + carInstance.carModel}</title>
</head>
<body>

<div id="greetingAndCars">
    <h1>${carInstance.manufacturer + " - " + carInstance.carModel}

            <g:if test="${carInstance == loggedInUser?.cars.find{c-> c == carInstance}}">
                - this is one of your cars
            </g:if>

    </h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:render template="carDetails"/>

        <sec:ifLoggedIn>
            <g:if test="${carInstance != loggedInUser?.cars.find{c-> c == carInstance}}">
                <g:remoteLink class="btn btn-primary" controller="user" action="addCarToUserProfile" asynchronous="false" params="[car: carInstance.id]" onComplete="location.reload()">Add this car to your profile</g:remoteLink>
            </g:if>
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
