<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.standard.project.customer.*" %>



	<!-- HEADER -->
	<header class="section">
		<div class="inner clearfix">
			<div class="menu-group float--left">
				<!-- <div class="logo"> -->
				<a href="/project" class="logo"><img
					src="<%=request.getContextPath()%>/ResourcesFile/img/logo2.png" width="60" height="40"></a>
				<!-- </div> -->
				<ul class="main-menu toggle">
					<li><a href="/project/shop/StoreWomenMain">W'Store</a></li>
					<li><a href="/project/shop/StoreManMain">M'Store</a></li>
					<li><a href="/project/magazine/magazineList">Magazine</a></li>
					<li><a href="/project/Customer/myPage">My page</a></li>
					
				</ul>
			</div>
			
			
			
			<div class="sign-group float--right toggle">
				<ul class="sub-menu">
					<%
					CustomerVO customer = (CustomerVO)session.getAttribute("loginCustomer");
					
					if(customer==null){
						System.out.println(session.getAttribute("loginCustomer"));
						%> 
						<!-- 세션이 설정되지 않을 경우 --> 
						<li><a href="/project/Customer/login_form">Login</a></li>
						<li><a href="/project/Customer/Register">Register</a></li>
					<% }else{ %>
						<li><a href="/project/Customer/logout">Logout</a></li>
						<li><a href="/project/Customer/myPage"><%=customer.getC_Id()%>님 환영합니다</a></li>
					<% } %>
				</ul>
				<a href="#"><input type="text"><img src="<%=request.getContextPath()%>/ResourcesFile/img/search.svg" alt="search" width="20" height="20">
				</a>
				<a href="#"><img src="<%=request.getContextPath()%>/ResourcesFile/img/cart.svg" alt="cart" width="25" height="25">
				</a>
			</div>
			<div id="toggle-btn">Header Menu Toggle Button</div>
		</div>
	</header>