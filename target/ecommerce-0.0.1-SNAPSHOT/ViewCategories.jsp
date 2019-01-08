<%@page import="impl.CategoryDAOImpl"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Categories</title>

<%
	CategoryDAO cdao = new CategoryDAOImpl();

	request.setAttribute("categories", cdao.getCategory());
%>

</head>
<body>

	<c:import url="header.jsp"></c:import>

	<table class="table table-striped">

		<thead>

			<tr>
				<td>Id</td>
				<td>Name</td>
				<td>Description</td>
				<td>Update</td>
				<td>Delete</td>
			</tr>

		</thead>

		<tbody>

			<c:forEach items="${categories}" var="x">

				<tr>
					<td>${x.getId()}</td>
					<td>${x.getName()}</td>
					<td>${x.getDescription()}</td>

					<td><a href="UpdateCategory.jsp?id=${x.getId()}" class="btn btn-success">Update</a></td>
					
					<td><a href="DeleteCategoryFromDB?id=${x.getId()}" class="btn btn-danger">Delete</a></td>

				</tr>

			</c:forEach>


		</tbody>

	</table>

</body>
</html>