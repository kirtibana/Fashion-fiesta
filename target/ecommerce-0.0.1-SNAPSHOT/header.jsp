<%@page import="impl.CartDAOImpl"%>
<%@page import="dao.CartDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<!-- Nav Section -->

<%
	CartDAO cdao = new CartDAOImpl();

	if( request.getSession().getAttribute("username") == null ){
		request.setAttribute("itemcount", 0);
	}else{
		request.setAttribute("itemcount",  cdao.getCount(request.getSession().getAttribute("username").toString()) );
	}
		
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
	<a class="navbar-brand" href="#"> </a>
	<ul class="navbar-nav">
		<c:if
			test="${not empty sessionScope.username and sessionScope.usernameRole=='ROLE_ADMIN'}">
			<li class="nav-item"><a class="nav-link" href="AddProduct.jsp">Add
					Product</a></li>
		</c:if>

		<li class="nav-item"><a class="nav-link" href="ViewProduct.jsp">View
				Products</a></li>

		<c:if
			test="${not empty sessionScope.username and sessionScope.usernameRole=='ROLE_ADMIN'}">
			<li class="nav-item"><a class="nav-link" href="AddCategory.jsp">Add
					Category</a></li>
		</c:if>

		<li class="nav-item"><a class="nav-link"
			href="ViewCategories.jsp">View Category</a></li>


		<c:if
			test="${not empty sessionScope.username and sessionScope.usernameRole=='ROLE_ADMIN'}">
			<li class="nav-item"><a class="nav-link" href="ViewUsers.jsp">View
					Users</a></li>
		</c:if>

		
			<li class="nav-item"><a class="nav-link" href="ViewCart.jsp">View
				Cart ${itemcount}</a></li>
	</ul>

	<ul class="navbar-nav ml-auto">
		<c:if test="${not empty sessionScope.username}">

			<li class="nav-item"><a class="nav-link" href="AddCategory.jsp">Welcome
					${sessionScope.username}</a></li>
			<li class="nav-item"><a class="nav-link" href="Logout1">Log
					Out</a></li>

		</c:if>

		<c:if test="${empty sessionScope.username}">

			<li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a></li>
			<li class="nav-item"><a class="nav-link" href="AddUsers.jsp">Sign
					Up</a></li>

		</c:if>

	</ul>
</nav>