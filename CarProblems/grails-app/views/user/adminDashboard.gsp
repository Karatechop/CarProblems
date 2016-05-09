<%@ page import="cscie56.fp.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>ADMIN</title>
</head>
<body>

<g:if test="${isAdminLoggedin == 'yes'}">
    <h1>Admin dashboard</h1>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="/CarProblems/user/index">Manage Users</a></li>
                    <li><a href="/CarProblems/car/index">Manage Cars</a></li>
                    <li><a href="/CarProblems/problem/index">Manage Problems</a></li>
                </ul>

            </div>
        </div>
    </nav>

    <hr>

    <div class="panel panel-default">

        <div class="panel-heading">Application summary</div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>Total users</th>
                    <th>Total cars</th>
                    <th>Total problems submitted</th>
                    <th>Total problems approved</th>
                    <th>Total problems awaiting approval</th>
                    <th>Total problems rejected</th>
                </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>${adminCarUserProblemSummary['numberOfUsers']}</td>
                        <td>${adminCarUserProblemSummary['numberOfCars']}</td>
                        <td>${adminCarUserProblemSummary['numberOfProblems']}</td>
                        <td>${adminCarUserProblemSummary['numberOfApprovedProblems']}</td>
                        <td>${adminCarUserProblemSummary['numberOfUnapprovedProblems']}</td>
                        <td>${adminCarUserProblemSummary['numberOfRejectedProblems']}</td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>

    <hr>

    <div class="panel panel-default">

            <div class="panel-heading">These problem submissions are waiting for approval</div>

                <g:if test="${adminCarUserProblemSummary['numberOfUnapprovedProblems'] == 0}">
                    <h3>There are no problem submissions waiting for approval</h3>
                </g:if>

                <g:else>

                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <g:render template="userProblemsTableHead"/>
                        </thead>
                        <tbody>

                            <g:each in="${unapprovedProblems}" var="p">
                                <tr>
                                    <td><g:link controller="car" action="carProfile" id="${p.car.id}">${p.car}</g:link></td>
                                    <td>${p.system}</td>
                                    <td>${p.mileage}</td>
                                    <td>${p.description}</td>
                                    <td>${p.dateSubmitted}</td>
                                    <g:if test="${p.user == null}">
                                        <td>User deleted</td>
                                    </g:if>
                                    <g:else>
                                        <td><g:link controller="user" action="userProfile" id="${p.user.id}">${p.user}</g:link></td>
                                    </g:else>
                                    <td>
                                        <g:remoteLink class="btn btn-success" controller="user" action="adminApproveProblem" asynchronous="false" params="[problemId: p.id]" onComplete="location.reload()">Approve</g:remoteLink>
                                    </td>
                                    <td>
                                        <g:remoteLink class="btn btn-danger" controller="user" action="adminRejectProblem" asynchronous="false" params="[problemId: p.id]" onComplete="location.reload()">Reject</g:remoteLink>
                                    </td>
                                </tr>
                            </g:each>

                        </tbody>
                    </table>
                </div>

            </g:else>
    </div>

</g:if>



</body>
</html>