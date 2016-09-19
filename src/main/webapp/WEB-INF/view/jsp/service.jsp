<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathService" value="${pageContext.request.contextPath}/Restaurant/service"/>

<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bastion|Service pages</title>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pathService}/../main">Bastion</a>
            <a class="navbar-brand" href="${pathService}"> Service page</a>
            <a class="navbar-brand" href="${pathService}/employee/employees">Personal</a>
            <a class="navbar-brand" href="${pathService}/menu/menus">Menus</a>
            <a class="navbar-brand" href="${pathService}/dish/dishes">Dishes</a>
            <a class="navbar-brand" href="${pathService}/storage/ingredients">Storage</a>
            <a class="navbar-brand" href="${pathService}/order/orders">Orders</a>
        </div>
    </div>
</nav>

<div class="container">
    <h1>Restaurant Bastion<small> Service pages</small></h1>
    <h3>Current time: ${currentTime}</h3>
</div>
<img src="${pageContext.request.contextPath}/images/photo_inside.jpg" />
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pathService}/../main">Bastion</a>
            <a class="navbar-brand" href="${pathService}"> Service page</a>
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
