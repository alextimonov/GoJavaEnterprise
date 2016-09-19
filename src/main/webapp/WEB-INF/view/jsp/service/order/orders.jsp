<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathOrder" value="${pageContext.request.contextPath}/Restaurant/service/order"/>
<c:set var="pathService" value="${pageContext.request.contextPath}/Restaurant/service"/>

<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bastion|Service|Orders</title>
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
    <h2>Orders<small> Service page</small></h2>
</div>

<table class="table table-striped">
    <tr>
        <th> ID </th>
        <th> Waiter </th>
        <th> Table </th>
        <th> Date </th>
        <th> Is closed </th>
        <th> Dishes </th>
    </tr>
    <c:forEach var="item" items="${orders}">
        <c:set var="nDishes" value="${item.getDishes().size()}"/>
        <tr>
            <td> ${item.id} </td>
            <td> ${item.waiter.name} </td>
            <td> ${item.tableNumber} </td>
            <td> ${item.date} </td>
            <td> ${item.closed} </td>
            <td> <a href="${pathOrder}/dishes?order=${order.id}"> ${nDishes} dishes </a>
                <table class="table">
                    <tr>
                        <th> ID </th>
                        <th> name </th>
                        <th> cost </th>
                        <th> weight </th>
                    </tr>
                    <c:forEach var="dish" items="${item.dishes}">
                        <tr>
                            <td> ${dish.id} </td>
                            <td> ${dish.name} </td>
                            <td> ${dish.cost} </td>
                            <td> ${dish.weight} </td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </c:forEach>

</table>
<br>

<table class="table table-striped">
    <tr>
        <form action="${pathOrder}/filterByTableNumber" method="GET">
            <td>Filter by table number</td>
            <td><input type="number" name="tableNumber"></td>
            <td><input type="submit" value="Filter by table number"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathOrder}/filterByWaiter" method="GET">
            <td>Filter by waiter's name</td>
            <td><input type="text" name="waiterName"></td>
            <td><input type="submit" value="Filter by waiter's name"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathOrder}/filterByDate" method="GET">
            <td>Filter by date</td>
            <td><input type="date" name="date"></td>
            <td><input type="submit" value="Filter by date"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathOrder}/orders" method="GET">
            <td>Show all orders</td>
            <td></td>
            <td><input type="submit" value="Show all"></td>
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