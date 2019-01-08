
<%@page import="impl.ProductDAOImpl"%> 
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<c:import url="header.jsp"></c:import>

<%
	int id = Integer.parseInt(request.getParameter("id"));

	ProductDAO cdao = new ProductDAOImpl();

	request.setAttribute("cat", cdao.getProduct(id));
%>

</head>
<body style="margin: auto; width: 80%;">

	

	<c:choose>

		<c:when
			test="${not empty sessionScope.username and sessionScope.usernameRole=='ROLE_ADMIN'}">

			<h1>Update Product</h1>

			<form action="UpdateProductFromDB" method="post">

				<input type="hidden" name="Id" value="${cat.getId()}"> <br>

				<input type="text" name="Category" placeholder="Enter Category Name"
					class="form-control"
					<c:if test="${not empty cat}"> value="${cat.getName()}" </c:if> />




				<input type="text" name="name" placeholder="Enter Name"
					class="form-control"
					<c:if test="${not empty cat}"> value="${cat.getName()}" </c:if> />

				<br> <input type="text" name="Quantity"
					placeholder="Enter Quantity" class="form-control"
					<c:if test="${not empty cat}"> value="${cat.getName()}" </c:if> />

				<br> <input type="text" name="price" placeholder="Enter Price"
					class="form-control"
					<c:if test="${not empty cat}"> value="${cat.getName()}" </c:if> />

				<br>

				<textarea name="description"
					placeholder="Enter Category Description" class="form-control">
	<c:if test="${not empty cat}">${cat.getDescription()}</c:if></textarea>

				<br> <input type="submit" value="Submit"
					class="btn btn-success">

			</form>

		</c:when>

		<c:otherwise>
			<br>
			<h1 style="margin: auto; width: 80%;" class="alert alert-danger">Only Admins are allowed to access this facility</h1>
		</c:otherwise>

	</c:choose>




</body>
</html>