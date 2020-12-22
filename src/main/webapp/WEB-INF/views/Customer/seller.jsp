<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
</head>
<%@ include file="../header.jsp"%>
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
				<li><a href="order.html">Order</a></li>
				<li><a href="Wishlist.html">Wish list</a></li>
				<li><a
					href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
			</ul>
		</div>
	</div>
	<header class="section">
		<div class="inner clearfix">
			<div class="menu-group float--left">
				<!-- <div class="logo"> -->
				<a href="#" class="logo"><img src="../img/logo2.png" width="60"
					height="40"></a>
				<!-- </div> -->
				<ul class="main-menu toggle">
					<li><a href="#">Store</a></li>
					<li><a href="#">Magazine</a></li>
					<li><a href="#">My page</a></li>

				</ul>
			</div>

			<div class="sign-group float--right toggle">
				<ul class="sub-menu">
					<li><a href="">Login</a></li>
					<li><a href="">Register</a></li>
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

	<div class="frame">
		<div class="container">
			<div class="nav">
				<ul class="nav-list">
					<li>관리자페이지</li>
					<br>
					<li clas="nav-item"><a href="seller.html" class="nav-link">상품
							관리</a></li>
					<li clas="nav-item"><a href="" class="nav-link">배송 관리</a></li>
					<li clas="na`v-item"><a href="SellerReview.html"
						class="nav-link">리뷰 관리</a></li>
				</ul>
			</div>
			<div class="content">
				<h3>상품관리</h3>
				<br>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>상품번호</th>
							<th>상품명</th>
							<th>상품 이미지</th>
							<th>재고현황</th>
							<th>비고</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="">후드</a></td>
							<td><img src="../img/logo2.png" width=60 height="40"></td>
							<td>100</td>
							<td>후드</td>
							<td><button>삭제하기</button></td>
						</tr>
						<tr>
							<td>2</td>
							<td>바지</td>
							<td><img src="../img/logo2.png" width=60 height="40"></td>
							<td>200</td>
							<td>후드</td>
							<td><button>삭제하기</button></td>
						</tr>
						<tr>
							<td>3</td>
							<td>티셔츠</td>
							<td><img src="../img/logo2.png" width=60 height="40"></td>
							<td>10</td>
							<td>후드</td>
							<td><button>삭제하기</button></td>
						</tr>
					</tbody>
				</table>
				<button class="add-product">상품 추가하기</button>
			</div>

		</div>
<%@ include file="../footer.jsp"%>