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
                    <td>${acp.user}</td>
                </tr>
            </g:each>

            </tbody>
        </table>
    </div>
</div>