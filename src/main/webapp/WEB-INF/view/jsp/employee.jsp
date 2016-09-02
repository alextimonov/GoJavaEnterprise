
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> Employees </title>
</head>
<body>
<table style="align-items: center">
    <tr>
        <th> ID </th>
        <th> First name </th>
        <th> Last name </th>
        <th> Position </th>
        <th> Salary </th>
        <th> Birthday </th>
    </tr>
    <tr>
        <td> ${employee.id} </td>
        <td> ${employee.name} </td>
        <td> ${employee.surname} </td>
        <td> ${employee.job.position} </td>
        <td> ${employee.salary} </td>
        <td> ${employee.birthday} </td>
    </tr>

</table>

</body>
</html>