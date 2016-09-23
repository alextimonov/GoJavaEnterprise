<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathEmployee" value="${pageContext.request.contextPath}/Restaurant/service/employee"/>
<html>
<head>
    <title>Bastion|Service|Edit employee</title>
</head>
<body>

<h1>Edit existing employee</h1>
<c:url var="saveUrl" value="${pathEmployee}/edit?id=${employeeView.id}"/>
<form:form modelAttribute="employeeView" method="POST" action="${saveUrl}">
    <table>
        <tr>
            <td><form:label path="id">ID:</form:label></td>
            <td><form:input path="id" disabled="true"/></td>
        </tr>

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
