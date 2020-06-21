<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/21/2020
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LSO Grade Analysis View</title>
</head>
<body>
    <p>
        <h2>Grade Details:</h2>

        <h3>${grade.rawGrade}</h3>

        <br/>

        Score: ${grade.grade}<br/>
        Wire: ${grade.wire}<br/>

        <table>
            <tr>
                <td>Pilot</td>
                <td>NAME PLACEHOLDER</td>
            </tr>
            <tr>
                <td>Aircraft</td>
                <td>${grade.aircraftType}</td>
            </tr>
            <tr>
                <td>Day/Night</td>
                <td>DAY NITE PLACEHODER</td>
            </tr>

            <tr>
                <td>Date and Time</td>
                <td>${grade.timestamp}</td>
            </tr>
        </table>

        <table>
            <tr>
                <th>Position</th>
                <th>How Much</th>
                <th>Control Error</th>
            </tr>
            <c:forEach var="err" items="${grade.errorItems}">
                <tr>
                    <td>${err.position}</td>
                    <td>${err.level}</td>
                    <td>${err.error}</td>
                </tr>
            </c:forEach>
        </table>


    </p>
</body>
</html>
