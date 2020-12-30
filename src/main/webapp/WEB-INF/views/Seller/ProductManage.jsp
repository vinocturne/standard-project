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
				<p class="side_nav_title">브랜드 관리페이지</p>
				<ul>
					<li><a href="/project/Seller/ProductManage">상품관리</a></li>
                        <li><a href="/project/Seller/BuyList">구매관리</a></li>
                        <li><a href="/project/Seller/Review">리뷰관리</a></li>
				</ul>
			</div>
		</div>
	</div>
	<% session.getAttribute("loginCustomer"); %>
	<div class="content">
		<h3>상품관리</h3>
		<br>
		<div class="allCheck">
			<input type="checkbox" name="allCheck" id="allCheck" /><label
				for="allCheck">모두 선택</label>
			<script>
				$("#allCheck").click(function() {
					var chk = $("#allCheck").prop("checked");
					if (chk) {
						$(".chBox").prop("checked", true);
					} else {
						$(".chBox").prop("checked", false);
					}
				});
			</script>
			<a class="delBtn">
				<button type="button" class="selectDelete_btn">삭제하기</button>
				<script>
					$(".selectDelete_btn").click(function() {
						var confirm_val = confirm("정말 삭제 하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();
							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-parent_p_Id"));
							});
							if (!(checkArr == "")) {
								$.ajax({
									url : "deleteWaitingMagazine",
									type : "post",
									data : {
										chBox : checkArr
									},
									success : function(result) {
										alert("삭제 성공");
										location.href = "ProductManage";
									}
								});
							}else{
								alert("삭제할 상품을 선택해주세요");
							}
						}
					});
				</script>
			</a>
			
		</div>
		<table class="table table-hover" height="100" width="1100">
			<thead>
				<tr>
					<th style="width:5%; height:10%">번호</th>
					<th style="width:5%; height:10%">상품명</th>
					<th style="width:5%; height:10%">상품아이디</th>
					<th style="width:5%; height:10%">카테고리1</th>
					<th style="width:5%; height:10%">카테고리2</th>
					<th style="width:5%; height:10%">썸네일</th>
					<!-- <th style="width:5%; height:10%">롱이미지</th> --><!-- 긴 이미지 보여주는거 불필요 -->
					<th style="width:5%; height:10%">브랜드</th>
					<th style="width:5%; height:10%">가격</th>
					<th style="width:5%; height:10%">수정</th>
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
											data-p_Id="${product.parent_p_Id}" />
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
								<td><a href="project/Seller/ProductAddChild" name="pp_Name">${product.pp_Name}</a></td>
								<td>${product.parent_p_Id}</td>
								<td>${product.pp_Category1}</td>
								<td>${product.pp_Category2}</td>
								<td>${product.pp_thumb}</td>
								<%-- <td>${product.pp_image}</td> --%><!-- 긴 이미지 보여주는거 불필요 -->
								<td><%=customer.getBrandName()%></td>
								<td>${product.pp_Price}</td>
								<td><input type="button" value="수정" onClick="'location.href='/project/Seller/ProductModify"></td>
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