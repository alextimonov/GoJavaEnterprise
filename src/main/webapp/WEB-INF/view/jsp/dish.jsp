
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> Dish </title>
</head>
<>
<table style="align-items: center" title="Dish">
    <tr>
        <th> ID </th>
        <th> Dish name </th>
        <th> Description </th>
        <th> Weight </th>
        <th> Cost </th>
    </tr>
    <tr>
        <td> ${dish.id} </td>
        <td> ${dish.name} </td>
        <td> ${dish.description} </td>
        <td> ${dish.weight} </td>
        <td> ${dish.cost} </td>
    </tr>
</table>

</body>
</html>