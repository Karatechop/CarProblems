<div class="panel panel-default">

    <div class="panel-heading">All car problems</div>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>System</th>
                <th>Mileage</th>
                <th>Description</th>
                <th>Submission date</th>
                <th>Submission by</th>
            </tr>
            </thead>
            <tbody>

            <g:each in="${allCarProblems}" var="acp">
                <tr>
                    <td>${acp.system}</td>
                    <td>${acp.mileage}</td>
                    <td>${acp.description}</td>
                    <td>${acp.dateSubmitted}</td>
                    <g:if test="${acp.user == null}">
                        <td>User deleted</td>
                    </g:if>
                    <g:else>
                    <td><g:link controller="user" action="userProfile" id="${acp.user?.id}">${acp.user}</g:link></td>
                    </g:else>
                </tr>
            </g:each>

            </tbody>
        </table>
    </div>
</div>