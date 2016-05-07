<g:if test="${unapprovedProblems.size() == 0}">
    <h3>You have no problems submissions waiting for admin approval</h3>
</g:if>
<g:else>

<div class="panel panel-default">

    <div class="panel-heading">These problem submissions are waiting for admin approval</div>

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
                </tr>
            </g:each>

            </tbody>
        </table>
    </div>
</div>

</g:else>