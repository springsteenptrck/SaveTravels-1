<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<style>
        body {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Expense Tracker</h1>

    <h2>Add Expense</h2>
    <form:form action="/expenses/add" method="post" modelAttribute="expense">
        <div>
    		<form:label path="name">Expense Name: </form:label><br />
    		<form:errors path="name" class="text-danger"/>
    		<form:input style="width:250px;" path="name"/>
		</div>

		<div>
    		<form:label path="vendor">Vendor: </form:label><br />
    		<form:errors path="vendor" class="text-danger"/>
    		<form:input style="width:250px;" path="vendor"/>
		</div>

		<div>
    		<form:label path="amount">$ Amount: </form:label><br />
    		<form:errors path="amount" class="text-danger"/>
    		<form:input style="width:250px;" type="number" step="0.01" min="0" path="amount" value="0.00"/>
		</div>

		<div>
    		<form:label path="description">Description: </form:label><br />
    		<form:errors path="description" class="text-danger"/>
    		<form:textarea style="width:250px;" rows="4" path="description"/>
		</div>

        <input type="submit" value="Add Expense"/>
    </form:form>

    <h1>Expense List</h1>
    <div style="display: flex; justify-content: center;">
    	<table>
        	<thead>
            	<tr>
                	<th>Name</th>
                	<th>Vendor</th>
                	<th>Amount</th>
                	<th>Description</th>
                	<th>Actions</th>
            	</tr>
        	</thead>
        	<tbody>
    		<c:forEach items="${expenses}" var="expense">
        		<tr>
            		<td><a href="/expenses/details/${expense.id}">${expense.name}</a></td>
            		<td>${expense.vendor}</td>
            		<td>$${String.format("%.2f", expense.amount)}</td>
            		<td>${expense.description}</td>
            		<td>
                		<a href="/expenses/edit/${expense.id}">Edit</a>
                		<a href="/expenses/delete/${expense.id}">Delete</a>
            		</td>
        		</tr>
    		</c:forEach>
			</tbody>
    	</table>
    
    	<c:if test="${not empty result and not empty result.allErrors}">
        	<div class="alert alert-danger">
            	<ul>
                	<c:forEach items="${result.allErrors}" var="error">
                    	<li>${error.defaultMessage}</li>
                	</c:forEach>
            	</ul>
        	</div>
    	</c:if>
    </div>
</body>
</html>
