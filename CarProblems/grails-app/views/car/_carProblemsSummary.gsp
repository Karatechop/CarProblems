<div class="panel panel-default">

    <div class="panel-heading">Car problems summary</div>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>System</th>
                <th>Mileage (median)</th>
                <th>Lowest mileage</th>
                <th>Highest mileage</th>

            </tr>
            </thead>
            <tbody>

            <g:each in="${carProblemsSummaryReport}" var="sr">
                <tr>
                    <td>${sr[0]}</td>
                    <td>${sr[1]}</td>
                    <td>${sr[2]}</td>
                    <td>${sr[3]}</td>
                </tr>
            </g:each>

            </tbody>
        </table>
    </div>
</div>