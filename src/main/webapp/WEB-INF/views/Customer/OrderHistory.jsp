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
				<h2>주문 상품 정보</h2>
			</div>
		</div>
		<div class="orderHistory">
		<%if(orderList!=null) {%>
			<table class="type11">
				<thead>
					<tr>
						<th style="width:25%">주문일자</th>
						<th style="width:35%">상품정보</th>
						<th style="width:10%">가격</th>
						<th style="width:5%">수량</th>
						<th style="width:10%">주문금액</th>
						<th style="width:15%">주문상태</th>
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
                    <button type="button" class="" onclick=""><button> < </button></a>
                    <button type="button" class="" onclick=""><button> 1 </button></a>
                    <button type="button" class="" onclick=""><button> > </button></a>
                    <button type="button" class="" onclick=""><button> >> </button></a>
        </div>
	</div>
</div>



<%@ include file="../footer.jsp"%>