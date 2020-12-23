<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.standard.project.vo.OrderHistoryVO"%>
<%@ include file="../head.jsp"%>
</head>

<!-- HEADER -->
<%@ include file="../header.jsp"%>

<!--COMTENT -->
<div class="content_wrap inner">
	<!-- side_nav -->
	<div class="side_nav">
		<div class="side_nav_item">
			<p class="side_nav_title">My page</p>
			<ul>
				<li><a href="#">Login</a></li>
				<li><a href="/project/Customer/Register">Register</a></li>
				<li><a href="/project/Customer/cart">Cart</a></li>
				<li><a href="/project/Customer/order">Order</a></li>
				<li><a href="#">Wish list</a></li>
				<li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
			</ul>
		</div>
	</div>

	<!-- CART:주문조회-->
	<div class="order_wrap">
		<div class="title_area">
			<div class="title_area1">
				<h1>장바구니</h1>
			</div>
		</div>
		<div class="order_table">
			<table class="type11">
				<thead>
					<tr>
						<th scope="cols">선택</th>
						<th scope="cols">이미지</th>
						<th scope="cols">상품정보</th>
						<th scope="cols">가격</th>
						<th scope="cols">수량</th>
						<th scope="cols">주문금액</th>
						<th scope="cols">선택</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<!-- OrderHistoryVO 구현되면 get xxx로연결하기  -->
						<td><input type="checkbox" name="checkbox" value="1" style="border:0"></td> 
						<td><img src="../img/logo2.png" style width="30px" height="20px"></th>
						<td>트위드 플레어 스커트</th>
						<td>38000원</th>
						<td>
							<form action= "" name="form" method="get">
								수량 : <input type=hidden name="p_Price" value="5500">
									  <input type="text" name="o_Num" value="1" size="1" onchange="change();">개
									  <input type="button" value=" + " onclick="add();">
                                    	<input type="button" value=" - " onclick="del();"><br>
								</td>
						<td>금액 : 
							<input type="text" name="o_TotalPrice">원
							</form>
						</td>
						<td class="button">
							<div>
								<button href="order.html">주문하기</button>
							</div>
							<div>
								<button href="#">찜하기</button>
							</div>
							<div>
								<button href="#">삭제</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>



</div>



<!-- FOOTER -->
<%@ include file="../footer.jsp"%>