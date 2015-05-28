<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="template/localHeader.jsp"%>
<html  data-ng-app="app">
    <head>
        <title>Mageto</title>
        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
        <openmrs:htmlInclude file="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"/>
    </head>
<body>
<div style="margin: 50px;" class="grid-wrapper">
    <div class="pure-g" style="margin: auto;
		padding: 8px;
		/*width: 850px; */
		border:2px solid #F0F0F0;
		box-shadow: 0px 0px 47px -3px rgba(0,0,0,0.58);
		border-radius: 5px;
		font-size: 15px;">
        <div class="pure-u-1-3">
            <div class="grid-content">
                <form  action="<c:url value='/module/basicexample/create.form' />" method="get" style="margin-top: 10px;" class="pure-form pure-form-aligned">
                    <fieldset>
                        <%--<legend>Patient Details</legend>--%>
                        <div class="pure-control-group">
                            <label for="id">ID</label>
                            <input name="id" id="id" type="text" placeholder="ID">
                        </div>

                        <div class="pure-control-group">
                            <label for="surname">Surname</label>
                            <input name="surname" id="surname" type="text" placeholder="Surname">
                        </div>

                        <div class="pure-control-group">
                            <label for="fname">First Name</label>
                            <input name="fname" id="fname" type="text" placeholder="First Name">
                        </div>

                        <div class="pure-control-group">
                            <label for="lname">Last Name</label>
                            <input name="lname" id="lname" type="text" placeholder="Last Name">
                        </div>

                        <div class="pure-control-group">
                            <label for="dob">Date of Birth</label>
                            <input name="dob" id="dob" type="text" placeholder="DOB">
                        </div>

                        <div class="pure-control-group">
                            <label for="gender">Gender</label>
                            <select name="gender" id="gender">
                                <option value="M">MALE</option>
                                <option value="F">FEMALE</option>
                            </select>
                        </div>

                        <div class="pure-control-group">
                            <label for="address">Address</label>
                            <input name="address" id="address" type="text" placeholder="Address">
                        </div>

                        <div class="pure-control-group">
                            <button style="float: right; margin-right: 225px;" type="submit" class="pure-button pure-button-primary">Submit</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="pure-u-1-2">

            <div class="grid-content">
                <table style="margin-right: 13px;margin-top: 10px;" class="pure-table pure-table-bordered">
                    <thead>
                    <tr>
                        <th>Family Name</th>
                        <th>Middle Name</th>
                        <th>Last Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>DOB</th>
                        <th>Summary</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="patient" items="${patients}" varStatus="status">
                        <tr>
                            <td>${patient.givenName}</td>
                            <td>${patient.middleName}</td>
                            <td>${patient.familyName}</td>
                            <td>${patient.age}</td>
                            <td>${patient.gender}</td>
                            <td>${patient.birthdate}</td>
                            <td><a href="summary.form?patientId=${patient.patientId}">Summary</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <br/><br/><br/><br/><br/><br/><br/><br/>
    <div style="height: 50px;margin-bottom: 1px;">
        <%@ include file="/WEB-INF/template/footer.jsp"%>
    </div>
</div>

</body>
</html>

