<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title> Restaurant menus </title>
</head>
<body>

<h2> Menus </h2>

<table style="align-items: center">
    <thead> Menus </thead>
    <tr>
        <th> ID </th>
        <th> Menu name </th>
    </tr>
    <c:forEach var="menu" items="${menus}">
        <tr>
            <td> ${menu.id} </td>
            <td> <a href="/Restaurant/menu/${menu.name}"> ${menu.name} </a> </td>
        </tr>
    </c:forEach>

</table>


</body>
</html>