<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathDish" value="${pageContext.request.contextPath}/Restaurant/service/dish"/>
<html>
<head>
    <title>Bastion|Service|Add new dish</title>
</head>
<body>

<h2>Create new dish</h2>
<c:url var="saveUrl" value="${pathDish}/add" />

<form:form modelAttribute="dishAttribute" method="POST" action="${saveUrl}">
    <table>
        <tr>
            <td><form:label path="name">Dish name:</form:label></td>
            <td><form:input path="Name"/></td>
        </tr>

        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="Description"/></td>
        </tr>

        <tr>
            <td><form:label path="weight">Weight</form:label></td>
            <td><form:input path="Weight"/></td>
        </tr>

        <tr>
            <td><form:label path="cost">Cost</form:label></td>
            <td><form:input path="Cost"/></td>
        </tr>
    </table>

    <input type="submit" value="Save" />
</form:form>

</body>
</html>
