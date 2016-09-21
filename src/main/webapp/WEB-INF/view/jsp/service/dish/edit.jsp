<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pathDish" value="${pageContext.request.contextPath}/Restaurant/service/dish"/>
<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bastion|Service|Edit dish</title>
</head>
<body>

<div class="container">
    <h2>Edit existing dish</h2>
    <c:url var="saveUrl" value="${pathDish}/edit?id=${dishExisting.id}"/>

    <form:form class="form-horizontal" modelAttribute="dishExisting" method="POST" action="${saveUrl}">
        <div class="form-group">
            <div class="col-sm-2">
                <label class="control-label" for="id">ID</label>
            </div>
            <div class="col-sm-4">
                <form:input class="form-control" path="id" disabled="true"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2">
                <label class="control-label" for="name">Dish name</label>
            </div>
            <div class="col-sm-4">
                <form:input class="form-control" path="name" type="text"/>
            </div>
            <div class="col-sm-4">
                <label class="label-info">${dishValidate.nameLabel}</label>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2">
                <label class="control-label" for="description">Description</label>
            </div>
            <div class="col-sm-4">
                <form:input class="form-control" path="description" type="text"/>
            </div>
            <div class="col-sm-4">
                <label class="label-info">${dishValidate.descriptionLabel}</label>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2">
                <label class="control-label" for="weight">Weight</label>
            </div>
            <div class="col-sm-4">
                <form:input class="form-control" path="weight" type="number" min="1" max="1000"/>
            </div>
            <div class="col-sm-4">
                <label class="label-info">${dishValidate.weightLabel}</label>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2">
                <label class="control-label" for="cost">Cost</label>
            </div>
            <div class="col-sm-4">
                <form:input class="form-control" path="cost" type="number" min="0.01" max="1000" step="0.01"/>
            </div>
            <div class="col-sm-4">
                <label class="label-info">${dishValidate.costLabel}</label>
            </div>
        </div>

        <button class="btn btn-primary" type="submit">Save changes</button>
    </form:form>
</div>

</body>
</html>
