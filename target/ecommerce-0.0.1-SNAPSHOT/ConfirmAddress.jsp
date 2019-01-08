

<%@page import="impl.CartDAOImpl"%>
<%@page import="dao.CartDAO"%>
<%@page import="impl.UsersDAOImpl"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
	CartDAO cdao = new CartDAOImpl();

	System.out.println(request.getSession().getAttribute("username").toString());

	request.setAttribute("sa",
			cdao.getShippingAddress(request.getSession().getAttribute("username").toString()));
	request.setAttribute("ba",
			cdao.getBillingAddress(request.getSession().getAttribute("username").toString()));
%>
</head>
<body>
	<c:import url="header.jsp"></c:import>

	<table class="table table-striped" style="margin: auto; width: 80%;">

		<thead>

			<tr>

				<td>Shipping Address</td>
				<td>Billing Address</td>
				<td>Update</td>

			</tr>

		</thead>
		<tbody>


			<tr>
				<td>${sa}</td>
				<td>${ba}</td>
				<td></a></td>
			</tr>

			<tr>
				<form action="UpdateCartAddressToDB" method="post">

					<td><textarea name="sa" class="form-control">${sa}</textarea></td>
					<td><textarea name="ba" class="form-control">${ba}</textarea></td>
					<td><button type="submit" class="btn btn-danger">Update</button></td>

				</form>

			</tr>


		</tbody>
	</table>
	<a href="Invoice.jsp" class="btn btn-warning" style="margin-left: 50px;"> View Invoice</a>
</body>
</html>