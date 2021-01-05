<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.standard.project.customer.*" %>

<style type="text/css">
.main-menu li a{
  color: black;
  text-decoration: none;
  display: inline-block;
  position: relative;
}
.main-menu li a:after {    
  background: none repeat scroll 0 0 transparent;
  bottom: 0;
  content: "";
  display: block;
  height: 1px;
  left: 50%;
  position: absolute;
  background: black;
  transition: width 0.3s ease 0s, left 0.3s ease 0s;
  width: 0;
}
.main-menu li a:hover:after { 
  width: 100%; 
  left: 0; 
}

a:hover{
 text-decoration:none;
 }

</style>


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