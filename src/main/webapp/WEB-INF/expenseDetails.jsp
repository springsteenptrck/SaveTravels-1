<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<style>
        body {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Expense Details</h1>
    <div style="display: flex; justify-content: center;">
    	<table>
        	<tr>
            	<th>Name</th>
            	<th>Vendor</th>
            	<th>Amount</th>
            	<th>Description</th>
        	</tr>
        	<tr>
            	<td>${expense.name}</td>
            	<td>${expense.vendor}</td>
            	<td>$${expense.amount}</td>
            	<td>${expense.description}</td>
        	</tr>
    	</table>
    </div>
    	<a href="/expenses">Go Back</a>
</body>
</html>
