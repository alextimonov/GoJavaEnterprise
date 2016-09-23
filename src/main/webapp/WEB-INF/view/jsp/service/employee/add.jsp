<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathEmployee" value="${pageContext.request.contextPath}/Restaurant/service/employee"/>
<html>
<head>
    <title>Bastion|Service|Add new employee</title>
</head>
<body>

<h2>Create new employee</h2>
<c:url var="saveUrl" value="${pathEmployee}/add"/>
<form:form modelAttribute="employeeView" method="POST" action="${saveUrl}">
    <table>
        <tr>
            <td><form:label path="name">Name:</form:label></td>
            <td><form:input path="Name"/></td>
        </tr>

        <tr>
            <td><form:label path="surname">Surname:</form:label></td>
            <td><form:input path="Surname"/></td>
        </tr>

        <tr>
            <td><form:label path="birthday">Birthday:</form:label></td>
            <td><form:input path="Birthday"/></td>
        </tr>

        <tr>
            <td><form:label path="position">Job:</form:label></td>
            <td><form:input path="Position"/></td>
        </tr>

        <tr>
            <td><form:label path="salary">Salary:</form:label></td>
            <td><form:input path="Salary"/></td>
        </tr>
    </table>

    <input type="submit" value="Save" />
</form:form>

</body>
</html>