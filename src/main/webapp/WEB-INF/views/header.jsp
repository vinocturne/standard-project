<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<!-- HEADER -->
	<header class="section">
		<div class="inner clearfix">
			<div class="menu-group float--left">
				<!-- <div class="logo"> -->
				<a href="/project" class="logo"><img
					src="<%=request.getContextPath()%>/ResourcesFile/img/logo2.png" width="60" height="40"></a>
				<!-- </div> -->
				<ul class="main-menu toggle">
					<li><a href="#">Store</a></li>
					<li><a href="#">Magazine</a></li>
					<li><a href="views/Cs/cs_request.jsp">My page</a></li>
				</ul>
			</div>
			<div class="sign-group float--right toggle">
				<ul class="sub-menu">
					<li><a href="/project/Customer/login_form">Login</a></li>
					<li><a href="/project/Customer/Register">Register</a></li>
				</ul>
				<a href="#"> <input type="text"> <img
					src="<%=request.getContextPath()%>/ResourcesFile/img/search.svg" alt="search" height="20" width="20">
				</a> <a href="#"> <img src="<%=request.getContextPath()%>/ResourcesFile/img/cart.svg" alt="cart" height="25"
					width="25">
				</a>
			</div>
			<div id="toggle-btn">Header Menu Toggle Button</div>
		</div>
	</header>
