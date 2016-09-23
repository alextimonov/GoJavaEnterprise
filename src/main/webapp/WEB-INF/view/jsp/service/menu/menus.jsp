<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathMenu" value="${pageContext.request.contextPath}/Restaurant/service/menu"/>
<c:set var="pathService" value="${pageContext.request.contextPath}/Restaurant/service"/>

<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bastion|Service|Menus</title>
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
    <h2>Menus<small> Service page</small></h2>
</div>

<table class="table table-striped">
    <c:url var="addUrl" value="${pathMenu}/add" />
    <tr>
        <th>ID</th>
        <th>Menu name</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Add menu</th>
    </tr>

    <c:forEach var="menu" items="${menus}">
        <c:url var="editUrl" value="${pathMenu}/edit?id=${menu.id}" />
        <c:url var="deleteUrl" value="${pathMenu}/delete?id=${menu.id}" />
    <tr>
        <td>${menu.id}</td>
        <td>${menu.name}</td>
        <td><a href="${editUrl}">Edit</a></td>
        <td><a href="${deleteUrl}">Delete</a></td>
        <td><a href="${addUrl}">Add</a></td>
    </tr>
    </c:forEach>
</table>

<table class="table table-striped">
    <tr>
        <form action="${pathMenu}/add" method="GET">
            <td>Add</td>
            <td></td>
            <td><input type="submit" value="Add new menu"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathMenu}/edit" method="GET">
            <td>Edit. Input menu's ID:</td>
            <td><input type="number" name="id"></td>
            <td><input type="submit" value="Edit by id" ></td>
        </form>
    </tr>

    <tr>
        <form action="${pathMenu}/editByName" method="GET">
            <td>Edit. Input menu's name:</td>
            <td><input type="text" name="name"></td>
            <td><input type="submit" value="Edit by name"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathMenu}/delete" method="GET">
            <td>Delete. Input menu's ID:</td>
            <td><input type="number" name="id"></td>
            <td><input type="submit" value="Delete by id"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathMenu}/deleteByName" method="GET">
            <td>Delete. Input menu's name:</td>
            <td><input type="text" name="name"></td>
            <td><input type="submit" value="Delete by name"></td>
        </form>
    </tr>
</table>

<div class="container">
    <c:forEach var="menu" items="${menus}">
        <h4>Menu ${menu.name} (id=${menu.id})</h4>
        <table class="table table-striped">
            <tr>
                <th> ID </th>
                <th> Dish name </th>
                <th> Weight </th>
                <th> Cost </th>
            </tr>
            <c:forEach var="dish" items="${menu.dishes}">
                <tr>
                    <td> ${dish.id} </td>
                    <td> <a href="${pathService}/dish/editByName?name=${dish.name}"> ${dish.name} </a> </td>
                    <td> ${dish.weight}</td>
                    <td> ${dish.cost} </td>
                </tr>
            </c:forEach>
        </table>
        <br>
    </c:forEach>
</div>

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