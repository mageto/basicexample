<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="template/localHeader.jsp"%>

<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">

<table class="pure-table pure-table-bordered">
    <thead>
    <tr>
        <th>Summary Id</th>
        <th>Date </th>
        <th>Visit Type</th>
        <th>Location</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="Encounter" items="${allSummary}" varStatus="status">
        <tr>
            <td>${Summary.summaryType.name}</td>
            <td>${Summary.summaryDatetime}</td>
            <td>${Summary.visit.visitType.name}</td>
            <td>${Summary.location}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@ include file="/WEB-INF/template/footer.jsp"%>