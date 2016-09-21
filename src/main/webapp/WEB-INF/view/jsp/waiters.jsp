<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}/Restaurant"/>

<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bastion|Waiters</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${path}/main">Restaurant Bastion</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="${path}/main">Home</a></li>
            <li><a href="${path}/menus">Menus</a></li>
            <li><a href="${path}/dishes">Dishes</a></li>
            <li><a href="${path}/scheme">Scheme</a></li>
            <li><a href="${path}/contacts">Contacts</a></li>
            <li class="active"><a href="${path}/waiters">Waiters</a></li>
            <li><a href="${path}/employees">Personal</a></li>
            <li><a href="${path}/service/service">Service pages</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <h3>Our waiters</h3>
    <table class="table table-striped">
        <tr>
            <th>First name</th>
            <th>Position</th>
            <th>Photo</th>
        </tr>
        <c:forEach var="employee" items="${waiters}">
            <tr>
                <td><a href="${path}/employee/${employee.name}">${employee.name}</a></td>
                <td>${employee.job.position}</td>
                <td><img src="${pageContext.request.contextPath}/images/photo_${employee.id}.jpg"/></td>
            </tr>
        </c:forEach>
    </table>
</div>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${path}/main">Restaurant Bastion</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="${path}/main">Home</a></li>
            <li><a href="${path}/menus">Menus</a></li>
            <li><a href="${path}/dishes">Dishes</a></li>
            <li><a href="${path}/scheme">Scheme</a></li>
            <li><a href="${path}/contacts">Contacts</a></li>
            <li class="active"><a href="${path}/waiters">Waiters</a></li>
            <li><a href="${path}/employees">Personal</a></li>
            <li><a href="${path}/service/service">Service pages</a></li>
        </ul>
    </div>
</nav>

</body>
</html>