<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathStorage" value="${pageContext.request.contextPath}/Restaurant/service/storage"/>
<html>
<head>
    <title>Bastion|Service|Edit new dish</title>
</head>
<body>

<h2>Edit existing ingredient</h2>
<c:url var="saveUrl" value="${pathStorage}/edit?id=${ingredient.id}"/>
<form:form modelAttribute="ingredient" method="POST" action="${saveUrl}">
    <table>
        <tr>
            <td><form:label path="id">ID:</form:label></td>
            <td><form:input path="id" disabled="true"/></td>
        </tr>

        <tr>
            <td><form:label path="name">Ingredient name:</form:label></td>
            <td><form:input path="Name"/></td>
        </tr>

        <tr>
            <td><form:label path="amount">Amount:</form:label></td>
            <td><form:input path="Amount"/></td>
        </tr>
    </table>

    <input type="submit" value="Save changes" />
</form:form>

</body>
</html>
