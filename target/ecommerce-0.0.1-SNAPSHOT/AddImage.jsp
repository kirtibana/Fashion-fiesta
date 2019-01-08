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

	<h1>Add Image</h1>

	<form action="AddImageToDB" method="post" enctype="multipart/form-data">
		
		<input type="file" name="kaddu" class="form-control"> <br>
		
		<input type="submit" value="Submit" class="btn btn-success">

	</form>

	<img alt="" src="https://res.cloudinary.com/dffeoc9ms/image/upload/v1540907849/pnw1zwmloo2bagcmdeum.jpg" class="img img-thumbnail" style="max-width: 400px;">
	<img alt="" src="https://res.cloudinary.com/dffeoc9ms/image/upload/v1540908099/dgo5uhaxyceh0isrr27c.jpg" class="img img-thumbnail" style="max-width: 400px;">


</body>
</html>