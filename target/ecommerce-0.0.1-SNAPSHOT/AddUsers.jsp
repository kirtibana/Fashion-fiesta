
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:import url="header.jsp"></c:import>

	<h1>Add Users</h1>

	<%-- <h1>${errorMap}</h1> --%>

	<form action="AddUsersToDB" method="post">



		<input type="text" name="Username" class="form-control"
			placeholder="Enter Username"
			<c:if test="${not empty currentUser}"> value="${currentUser.getUsername()}"</c:if> />

		<c:if test="${not empty errorMap.username}">
			<c:forEach var="errors" items="${errorMap.username}">
				<h3 class="alert alert-danger">${errors}</h3>
			</c:forEach>

		</c:if>


		<br> <input type="password" name="Password" class="form-control"
			placeholder="Enter Password"
			<c:if test="${not empty currentUser}">value="${currentUser.getPassword()}"</c:if> />


		<c:if test="${not empty errorMap.password}">
			<c:forEach var="errors" items="${errorMap.password}">
				<h3 class="alert alert-danger">${errors}</h3>
			</c:forEach>

		</c:if>

		<br> <input type="email" name="Email" class="form-control"
			placeholder="Enter Email"
			<c:if test="${not empty currentUser}">value="${currentUser.getEmail()}"</c:if> />

		<c:if test="${not empty errorMap.email}">

			<c:forEach var="errors" items="${errorMap.email}">
				<h3 class="alert alert-danger">${errors}</h3>
			</c:forEach>

		</c:if>
		<br> <input type="text" name="Phoneno" class="form-control" placeholder="Enter Phone Number"
		<c:if test="${not empty currentUser}">value="${currentUser.getPhoneno()}"</c:if> />

		<c:if test="${not empty errorMap.phoneno}">

			<c:forEach var="errors" items="${errorMap.phoneno}">
				<h3 class="alert alert-danger">${errors}</h3>
			</c:forEach>

		</c:if>
		
		
		<br> <input type="text" name="Address" class="form-control" placeholder ="Enter Address"
		<c:if test="${not empty currentUser}">value="${currentUser.getAddress()}"</c:if> />

		<c:if test="${not empty errorMap.address}">

			<c:forEach var="errors" items="${errorMap.address}">
				<h3 class="alert alert-danger">${errors}</h3>
			
			</c:forEach>

		</c:if>
		
		
		<br> <input type="submit" value="Submit" class="btn btn-success">

	</form>


</body>
</html>