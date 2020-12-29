<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>

     .table{
        width: 1200px;
    }
</style>
</head>

<%@ include file="../header.jsp"%>
<!-- CONTENT -->
<div class="content_wrap inner">
	<!-- side_nav -->

	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title" font_size="100px">브랜드 관리페이지</p>
				<ul>
					<li><a href="/project/Seller/ProductManage">상품관리</a></li>
					<li><a href="/project/Seller/Delivery">배송관리</a></li>
					<li><a href="/project/Cs/cs_request">리뷰관리</a></li>

				</ul>
			</div>
		</div>
	</div>
	
	<% session.getAttribute("loginCustomer"); %>
	
	<div class="content">
		<h3>상품관리</h3>
		<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>상품명</th>
					<th>상품아이디</th>
					<th>카테고리1</th>
					<th>카테고리2</th>
					<th>썸네일</th>
					<th>롱이미지</th>
					<th>브랜드</th>
					<th>가격</th>
					<th>삭제 | 수정</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="produt" items="${list}">
							<tr>
								<td><a href="project/Seller/ProductAddChild" name="pp_Name">${produt.pp_Name}</a></td>
								<td>${produt.parent_p_Id}</td>
								<td>${produt.pp_Category1}</td>
								<td>${produt.pp_Category2}</td>
								<td>${produt.pp_thumb}</td>
								<td>${produt.pp_image}</td>
								<td><%=customer.getBrandName()%></td>
								<td>${produt.pp_Price}</td>
								<td><button>삭제</button>
									<button>수정</button></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="9">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<a href="/project/Seller/ProductAddParent"><button
				class="add-product">상품 추가하기</button></a>
	</div>
</div>

<%@ include file="../footer.jsp"%>