<tr>
    <th>Car</th>
    <th>System</th>
    <th>Mileage</th>
    <th>Description</th>
    <th>Submission date</th>
    <g:if test="${isAdminLoggedin == 'yes' && request.forwardURI == '/CarProblems/user/adminDashboard'}">
        <th>Submission by</th>
        <th>Approve</th>
        <th>Reject</th>
    </g:if>
</tr>