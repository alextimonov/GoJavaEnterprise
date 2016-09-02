
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> Menu </title>
</head>
<>
<table style="align-items: center" title="Menu-">
    <tr>
        <th> ID </th>
        <th> Menu name </th>
    </tr>
    <tr>
        <td> ${menu.id} </td>
        <td> ${menu.name} </td>
    </tr>
</table>
<br>
<br>
<table style="align-items: center">
    <thead align="center" title="Menu dishes"/>
    <tr>
        <th> ID </th>
        <th> Dish name </th>
        <th> Cost </th>
    </tr>
    <%--<c:set var="dish" value="${menu.dishes.get(0)}"/>--%>
    <c:forEach var="dish" items="${menu.dishes}">
        <tr>
            <td> ${dish.id} </td>
            <td> <a href="/Restaurant/dish/${dish.name}"> ${dish.name} </a> </td>
            <td> ${dish.cost} </td>
        </tr>
    </c:forEach>
</table>


</body>
</html>