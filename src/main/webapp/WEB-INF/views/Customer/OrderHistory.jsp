<%@page import="org.standard.project.order.OrderHistoryVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
</head>
<%@ include file="../header.jsp"%>
<header class="section">
	<div class="inner clearfix">
		<div class="menu-group float--left">
			<!-- <div class="logo"> -->
			<a href="../views/index.html" class="logo"><img
				src="../img/logo2.png" width="60" height="40"></a>
			<!-- </div> -->
			<ul class="main-menu toggle">
				<li><a href="#">Store</a></li>
				<li><a href="#">Magazine</a></li>
				<!-- 로그인 안한 상태에서 보여주는 페이지 -->
				<li><a href="../views/login_form.html">My page</a></li>
			</ul>
		</div>
		<div class="sign-group float--right toggle">
			<ul class="sub-menu">
				<li><a href="../views/login_form.html">Login</a></li>
				<li><a href="Register.html">Register</a></li>
			</ul>
			<a href="#"> <input type="text"> <img
				src="../img/search.svg" alt="search" height="20" width="20">
			</a> <a href="#"> <img src="../img/cart.svg" alt="cart" height="25"
				width="25">
			</a>
		</div>
		<div id="toggle-btn">Header Menu Toggle Button</div>
	</div>
</header>

<!-- CONTENT -->
<div class="content_wrap inner">
	<!-- side_nav -->
	<div class="side_nav">
		<div class="side_nav_item">
			<p class="side_nav_title">My page</p>
			<ul>
				<li><a href="#">Login</a></li>
				<li><a href="Register.html">Register</a></li>
				<li><a href="cart.html">Cart</a></li>
				<li><a href="../views/order.html">Order</a></li>
				<li><a href="Wishlist.html">Wish list</a></li>
				<li><a
					href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
			</ul>
		</div>
	</div>
	<%ArrayList<OrderHistoryVO> orderList = (ArrayList)session.getAttribute("orderList"); %>
	<!-- ORDER :주문조회-->
	<div class="order_wrap">
		<div class="title_area">
			<div class="title_area1">
				<h1>주문 조회</h1>
			</div>
			<div class="title_area2">
				<h2>
					<주문 상품 정보>
				</h2>
			</div>
		</div>
		<div class="orderHistory">
		<%if(orderList!=null) {%>
			<table class="type11">
				<thead>
					<tr>
						<th scope="cols">주문일자</th>
						<th scope="cols">상품정보</th>
						<th scope="cols">가격</th>
						<th scope="cols">수량</th>
						<th scope="cols">주문금액</th>
						<th scope="cols">주문상태</th>
					</tr>
				</thead>
				
				<tbody>
				<%for(int i=0; i<orderList.size();i++){ %>
				
					<tr>
						<td><%=orderList.get(i).getO_Date() %></th>
						<td><%=orderList.get(i).getP_Id() %></th>
						<td><%=orderList.get(i).getP_Price() %></th>
						<td><%=orderList.get(i).getO_Quantity() %></th>
						<td><%=orderList.get(i).getO_TotalPrice() %></th>
						<td><%=orderList.get(i).getO_Delivery() %></th>
					</tr>
					
					<%}//for %>
					
				</tbody>
			</table>
			<%}else{ %>
						<h2> 주문 내역이 없습니다.</h2>
			<%} %>
		</div>
		<div class="order_index">
                    <button type="button" class="" onclick=""><button> << </button></a>
                    <button type="button" class="" onclick="" ><button> < </button></a>
                    <button type="button" class="" onclick=""><button> 1 </button></a>
                    <button type="button" class="" onclick=""><button> > </button></a>
                    <button type="button" class="" onclick=""><button> >> </button></a>
        </div>
	</div>
</div>

<!-- FOOTER -->
<footer class="section">
	<div class="inner clearfix">
		<ul class="site-links float--right">
			<li><a href="#">API</a></li>
			<li><a href="#">Training</a></li>
			<li><a href="#">Shop</a></li>
			<li><a href="#">About</a></li>
		</ul>
		<ul class="site-links float--left">
			<li>© 2020 STANDARD Inc.</li>
			<li><a href="#">Terms</a></li>
			<li><a href="#">Status</a></li>
			<li><a href="#">Help</a></li>
		</ul>
	</div>
</footer>
<%@ include file="../footer.jsp"%>