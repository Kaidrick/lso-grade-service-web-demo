<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/20/2020
  Time: 10:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LSO Grade Analyzer for DCS: Super Carrier</title>
</head>
<body>
    <div id="global">
        <form action="view-grade" method="post">
            <fieldset>
                <legend>Enter LSO Grade message from DCS World</legend>
                <p>
                    <label for="rawGrade">LSO Grade: </label>
                    <textarea name="rawGrade" id="rawGrade" tabindex="0" rows="5" cols="80"></textarea>
                </p>
                <p>
                    <label for="carrierName">Carrier/Wing Name: </label>
                    <input type="text" id="carrierName" name="carrierName"
                           tabindex="1">
                </p>
                <p>
                    <label for="aircraftType">Aircraft Type: </label>
                    <input type="text" id="aircraftType"
                           name="aircraftType" tabindex="2">
                </p>
                <p id="buttons">
                    <input id="reset" type="reset" tabindex="3">
                    <input id="submit" type="submit" tabindex="4"
                           value="Submit">
                </p>
            </fieldset>
        </form>
    </div>

</body>
</html>
