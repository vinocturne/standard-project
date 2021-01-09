<%@page import="org.standard.project.product.ProductParentVO"%>
<%@page import="org.standard.project.order.OrderHistoryVO"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
</head>
<%@ include file="../header.jsp"%>
${ok}
<script type="text/javascript">
var str = '${ok}';
console.log(str);
if (str==="ok"){
	console.log(str);
	self.close();
	}else {
		console.log(str);
	}
</script>

	<!-- CONTENT -->
	<div class="content_wrap inner">
	<!-- side_nav -->
	<%@ include file="../side_nav.jsp"%>
	
	<%request.getAttribute("productInfoList"); %>
	<%ArrayList<ProductParentVO> productInfoList = (ArrayList)request.getAttribute("productInfoList"); %>
	<%request.getAttribute("orderHistory"); %>
	<%ArrayList<OrderHistoryVO> orderHistory = (ArrayList)session.getAttribute("orderList"); %>
	
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
		<%if(productInfoList!=null) {%>
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
				<% for(int i=0;i<productInfoList.size(); i++) {  %>
					<tr>
						<td><%=orderHistory.get(i).getO_Date() %></td>
						<td><%=productInfoList.get(i).getPp_Name() %></td>
						<td><%=productInfoList.get(i).getPp_Price() %></td>
						<td><%=orderHistory.get(i).getO_Quantity() %></td>
						<td><%=orderHistory.get(i).getO_TotalPrice() %></td>
						<td><%=orderHistory.get(i).getO_Delivery() %><br>
						<button onclick="window.open(' <%=request.getContextPath() %>/Customer/ReviewPopup?orderNum=<%=orderHistory.get(i).getO_Num() %>&ppName=<%=productInfoList.get(i).getPp_Name() %>','window_name','width=480,height=530,left=200 top=100 location=no,status=no,scrollbars=yes');" class="order_btn">후기작성</button>
						</td>
					</tr>
					
					<%}//for %>
					
				</tbody>
			</table>
			<%}else{%>
						<h2> 주문 내역이 없습니다</h2>
			<%}%>
		</div>
		<div class="order_index">
                    <button type="button" class="" onclick=""><button><<</button></a>
                    <button type="button" class="" onclick=""><button><</button></a>
                    <button type="button" class="" onclick=""><button>1</button></a>
                    <button type="button" class="" onclick=""><button>></button></a>
                    <button type="button" class="" onclick=""><button>>></button></a>
        </div>
	</div>
</div>



<%@ include file="../footer.jsp"%>