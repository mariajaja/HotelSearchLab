<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="/style.css" />
</head>
<body>
	<div class=container>
	<h2>Hotel Search</h2>
	<p>${ allcities } </p>
		<form class="form-inline" action="/list">
			<label class="sr-only" for="category">Choose a City</label>
	        <select class="form-control mb-2 mr-sm-2" id="city-search" name="city" >
	          	<option value="">Select</option>
	            <c:forEach items="${ cities }" var="city">
	                <option <c:if test="${ city eq param.city }">selected</c:if>>${ city }</option>
	            </c:forEach>
	       	</select>
	       	<label class="sr-only" for="maxPrice">Maximum Per Night</label>
	       	<input type="number" value="${param.maxPrice}" name="maxPrice" placeholder="Maximum Price" min=>
	       	<button type="submit">Search</button>
	          <c:if test="${ not empty param.city }">
	            <a href="/">Clear</a>
	          </c:if>
		</form>
	</div>
</body>
</html>