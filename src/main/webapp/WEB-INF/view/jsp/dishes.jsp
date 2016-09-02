<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title> Restaurant dishes </title>
</head>
<body>
<table style="align-items: center" title="Dishes">
    <tr>
        <th> ID </th>
        <th> Dish name </th>
        <th> Cost </th>
    </tr>
    <c:forEach var="dish" items="${dishes}">
        <tr>
            <td> ${dish.id} </td>
            <td> <a href="/Restaurant/dish/${dish.name}"> ${dish.name} </a> </td>
            <td> ${dish.cost} </td>
        </tr>
    </c:forEach>

</table>


</body>
</html>