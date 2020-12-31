<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.standard.project.order.OrderHistoryVO"%>
<%@ page import="org.standard.project.ReviewController" %>

<%@ include file="../head.jsp"%>
</head>

	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--COMTENT -->
	<div class="content_wrap inner">
	<!-- side_nav -->
	<%@ include file="../side_nav.jsp"%>
	    
	<!-- Review -->
	<div class="order_wrap">
		<div class="title_area">
			<div class="title_area1">
				<h1>나의 문의 내역</h1>
			</div>
		</div>
		<div class="order_table">
			<table class="type15">
				<thead>
					<tr>
						<th style="width:10%">No.</th>
						<th style="width:60%">질문</th>
						<th style="width:15%">문의유형</th>
						<th style="width:15%">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- 샘플  -->
						<td>1</th>
						<td>환불 부탁드립니다 </th>
						<td>결제/환불 </th>
						<td>2020-12-25</td> 
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