<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathMenu" value="${pageContext.request.contextPath}/Restaurant/service/menu"/>
<c:set var="pathService" value="${pageContext.request.contextPath}/Restaurant/service"/>

<html>
<head>
    <title>Bastion|Service|Edit menu</title>
</head>
<body>

<h2>Edit existing menu</h2>
<c:url var="saveUrl" value="${pathMenu}/edit?id=${menuExisting.id}"/>
<form:form modelAttribute="menuExisting" method="POST" action="${saveUrl}" >
    <table>
        <tr>
            <td><form:label path="id">ID:</form:label></td>
            <td><form:input path="Id" disabled="true"/></td>
        </tr>

        <tr>
            <td><form:label path="name">Menu name:</form:label></td>
            <td><form:input path="Name"/></td>
        </tr>
        <tr>
            <td><form:label path="dishes">Dishes:</form:label></td>
            <td>
                <table style="align-items: center" border="1">
                    <tr>
                        <th> ID </th>
                        <th> Dish name </th>
                        <th> Description </th>
                        <th> Cost </th>
                        <th> Weight </th>
                    </tr>
                    <c:url var="addUrl" value="${pathMenu}/${menuExisting.id}/addDish"/>
                    <c:forEach var="dish" items="${menuExisting.dishes}" varStatus="loop">
                        <c:url var="deleteUrl" value="${pathMenu}/${menuExisting.id}/deleteDish?id=${dish.id}" />
                        <c:url var="editUrl" value="${pathService}/dish/edit?id=${dish.id}" />
                        <tr>
                            <td> <form:input path="dishes[${loop.index}].id"/></td>
                            <td> <form:input path="dishes[${loop.index}].name"/></td>
                            <td> <form:input path="dishes[${loop.index}].description"/></td>
                            <td> <form:input path="dishes[${loop.index}].cost"/></td>
                            <td> <form:input path="dishes[${loop.index}].weight"/></td>
                            <td><a href="${deleteUrl}">Delete dish</a></td>
                            <td><a href="${editUrl}">Edit for all menus</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
    <input type="submit" value="Save changes" />
</form:form>

<table>
    <tr>
        <form action="${pathMenu}/${menuExisting.id}/addDish" method="GET">
            <td>Add dish. Input dish's ID:</td>
            <td><input type="number" name="id"></td>
            <td><input type="submit" value="Add dish to menu"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathMenu}/${menuExisting.id}/addDishByName" method="GET">
            <td>Add dish. Input dish's name:</td>
            <td><input type="text" name="name"></td>
            <td><input type="submit" value="Add dish to menu"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathMenu}/${menuExisting.id}/deleteDish" method="GET">
            <td>Delete. Input dish's ID:</td>
            <td><input type="number" name="id"></td>
            <td><input type="submit" value="Delete dish by id"></td>
        </form>
    </tr>

    <tr>
        <form action="${pathMenu}/${menuExisting.id}/deleteDishByName" method="GET">
            <td>Delete. Input dish's name:</td>
            <td><input type="text" name="name"></td>
            <td><input type="submit" value="Delete by name"></td>
        </form>
    </tr>
</table>

</body>
</html>
