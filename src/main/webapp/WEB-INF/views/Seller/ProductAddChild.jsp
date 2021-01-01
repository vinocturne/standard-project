<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
   body{
       margin-left: 100px;
       margin-right: 10%;
   }
    .table{
        width: 1200px;
    }
</style>
</head>
<%@ include file="../header.jsp"%>
<!-- CONTENT -->
<div class="content_wrap">
	<!-- side_nav -->

	<div class="col-auto p-0">
		<div class="side_nav">
			<div class="side_nav_item">
				<p class="side_nav_title">브랜드 관리페이지</p>
				<ul>
					<li><a href="/project/Seller/ProductManage">상품관리</a></li>
					<li><a href="/project/Seller/BuyList">구매관리</a></li>
					<li><a href="/project/Seller/Review">리뷰관리</a></li>

				</ul>
			</div>
		</div>
	</div>

	<div class="content">
		<br><br>
		<h3>상품 옵션 관리</h3>
		<br>
		<table class="table table-hover" height="100" width="1100">
			<thead>
				<tr>
					<th style="width:5%; height:10%" value="${product.p_Id}">${product.p_Id}</th>
					<th style="width:5%; height:10%"><input type="text" id="color"></th>
					<th style="width:5%; height:10%"><input type="text" id="size"></th>
					<th style="width:5%; height:10%"><input type="text" id="stock"></th>
				</tr>
				
			</thead>
		</table>
		
		<input type="submit" value=등록>
					
					
		<br><br><br>
		<table class="table table-hover" height="100" width="1100">
			<thead>
				<tr>
					<th style="width:5%; height:10%">상품아이디</th>
					<th style="width:5%; height:10%">색상</th>
					<th style="width:5%; height:10%">사이즈</th>
					<th style="width:5%; height:10%">재고</th>
					<th style="width:5%; height:10%">수정 | 삭제</th>
					
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list)>0}">
						<c:forEach var="product" items="${list}">
							<tr>
								<td>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-p_Id="${product.p_Id}" />
										<script>
											$(".chBox").click(
													function() {
														$("#allCheck").prop(
																"checked",
																false);
													});
										</script>
									</div>
								</td>
								<td>${product.p_Id}</a></td>
								<td><input name="p_Color" type="text" value="${product.p_Color}"></td>
								<td><input name="p_Size" type="text" value="${product.p_Size}"></td>
								<td><input name="p_Stack" type="text" value="${product.p_Stack}"></td>
								<td><input type="button" value="수정" onClick="'location.href='/project/Seller/ProductModify"></td>
								<td><input type="button" value="삭제" onClick="'location.href='/project/Seller/ProductAddChild"></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

	</div>
</div>

<%@ include file="../footer.jsp"%>