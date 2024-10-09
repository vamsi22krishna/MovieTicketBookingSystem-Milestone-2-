<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Users</title>
</head>
<body>
	<h2>List of Users</h2>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Username</th>
				<th>Phone</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.id}</td>
					<td>${user.username}</td>
					<td>${user.phone}</td>
					<td><a
						href="${pageContext.request.contextPath}/users/${user.id}">View</a>
						<form action="${pageContext.request.contextPath}/users/${user.id}"
							method="post" style="display: inline;">
							<input type="hidden" name="_method" value="delete" />
							<button type="submit">Delete</button>
						</form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
