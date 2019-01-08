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
	
		<h1>Login</h1>
	<h1>${errorMap}</h1>
		
		<form action="Login" method="post">
	
			<input type="text" name="Username" class="form-control" placeholder="Enter Username">
			
			<br>
			<input type="password" name="Password"  class="form-control" placeholder="Enter Password"/>
			<br>
			<input type="submit" value="Submit" class="btn btn-danger">
	
			<c:if test="${not empty invalid}">
			
				<br>
				<h1 class="alert alert-danger" style="margin: auto; width: 80%;">Invalid credentials</h1>
			
			</c:if>
	
		</form>
	
	
	</body>
	</html>