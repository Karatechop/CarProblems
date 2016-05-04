<div class="panel panel-default">

    <g:if test="${profileOwnerIsLoggedin == 'yes'}">
        <div class="panel-heading">Your cars</div>
    </g:if>
    <g:else>
        <div class="panel-heading">${userInstance}'s cars</div>
    </g:else>


    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Manufacturer</th>
                <th>Car model</th>
                <th>Fuel</th>
                <th>Doors</th>
            <g:if test="${profileOwnerIsLoggedin == 'yes'}">
                <th>Remove car</th>
            </g:if>
            </tr>
            </thead>
            <tbody>

            <g:each in="${userInstance.cars}" var="uc">
                <tr>
                    <td><g:link controller="car" action="carProfile" id="${uc.id}">${uc.manufacturer}</g:link></td>
                    <td>${uc.carModel}</td>
                    <td>${uc.fuel}</td>
                    <td>${uc.doors}</td>
                <g:if test="${profileOwnerIsLoggedin == 'yes'}">
                    <td><g:link class="btn btn-warning" controller="user" action="removeCarFromProfile" resource="${carInstance}">Remove from profile</g:link></td>
                </g:if>
                </tr>
            </g:each>


            </tbody>
        </table>
    </div>
</div>
