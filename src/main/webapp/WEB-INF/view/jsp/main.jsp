<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathDish" value="${pageContext.request.contextPath}/Restaurant"/>

<html>
<head>
    <title>My Restaurant</title>
</head>
<body>
<h2>Restaurant Bastion <small>We make your free time unforgettable</small></h2>
<h4>Kyiv, Blvd. Buchmy, 10. Tel. 123-45-67, E-mail:bastion@bastion.kiev.ua</h4>
<img src="${pageContext.request.contextPath}/images/photo_inside.jpg" />
<br>
<form action="${pathDish}/searchDish" method="GET">
    <h4>Input dish's name to search:</h4>
    <input type="text" name="dishName">
    <input type="submit" value="Search" >
</form>
<a href="${pathDish}/main">Main page</a> |
<a href="${pathDish}/menus">Our menus</a> |
<a href="${pathDish}/findDishByName">Find your favorite dish</a> |
<a href="${pathDish}/scheme">Restaurant's scheme</a> |
<a href="${pathDish}/contacts">Contacts</a> |
<a href="${pathDish}/waiters">Our Waiters</a> |
<a href="${pathDish}/employees">Our personal</a>
</body>
</html>
