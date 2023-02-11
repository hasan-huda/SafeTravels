<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Safe Travels</title>
</head>
<body>
    <div class="container">
        <div class="card mt-3">
            <div class="card-header">
                <h1>Safe Travels</h1>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Expense</th>
                            <th>Vendor</th>
                            <th>Amount</th>
                            <th>Action</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="expense" items ="${expenses}">
                            <tr>
                                <td><a href="/expenses/${expense.id}"><c:out value="${expense.name}"/></a></td>
                                <td><c:out value="${expense.vendor}"/></td>
                                <td><c:out value="${expense.amount}"/></td>
                                <td><a href="/expenses/${expense.id}/edit">edit</a></td>
                                <td>
                                    <form action="/expenses/${expense.id}" method="post">
                                        <input type="hidden" name="_method" value="delete">
                                        <input type="submit" value="Delete" class="btn btn-primary">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card mt-3">
            <div class="card-header">
                <h1>Add A New Expense</h1>
            </div>
            <div class="card-body">
                <form:form action="/expenses" method="post" modelAttribute="expense">
                    <p>
                        <form:label path="name" class="form-label">Expense Name</form:label>
                        <form:errors path="name" class="text-danger" />
                        <form:input path="name" class="form-control form-control"/>
                    </p>
                    <p>
                        <form:label path="vendor" class="form-label">Vendor</form:label>
                        <form:errors path="vendor" class="text-danger" />
                        <form:input path="vendor" class="form-control form-control"/>
                    </p>
                    <p>
                        <form:label path="amount">Amount</form:label>
                        <form:errors path="amount" class="text-danger" />
                        <form:input type="number" step="any" path="amount" class="form-control form-control"/>
                    </p>
                    <p>
                        <form:label path="description" class="form-label">Description</form:label>
                        <form:errors path="description" class="text-danger" />
                        <form:input path="description" class="form-control form-control"/>
                    </p> 
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary">
                            Submit
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>