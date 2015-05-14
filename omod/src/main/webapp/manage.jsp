<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ include file="/WEB-INF/template/include.jsp"%>--%>
<%--<%@ include file="/WEB-INF/template/localHeader.jsp"%>--%>
<html>
    <head>
        <title>Mageto</title>
        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
    </head>
    <body>
    <table style="margin-left: 50px;" class="pure-table pure-table-bordered">
        <thead>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Identifier</th>
            <th>Summary</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="patient" items="${patients}" varStatus="status">
            <tr>
                <td>${patient.givenName}</td>
                <td>${patient.age}</td>
                <td>${patient.gender}</td>
                <td>${patient.identifiers}</td>
                <td><a href="summary.form?patientId=${patient.patientId}">Summary</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--<%@ include file="/WEB-INF/template/footer.jsp"%>--%>

</body>
</html>

