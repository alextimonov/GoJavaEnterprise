<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathEmployee" value="${pageContext.request.contextPath}/Restaurant/service/employee"/>
<c:set var="pathService" value="${pageContext.request.contextPath}/Restaurant/service"/>

<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bastion|Service|Employees</title>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pathService}/../main">Bastion</a>
            <a class="navbar-brand" href="${pathService}"> Service pages</a>
            <a class="navbar-brand" href="${pathService}/employee/employees">Personal</a>
            <a class="navbar-brand" href="${pathService}/menu/menus">Menus</a>
            <a class="navbar-brand" href="${pathService}/dish/dishes">Dishes</a>
            <a class="navbar-brand" href="${pathService}/storage/ingredients">Storage</a>
            <a class="navbar-brand" href="${pathService}/order/orders">Orders</a>
        </div>
    </div>
</nav>

<div class="container">
    <h2>Our personal<small> Service page</small></h2>
</div>

<table class="table table-striped">
    <c:url var="addUrl" value="${pathEmployee}/add"/>
    <tr>
        <th>ID</th>
        <th>First name</th>
        <th>Last name</th>
        <th>Birthday</th>
        <th>Position</th>
        <th>Salary</th>
        <th>Edit</th>
        <th>Add employee</th>
    </tr>
    <c:forEach var="employee" items="${employees}">
        <c:url var="editUrl" value="${pathEmployee}/edit?id=${employee.id}"/>
        <tr>
            <td> ${employee.id} </td>
            <td> ${employee.name} </td>
            <td> ${employee.surname} </td>
            <td> <fmt:formatDate pattern="yyyy-MM-dd" value="${employee.birthday}"/> </td>
            <td> ${employee.job.position} </td>
            <td> ${employee.salary} </td>
            <td><a href="${editUrl}">Edit</a></td>
            <td><a href="${addUrl}">Add</a></td>
        </tr>
    </c:forEach>
</table>
<br>

<table class="table table-striped">

    <tr>
        <form action="${pathEmployee}/add" method="GET">
            <td>Add</td>
            <td></td>
            <td><input type="submit" value="Add new employee"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathEmployee}/edit" method="GET">
            <td>Edit. Input employee's ID:</td>
            <td><input type="number" name="id"></td>
            <td><input type="submit" value="Edit by id"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathEmployee}/editByName" method="GET">
            <td>Edit. Input employee's name:</td>
            <td><input type="text" name="name"></td>
            <td><input type="submit" value="Edit by name"></td>
        </form>
    </tr>
</table>

<br>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pathService}/../main">Bastion</a>
            <a class="navbar-brand" href="${pathService}"> Service pages</a>
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
