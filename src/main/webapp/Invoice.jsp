<%@page import="model.Cart"%>
<%@page import="impl.CartDAOImpl"%>
<%@page import="dao.CartDAO"%>
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

	request.setAttribute("sa",
			cdao.getShippingAddress(request.getSession().getAttribute("username").toString()));
	request.setAttribute("ba",
			cdao.getBillingAddress(request.getSession().getAttribute("username").toString()));

	float total = 0.0f;
	
	for( Cart x : cdao.getCart(request.getSession().getAttribute("username").toString()) ){
		
		total += Float.parseFloat( x.getProduct().getPrice() ) * Float.parseFloat( x.getQ() ) ;
		
	}
	
	request.setAttribute("total", total);
	request.setAttribute("list", cdao.getCart(request.getSession().getAttribute("username").toString()));
%>
</head>
<body style="margin: auto; width: 80%;">
	<h1>${errorMap}</h1>
	<c:import url="header.jsp"></c:import>

	<h1>Your Invoice</h1>


	<a href="Thankyou.jsp" class="btn btn-primary" style="floot: right;">Confirm
		Order</a>
	<br>
	
	<hr>
	
	<h2> Grand Total: Rs. ${total}</h2>
	
	<hr>
	

	<div class="jumbotron">

		<h3>Shipping Address</h3>

		<hr>

		<p style="font-size: 22px; font-weight: bold;">${sa}</p>

	</div>
	
	<div class="jumbotron">

		<h3>Billing Address</h3>

		<hr>
		
		<p style="font-size: 22px; font-weight: bold;">${ba}</p>

	</div>

	
	<br>

	<table class="table table-striped">

		<thead>

			<tr>

				<td>Product Name</td>
				<td>Product Image</td>
				<td>Product Price</td>
				<td>Quantity</td>
				<td>Sub Total</td>

			</tr>

		</thead>

		<tbody>

			<c:forEach items="${list}" var="x">

				<tr>
					<td>${x.getProduct().getName()}</td>
					<td><img src="${x.getProduct().getImageUrl()}"
						class="img img-thumbnail" style="max-width: 200px"></td>
					<td>${x.getProduct().getPrice()}</td>
					<td>${x.getQ()}</td>

					<td>${x.getProduct().getPrice() * x.getQ()}</td>

				</tr>

			</c:forEach>


		</tbody>

	</table>

</body>
</html>