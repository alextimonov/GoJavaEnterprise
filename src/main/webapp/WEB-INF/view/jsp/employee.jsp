<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathDish" value="${pageContext.request.contextPath}/Restaurant"/>

<html>
<head>
    <title>My Restaurant|Employee|Detail info</title>
</head>
<body>
<table style="align-items: center" border="1">
    <thead>Employee. Detail info</thead>
    <tr>
        <th>ID</th>
        <th>First name</th>
        <th>Last name</th>
        <th>Position</th>
        <th>Salary</th>
        <th>Birthday</th>
    </tr>
    <tr>
        <td>${employee.id}</td>
        <td>${employee.name}</td>
        <td>${employee.surname}</td>
        <td>${employee.job.position}</td>
        <td>${employee.salary}</td>
        <td>${employee.birthday}</td>
    </tr>

</table>

<br>
<a href="${pathDish}/main">Main page</a> |
<a href="${pathDish}/menus">Our menus</a> |
<a href="${pathDish}/findDishByName">Find your favorite dish</a> |
<a href="${pathDish}/scheme">Restaurant's scheme</a> |
<a href="${pathDish}/contacts">Contacts</a> |
<a href="${pathDish}/waiters">Our Waiters</a> |
<a href="${pathDish}/employees">Our personal</a>

</body>
</html>