<%@page import="impl.CategoryDAOImpl"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%
	CategoryDAO cdao = new CategoryDAOImpl();
	request.setAttribute("cats", cdao.getCategory());
%>

</head>
<body>

	<c:import url="header.jsp"></c:import>

	<h1>Add Product</h1>

	<form action="AddProductToDB" method="post" enctype="multipart/form-data">

		<input type="text" name="name" placeholder="enter name"  class="form-control">
		<br>
		
		<select class="form-control" name="category">
			<c:forEach items="${cats}" var="cat">
				<option value="${cat.getName()}" title="${cat.getDescription()}">${cat.getName()}</option>			
			</c:forEach>
		</select>
		
		<!-- <input type="text" name="category" placeholder="enter category"  class="form-control"> -->
		<br>
		<input type="text" name="quantity"  placeholder="enter quantity " class="form-control">
		<br>
		<input type="text" name="price"  placeholder="enter price"class="form-control">
		<br>
		<textarea name="description" placeholder="enter description" class="form-control"></textarea>
		<br>
		
		<input type="file" name="file" class="form-control">
		<br>
		
		<input type="submit" value="Submit" class="btn btn-success">

	</form>


</body>
</html>
