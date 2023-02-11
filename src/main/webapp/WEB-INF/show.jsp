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
<title>Show Expense</title>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-end">
            <a href="/expenses">go back</a>
        </div>
        <div class="card">
            <div class="card-header">
                <h1>Expense Details</h1>
            </div>
            <div class="card-body">
                <div>
                    Expense Name:
                    <c:out value="${expense.name}"/>
                </div>
                <div>
                    Expense Description:
                    <c:out value="${expense.description}"/>
                </div>
                <div>
                    Vendor:
                    <c:out value="${expense.vendor}"/>
                </div>
                <div>
                    Amount Spent:
                    $<c:out value="${expense.amount}"/>
                </div>
            </div>
        </div>
    </div>
</body>
</html>