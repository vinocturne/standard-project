<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.standard.project.order.OrderHistoryVO"%>
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
				<%
					if(customer==null){
					System.out.println(session.getAttribute("loginCustomer"));
				%>   
                    <li><a href="/project/Customer/login_form">Login</a></li>
                    <li><a href="/project/Customer/Register">Register</a></li>
                    <% } else { %>
                    <li><a href="/project/Customer/Modify">Modify</a></li>
                    <li><a href="/project/Customer/cart">Cart</a></li>
                    <li><a href="/project/Customer/OrderHistory">Order</a></li>
                    <li><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">Delivery</a></li>
                    <%} %>
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
			<table class="type15">
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
						<td><img src="../ResourcesFile/img/logo2.png" style width="30px" height="20px"></th>
						<td>트위드 플레어 스커트</th>
						<td>38000원</th>
						<td>
							<form name="form" method="get">
							<span class=""> 
								<span class="ec-base-qty"> 
								<input type="text" name="amount" value="1" size="3" onchange="change();"> 
								<a onclick="add();"> 
									<img src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif" alt="수량증가" class="up">
								</a> 
								<a onclick="del();"> 
									<img src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif" alt="수량감소" class="down">
								</a>
								</span>
							</span>
							</td>
						<td>
							<input type="text" name="o_TotalPrice" id="o_TotalPrice" >원
							</form>
						</td>
						<td class="cart_button">
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
		
		<div class="cart_index">
                    <button type="button" class="" onclick=""><button> << </button></a>
                    <button type="button" class="" onclick=""><button> < </button></a>
                    <button type="button" class="" onclick=""><button> 1 </button></a>
                    <button type="button" class="" onclick=""><button> > </button></a>
                    <button type="button" class="" onclick=""><button> >> </button></a>
        </div>
	</div>
</div>
	

<!-- FOOTER -->
<%@ include file="../footer.jsp"%>