<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title> Employees </title>
</head>
<body>
<table style="align-items: center" >
    <thead> Employees </thead>
    <tr>
        <th> First name </th>
        <th> Last name </th>
        <th> Position </th>
        <th> Salary </th>
    </tr>
    <c:forEach var="employee" items="${employees}">
        <tr>
            <td> <a href="/Restaurant/employee/${employee.name}"> ${employee.name} </a> </td>
            <td> ${employee.surname} </td>
            <td> ${employee.job.position} </td>
            <td> ${employee.salary} </td>
        </tr>
    </c:forEach>

</table>


</body>
</html>