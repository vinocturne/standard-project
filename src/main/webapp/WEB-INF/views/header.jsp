<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>INDEX</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/ResourcesFile/css/reset.css">
<link rel="stylesheet" media="(max-width:1024px)" href="<%=request.getContextPath()%>/ResourcesFile/css/main_medium.css">
<link rel="stylesheet" media="(max-width:768px)" href="<%=request.getContextPath()%>/ResourcesFile/css/main_small.css">

<script defer src="<%=request.getContextPath()%>/ResourcesFile/js/main.js"></script>
</head>

<body>
	<!-- HEADER -->
	<header class="section">
		<div class="inner clearfix">
			<div class="menu-group float--left">
				<!-- <div class="logo"> -->
				<a href="../views/index.jsp" class="logo"><img
					src="<%=request.getContextPath()%>/ResourcesFile/img/logo2.png" width="60" height="40"></a>
				<!-- </div> -->
				<ul class="main-menu toggle">
					<li><a href="#">Store</a></li>
					<li><a href="#">Magazine</a></li>
					<li><a href="../views/login_form.html">My page</a></li>
				</ul>
			</div>
			<div class="sign-group float--right toggle">
				<ul class="sub-menu">
					<li><a href="Customer/login_form">Login</a></li>
					<li><a href="Register.html">Register</a></li>
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
