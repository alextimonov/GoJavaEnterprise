<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathDish" value="${pageContext.request.contextPath}/Restaurant"/>

<html>
<head>
    <title>My Restaurant|Menus</title>
</head>
<body>

<h2>Find dish by Name</h2>
<form action="${pathDish}/searchDish" method="GET">
    <h4>Input dish's name to search:</h4>
    <br>
    <input type="text" name="dishName">
    <input type="submit" value="Search">
</form>


<br>
<br>
<a href="${pathDish}/main">Main page</a> |
<a href="${pathDish}/menus">Our menus</a> |
<a href="${pathDish}/scheme">Restaurant's scheme</a> |
<a href="${pathDish}/contacts">Contacts</a> |
<a href="${pathDish}/waiters">Our Waiters</a> |
<a href="${pathDish}/employees">Our personal</a>

</body>
</html>