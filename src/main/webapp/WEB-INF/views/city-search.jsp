<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotels in ${ city }</title>
</head>
<body>
	<div class=container>
		<h2>Hotels in ${ city }</h2>
		<table>
			<tr>
				<th>Name</th>
				<th>Price Per Night</th>
			</tr>
			<c:forEach items="${ hotelList }" var="hotel">
				<tr>
					<td>${ hotel.name }</td>
					<td>${ hotel.pricePerNight }</td>
				</tr>
			</c:forEach>
		</table>
		
		<a href="/">Search again?</a>
	</div>
</body>
</html>