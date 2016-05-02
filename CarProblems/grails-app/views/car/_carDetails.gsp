<div class="panel panel-default">

    <div class="panel-heading">Car details</div>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Manufacturer</th>
                <th>Car model</th>
                <th>Fuel</th>
                <th>Doors</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <g:if test="${carInstance?.manufacturer}">
                        <g:fieldValue bean="${carInstance}" field="manufacturer"/>
                    </g:if>
                </td>
                <td>
                    <g:if test="${carInstance?.carModel}">
                        <g:fieldValue bean="${carInstance}" field="carModel"/>
                    </g:if>
                </td>
                <td>
                    <g:if test="${carInstance?.fuel}">
                        <g:fieldValue bean="${carInstance}" field="fuel"/>
                    </g:if>
                </td>
                <td>
                    <g:if test="${carInstance?.doors}">
                        <g:fieldValue bean="${carInstance}" field="doors"/>
                    </g:if>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
