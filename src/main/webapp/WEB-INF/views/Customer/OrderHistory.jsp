<%@page import="org.standard.project.order.OrderHistoryVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
</head>
<%@ include file="../header.jsp"%>


	<!-- CONTENT -->
	<div class="content_wrap inner">
	<!-- side_nav -->
	<%@ include file="../side_nav.jsp"%>
	
	
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
						<th scope="cols">선택</th>
						<th scope="cols">주문일자</th>
						<th scope="cols">상품정보</th>
						<th scope="cols">가격</th>
						<th scope="cols">수량</th>
						<th scope="cols">주문금액</th>
						<th scope="cols">주문상태</th>
					</tr>
				</thead>
				
				<tbody>
				<tbody>
					<tr>
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
								<button href="#">주문하기</button>
							<div>
								<input type="button" name="btn1" value="리뷰작성"
								onclick="window.open('ReviewPopup.html','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">
							</div>
							<div>
								<button href="#">삭제</button>
							</div>
						</td>
					</tr>
				</tbody>
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
                    <button type="button" class="" onclick=""><button> < </button></a>
                    <button type="button" class="" onclick=""><button> 1 </button></a>
                    <button type="button" class="" onclick=""><button> > </button></a>
                    <button type="button" class="" onclick=""><button> >> </button></a>
        </div>
	</div>
</div>



<%@ include file="../footer.jsp"%>