<%@page import="impl.UsersDAOImpl"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>

<%
	UsersDAO cdao = new UsersDAOImpl();

	request.setAttribute("list", cdao.getUsers());
%>

</head>
<body>

	<c:import url="header.jsp"></c:import>

	<table class="table table-striped">

		<thead>

			<tr>
				<td>Id</td>
				<td>User Name</td>
				<td>Email Id</td>
				<td>Password</td>
				<td>Phone no</td>
				<td>Address</td>
				<td>Delete</td>
			</tr>

		</thead>

		<tbody>

			<c:forEach items="${list}" var="x">

				<tr>
					<td>${x.getId()}</td>
					<td>${x.getUsername()}</td>
					<td>${x.getEmail()}</td>
					<td>${x.getPassword()}</td>
					<td>${x.getPhoneno()}</td>
					<td>${x.getAddress()}</td>
					<td><a href="DeleteUsersFromDB?id=${x.getId()}"
						class="btn btn-danger">Delete</a></td>

				</tr>

			</c:forEach>


		</tbody>

	</table>

</body>
</html>