<g:if test="${profileOwnerIsLoggedin == 'no' && approvedProblems.size() == 0}">
    <h3>${userInstance} has no approved problem submissions yet</h3>
</g:if>

<g:elseif test="${approvedProblems.size() == 0}">
    <h3>You have no approved problems submissions yet</h3>
</g:elseif>
<g:else>

<div class="panel panel-default">

    <div class="panel-heading">This problem submissions have been approved by admin</div>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <g:render template="userProblemsTableHead"/>
            </thead>
            <tbody>

            <g:each in="${approvedProblems}" var="p">
                <tr>
                    <td><g:link controller="car" action="carProfile" id="${p.car.id}">${p.car}</g:link></td>
                    <td>${p.system}</td>
                    <td>${p.mileage}</td>
                    <td>${p.description}</td>
                    <td>${p.dateSubmitted}</td>
                </tr>
            </g:each>

            </tbody>
        </table>
    </div>
</div>

</g:else>