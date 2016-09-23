<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathDish" value="${pageContext.request.contextPath}/Restaurant/service/dish"/>
<c:set var="pathService" value="${pageContext.request.contextPath}/Restaurant/service"/>

<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bastion|Service|Dishes</title>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pathService}/../main">Bastion</a>
            <a class="navbar-brand" href="${pathService}">Service pages</a>
            <a class="navbar-brand" href="${pathService}/employee/employees">Personal</a>
            <a class="navbar-brand" href="${pathService}/menu/menus">Menus</a>
            <a class="navbar-brand" href="${pathService}/dish/dishes">Dishes</a>
            <a class="navbar-brand" href="${pathService}/storage/ingredients">Storage</a>
            <a class="navbar-brand" href="${pathService}/order/orders">Orders</a>
        </div>
    </div>
</nav>

<div class="container">
    <h2>Dishes<small> Service page</small> !!!TODO: add edit ingredients!!!</h2>
</div>
<table class="table table-striped">
    <c:url var="addUrl" value="${pathDish}/add" />
    <tr>
        <th>ID</th>
        <th>Dish name</th>
        <th>Description</th>
        <th>Cost</th>
        <th>Weight</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Add dish</th>
    </tr>
    <c:forEach var="dish" items="${dishes}">
        <c:url var="editUrl" value="${pathDish}/edit?id=${dish.id}" />
        <c:url var="deleteUrl" value="${pathDish}/delete?id=${dish.id}" />
        <tr>
            <td> ${dish.id} </td>
            <td> ${dish.name} </td>
            <td> ${dish.description} </td>
            <td> ${dish.cost} </td>
            <td> ${dish.weight} </td>
            <td><a href="${editUrl}">Edit</a></td>
            <td><a href="${deleteUrl}">Delete</a></td>
            <td><a href="${addUrl}">Add</a></td>
        </tr>
    </c:forEach>

</table>

<table class="table table-striped">
    <tr>
        <form action="${pathDish}/add" method="GET">
            <td>Add</td>
            <td></td>
            <td><input type="submit" value="Add new dish"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathDish}/edit" method="GET">
            <td>Edit. Input dish's ID:</td>
            <td><input type="number" name="id"></td>
            <td><input type="submit" value="Edit by id" ></td>
        </form>
    </tr>

    <tr>
    <form action="${pathDish}/editByName" method="GET">
        <td>Edit. Input dish's name:</td>
        <td><input type="text" name="name"></td>
        <td><input type="submit" value="Edit by name" ></td>
    </form>
    </tr>

    <tr>
        <form action="${pathDish}/delete" method="GET">
            <td>Delete. Input dish's ID:</td>
            <td><input type="number" name="id"></td>
            <td><input type="submit" value="Delete by id"></td>
        </form>
    </tr>

    <tr>
    <form action="${pathDish}/deleteByName" method="GET">
        <td>Delete. Input dish's name:</td>
        <td><input type="text" name="name"></td>
        <td><input type="submit" value="Delete by name" ></td>
    </form>
    </tr>

</table>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pathService}/../main">Bastion</a>
            <a class="navbar-brand" href="${pathService}">Service pages</a>
            <a class="navbar-brand" href="${pathService}/employee/employees">Personal</a>
            <a class="navbar-brand" href="${pathService}/menu/menus">Menus</a>
            <a class="navbar-brand" href="${pathService}/dish/dishes">Dishes</a>
            <a class="navbar-brand" href="${pathService}/storage/ingredients">Storage</a>
            <a class="navbar-brand" href="${pathService}/order/orders">Orders</a>
        </div>
    </div>
</nav>

</body>
</html>
