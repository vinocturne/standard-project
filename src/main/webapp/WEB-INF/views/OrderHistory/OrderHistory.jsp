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
					<tr>
						<td>2020-11-12<br>(202011120153111)
						</th>
						<td>닭가슴살/소시지/만두BEST 67종 골라담기
						</th>
						<td>7600원
						</th>
						<td>2개
						</th>
						<td>15,200
						</th>
						<td>배송전
						</th>
					</tr>
					<tr>
						<td>o_Date<br>o_Num
						</th>
						<td>p_Id
						</th>
						<td>p_Price
						</th>
						<td>o_Quantity
						</th>
						<td>p_Price
						</th>
						<td>o_Delivery
						</th>
					</tr>
				</tbody>
			</table>
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