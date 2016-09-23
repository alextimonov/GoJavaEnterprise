<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">My Tasks</a>
        </div>
    </div>
</nav>

<div class="container">
    <h1>My ToDo list</h1>
    <hr/>
    <form action="todo" method="post">
        <table class="table table-bordered">
            <thead>
            <tr>
                <td>Name</td>
                <td>Category</td>
                <td>Complete</td>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="task" items="${taskList}" varStatus="loop">
                <tr>
                    <td><c:out value="${task.name}"/></td>
                    <td><c:out value="${task.category}"/></td>
                    <td><input type="checkbox" name="${task.hashCode()}" value="${task.complete}"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button class="btn btn-info" type="submit">Update tasks</button>
    </form>
    <hr>
    <form action="newTask" method="post" class="form-horizontal">
        <div class="form-group">
            <div class="col-sm-2">
                <label class="control-label" for="name">Task Name</label>
            </div>
            <div class="col-sm-10">
                <input class="form-control" name="name" type="text"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2">
                <label for="category">Task Category</label>
            </div>
            <div class="col-sm-10">
                <input class="form-control" name="category" type="text"/>
            </div>
        </div>
        <button class="btn btn-info" type="submit">Add task</button>
    </form>
</div>
</body>
</html>
