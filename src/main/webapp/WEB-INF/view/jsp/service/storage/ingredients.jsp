<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathStorage" value="${pageContext.request.contextPath}/Restaurant/service/storage"/>
<c:set var="pathService" value="${pageContext.request.contextPath}/Restaurant/service"/>

<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bastion|Service|Storage</title>
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
    <h2>Storage<small> Service page</small></h2>
</div>

<table class="table table-striped">
    <c:url var="addUrl" value="${pathStorage}/add" />
    <tr>
        <th>ID</th>
        <th>Ingredient name</th>
        <th>Amount</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Add ingredient</th>
    </tr>
    <c:forEach var="item" items="${ingredients}">
        <c:url var="editUrl" value="${pathStorage}/edit?id=${item.id}" />
        <c:url var="deleteUrl" value="${pathStorage}/delete?id=${item.id}" />
        <tr>
            <td> ${item.id} </td>
            <td> ${item.name} </td>
            <td> ${item.amount} </td>
            <td><a href="${editUrl}">Edit</a></td>
            <td><a href="${deleteUrl}">Delete</a></td>
            <td><a href="${addUrl}">Add</a></td>
        </tr>
    </c:forEach>

</table>

<table class="table table-striped">
    <tr>
        <form action="${pathStorage}/add" method="GET">
            <td>Add</td>
            <td></td>
            <td><input type="submit" value="Add new ingredient"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathStorage}/filter" method="GET">
            <td>Filter by first chars</td>
            <td><input type="text" name="name"></td>
            <td><input type="submit" value="Filter"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathStorage}/ingredients" method="GET">
            <td>Show all ingredients</td>
            <td></td>
            <td><input type="submit" value="Show all"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathStorage}/edit" method="GET">
            <td>Edit. Input ingredient's ID:</td>
            <td><input type="number" name="id"></td>
            <td><input type="submit" value="Edit by id"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathStorage}/editByName" method="GET">
            <td>Edit. Input ingredient's name:</td>
            <td><input type="text" name="name"></td>
            <td><input type="submit" value="Edit by name"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathStorage}/delete" method="GET">
            <td>Delete. Input ingrdient's ID:</td>
            <td><input type="number" name="id"></td>
            <td><input type="submit" value="Delete by id"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathStorage}/deleteByName" method="GET">
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
